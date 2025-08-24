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
extern "C" void minkowski_net_14_layer_pipeline(Byte<4>*, Byte<4>*, Byte<4>*, __cosim_s136__*, int, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, int, int, Byte<64>*, Byte<64>*, Byte<64>*, Byte<64>*, volatile void *, volatile void *);
extern "C" void apatb_minkowski_net_14_layer_pipeline_hw(volatile void * __xlx_apatb_param_input_voxel_stream, volatile void * __xlx_apatb_param_final_output_full_cubic, volatile void * __xlx_apatb_param_layer_weights_0, volatile void * __xlx_apatb_param_layer_weights_1, volatile void * __xlx_apatb_param_layer_weights_2, volatile void * __xlx_apatb_param_layer_weights_3, volatile void * __xlx_apatb_param_layer_weights_4, volatile void * __xlx_apatb_param_layer_weights_5, volatile void * __xlx_apatb_param_layer_weights_6, volatile void * __xlx_apatb_param_layer_weights_7, volatile void * __xlx_apatb_param_layer_weights_8, volatile void * __xlx_apatb_param_layer_weights_9, volatile void * __xlx_apatb_param_layer_weights_10, volatile void * __xlx_apatb_param_layer_weights_11, volatile void * __xlx_apatb_param_layer_weights_12, volatile void * __xlx_apatb_param_layer_weights_13, volatile void * __xlx_apatb_param_layer_biases_0, volatile void * __xlx_apatb_param_layer_biases_1, volatile void * __xlx_apatb_param_layer_biases_2, volatile void * __xlx_apatb_param_layer_biases_3, volatile void * __xlx_apatb_param_layer_biases_4, volatile void * __xlx_apatb_param_layer_biases_5, volatile void * __xlx_apatb_param_layer_biases_6, volatile void * __xlx_apatb_param_layer_biases_7, volatile void * __xlx_apatb_param_layer_biases_8, volatile void * __xlx_apatb_param_layer_biases_9, volatile void * __xlx_apatb_param_layer_biases_10, volatile void * __xlx_apatb_param_layer_biases_11, volatile void * __xlx_apatb_param_layer_biases_12, volatile void * __xlx_apatb_param_layer_biases_13, volatile void * __xlx_apatb_param_pruned_feature_dram_read, volatile void * __xlx_apatb_param_pruned_feature_dram_write, volatile void * __xlx_apatb_param_L3_bitmap, volatile void * __xlx_apatb_param_L2_bitmap, volatile void * __xlx_apatb_param_L1_bitmap, volatile void * __xlx_apatb_param_L0_bitmap, volatile void * __xlx_apatb_param_bitmap_info, volatile void * __xlx_apatb_param_total_processed_voxels) {
using hls::sim::createStream;
  // Collect __xlx_final_output_full_cubic__tmp_vec
std::vector<Byte<4>> __xlx_final_output_full_cubic__tmp_vec;
for (size_t i = 0; i < 5242880; ++i){
__xlx_final_output_full_cubic__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_final_output_full_cubic)[i]);
}
  int __xlx_size_param_final_output_full_cubic = 5242880;
  int __xlx_offset_param_final_output_full_cubic = 0;
  int __xlx_offset_byte_param_final_output_full_cubic = 0*4;
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
  // Collect __xlx_layer_weights_0__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_0__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_0)[i]);
}
  int __xlx_size_param_layer_weights_0 = 28311552;
  int __xlx_offset_param_layer_weights_0 = 0;
  int __xlx_offset_byte_param_layer_weights_0 = 0*4;
  // Collect __xlx_layer_weights_1__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_1__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_1)[i]);
}
  int __xlx_size_param_layer_weights_1 = 28311552;
  int __xlx_offset_param_layer_weights_1 = 0;
  int __xlx_offset_byte_param_layer_weights_1 = 0*4;
  // Collect __xlx_layer_weights_2__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_2__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_2)[i]);
}
  int __xlx_size_param_layer_weights_2 = 28311552;
  int __xlx_offset_param_layer_weights_2 = 0;
  int __xlx_offset_byte_param_layer_weights_2 = 0*4;
  // Collect __xlx_layer_weights_3__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_3__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_3)[i]);
}
  int __xlx_size_param_layer_weights_3 = 28311552;
  int __xlx_offset_param_layer_weights_3 = 0;
  int __xlx_offset_byte_param_layer_weights_3 = 0*4;
  // Collect __xlx_layer_weights_4__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_4__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_4)[i]);
}
  int __xlx_size_param_layer_weights_4 = 28311552;
  int __xlx_offset_param_layer_weights_4 = 0;
  int __xlx_offset_byte_param_layer_weights_4 = 0*4;
  // Collect __xlx_layer_weights_5__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_5__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_5)[i]);
}
  int __xlx_size_param_layer_weights_5 = 28311552;
  int __xlx_offset_param_layer_weights_5 = 0;
  int __xlx_offset_byte_param_layer_weights_5 = 0*4;
  // Collect __xlx_layer_weights_6__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_6__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_6)[i]);
}
  int __xlx_size_param_layer_weights_6 = 28311552;
  int __xlx_offset_param_layer_weights_6 = 0;
  int __xlx_offset_byte_param_layer_weights_6 = 0*4;
  // Collect __xlx_layer_weights_7__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_7__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_7)[i]);
}
  int __xlx_size_param_layer_weights_7 = 28311552;
  int __xlx_offset_param_layer_weights_7 = 0;
  int __xlx_offset_byte_param_layer_weights_7 = 0*4;
  // Collect __xlx_layer_weights_8__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_8__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_8__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_8)[i]);
}
  int __xlx_size_param_layer_weights_8 = 28311552;
  int __xlx_offset_param_layer_weights_8 = 0;
  int __xlx_offset_byte_param_layer_weights_8 = 0*4;
  // Collect __xlx_layer_weights_9__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_9__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_9__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_9)[i]);
}
  int __xlx_size_param_layer_weights_9 = 28311552;
  int __xlx_offset_param_layer_weights_9 = 0;
  int __xlx_offset_byte_param_layer_weights_9 = 0*4;
  // Collect __xlx_layer_weights_10__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_10__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_10__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_10)[i]);
}
  int __xlx_size_param_layer_weights_10 = 28311552;
  int __xlx_offset_param_layer_weights_10 = 0;
  int __xlx_offset_byte_param_layer_weights_10 = 0*4;
  // Collect __xlx_layer_weights_11__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_11__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_11__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_11)[i]);
}
  int __xlx_size_param_layer_weights_11 = 28311552;
  int __xlx_offset_param_layer_weights_11 = 0;
  int __xlx_offset_byte_param_layer_weights_11 = 0*4;
  // Collect __xlx_layer_weights_12__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_12__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_12__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_12)[i]);
}
  int __xlx_size_param_layer_weights_12 = 28311552;
  int __xlx_offset_param_layer_weights_12 = 0;
  int __xlx_offset_byte_param_layer_weights_12 = 0*4;
  // Collect __xlx_layer_weights_13__tmp_vec
std::vector<Byte<4>> __xlx_layer_weights_13__tmp_vec;
for (size_t i = 0; i < 28311552; ++i){
__xlx_layer_weights_13__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_weights_13)[i]);
}
  int __xlx_size_param_layer_weights_13 = 28311552;
  int __xlx_offset_param_layer_weights_13 = 0;
  int __xlx_offset_byte_param_layer_weights_13 = 0*4;
  // Collect __xlx_layer_biases_0__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_0__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_0)[i]);
}
  int __xlx_size_param_layer_biases_0 = 1024;
  int __xlx_offset_param_layer_biases_0 = 0;
  int __xlx_offset_byte_param_layer_biases_0 = 0*4;
  // Collect __xlx_layer_biases_1__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_1__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_1)[i]);
}
  int __xlx_size_param_layer_biases_1 = 1024;
  int __xlx_offset_param_layer_biases_1 = 0;
  int __xlx_offset_byte_param_layer_biases_1 = 0*4;
  // Collect __xlx_layer_biases_2__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_2__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_2)[i]);
}
  int __xlx_size_param_layer_biases_2 = 1024;
  int __xlx_offset_param_layer_biases_2 = 0;
  int __xlx_offset_byte_param_layer_biases_2 = 0*4;
  // Collect __xlx_layer_biases_3__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_3__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_3)[i]);
}
  int __xlx_size_param_layer_biases_3 = 1024;
  int __xlx_offset_param_layer_biases_3 = 0;
  int __xlx_offset_byte_param_layer_biases_3 = 0*4;
  // Collect __xlx_layer_biases_4__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_4__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_4)[i]);
}
  int __xlx_size_param_layer_biases_4 = 1024;
  int __xlx_offset_param_layer_biases_4 = 0;
  int __xlx_offset_byte_param_layer_biases_4 = 0*4;
  // Collect __xlx_layer_biases_5__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_5__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_5)[i]);
}
  int __xlx_size_param_layer_biases_5 = 1024;
  int __xlx_offset_param_layer_biases_5 = 0;
  int __xlx_offset_byte_param_layer_biases_5 = 0*4;
  // Collect __xlx_layer_biases_6__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_6__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_6)[i]);
}
  int __xlx_size_param_layer_biases_6 = 1024;
  int __xlx_offset_param_layer_biases_6 = 0;
  int __xlx_offset_byte_param_layer_biases_6 = 0*4;
  // Collect __xlx_layer_biases_7__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_7__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_7)[i]);
}
  int __xlx_size_param_layer_biases_7 = 1024;
  int __xlx_offset_param_layer_biases_7 = 0;
  int __xlx_offset_byte_param_layer_biases_7 = 0*4;
  // Collect __xlx_layer_biases_8__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_8__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_8__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_8)[i]);
}
  int __xlx_size_param_layer_biases_8 = 1024;
  int __xlx_offset_param_layer_biases_8 = 0;
  int __xlx_offset_byte_param_layer_biases_8 = 0*4;
  // Collect __xlx_layer_biases_9__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_9__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_9__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_9)[i]);
}
  int __xlx_size_param_layer_biases_9 = 1024;
  int __xlx_offset_param_layer_biases_9 = 0;
  int __xlx_offset_byte_param_layer_biases_9 = 0*4;
  // Collect __xlx_layer_biases_10__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_10__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_10__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_10)[i]);
}
  int __xlx_size_param_layer_biases_10 = 1024;
  int __xlx_offset_param_layer_biases_10 = 0;
  int __xlx_offset_byte_param_layer_biases_10 = 0*4;
  // Collect __xlx_layer_biases_11__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_11__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_11__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_11)[i]);
}
  int __xlx_size_param_layer_biases_11 = 1024;
  int __xlx_offset_param_layer_biases_11 = 0;
  int __xlx_offset_byte_param_layer_biases_11 = 0*4;
  // Collect __xlx_layer_biases_12__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_12__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_12__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_12)[i]);
}
  int __xlx_size_param_layer_biases_12 = 1024;
  int __xlx_offset_param_layer_biases_12 = 0;
  int __xlx_offset_byte_param_layer_biases_12 = 0*4;
  // Collect __xlx_layer_biases_13__tmp_vec
std::vector<Byte<4>> __xlx_layer_biases_13__tmp_vec;
for (size_t i = 0; i < 1024; ++i){
__xlx_layer_biases_13__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_layer_biases_13)[i]);
}
  int __xlx_size_param_layer_biases_13 = 1024;
  int __xlx_offset_param_layer_biases_13 = 0;
  int __xlx_offset_byte_param_layer_biases_13 = 0*4;
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
  minkowski_net_14_layer_pipeline(__xlx_final_output_full_cubic__tmp_vec.data(), __xlx_pruned_feature_dram_read__tmp_vec.data(), __xlx_pruned_feature_dram_write__tmp_vec.data(), sinput_voxel_stream->data<__cosim_s136__>(), __xlx_offset_byte_param_final_output_full_cubic, __xlx_layer_weights_0__tmp_vec.data(), __xlx_layer_weights_1__tmp_vec.data(), __xlx_layer_weights_2__tmp_vec.data(), __xlx_layer_weights_3__tmp_vec.data(), __xlx_layer_weights_4__tmp_vec.data(), __xlx_layer_weights_5__tmp_vec.data(), __xlx_layer_weights_6__tmp_vec.data(), __xlx_layer_weights_7__tmp_vec.data(), __xlx_layer_weights_8__tmp_vec.data(), __xlx_layer_weights_9__tmp_vec.data(), __xlx_layer_weights_10__tmp_vec.data(), __xlx_layer_weights_11__tmp_vec.data(), __xlx_layer_weights_12__tmp_vec.data(), __xlx_layer_weights_13__tmp_vec.data(), __xlx_layer_biases_0__tmp_vec.data(), __xlx_layer_biases_1__tmp_vec.data(), __xlx_layer_biases_2__tmp_vec.data(), __xlx_layer_biases_3__tmp_vec.data(), __xlx_layer_biases_4__tmp_vec.data(), __xlx_layer_biases_5__tmp_vec.data(), __xlx_layer_biases_6__tmp_vec.data(), __xlx_layer_biases_7__tmp_vec.data(), __xlx_layer_biases_8__tmp_vec.data(), __xlx_layer_biases_9__tmp_vec.data(), __xlx_layer_biases_10__tmp_vec.data(), __xlx_layer_biases_11__tmp_vec.data(), __xlx_layer_biases_12__tmp_vec.data(), __xlx_layer_biases_13__tmp_vec.data(), __xlx_offset_byte_param_pruned_feature_dram_read, __xlx_offset_byte_param_pruned_feature_dram_write, __xlx_L3_bitmap__tmp_vec.data(), __xlx_L2_bitmap__tmp_vec.data(), __xlx_L1_bitmap__tmp_vec.data(), __xlx_L0_bitmap__tmp_vec.data(), __xlx_apatb_param_bitmap_info, __xlx_apatb_param_total_processed_voxels);
// print __xlx_apatb_param_final_output_full_cubic
for (size_t i = 0; i < __xlx_size_param_final_output_full_cubic; ++i) {
((Byte<4>*)__xlx_apatb_param_final_output_full_cubic)[i] = __xlx_final_output_full_cubic__tmp_vec[__xlx_offset_param_final_output_full_cubic+i];
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
// print __xlx_apatb_param_layer_weights_0
for (size_t i = 0; i < __xlx_size_param_layer_weights_0; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_0)[i] = __xlx_layer_weights_0__tmp_vec[__xlx_offset_param_layer_weights_0+i];
}
// print __xlx_apatb_param_layer_weights_1
for (size_t i = 0; i < __xlx_size_param_layer_weights_1; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_1)[i] = __xlx_layer_weights_1__tmp_vec[__xlx_offset_param_layer_weights_1+i];
}
// print __xlx_apatb_param_layer_weights_2
for (size_t i = 0; i < __xlx_size_param_layer_weights_2; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_2)[i] = __xlx_layer_weights_2__tmp_vec[__xlx_offset_param_layer_weights_2+i];
}
// print __xlx_apatb_param_layer_weights_3
for (size_t i = 0; i < __xlx_size_param_layer_weights_3; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_3)[i] = __xlx_layer_weights_3__tmp_vec[__xlx_offset_param_layer_weights_3+i];
}
// print __xlx_apatb_param_layer_weights_4
for (size_t i = 0; i < __xlx_size_param_layer_weights_4; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_4)[i] = __xlx_layer_weights_4__tmp_vec[__xlx_offset_param_layer_weights_4+i];
}
// print __xlx_apatb_param_layer_weights_5
for (size_t i = 0; i < __xlx_size_param_layer_weights_5; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_5)[i] = __xlx_layer_weights_5__tmp_vec[__xlx_offset_param_layer_weights_5+i];
}
// print __xlx_apatb_param_layer_weights_6
for (size_t i = 0; i < __xlx_size_param_layer_weights_6; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_6)[i] = __xlx_layer_weights_6__tmp_vec[__xlx_offset_param_layer_weights_6+i];
}
// print __xlx_apatb_param_layer_weights_7
for (size_t i = 0; i < __xlx_size_param_layer_weights_7; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_7)[i] = __xlx_layer_weights_7__tmp_vec[__xlx_offset_param_layer_weights_7+i];
}
// print __xlx_apatb_param_layer_weights_8
for (size_t i = 0; i < __xlx_size_param_layer_weights_8; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_8)[i] = __xlx_layer_weights_8__tmp_vec[__xlx_offset_param_layer_weights_8+i];
}
// print __xlx_apatb_param_layer_weights_9
for (size_t i = 0; i < __xlx_size_param_layer_weights_9; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_9)[i] = __xlx_layer_weights_9__tmp_vec[__xlx_offset_param_layer_weights_9+i];
}
// print __xlx_apatb_param_layer_weights_10
for (size_t i = 0; i < __xlx_size_param_layer_weights_10; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_10)[i] = __xlx_layer_weights_10__tmp_vec[__xlx_offset_param_layer_weights_10+i];
}
// print __xlx_apatb_param_layer_weights_11
for (size_t i = 0; i < __xlx_size_param_layer_weights_11; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_11)[i] = __xlx_layer_weights_11__tmp_vec[__xlx_offset_param_layer_weights_11+i];
}
// print __xlx_apatb_param_layer_weights_12
for (size_t i = 0; i < __xlx_size_param_layer_weights_12; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_12)[i] = __xlx_layer_weights_12__tmp_vec[__xlx_offset_param_layer_weights_12+i];
}
// print __xlx_apatb_param_layer_weights_13
for (size_t i = 0; i < __xlx_size_param_layer_weights_13; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_weights_13)[i] = __xlx_layer_weights_13__tmp_vec[__xlx_offset_param_layer_weights_13+i];
}
// print __xlx_apatb_param_layer_biases_0
for (size_t i = 0; i < __xlx_size_param_layer_biases_0; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_0)[i] = __xlx_layer_biases_0__tmp_vec[__xlx_offset_param_layer_biases_0+i];
}
// print __xlx_apatb_param_layer_biases_1
for (size_t i = 0; i < __xlx_size_param_layer_biases_1; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_1)[i] = __xlx_layer_biases_1__tmp_vec[__xlx_offset_param_layer_biases_1+i];
}
// print __xlx_apatb_param_layer_biases_2
for (size_t i = 0; i < __xlx_size_param_layer_biases_2; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_2)[i] = __xlx_layer_biases_2__tmp_vec[__xlx_offset_param_layer_biases_2+i];
}
// print __xlx_apatb_param_layer_biases_3
for (size_t i = 0; i < __xlx_size_param_layer_biases_3; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_3)[i] = __xlx_layer_biases_3__tmp_vec[__xlx_offset_param_layer_biases_3+i];
}
// print __xlx_apatb_param_layer_biases_4
for (size_t i = 0; i < __xlx_size_param_layer_biases_4; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_4)[i] = __xlx_layer_biases_4__tmp_vec[__xlx_offset_param_layer_biases_4+i];
}
// print __xlx_apatb_param_layer_biases_5
for (size_t i = 0; i < __xlx_size_param_layer_biases_5; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_5)[i] = __xlx_layer_biases_5__tmp_vec[__xlx_offset_param_layer_biases_5+i];
}
// print __xlx_apatb_param_layer_biases_6
for (size_t i = 0; i < __xlx_size_param_layer_biases_6; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_6)[i] = __xlx_layer_biases_6__tmp_vec[__xlx_offset_param_layer_biases_6+i];
}
// print __xlx_apatb_param_layer_biases_7
for (size_t i = 0; i < __xlx_size_param_layer_biases_7; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_7)[i] = __xlx_layer_biases_7__tmp_vec[__xlx_offset_param_layer_biases_7+i];
}
// print __xlx_apatb_param_layer_biases_8
for (size_t i = 0; i < __xlx_size_param_layer_biases_8; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_8)[i] = __xlx_layer_biases_8__tmp_vec[__xlx_offset_param_layer_biases_8+i];
}
// print __xlx_apatb_param_layer_biases_9
for (size_t i = 0; i < __xlx_size_param_layer_biases_9; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_9)[i] = __xlx_layer_biases_9__tmp_vec[__xlx_offset_param_layer_biases_9+i];
}
// print __xlx_apatb_param_layer_biases_10
for (size_t i = 0; i < __xlx_size_param_layer_biases_10; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_10)[i] = __xlx_layer_biases_10__tmp_vec[__xlx_offset_param_layer_biases_10+i];
}
// print __xlx_apatb_param_layer_biases_11
for (size_t i = 0; i < __xlx_size_param_layer_biases_11; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_11)[i] = __xlx_layer_biases_11__tmp_vec[__xlx_offset_param_layer_biases_11+i];
}
// print __xlx_apatb_param_layer_biases_12
for (size_t i = 0; i < __xlx_size_param_layer_biases_12; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_12)[i] = __xlx_layer_biases_12__tmp_vec[__xlx_offset_param_layer_biases_12+i];
}
// print __xlx_apatb_param_layer_biases_13
for (size_t i = 0; i < __xlx_size_param_layer_biases_13; ++i) {
((Byte<4>*)__xlx_apatb_param_layer_biases_13)[i] = __xlx_layer_biases_13__tmp_vec[__xlx_offset_param_layer_biases_13+i];
}
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
