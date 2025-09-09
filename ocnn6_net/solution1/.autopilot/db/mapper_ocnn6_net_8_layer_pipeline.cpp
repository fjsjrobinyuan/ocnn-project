#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_directio.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_input_voxel_stream_cap_bc;
static AESL_RUNTIME_BC __xlx_input_voxel_stream_V_size_Reader("../tv/stream_size/stream_size_in_input_voxel_stream.dat");
using hls::sim::Byte;
struct __cosim_s136__ { char data[256]; };
struct __cosim_s64__ { char data[64]; };
struct __cosim_s20__ { char data[20]; };
struct __cosim_s256__ { char data[256]; };
struct __cosim_s32__ { char data[32]; };
extern "C" void ocnn6_net_8_layer_pipeline(Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, __cosim_s136__*, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, Byte<64>*, Byte<64>*, Byte<64>*, Byte<64>*, volatile void *, volatile void *);
extern "C" void apatb_ocnn6_net_8_layer_pipeline_hw(volatile void * __xlx_apatb_param_input_voxel_stream, volatile void * __xlx_apatb_param_final_output_full_cubic, volatile void * __xlx_apatb_param_conv1_weights, volatile void * __xlx_apatb_param_conv2_weights, volatile void * __xlx_apatb_param_conv3_weights, volatile void * __xlx_apatb_param_conv4_weights, volatile void * __xlx_apatb_param_conv5_weights, volatile void * __xlx_apatb_param_conv6_weights, volatile void * __xlx_apatb_param_fc1_weights, volatile void * __xlx_apatb_param_fc2_weights, volatile void * __xlx_apatb_param_conv1_bias, volatile void * __xlx_apatb_param_conv2_bias, volatile void * __xlx_apatb_param_conv3_bias, volatile void * __xlx_apatb_param_conv4_bias, volatile void * __xlx_apatb_param_conv5_bias, volatile void * __xlx_apatb_param_conv6_bias, volatile void * __xlx_apatb_param_fc1_bias, volatile void * __xlx_apatb_param_fc2_bias, volatile void * __xlx_apatb_param_pruned_feature_dram_read, volatile void * __xlx_apatb_param_pruned_feature_dram_write, volatile void * __xlx_apatb_param_L3_bitmap, volatile void * __xlx_apatb_param_L2_bitmap, volatile void * __xlx_apatb_param_L1_bitmap, volatile void * __xlx_apatb_param_L0_bitmap, volatile void * __xlx_apatb_param_bitmap_info, volatile void * __xlx_apatb_param_total_processed_voxels) {
using hls::sim::createStream;
  // Collect __xlx_final_output_full_cubic__tmp_vec
std::vector<Byte<4>> __xlx_final_output_full_cubic__tmp_vec;
for (size_t i = 0; i < 10485760; ++i){
__xlx_final_output_full_cubic__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_final_output_full_cubic)[i]);
}
  int __xlx_size_param_final_output_full_cubic = 10485760;
  int __xlx_offset_param_final_output_full_cubic = 0;
  int __xlx_offset_byte_param_final_output_full_cubic = 0*4;
  // Collect __xlx_conv1_weights__tmp_vec
std::vector<Byte<4>> __xlx_conv1_weights__tmp_vec;
for (size_t i = 0; i < 1296; ++i){
__xlx_conv1_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv1_weights)[i]);
}
  int __xlx_size_param_conv1_weights = 1296;
  int __xlx_offset_param_conv1_weights = 0;
  int __xlx_offset_byte_param_conv1_weights = 0*4;
  // Collect __xlx_conv2_weights__tmp_vec
std::vector<Byte<4>> __xlx_conv2_weights__tmp_vec;
for (size_t i = 0; i < 13824; ++i){
__xlx_conv2_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv2_weights)[i]);
}
  int __xlx_size_param_conv2_weights = 13824;
  int __xlx_offset_param_conv2_weights = 0;
  int __xlx_offset_byte_param_conv2_weights = 0*4;
  // Collect __xlx_conv3_weights__tmp_vec
std::vector<Byte<4>> __xlx_conv3_weights__tmp_vec;
for (size_t i = 0; i < 55296; ++i){
__xlx_conv3_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv3_weights)[i]);
}
  int __xlx_size_param_conv3_weights = 55296;
  int __xlx_offset_param_conv3_weights = 0;
  int __xlx_offset_byte_param_conv3_weights = 0*4;
  // Collect __xlx_conv4_weights__tmp_vec
std::vector<Byte<4>> __xlx_conv4_weights__tmp_vec;
for (size_t i = 0; i < 221184; ++i){
__xlx_conv4_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv4_weights)[i]);
}
  int __xlx_size_param_conv4_weights = 221184;
  int __xlx_offset_param_conv4_weights = 0;
  int __xlx_offset_byte_param_conv4_weights = 0*4;
  // Collect __xlx_conv5_weights__tmp_vec
std::vector<Byte<4>> __xlx_conv5_weights__tmp_vec;
for (size_t i = 0; i < 884736; ++i){
__xlx_conv5_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv5_weights)[i]);
}
  int __xlx_size_param_conv5_weights = 884736;
  int __xlx_offset_param_conv5_weights = 0;
  int __xlx_offset_byte_param_conv5_weights = 0*4;
  // Collect __xlx_conv6_weights__tmp_vec
std::vector<Byte<4>> __xlx_conv6_weights__tmp_vec;
for (size_t i = 0; i < 3538944; ++i){
__xlx_conv6_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv6_weights)[i]);
}
  int __xlx_size_param_conv6_weights = 3538944;
  int __xlx_offset_param_conv6_weights = 0;
  int __xlx_offset_byte_param_conv6_weights = 0*4;
  // Collect __xlx_fc1_weights__tmp_vec
std::vector<Byte<4>> __xlx_fc1_weights__tmp_vec;
for (size_t i = 0; i < 65536; ++i){
__xlx_fc1_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_fc1_weights)[i]);
}
  int __xlx_size_param_fc1_weights = 65536;
  int __xlx_offset_param_fc1_weights = 0;
  int __xlx_offset_byte_param_fc1_weights = 0*4;
  // Collect __xlx_fc2_weights__tmp_vec
std::vector<Byte<4>> __xlx_fc2_weights__tmp_vec;
for (size_t i = 0; i < 5120; ++i){
__xlx_fc2_weights__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_fc2_weights)[i]);
}
  int __xlx_size_param_fc2_weights = 5120;
  int __xlx_offset_param_fc2_weights = 0;
  int __xlx_offset_byte_param_fc2_weights = 0*4;
  // Collect __xlx_conv1_bias__tmp_vec
std::vector<Byte<4>> __xlx_conv1_bias__tmp_vec;
for (size_t i = 0; i < 16; ++i){
__xlx_conv1_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv1_bias)[i]);
}
  int __xlx_size_param_conv1_bias = 16;
  int __xlx_offset_param_conv1_bias = 0;
  int __xlx_offset_byte_param_conv1_bias = 0*4;
  // Collect __xlx_conv2_bias__tmp_vec
std::vector<Byte<4>> __xlx_conv2_bias__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_conv2_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv2_bias)[i]);
}
  int __xlx_size_param_conv2_bias = 32;
  int __xlx_offset_param_conv2_bias = 0;
  int __xlx_offset_byte_param_conv2_bias = 0*4;
  // Collect __xlx_conv3_bias__tmp_vec
std::vector<Byte<4>> __xlx_conv3_bias__tmp_vec;
for (size_t i = 0; i < 64; ++i){
__xlx_conv3_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv3_bias)[i]);
}
  int __xlx_size_param_conv3_bias = 64;
  int __xlx_offset_param_conv3_bias = 0;
  int __xlx_offset_byte_param_conv3_bias = 0*4;
  // Collect __xlx_conv4_bias__tmp_vec
std::vector<Byte<4>> __xlx_conv4_bias__tmp_vec;
for (size_t i = 0; i < 128; ++i){
__xlx_conv4_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv4_bias)[i]);
}
  int __xlx_size_param_conv4_bias = 128;
  int __xlx_offset_param_conv4_bias = 0;
  int __xlx_offset_byte_param_conv4_bias = 0*4;
  // Collect __xlx_conv5_bias__tmp_vec
std::vector<Byte<4>> __xlx_conv5_bias__tmp_vec;
for (size_t i = 0; i < 256; ++i){
__xlx_conv5_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv5_bias)[i]);
}
  int __xlx_size_param_conv5_bias = 256;
  int __xlx_offset_param_conv5_bias = 0;
  int __xlx_offset_byte_param_conv5_bias = 0*4;
  // Collect __xlx_conv6_bias__tmp_vec
std::vector<Byte<4>> __xlx_conv6_bias__tmp_vec;
for (size_t i = 0; i < 512; ++i){
__xlx_conv6_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_conv6_bias)[i]);
}
  int __xlx_size_param_conv6_bias = 512;
  int __xlx_offset_param_conv6_bias = 0;
  int __xlx_offset_byte_param_conv6_bias = 0*4;
  // Collect __xlx_fc1_bias__tmp_vec
std::vector<Byte<4>> __xlx_fc1_bias__tmp_vec;
for (size_t i = 0; i < 128; ++i){
__xlx_fc1_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_fc1_bias)[i]);
}
  int __xlx_size_param_fc1_bias = 128;
  int __xlx_offset_param_fc1_bias = 0;
  int __xlx_offset_byte_param_fc1_bias = 0*4;
  // Collect __xlx_fc2_bias__tmp_vec
std::vector<Byte<4>> __xlx_fc2_bias__tmp_vec;
for (size_t i = 0; i < 40; ++i){
__xlx_fc2_bias__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_fc2_bias)[i]);
}
  int __xlx_size_param_fc2_bias = 40;
  int __xlx_offset_param_fc2_bias = 0;
  int __xlx_offset_byte_param_fc2_bias = 0*4;
  // Collect __xlx_pruned_feature_dram_read__tmp_vec
std::vector<Byte<4>> __xlx_pruned_feature_dram_read__tmp_vec;
for (size_t i = 0; i < 262144; ++i){
__xlx_pruned_feature_dram_read__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_pruned_feature_dram_read)[i]);
}
  int __xlx_size_param_pruned_feature_dram_read = 262144;
  int __xlx_offset_param_pruned_feature_dram_read = 0;
  int __xlx_offset_byte_param_pruned_feature_dram_read = 0*4;
  // Collect __xlx_pruned_feature_dram_write__tmp_vec
std::vector<Byte<4>> __xlx_pruned_feature_dram_write__tmp_vec;
for (size_t i = 0; i < 262144; ++i){
__xlx_pruned_feature_dram_write__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_pruned_feature_dram_write)[i]);
}
  int __xlx_size_param_pruned_feature_dram_write = 262144;
  int __xlx_offset_param_pruned_feature_dram_write = 0;
  int __xlx_offset_byte_param_pruned_feature_dram_write = 0*4;
auto* sinput_voxel_stream = createStream((hls::stream<__cosim_s136__>*)__xlx_apatb_param_input_voxel_stream);
  // Collect __xlx_L3_bitmap__tmp_vec
std::vector<Byte<64>> __xlx_L3_bitmap__tmp_vec;
for (size_t i = 0; i < 1; ++i){
__xlx_L3_bitmap__tmp_vec.push_back(((Byte<64>*)__xlx_apatb_param_L3_bitmap)[i]);
}
  int __xlx_size_param_L3_bitmap = 1;
  int __xlx_offset_param_L3_bitmap = 0;
  int __xlx_offset_byte_param_L3_bitmap = 0*64;
  // Collect __xlx_L2_bitmap__tmp_vec
std::vector<Byte<64>> __xlx_L2_bitmap__tmp_vec;
for (size_t i = 0; i < 1; ++i){
__xlx_L2_bitmap__tmp_vec.push_back(((Byte<64>*)__xlx_apatb_param_L2_bitmap)[i]);
}
  int __xlx_size_param_L2_bitmap = 1;
  int __xlx_offset_param_L2_bitmap = 0;
  int __xlx_offset_byte_param_L2_bitmap = 0*64;
  // Collect __xlx_L1_bitmap__tmp_vec
std::vector<Byte<64>> __xlx_L1_bitmap__tmp_vec;
for (size_t i = 0; i < 1; ++i){
__xlx_L1_bitmap__tmp_vec.push_back(((Byte<64>*)__xlx_apatb_param_L1_bitmap)[i]);
}
  int __xlx_size_param_L1_bitmap = 1;
  int __xlx_offset_param_L1_bitmap = 0;
  int __xlx_offset_byte_param_L1_bitmap = 0*64;
  // Collect __xlx_L0_bitmap__tmp_vec
std::vector<Byte<64>> __xlx_L0_bitmap__tmp_vec;
for (size_t i = 0; i < 1; ++i){
__xlx_L0_bitmap__tmp_vec.push_back(((Byte<64>*)__xlx_apatb_param_L0_bitmap)[i]);
}
  int __xlx_size_param_L0_bitmap = 1;
  int __xlx_offset_param_L0_bitmap = 0;
  int __xlx_offset_byte_param_L0_bitmap = 0*64;
  // DUT call
  ocnn6_net_8_layer_pipeline(__xlx_final_output_full_cubic__tmp_vec.data(), __xlx_conv1_weights__tmp_vec.data(), __xlx_conv2_weights__tmp_vec.data(), __xlx_conv3_weights__tmp_vec.data(), __xlx_conv4_weights__tmp_vec.data(), __xlx_conv5_weights__tmp_vec.data(), __xlx_conv6_weights__tmp_vec.data(), __xlx_fc1_weights__tmp_vec.data(), __xlx_fc2_weights__tmp_vec.data(), __xlx_conv1_bias__tmp_vec.data(), __xlx_conv2_bias__tmp_vec.data(), __xlx_conv3_bias__tmp_vec.data(), __xlx_conv4_bias__tmp_vec.data(), __xlx_conv5_bias__tmp_vec.data(), __xlx_conv6_bias__tmp_vec.data(), __xlx_fc1_bias__tmp_vec.data(), __xlx_fc2_bias__tmp_vec.data(), __xlx_pruned_feature_dram_read__tmp_vec.data(), __xlx_pruned_feature_dram_write__tmp_vec.data(), sinput_voxel_stream->data<__cosim_s136__>(), __xlx_offset_byte_param_final_output_full_cubic, __xlx_offset_byte_param_conv1_weights, __xlx_offset_byte_param_conv2_weights, __xlx_offset_byte_param_conv3_weights, __xlx_offset_byte_param_conv4_weights, __xlx_offset_byte_param_conv5_weights, __xlx_offset_byte_param_conv6_weights, __xlx_offset_byte_param_fc1_weights, __xlx_offset_byte_param_fc2_weights, __xlx_offset_byte_param_conv1_bias, __xlx_offset_byte_param_conv2_bias, __xlx_offset_byte_param_conv3_bias, __xlx_offset_byte_param_conv4_bias, __xlx_offset_byte_param_conv5_bias, __xlx_offset_byte_param_conv6_bias, __xlx_offset_byte_param_fc1_bias, __xlx_offset_byte_param_fc2_bias, __xlx_offset_byte_param_pruned_feature_dram_read, __xlx_offset_byte_param_pruned_feature_dram_write, __xlx_L3_bitmap__tmp_vec.data(), __xlx_L2_bitmap__tmp_vec.data(), __xlx_L1_bitmap__tmp_vec.data(), __xlx_L0_bitmap__tmp_vec.data(), __xlx_apatb_param_bitmap_info, __xlx_apatb_param_total_processed_voxels);
// print __xlx_apatb_param_final_output_full_cubic
for (size_t i = 0; i < __xlx_size_param_final_output_full_cubic; ++i) {
((Byte<4>*)__xlx_apatb_param_final_output_full_cubic)[i] = __xlx_final_output_full_cubic__tmp_vec[__xlx_offset_param_final_output_full_cubic+i];
}
// print __xlx_apatb_param_conv1_weights
for (size_t i = 0; i < __xlx_size_param_conv1_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_conv1_weights)[i] = __xlx_conv1_weights__tmp_vec[__xlx_offset_param_conv1_weights+i];
}
// print __xlx_apatb_param_conv2_weights
for (size_t i = 0; i < __xlx_size_param_conv2_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_conv2_weights)[i] = __xlx_conv2_weights__tmp_vec[__xlx_offset_param_conv2_weights+i];
}
// print __xlx_apatb_param_conv3_weights
for (size_t i = 0; i < __xlx_size_param_conv3_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_conv3_weights)[i] = __xlx_conv3_weights__tmp_vec[__xlx_offset_param_conv3_weights+i];
}
// print __xlx_apatb_param_conv4_weights
for (size_t i = 0; i < __xlx_size_param_conv4_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_conv4_weights)[i] = __xlx_conv4_weights__tmp_vec[__xlx_offset_param_conv4_weights+i];
}
// print __xlx_apatb_param_conv5_weights
for (size_t i = 0; i < __xlx_size_param_conv5_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_conv5_weights)[i] = __xlx_conv5_weights__tmp_vec[__xlx_offset_param_conv5_weights+i];
}
// print __xlx_apatb_param_conv6_weights
for (size_t i = 0; i < __xlx_size_param_conv6_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_conv6_weights)[i] = __xlx_conv6_weights__tmp_vec[__xlx_offset_param_conv6_weights+i];
}
// print __xlx_apatb_param_fc1_weights
for (size_t i = 0; i < __xlx_size_param_fc1_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_fc1_weights)[i] = __xlx_fc1_weights__tmp_vec[__xlx_offset_param_fc1_weights+i];
}
// print __xlx_apatb_param_fc2_weights
for (size_t i = 0; i < __xlx_size_param_fc2_weights; ++i) {
((Byte<4>*)__xlx_apatb_param_fc2_weights)[i] = __xlx_fc2_weights__tmp_vec[__xlx_offset_param_fc2_weights+i];
}
// print __xlx_apatb_param_conv1_bias
for (size_t i = 0; i < __xlx_size_param_conv1_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_conv1_bias)[i] = __xlx_conv1_bias__tmp_vec[__xlx_offset_param_conv1_bias+i];
}
// print __xlx_apatb_param_conv2_bias
for (size_t i = 0; i < __xlx_size_param_conv2_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_conv2_bias)[i] = __xlx_conv2_bias__tmp_vec[__xlx_offset_param_conv2_bias+i];
}
// print __xlx_apatb_param_conv3_bias
for (size_t i = 0; i < __xlx_size_param_conv3_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_conv3_bias)[i] = __xlx_conv3_bias__tmp_vec[__xlx_offset_param_conv3_bias+i];
}
// print __xlx_apatb_param_conv4_bias
for (size_t i = 0; i < __xlx_size_param_conv4_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_conv4_bias)[i] = __xlx_conv4_bias__tmp_vec[__xlx_offset_param_conv4_bias+i];
}
// print __xlx_apatb_param_conv5_bias
for (size_t i = 0; i < __xlx_size_param_conv5_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_conv5_bias)[i] = __xlx_conv5_bias__tmp_vec[__xlx_offset_param_conv5_bias+i];
}
// print __xlx_apatb_param_conv6_bias
for (size_t i = 0; i < __xlx_size_param_conv6_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_conv6_bias)[i] = __xlx_conv6_bias__tmp_vec[__xlx_offset_param_conv6_bias+i];
}
// print __xlx_apatb_param_fc1_bias
for (size_t i = 0; i < __xlx_size_param_fc1_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_fc1_bias)[i] = __xlx_fc1_bias__tmp_vec[__xlx_offset_param_fc1_bias+i];
}
// print __xlx_apatb_param_fc2_bias
for (size_t i = 0; i < __xlx_size_param_fc2_bias; ++i) {
((Byte<4>*)__xlx_apatb_param_fc2_bias)[i] = __xlx_fc2_bias__tmp_vec[__xlx_offset_param_fc2_bias+i];
}
// print __xlx_apatb_param_pruned_feature_dram_read
for (size_t i = 0; i < __xlx_size_param_pruned_feature_dram_read; ++i) {
((Byte<4>*)__xlx_apatb_param_pruned_feature_dram_read)[i] = __xlx_pruned_feature_dram_read__tmp_vec[__xlx_offset_param_pruned_feature_dram_read+i];
}
// print __xlx_apatb_param_pruned_feature_dram_write
for (size_t i = 0; i < __xlx_size_param_pruned_feature_dram_write; ++i) {
((Byte<4>*)__xlx_apatb_param_pruned_feature_dram_write)[i] = __xlx_pruned_feature_dram_write__tmp_vec[__xlx_offset_param_pruned_feature_dram_write+i];
}
sinput_voxel_stream->transfer((hls::stream<__cosim_s136__>*)__xlx_apatb_param_input_voxel_stream);
// print __xlx_apatb_param_L3_bitmap
for (size_t i = 0; i < __xlx_size_param_L3_bitmap; ++i) {
((Byte<64>*)__xlx_apatb_param_L3_bitmap)[i] = __xlx_L3_bitmap__tmp_vec[__xlx_offset_param_L3_bitmap+i];
}
// print __xlx_apatb_param_L2_bitmap
for (size_t i = 0; i < __xlx_size_param_L2_bitmap; ++i) {
((Byte<64>*)__xlx_apatb_param_L2_bitmap)[i] = __xlx_L2_bitmap__tmp_vec[__xlx_offset_param_L2_bitmap+i];
}
// print __xlx_apatb_param_L1_bitmap
for (size_t i = 0; i < __xlx_size_param_L1_bitmap; ++i) {
((Byte<64>*)__xlx_apatb_param_L1_bitmap)[i] = __xlx_L1_bitmap__tmp_vec[__xlx_offset_param_L1_bitmap+i];
}
// print __xlx_apatb_param_L0_bitmap
for (size_t i = 0; i < __xlx_size_param_L0_bitmap; ++i) {
((Byte<64>*)__xlx_apatb_param_L0_bitmap)[i] = __xlx_L0_bitmap__tmp_vec[__xlx_offset_param_L0_bitmap+i];
}
}
