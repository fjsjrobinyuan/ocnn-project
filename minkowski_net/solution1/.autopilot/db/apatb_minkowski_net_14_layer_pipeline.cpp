#include "hls_signal_handler.h"
#include <algorithm>
#include <complex>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <exception>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <set>
#include "ap_fixed.h"
#include "ap_int.h"
#include "autopilot_cbe.h"
#include "hls_half.h"
#include "hls_directio.h"
#include "hls_stream.h"

using namespace std;

// wrapc file define:
#define AUTOTB_TVIN_input_voxel_stream "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_input_voxel_stream.dat"
#define WRAPC_STREAM_SIZE_IN_input_voxel_stream "../tv/stream_size/stream_size_in_input_voxel_stream.dat"
#define WRAPC_STREAM_INGRESS_STATUS_input_voxel_stream "../tv/stream_size/stream_ingress_status_input_voxel_stream.dat"
#define AUTOTB_TVIN_final_output_full_cubic "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_final_output_full_cubic.dat"
#define AUTOTB_TVOUT_final_output_full_cubic "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_final_output_full_cubic.dat"
#define AUTOTB_TVIN_layer_weights_0 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_0.dat"
#define AUTOTB_TVOUT_layer_weights_0 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_0.dat"
#define AUTOTB_TVIN_layer_weights_1 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_1.dat"
#define AUTOTB_TVOUT_layer_weights_1 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_1.dat"
#define AUTOTB_TVIN_layer_weights_2 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_2.dat"
#define AUTOTB_TVOUT_layer_weights_2 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_2.dat"
#define AUTOTB_TVIN_layer_weights_3 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_3.dat"
#define AUTOTB_TVOUT_layer_weights_3 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_3.dat"
#define AUTOTB_TVIN_layer_weights_4 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_4.dat"
#define AUTOTB_TVOUT_layer_weights_4 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_4.dat"
#define AUTOTB_TVIN_layer_weights_5 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_5.dat"
#define AUTOTB_TVOUT_layer_weights_5 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_5.dat"
#define AUTOTB_TVIN_layer_weights_6 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_6.dat"
#define AUTOTB_TVOUT_layer_weights_6 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_6.dat"
#define AUTOTB_TVIN_layer_weights_7 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_7.dat"
#define AUTOTB_TVOUT_layer_weights_7 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_7.dat"
#define AUTOTB_TVIN_layer_weights_8 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_8.dat"
#define AUTOTB_TVOUT_layer_weights_8 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_8.dat"
#define AUTOTB_TVIN_layer_weights_9 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_9.dat"
#define AUTOTB_TVOUT_layer_weights_9 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_9.dat"
#define AUTOTB_TVIN_layer_weights_10 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_10.dat"
#define AUTOTB_TVOUT_layer_weights_10 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_10.dat"
#define AUTOTB_TVIN_layer_weights_11 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_11.dat"
#define AUTOTB_TVOUT_layer_weights_11 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_11.dat"
#define AUTOTB_TVIN_layer_weights_12 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_12.dat"
#define AUTOTB_TVOUT_layer_weights_12 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_12.dat"
#define AUTOTB_TVIN_layer_weights_13 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_weights_13.dat"
#define AUTOTB_TVOUT_layer_weights_13 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_weights_13.dat"
#define AUTOTB_TVIN_layer_biases_0 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_0.dat"
#define AUTOTB_TVOUT_layer_biases_0 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_0.dat"
#define AUTOTB_TVIN_layer_biases_1 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_1.dat"
#define AUTOTB_TVOUT_layer_biases_1 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_1.dat"
#define AUTOTB_TVIN_layer_biases_2 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_2.dat"
#define AUTOTB_TVOUT_layer_biases_2 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_2.dat"
#define AUTOTB_TVIN_layer_biases_3 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_3.dat"
#define AUTOTB_TVOUT_layer_biases_3 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_3.dat"
#define AUTOTB_TVIN_layer_biases_4 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_4.dat"
#define AUTOTB_TVOUT_layer_biases_4 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_4.dat"
#define AUTOTB_TVIN_layer_biases_5 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_5.dat"
#define AUTOTB_TVOUT_layer_biases_5 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_5.dat"
#define AUTOTB_TVIN_layer_biases_6 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_6.dat"
#define AUTOTB_TVOUT_layer_biases_6 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_6.dat"
#define AUTOTB_TVIN_layer_biases_7 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_7.dat"
#define AUTOTB_TVOUT_layer_biases_7 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_7.dat"
#define AUTOTB_TVIN_layer_biases_8 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_8.dat"
#define AUTOTB_TVOUT_layer_biases_8 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_8.dat"
#define AUTOTB_TVIN_layer_biases_9 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_9.dat"
#define AUTOTB_TVOUT_layer_biases_9 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_9.dat"
#define AUTOTB_TVIN_layer_biases_10 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_10.dat"
#define AUTOTB_TVOUT_layer_biases_10 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_10.dat"
#define AUTOTB_TVIN_layer_biases_11 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_11.dat"
#define AUTOTB_TVOUT_layer_biases_11 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_11.dat"
#define AUTOTB_TVIN_layer_biases_12 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_12.dat"
#define AUTOTB_TVOUT_layer_biases_12 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_12.dat"
#define AUTOTB_TVIN_layer_biases_13 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_layer_biases_13.dat"
#define AUTOTB_TVOUT_layer_biases_13 "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_layer_biases_13.dat"
#define AUTOTB_TVIN_pruned_feature_dram_read "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_pruned_feature_dram_read.dat"
#define AUTOTB_TVOUT_pruned_feature_dram_read "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_pruned_feature_dram_read.dat"
#define AUTOTB_TVIN_pruned_feature_dram_write "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_pruned_feature_dram_write.dat"
#define AUTOTB_TVOUT_pruned_feature_dram_write "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_pruned_feature_dram_write.dat"
#define AUTOTB_TVIN_L3_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_L3_bitmap.dat"
#define AUTOTB_TVOUT_L3_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_L3_bitmap.dat"
#define AUTOTB_TVIN_L2_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_L2_bitmap.dat"
#define AUTOTB_TVOUT_L2_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_L2_bitmap.dat"
#define AUTOTB_TVIN_L1_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_L1_bitmap.dat"
#define AUTOTB_TVOUT_L1_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_L1_bitmap.dat"
#define AUTOTB_TVIN_L0_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_L0_bitmap.dat"
#define AUTOTB_TVOUT_L0_bitmap "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_L0_bitmap.dat"
#define AUTOTB_TVIN_bitmap_info "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_bitmap_info.dat"
#define AUTOTB_TVOUT_bitmap_info "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_bitmap_info.dat"
#define AUTOTB_TVIN_total_processed_voxels "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_total_processed_voxels.dat"
#define AUTOTB_TVOUT_total_processed_voxels "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_total_processed_voxels.dat"
#define AUTOTB_TVIN_gmem_output "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_gmem_output.dat"
#define AUTOTB_TVOUT_gmem_output "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_gmem_output.dat"
#define AUTOTB_TVIN_gmem_read "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_gmem_read.dat"
#define AUTOTB_TVOUT_gmem_read "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_gmem_read.dat"
#define AUTOTB_TVIN_gmem_write "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvin_gmem_write.dat"
#define AUTOTB_TVOUT_gmem_write "../tv/cdatafile/c.minkowski_net_14_layer_pipeline.autotvout_gmem_write.dat"


// tvout file define:
#define AUTOTB_TVOUT_PC_L3_bitmap "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_L3_bitmap.dat"
#define AUTOTB_TVOUT_PC_L2_bitmap "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_L2_bitmap.dat"
#define AUTOTB_TVOUT_PC_L1_bitmap "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_L1_bitmap.dat"
#define AUTOTB_TVOUT_PC_L0_bitmap "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_L0_bitmap.dat"
#define AUTOTB_TVOUT_PC_bitmap_info "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_bitmap_info.dat"
#define AUTOTB_TVOUT_PC_total_processed_voxels "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_total_processed_voxels.dat"
#define AUTOTB_TVOUT_PC_gmem_output "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_gmem_output.dat"
#define AUTOTB_TVOUT_PC_gmem_read "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_gmem_read.dat"
#define AUTOTB_TVOUT_PC_gmem_write "../tv/rtldatafile/rtl.minkowski_net_14_layer_pipeline.autotvout_gmem_write.dat"


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
  size_t divide_ceil(size_t a, size_t b)
  {
    return (a + b - 1) / b;
  }

  const bool little_endian()
  {
    int a = 1;
    return *(char*)&a == 1;
  }

  inline void rev_endian(unsigned char *p, size_t nbytes)
  {
    std::reverse(p, p+nbytes);
  }

  const bool LE = little_endian();

  inline size_t least_nbyte(size_t width)
  {
    return (width+7)>>3;
  }

  std::string formatData(unsigned char *pos, size_t wbits)
  {
    size_t wbytes = least_nbyte(wbits);
    size_t i = LE ? wbytes-1 : 0;
    auto next = [&] () {
      auto c = pos[i];
      LE ? --i : ++i;
      return c;
    };
    std::ostringstream ss;
    ss << "0x";
    if (int t = (wbits & 0x7)) {
      if (t <= 4) {
        unsigned char mask = (1<<t)-1;
        ss << std::hex << std::setfill('0') << std::setw(1)
           << (int) (next() & mask);
        wbytes -= 1;
      }
    }
    for (size_t i = 0; i < wbytes; ++i) {
      ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
    }
    return ss.str();
  }

  char ord(char c)
  {
    if (c >= 'a' && c <= 'f') {
      return c-'a'+10;
    } else if (c >= 'A' && c <= 'F') {
      return c-'A'+10;
    } else if (c >= '0' && c <= '9') {
      return c-'0';
    } else {
      throw SimException("Not Hexdecimal Digit", __LINE__);
    }
  }

  void unformatData(const char *data, unsigned char *put, size_t pbytes = 0)
  {
    size_t nchars = strlen(data+2);
    size_t nbytes = (nchars+1)>>1;
    if (pbytes == 0) {
      pbytes = nbytes;
    } else if (pbytes > nbytes) {
      throw SimException("Wrong size specified", __LINE__);
    }
    put = LE ? put : put+pbytes-1;
    auto nextp = [&] () {
      return LE ? put++ : put--;
    };
    const char *c = data + (nchars + 2) - 1;
    auto next = [&] () {
      char res { *c == 'x' ? (char)0 : ord(*c) };
      --c;
      return res;
    };
    for (size_t i = 0; i < pbytes; ++i) {
      char l = next();
      char h = next();
      *nextp() = (h<<4)+l;
    }
  }

  char* strip(char *s)
  {
    while (isspace(*s)) {
      ++s;
    }
    for (char *p = s+strlen(s)-1; p >= s; --p) {
      if (isspace(*p)) {
        *p = 0;
      } else {
        return s;
      }
    }
    return s;
  }

  size_t sum(const std::vector<size_t> &v)
  {
    size_t res = 0;
    for (const auto &e : v) {
      res += e;
    }
    return res;
  }

  const char* bad = "Bad TV file";
  const char* err = "Error on TV file";

  const unsigned char bmark[] = {
    0x5a, 0x5a, 0xa5, 0xa5, 0x0f, 0x0f, 0xf0, 0xf0
  };

  class Input {
    FILE *fp;
    long pos;

    void read(unsigned char *buf, size_t size)
    {
      if (fread(buf, size, 1, fp) != 1) {
        throw SimException(bad, __LINE__);
      }
      if (LE) {
        rev_endian(buf, size);
      }
    }

  public:
    void advance(size_t nbytes)
    {
      if (fseek(fp, nbytes, SEEK_CUR) == -1) {
        throw SimException(bad, __LINE__);
      }
    }

    Input(const char *path) : fp(nullptr)
    {
      fp = fopen(path, "rb");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    size_t begin()
    {
      size_t n;
      read((unsigned char*)&n, sizeof(n));
      pos = ftell(fp);
      return n;
    }

    void reset()
    {
      fseek(fp, pos, SEEK_SET);
    }

    void into(unsigned char *param, size_t wbytes, size_t asize, size_t nbytes)
    {
      size_t n = nbytes / asize;
      size_t r = nbytes % asize;
      for (size_t i = 0; i < n; ++i) {
        read(param, wbytes);
        param += asize;
      }
      if (r > 0) {
        advance(asize-r);
        read(param, r);
      }
    }

    ~Input()
    {
      unsigned char buf[8];
      size_t res = fread(buf, 8, 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, bad);
      }
      if (std::memcmp(buf, bmark, 8) != 0) {
        errExit(__LINE__, bad);
      }
    }
  };

  class Output {
    FILE *fp;

    void write(unsigned char *buf, size_t size)
    {
      if (LE) {
        rev_endian(buf, size);
      }
      if (fwrite(buf, size, 1, fp) != 1) {
        throw SimException(err, __LINE__);
      }
      if (LE) {
        rev_endian(buf, size);
      }
    }

  public:
    Output(const char *path) : fp(nullptr)
    {
      fp = fopen(path, "wb");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void begin(size_t total)
    {
      unsigned char buf[8] = {0};
      std::memcpy(buf, &total, sizeof(buf));
      write(buf, sizeof(buf));
    }

    void from(unsigned char *param, size_t wbytes, size_t asize, size_t nbytes, size_t skip)
    {
      param -= asize*skip;
      size_t n = divide_ceil(nbytes, asize);
      for (size_t i = 0; i < n; ++i) {
        write(param, wbytes);
        param += asize;
      }
    }

    ~Output()
    {
      size_t res = fwrite(bmark, 8, 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, err);
      }
    }
  };

  class Reader {
    FILE *fp;
    long pos;
    int size;
    char *s;

    void readline()
    {
      s = fgets(s, size, fp);
      if (s == nullptr) {
        throw SimException(bad, __LINE__);
      }
    }

  public:
    Reader(const char *path) : fp(nullptr), size(1<<12), s(new char[size])
    {
      try {
        fp = fopen(path, "r");
        if (fp == nullptr) {
          throw SimException(err, __LINE__);
        } else {
          readline();
          static const char mark[] = "[[[runtime]]]\n";
          if (strcmp(s, mark) != 0) {
            throw SimException(bad, __LINE__);
          }
        }
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
    }

    ~Reader()
    {
      fclose(fp);
      delete[] s;
    }

    void begin()
    {
      readline();
      static const char mark[] = "[[transaction]]";
      if (strncmp(s, mark, strlen(mark)) != 0) {
        throw SimException(bad, __LINE__);
      }
      pos = ftell(fp);
    }

    void reset()
    {
      fseek(fp, pos, SEEK_SET);
    }

    void skip(size_t n)
    {
      for (size_t i = 0; i < n; ++i) {
        readline();
      }
    }

    char* next()
    {
      long pos = ftell(fp);
      readline();
      if (*s == '[') {
        fseek(fp, pos, SEEK_SET);
        return nullptr;
      }
      return strip(s);
    }

    void end()
    {
      do {
        readline();
      } while (strcmp(s, "[[/transaction]]\n") != 0);
    }
  };

  class Writer {
    FILE *fp;

    void write(const char *s)
    {
      if (fputs(s, fp) == EOF) {
        throw SimException(err, __LINE__);
      }
    }

  public:
    Writer(const char *path) : fp(nullptr)
    {
      try {
        fp = fopen(path, "w");
        if (fp == nullptr) {
          throw SimException(err, __LINE__);
        } else {
          static const char mark[] = "[[[runtime]]]\n";
          write(mark);
        }
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
    }

    virtual ~Writer()
    {
      try {
        static const char mark[] = "[[[/runtime]]]\n";
        write(mark);
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
      fclose(fp);
    }

    void begin(size_t AESL_transaction)
    {
      static const char mark[] = "[[transaction]]           ";
      write(mark);
      auto buf = std::to_string(AESL_transaction);
      buf.push_back('\n');
      buf.push_back('\0');
      write(buf.data());
    }

    void next(const char *s)
    {
      write(s);
      write("\n");
    }

    void end()
    {
      static const char mark[] = "[[/transaction]]\n";
      write(mark);
    }
  };

  bool RTLOutputCheckAndReplacement(char *data)
  {
    bool changed = false;
    for (size_t i = 2; i < strlen(data); ++i) {
      if (data[i] == 'X' || data[i] == 'x') {
        data[i] = '0';
        changed = true;
      }
    }
    return changed;
  }

  void warnOnX()
  {
    static const char msg[] =
      "WARNING: [SIM 212-201] RTL produces unknown value "
      "'x' or 'X' on some port, possible cause: "
      "There are uninitialized variables in the design.\n";
    fprintf(stderr, msg);
  }

#ifndef POST_CHECK
  class RefTCL {
    FILE *fp;
    std::ostringstream ss;

    void fmt(std::vector<size_t> &vec)
    {
      ss << "{";
      for (auto &x : vec) {
        ss << " " << x;
      }
      ss << " }";
    }

    void formatDepth()
    {
      ss << "set depth_list {\n";
      for (auto &p : depth) {
        ss << "  {" << p.first << " " << p.second << "}\n";
      }
      if (nameHBM != "") {
        ss << "  {" << nameHBM << " " << depthHBM << "}\n";
      }
      ss << "}\n";
    }

    void formatTransDepth()
    {
      ss << "set trans_depth {\n";
      for (auto &p : transDepth) {
        ss << "  {" << p.first << " ";
        fmt(p.second);
        ss << " " << bundleNameFor[p.first] << "}\n";
      }
      ss << "}\n";
    }

    void formatTransNum()
    {
      ss << "set trans_num " << AESL_transaction << "\n";
    }

    void formatContainsVLA()
    {
      ss << "set containsVLA " << containsVLA << "\n";
    }

    void formatHBM()
    {
      ss << "set HBM_ArgDict {\n"
         << "  Name " << nameHBM << "\n"
         << "  Port " << portHBM << "\n"
         << "  BitWidth " << widthHBM << "\n"
         << "}\n";
    }

    void close()
    {
      formatDepth();
      formatTransDepth();
      formatContainsVLA();
      formatTransNum();
      if (nameHBM != "") {
        formatHBM();
      }
      std::string &&s { ss.str() };
      size_t res = fwrite(s.data(), s.size(), 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, err);
      }
    }

  public:
    std::map<const std::string, size_t> depth;
    typedef const std::string PortName;
    typedef const char *BundleName;
    std::map<PortName, std::vector<size_t>> transDepth;
    std::map<PortName, BundleName> bundleNameFor;
    std::string nameHBM;
    size_t depthHBM;
    std::string portHBM;
    unsigned widthHBM;
    size_t AESL_transaction;
    bool containsVLA;
    std::mutex mut;

    RefTCL(const char *path)
    {
      fp = fopen(path, "w");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void set(const char* name, size_t dep)
    {
      std::lock_guard<std::mutex> guard(mut);
      if (depth[name] < dep) {
        depth[name] = dep;
      }
    }

    void append(const char* portName, size_t dep, const char* bundleName)
    {
      std::lock_guard<std::mutex> guard(mut);
      transDepth[portName].push_back(dep);
      bundleNameFor[portName] = bundleName;
    }

    ~RefTCL()
    {
      close();
    }
  };

#endif

  struct Register {
    const char* name;
    unsigned width;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    void* param;

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      if (strcmp(name, "return") == 0) {
        tcl.set("ap_return", 1);
      } else {
        tcl.set(name, 1);
      }
    }
#endif
    ~Register()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  template<typename E>
  struct DirectIO {
    unsigned width;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* writer;
    Writer* swriter;
    Writer* gwriter;
#endif
    hls::directio<E>* param;
    std::vector<E> buf;
    size_t initSize;
    size_t depth;
    bool hasWrite;

    void markSize()
    {
      initSize = param->size();
    }

    void buffer()
    {
      buf.clear();
      while (param->valid()) {
        buf.push_back(param->read());
      }
      for (auto &e : buf) {
        param->write(e);
      }
    }

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, depth);
    }
#endif

    ~DirectIO()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete writer;
      delete swriter;
      delete gwriter;
#endif
    }
  };

  template<typename Reader, typename Writer>
  struct Memory {
    unsigned width;
    unsigned asize;
    bool hbm;
    std::vector<const char*> name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    std::vector<void*> param;
    std::vector<const char*> mname;
    std::vector<size_t> nbytes;
    std::vector<size_t> offset;
    std::vector<bool> hasWrite;

    size_t depth()
    {
      if (hbm) {
        return divide_ceil(nbytes[0], asize);
      }
      else {
        size_t depth = 0;
        for (size_t n : nbytes) {
          depth += divide_ceil(n, asize);
        }
        return depth;
      }
    }

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      if (hbm) {
        tcl.nameHBM.clear();
        tcl.portHBM.clear();
        tcl.nameHBM.append(name[0]);
        tcl.portHBM.append("{").append(name[0]);
        for (size_t i = 1; i < name.size(); ++i) {
          tcl.nameHBM.append("_").append(name[i]);
          tcl.portHBM.append(" ").append(name[i]);
        }
        tcl.nameHBM.append("_HBM");
        tcl.portHBM.append("}");
        tcl.widthHBM = width;
        size_t depthHBM = divide_ceil(nbytes[0], asize);
        tcl.append(tcl.nameHBM.c_str(), depthHBM, tcl.nameHBM.c_str());
        if (depthHBM > tcl.depthHBM) {
          tcl.depthHBM = depthHBM;
        }
      } else {
        tcl.set(name[0], depth());
        for (size_t i = 0; i < mname.size(); ++i) {
          tcl.append(mname[i], divide_ceil(nbytes[i], asize), name[0]);
        }
      }
    }
#endif

    ~Memory()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  struct A2Stream {
    unsigned width;
    unsigned asize;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    void* param;
    size_t nbytes;
    bool hasWrite;

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, divide_ceil(nbytes, asize));
    }
#endif

    ~A2Stream()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  template<typename E>
  struct Stream {
    unsigned width;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* writer;
    Writer* swriter;
    Writer* gwriter;
#endif
    hls::stream<E>* param;
    std::vector<E> buf;
    size_t initSize;
    size_t depth;
    bool hasWrite;

    void markSize()
    {
      initSize = param->size();
    }

    void buffer()
    {
      buf.clear();
      while (!param->empty()) {
        buf.push_back(param->read());
      }
      for (auto &e : buf) {
        param->write(e);
      }
    }

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, depth);
    }
#endif

    ~Stream()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete writer;
      delete swriter;
      delete gwriter;
#endif
    }
  };

#ifdef POST_CHECK
  void check(Register &port)
  {
    port.reader->begin();
    bool foundX = false;
    if (char *s = port.reader->next()) {
      foundX |= RTLOutputCheckAndReplacement(s);
      unformatData(s, (unsigned char*)port.param);
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  template<typename E>
  void check(DirectIO<E> &port)
  {
    if (port.hasWrite) {
      port.reader->begin();
      bool foundX = false;
      E *p = new E;
      while (char *s = port.reader->next()) {
        foundX |= RTLOutputCheckAndReplacement(s);
        unformatData(s, (unsigned char*)p);
        port.param->write(*p);
      }
      delete p;
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    } else {
      port.reader->begin();
      size_t n = 0;
      if (char *s = port.reader->next()) {
        std::istringstream ss(s);
        ss >> n;
      } else {
        throw SimException(bad, __LINE__);
      }
      port.reader->end();
      for (size_t j = 0; j < n; ++j) {
        port.param->read();
      }
    }
  }

  void checkHBM(Memory<Input, Output> &port)
  {
    size_t wbytes = least_nbyte(port.width);
    for (size_t i = 0; i < port.param.size(); ++i) {
      if (port.hasWrite[i]) {
        size_t n = port.reader->begin();
        size_t skip = wbytes * port.offset[i];
        port.reader->advance(skip);
        port.reader->into((unsigned char*)port.param[i], wbytes,
                           port.asize, port.nbytes[i] - skip);
        port.reader->reset();
        port.reader->advance(port.asize*n);
      }
    }
  }

  void check(Memory<Input, Output> &port)
  {
    if (port.hbm) {
      return checkHBM(port);
    } else {
      port.reader->begin();
      size_t wbytes = least_nbyte(port.width);
      for (size_t i = 0; i < port.param.size(); ++i) {
        if (port.hasWrite[i]) {
          port.reader->into((unsigned char*)port.param[i], wbytes,
                             port.asize, port.nbytes[i]);
        } else {
          size_t n = divide_ceil(port.nbytes[i], port.asize);
          port.reader->advance(port.asize*n);
        }
      }
    }
  }

  void transfer(Reader *reader, size_t nbytes, unsigned char *put, bool &foundX)
  {
    if (char *s = reader->next()) {
      foundX |= RTLOutputCheckAndReplacement(s);
      unformatData(s, put, nbytes);
    } else {
      throw SimException("No more data", __LINE__);
    }
  }

  void checkHBM(Memory<Reader, Writer> &port)
  {
    port.reader->begin();
    bool foundX = false;
    size_t wbytes = least_nbyte(port.width);
    for (size_t i = 0, last = port.param.size()-1; i <= last; ++i) {
      if (port.hasWrite[i]) {
        port.reader->skip(port.offset[i]);
        size_t n = port.nbytes[i] / port.asize - port.offset[i];
        unsigned char *put = (unsigned char*)port.param[i];
        for (size_t j = 0; j < n; ++j) {
          transfer(port.reader, wbytes, put, foundX);
          put += port.asize;
        }
        if (i < last) {
          port.reader->reset();
        }
      }
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  void check(Memory<Reader, Writer> &port)
  {
    if (port.hbm) {
      return checkHBM(port);
    } else {
      port.reader->begin();
      bool foundX = false;
      size_t wbytes = least_nbyte(port.width);
      for (size_t i = 0; i < port.param.size(); ++i) {
        if (port.hasWrite[i]) {
          size_t n = port.nbytes[i] / port.asize;
          size_t r = port.nbytes[i] % port.asize;
          unsigned char *put = (unsigned char*)port.param[i];
          for (size_t j = 0; j < n; ++j) {
            transfer(port.reader, wbytes, put, foundX);
            put += port.asize;
          }
          if (r > 0) {
            transfer(port.reader, r, put, foundX);
          }
        } else {
          size_t n = divide_ceil(port.nbytes[i], port.asize);
          port.reader->skip(n);
        }
      }
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    }
  }

  void check(A2Stream &port)
  {
    port.reader->begin();
    bool foundX = false;
    if (port.hasWrite) {
      size_t wbytes = least_nbyte(port.width);
      size_t n = port.nbytes / port.asize;
      size_t r = port.nbytes % port.asize;
      unsigned char *put = (unsigned char*)port.param;
      for (size_t j = 0; j < n; ++j) {
        if (char *s = port.reader->next()) {
          foundX |= RTLOutputCheckAndReplacement(s);
          unformatData(s, put, wbytes);
        }
        put += port.asize;
      }
      if (r > 0) {
        if (char *s = port.reader->next()) {
          foundX |= RTLOutputCheckAndReplacement(s);
          unformatData(s, put, r);
        }
      }
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  template<typename E>
  void check(Stream<E> &port)
  {
    if (port.hasWrite) {
      port.reader->begin();
      bool foundX = false;
      E *p = new E;
      while (char *s = port.reader->next()) {
        foundX |= RTLOutputCheckAndReplacement(s);
        unformatData(s, (unsigned char*)p);
        port.param->write(*p);
      }
      delete p;
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    } else {
      port.reader->begin();
      size_t n = 0;
      if (char *s = port.reader->next()) {
        std::istringstream ss(s);
        ss >> n;
      } else {
        throw SimException(bad, __LINE__);
      }
      port.reader->end();
      for (size_t j = 0; j < n; ++j) {
        port.param->read();
      }
    }
  }
#else
  void dump(Register &port, Writer *writer, size_t AESL_transaction)
  {
    writer->begin(AESL_transaction);
    std::string &&s { formatData((unsigned char*)port.param, port.width) };
    writer->next(s.data());
    writer->end();
  }

  template<typename E>
  void dump(DirectIO<E> &port, size_t AESL_transaction)
  {
    if (port.hasWrite) {
      port.writer->begin(AESL_transaction);
      port.depth = port.param->size()-port.initSize;
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[port.initSize+j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();
    } else {
      port.writer->begin(AESL_transaction);
      port.depth = port.initSize-port.param->size();
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();

      port.gwriter->begin(AESL_transaction);
      size_t n = (port.depth ? port.initSize : port.depth);
      size_t d = port.depth;
      do {
        port.gwriter->next(std::to_string(n--).c_str());
      } while (d--);
      port.gwriter->end();
    }
  }

  void error_on_depth_unspecified(const char *portName)
  {
    std::string msg {"A depth specification is required for interface port "};
    msg.append("'");
    msg.append(portName);
    msg.append("'");
    msg.append(" for cosimulation.");
    throw SimException(msg, __LINE__);
  }

  void dump(Memory<Input, Output> &port, Output *writer, size_t AESL_transaction)
  {
    for (size_t i = 0; i < port.param.size(); ++i) {
      if (port.nbytes[i] == 0) {
        error_on_depth_unspecified(port.mname[i]);
      }
    }

    writer->begin(port.depth());
    size_t wbytes = least_nbyte(port.width);
    if (port.hbm) {
      writer->from((unsigned char*)port.param[0], wbytes, port.asize,
                   port.nbytes[0], 0);
    }
    else {
      for (size_t i = 0; i < port.param.size(); ++i) {
        writer->from((unsigned char*)port.param[i], wbytes, port.asize,
                     port.nbytes[i], 0);
      }
    }
  }

  void dump(Memory<Reader, Writer> &port, Writer *writer, size_t AESL_transaction)
  {
    for (size_t i = 0; i < port.param.size(); ++i) {
      if (port.nbytes[i] == 0) {
        error_on_depth_unspecified(port.mname[i]);
      }
    }
    writer->begin(AESL_transaction);
    for (size_t i = 0; i < port.param.size(); ++i) {
      size_t n = divide_ceil(port.nbytes[i], port.asize);
      unsigned char *put = (unsigned char*)port.param[i];
      for (size_t j = 0; j < n; ++j) {
        std::string &&s {
          formatData(put, port.width)
        };
        writer->next(s.data());
        put += port.asize;
      }
      if (port.hbm) {
        break;
      }
    }
    writer->end();
  }

  void dump(A2Stream &port, Writer *writer, size_t AESL_transaction)
  {
    if (port.nbytes == 0) {
      error_on_depth_unspecified(port.name);
    }
    writer->begin(AESL_transaction);
    size_t n = divide_ceil(port.nbytes, port.asize);
    unsigned char *put = (unsigned char*)port.param;
    for (size_t j = 0; j < n; ++j) {
      std::string &&s { formatData(put, port.width) };
      writer->next(s.data());
      put += port.asize;
    }
    writer->end();
  }

  template<typename E>
  void dump(Stream<E> &port, size_t AESL_transaction)
  {
    if (port.hasWrite) {
      port.writer->begin(AESL_transaction);
      port.depth = port.param->size()-port.initSize;
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[port.initSize+j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();
    } else {
      port.writer->begin(AESL_transaction);
      port.depth = port.initSize-port.param->size();
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();

      port.gwriter->begin(AESL_transaction);
      size_t n = (port.depth ? port.initSize : port.depth);
      size_t d = port.depth;
      do {
        port.gwriter->next(std::to_string(n--).c_str());
      } while (d--);
      port.gwriter->end();
    }
  }
#endif
}



extern "C"
void minkowski_net_14_layer_pipeline_hw_stub_wrapper(void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*);

extern "C"
void apatb_minkowski_net_14_layer_pipeline_hw(void* __xlx_apatb_param_input_voxel_stream, void* __xlx_apatb_param_final_output_full_cubic, void* __xlx_apatb_param_layer_weights_0, void* __xlx_apatb_param_layer_weights_1, void* __xlx_apatb_param_layer_weights_2, void* __xlx_apatb_param_layer_weights_3, void* __xlx_apatb_param_layer_weights_4, void* __xlx_apatb_param_layer_weights_5, void* __xlx_apatb_param_layer_weights_6, void* __xlx_apatb_param_layer_weights_7, void* __xlx_apatb_param_layer_weights_8, void* __xlx_apatb_param_layer_weights_9, void* __xlx_apatb_param_layer_weights_10, void* __xlx_apatb_param_layer_weights_11, void* __xlx_apatb_param_layer_weights_12, void* __xlx_apatb_param_layer_weights_13, void* __xlx_apatb_param_layer_biases_0, void* __xlx_apatb_param_layer_biases_1, void* __xlx_apatb_param_layer_biases_2, void* __xlx_apatb_param_layer_biases_3, void* __xlx_apatb_param_layer_biases_4, void* __xlx_apatb_param_layer_biases_5, void* __xlx_apatb_param_layer_biases_6, void* __xlx_apatb_param_layer_biases_7, void* __xlx_apatb_param_layer_biases_8, void* __xlx_apatb_param_layer_biases_9, void* __xlx_apatb_param_layer_biases_10, void* __xlx_apatb_param_layer_biases_11, void* __xlx_apatb_param_layer_biases_12, void* __xlx_apatb_param_layer_biases_13, void* __xlx_apatb_param_pruned_feature_dram_read, void* __xlx_apatb_param_pruned_feature_dram_write, void* __xlx_apatb_param_L3_bitmap, void* __xlx_apatb_param_L2_bitmap, void* __xlx_apatb_param_L1_bitmap, void* __xlx_apatb_param_L0_bitmap, void* __xlx_apatb_param_bitmap_info, void* __xlx_apatb_param_total_processed_voxels)
{
  static hls::sim::Stream<hls::sim::Byte<256>> port0 {
    .width = 1085,
    .name = "input_voxel_stream",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(WRAPC_STREAM_SIZE_IN_input_voxel_stream),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVIN_input_voxel_stream),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_IN_input_voxel_stream),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_INGRESS_STATUS_input_voxel_stream),
#endif
  };
  port0.param = (hls::stream<hls::sim::Byte<256>>*)__xlx_apatb_param_input_voxel_stream;
  port0.hasWrite = false;

  hls::sim::Byte<4> __xlx_offset_byte_param_final_output_full_cubic;
  static hls::sim::Register port1 {
    .name = "final_output_full_cubic",
    .width = 32,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_final_output_full_cubic),
#endif
  };
  port1.param = &__xlx_offset_byte_param_final_output_full_cubic;

  hls::sim::Byte<4> __xlx_offset_byte_param_pruned_feature_dram_read;
  static hls::sim::Register port2 {
    .name = "pruned_feature_dram_read",
    .width = 32,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_pruned_feature_dram_read),
#endif
  };
  port2.param = &__xlx_offset_byte_param_pruned_feature_dram_read;

  hls::sim::Byte<4> __xlx_offset_byte_param_pruned_feature_dram_write;
  static hls::sim::Register port3 {
    .name = "pruned_feature_dram_write",
    .width = 32,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_pruned_feature_dram_write),
#endif
  };
  port3.param = &__xlx_offset_byte_param_pruned_feature_dram_write;

  static hls::sim::Register port4 {
    .name = "bitmap_info",
    .width = 160,
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_bitmap_info),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_bitmap_info),
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_bitmap_info),
#endif
  };
  port4.param = __xlx_apatb_param_bitmap_info;

  static hls::sim::Register port5 {
    .name = "total_processed_voxels",
    .width = 32,
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_total_processed_voxels),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_total_processed_voxels),
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_total_processed_voxels),
#endif
  };
  port5.param = __xlx_apatb_param_total_processed_voxels;

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port6 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port6 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "gmem_output" },
#ifdef POST_CHECK
#ifdef USE_BINARY_TV_FILE
    .reader = new hls::sim::Input(AUTOTB_TVOUT_PC_gmem_output),
#else
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_gmem_output),
#endif
#else
#ifdef USE_BINARY_TV_FILE
    .owriter = new hls::sim::Output(AUTOTB_TVOUT_gmem_output),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_gmem_output),
#endif
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_gmem_output),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_gmem_output),
#endif
#endif
    .hasWrite = { true },
  };
  port6.param = { __xlx_apatb_param_final_output_full_cubic };
  port6.mname = { "final_output_full_cubic" };
  port6.nbytes = { 20971520 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port7 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port7 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "gmem_read" },
#ifdef POST_CHECK
#ifdef USE_BINARY_TV_FILE
    .reader = new hls::sim::Input(AUTOTB_TVOUT_PC_gmem_read),
#else
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_gmem_read),
#endif
#else
#ifdef USE_BINARY_TV_FILE
    .owriter = new hls::sim::Output(AUTOTB_TVOUT_gmem_read),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_gmem_read),
#endif
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_gmem_read),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_gmem_read),
#endif
#endif
    .hasWrite = { true },
  };
  port7.param = { __xlx_apatb_param_pruned_feature_dram_read };
  port7.mname = { "pruned_feature_dram_read" };
  port7.nbytes = { 1048576 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port8 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port8 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "gmem_write" },
#ifdef POST_CHECK
#ifdef USE_BINARY_TV_FILE
    .reader = new hls::sim::Input(AUTOTB_TVOUT_PC_gmem_write),
#else
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_gmem_write),
#endif
#else
#ifdef USE_BINARY_TV_FILE
    .owriter = new hls::sim::Output(AUTOTB_TVOUT_gmem_write),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_gmem_write),
#endif
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_gmem_write),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_gmem_write),
#endif
#endif
    .hasWrite = { true },
  };
  port8.param = { __xlx_apatb_param_pruned_feature_dram_write };
  port8.mname = { "pruned_feature_dram_write" };
  port8.nbytes = { 1048576 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port9 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port9 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_0" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_0),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_0),
#endif
#endif
    .hasWrite = { false },
  };
  port9.param = { __xlx_apatb_param_layer_weights_0 };
  port9.mname = { "layer_weights_0" };
  port9.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port10 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port10 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_1" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_1),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_1),
#endif
#endif
    .hasWrite = { false },
  };
  port10.param = { __xlx_apatb_param_layer_weights_1 };
  port10.mname = { "layer_weights_1" };
  port10.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port11 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port11 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_2" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_2),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_2),
#endif
#endif
    .hasWrite = { false },
  };
  port11.param = { __xlx_apatb_param_layer_weights_2 };
  port11.mname = { "layer_weights_2" };
  port11.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port12 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port12 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_3" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_3),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_3),
#endif
#endif
    .hasWrite = { false },
  };
  port12.param = { __xlx_apatb_param_layer_weights_3 };
  port12.mname = { "layer_weights_3" };
  port12.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port13 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port13 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_4" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_4),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_4),
#endif
#endif
    .hasWrite = { false },
  };
  port13.param = { __xlx_apatb_param_layer_weights_4 };
  port13.mname = { "layer_weights_4" };
  port13.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port14 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port14 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_5" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_5),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_5),
#endif
#endif
    .hasWrite = { false },
  };
  port14.param = { __xlx_apatb_param_layer_weights_5 };
  port14.mname = { "layer_weights_5" };
  port14.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port15 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port15 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_6" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_6),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_6),
#endif
#endif
    .hasWrite = { false },
  };
  port15.param = { __xlx_apatb_param_layer_weights_6 };
  port15.mname = { "layer_weights_6" };
  port15.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port16 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port16 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_7" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_7),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_7),
#endif
#endif
    .hasWrite = { false },
  };
  port16.param = { __xlx_apatb_param_layer_weights_7 };
  port16.mname = { "layer_weights_7" };
  port16.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port17 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port17 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_8" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_8),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_8),
#endif
#endif
    .hasWrite = { false },
  };
  port17.param = { __xlx_apatb_param_layer_weights_8 };
  port17.mname = { "layer_weights_8" };
  port17.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port18 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port18 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_9" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_9),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_9),
#endif
#endif
    .hasWrite = { false },
  };
  port18.param = { __xlx_apatb_param_layer_weights_9 };
  port18.mname = { "layer_weights_9" };
  port18.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port19 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port19 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_10" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_10),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_10),
#endif
#endif
    .hasWrite = { false },
  };
  port19.param = { __xlx_apatb_param_layer_weights_10 };
  port19.mname = { "layer_weights_10" };
  port19.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port20 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port20 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_11" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_11),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_11),
#endif
#endif
    .hasWrite = { false },
  };
  port20.param = { __xlx_apatb_param_layer_weights_11 };
  port20.mname = { "layer_weights_11" };
  port20.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port21 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port21 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_12" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_12),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_12),
#endif
#endif
    .hasWrite = { false },
  };
  port21.param = { __xlx_apatb_param_layer_weights_12 };
  port21.mname = { "layer_weights_12" };
  port21.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port22 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port22 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_weights_13" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_weights_13),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_weights_13),
#endif
#endif
    .hasWrite = { false },
  };
  port22.param = { __xlx_apatb_param_layer_weights_13 };
  port22.mname = { "layer_weights_13" };
  port22.nbytes = { 113246208 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port23 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port23 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_0" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_0),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_0),
#endif
#endif
    .hasWrite = { false },
  };
  port23.param = { __xlx_apatb_param_layer_biases_0 };
  port23.mname = { "layer_biases_0" };
  port23.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port24 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port24 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_1" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_1),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_1),
#endif
#endif
    .hasWrite = { false },
  };
  port24.param = { __xlx_apatb_param_layer_biases_1 };
  port24.mname = { "layer_biases_1" };
  port24.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port25 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port25 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_2" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_2),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_2),
#endif
#endif
    .hasWrite = { false },
  };
  port25.param = { __xlx_apatb_param_layer_biases_2 };
  port25.mname = { "layer_biases_2" };
  port25.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port26 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port26 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_3" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_3),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_3),
#endif
#endif
    .hasWrite = { false },
  };
  port26.param = { __xlx_apatb_param_layer_biases_3 };
  port26.mname = { "layer_biases_3" };
  port26.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port27 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port27 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_4" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_4),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_4),
#endif
#endif
    .hasWrite = { false },
  };
  port27.param = { __xlx_apatb_param_layer_biases_4 };
  port27.mname = { "layer_biases_4" };
  port27.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port28 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port28 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_5" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_5),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_5),
#endif
#endif
    .hasWrite = { false },
  };
  port28.param = { __xlx_apatb_param_layer_biases_5 };
  port28.mname = { "layer_biases_5" };
  port28.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port29 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port29 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_6" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_6),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_6),
#endif
#endif
    .hasWrite = { false },
  };
  port29.param = { __xlx_apatb_param_layer_biases_6 };
  port29.mname = { "layer_biases_6" };
  port29.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port30 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port30 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_7" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_7),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_7),
#endif
#endif
    .hasWrite = { false },
  };
  port30.param = { __xlx_apatb_param_layer_biases_7 };
  port30.mname = { "layer_biases_7" };
  port30.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port31 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port31 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_8" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_8),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_8),
#endif
#endif
    .hasWrite = { false },
  };
  port31.param = { __xlx_apatb_param_layer_biases_8 };
  port31.mname = { "layer_biases_8" };
  port31.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port32 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port32 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_9" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_9),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_9),
#endif
#endif
    .hasWrite = { false },
  };
  port32.param = { __xlx_apatb_param_layer_biases_9 };
  port32.mname = { "layer_biases_9" };
  port32.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port33 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port33 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_10" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_10),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_10),
#endif
#endif
    .hasWrite = { false },
  };
  port33.param = { __xlx_apatb_param_layer_biases_10 };
  port33.mname = { "layer_biases_10" };
  port33.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port34 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port34 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_11" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_11),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_11),
#endif
#endif
    .hasWrite = { false },
  };
  port34.param = { __xlx_apatb_param_layer_biases_11 };
  port34.mname = { "layer_biases_11" };
  port34.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port35 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port35 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_12" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_12),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_12),
#endif
#endif
    .hasWrite = { false },
  };
  port35.param = { __xlx_apatb_param_layer_biases_12 };
  port35.mname = { "layer_biases_12" };
  port35.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Input, hls::sim::Output> port36 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port36 {
#endif
    .width = 32,
    .asize = 4,
    .hbm = false,
    .name = { "layer_biases_13" },
#ifdef POST_CHECK
#else
    .owriter = nullptr,
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Output(AUTOTB_TVIN_layer_biases_13),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_layer_biases_13),
#endif
#endif
    .hasWrite = { false },
  };
  port36.param = { __xlx_apatb_param_layer_biases_13 };
  port36.mname = { "layer_biases_13" };
  port36.nbytes = { 4096 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port37 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port37 {
#endif
    .width = 512,
    .asize = 64,
    .hbm = false,
    .name = { "L3_bitmap" },
#ifdef POST_CHECK
#ifdef USE_BINARY_TV_FILE
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L3_bitmap),
#else
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L3_bitmap),
#endif
#else
#ifdef USE_BINARY_TV_FILE
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L3_bitmap),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L3_bitmap),
#endif
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L3_bitmap),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L3_bitmap),
#endif
#endif
    .hasWrite = { true },
  };
  port37.param = { __xlx_apatb_param_L3_bitmap };
  port37.mname = { "L3_bitmap" };
  port37.nbytes = { 0 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port38 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port38 {
#endif
    .width = 512,
    .asize = 64,
    .hbm = false,
    .name = { "L2_bitmap" },
#ifdef POST_CHECK
#ifdef USE_BINARY_TV_FILE
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L2_bitmap),
#else
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L2_bitmap),
#endif
#else
#ifdef USE_BINARY_TV_FILE
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L2_bitmap),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L2_bitmap),
#endif
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L2_bitmap),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L2_bitmap),
#endif
#endif
    .hasWrite = { true },
  };
  port38.param = { __xlx_apatb_param_L2_bitmap };
  port38.mname = { "L2_bitmap" };
  port38.nbytes = { 0 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port39 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port39 {
#endif
    .width = 512,
    .asize = 64,
    .hbm = false,
    .name = { "L1_bitmap" },
#ifdef POST_CHECK
#ifdef USE_BINARY_TV_FILE
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L1_bitmap),
#else
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L1_bitmap),
#endif
#else
#ifdef USE_BINARY_TV_FILE
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L1_bitmap),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L1_bitmap),
#endif
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L1_bitmap),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L1_bitmap),
#endif
#endif
    .hasWrite = { true },
  };
  port39.param = { __xlx_apatb_param_L1_bitmap };
  port39.mname = { "L1_bitmap" };
  port39.nbytes = { 0 };

#ifdef USE_BINARY_TV_FILE
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port40 {
#else
  static hls::sim::Memory<hls::sim::Reader, hls::sim::Writer> port40 {
#endif
    .width = 512,
    .asize = 64,
    .hbm = false,
    .name = { "L0_bitmap" },
#ifdef POST_CHECK
#ifdef USE_BINARY_TV_FILE
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L0_bitmap),
#else
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_L0_bitmap),
#endif
#else
#ifdef USE_BINARY_TV_FILE
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L0_bitmap),
#else
    .owriter = new hls::sim::Writer(AUTOTB_TVOUT_L0_bitmap),
#endif
#ifdef USE_BINARY_TV_FILE
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L0_bitmap),
#else
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_L0_bitmap),
#endif
#endif
    .hasWrite = { true },
  };
  port40.param = { __xlx_apatb_param_L0_bitmap };
  port40.mname = { "L0_bitmap" };
  port40.nbytes = { 0 };

  try {
#ifdef POST_CHECK
    CodeState = ENTER_WRAPC_PC;
    check(port4);
    check(port5);
    check(port6);
    check(port7);
    check(port8);
    check(port37);
    check(port38);
    check(port39);
    check(port40);
    check(port0);
#else
    static hls::sim::RefTCL tcl("../tv/cdatafile/ref.tcl");
    tcl.containsVLA = 0;
    CodeState = DUMP_INPUTS;
    dump(port1, port1.iwriter, tcl.AESL_transaction);
    dump(port2, port2.iwriter, tcl.AESL_transaction);
    dump(port3, port3.iwriter, tcl.AESL_transaction);
    dump(port4, port4.iwriter, tcl.AESL_transaction);
    dump(port5, port5.iwriter, tcl.AESL_transaction);
    dump(port6, port6.iwriter, tcl.AESL_transaction);
    dump(port7, port7.iwriter, tcl.AESL_transaction);
    dump(port8, port8.iwriter, tcl.AESL_transaction);
    dump(port9, port9.iwriter, tcl.AESL_transaction);
    dump(port10, port10.iwriter, tcl.AESL_transaction);
    dump(port11, port11.iwriter, tcl.AESL_transaction);
    dump(port12, port12.iwriter, tcl.AESL_transaction);
    dump(port13, port13.iwriter, tcl.AESL_transaction);
    dump(port14, port14.iwriter, tcl.AESL_transaction);
    dump(port15, port15.iwriter, tcl.AESL_transaction);
    dump(port16, port16.iwriter, tcl.AESL_transaction);
    dump(port17, port17.iwriter, tcl.AESL_transaction);
    dump(port18, port18.iwriter, tcl.AESL_transaction);
    dump(port19, port19.iwriter, tcl.AESL_transaction);
    dump(port20, port20.iwriter, tcl.AESL_transaction);
    dump(port21, port21.iwriter, tcl.AESL_transaction);
    dump(port22, port22.iwriter, tcl.AESL_transaction);
    dump(port23, port23.iwriter, tcl.AESL_transaction);
    dump(port24, port24.iwriter, tcl.AESL_transaction);
    dump(port25, port25.iwriter, tcl.AESL_transaction);
    dump(port26, port26.iwriter, tcl.AESL_transaction);
    dump(port27, port27.iwriter, tcl.AESL_transaction);
    dump(port28, port28.iwriter, tcl.AESL_transaction);
    dump(port29, port29.iwriter, tcl.AESL_transaction);
    dump(port30, port30.iwriter, tcl.AESL_transaction);
    dump(port31, port31.iwriter, tcl.AESL_transaction);
    dump(port32, port32.iwriter, tcl.AESL_transaction);
    dump(port33, port33.iwriter, tcl.AESL_transaction);
    dump(port34, port34.iwriter, tcl.AESL_transaction);
    dump(port35, port35.iwriter, tcl.AESL_transaction);
    dump(port36, port36.iwriter, tcl.AESL_transaction);
    dump(port37, port37.iwriter, tcl.AESL_transaction);
    dump(port38, port38.iwriter, tcl.AESL_transaction);
    dump(port39, port39.iwriter, tcl.AESL_transaction);
    dump(port40, port40.iwriter, tcl.AESL_transaction);
    port1.doTCL(tcl);
    port2.doTCL(tcl);
    port3.doTCL(tcl);
    port4.doTCL(tcl);
    port5.doTCL(tcl);
    port6.doTCL(tcl);
    port7.doTCL(tcl);
    port8.doTCL(tcl);
    port9.doTCL(tcl);
    port10.doTCL(tcl);
    port11.doTCL(tcl);
    port12.doTCL(tcl);
    port13.doTCL(tcl);
    port14.doTCL(tcl);
    port15.doTCL(tcl);
    port16.doTCL(tcl);
    port17.doTCL(tcl);
    port18.doTCL(tcl);
    port19.doTCL(tcl);
    port20.doTCL(tcl);
    port21.doTCL(tcl);
    port22.doTCL(tcl);
    port23.doTCL(tcl);
    port24.doTCL(tcl);
    port25.doTCL(tcl);
    port26.doTCL(tcl);
    port27.doTCL(tcl);
    port28.doTCL(tcl);
    port29.doTCL(tcl);
    port30.doTCL(tcl);
    port31.doTCL(tcl);
    port32.doTCL(tcl);
    port33.doTCL(tcl);
    port34.doTCL(tcl);
    port35.doTCL(tcl);
    port36.doTCL(tcl);
    port37.doTCL(tcl);
    port38.doTCL(tcl);
    port39.doTCL(tcl);
    port40.doTCL(tcl);
    port0.markSize();
    port0.buffer();
    CodeState = CALL_C_DUT;
    minkowski_net_14_layer_pipeline_hw_stub_wrapper(__xlx_apatb_param_input_voxel_stream, __xlx_apatb_param_final_output_full_cubic, __xlx_apatb_param_layer_weights_0, __xlx_apatb_param_layer_weights_1, __xlx_apatb_param_layer_weights_2, __xlx_apatb_param_layer_weights_3, __xlx_apatb_param_layer_weights_4, __xlx_apatb_param_layer_weights_5, __xlx_apatb_param_layer_weights_6, __xlx_apatb_param_layer_weights_7, __xlx_apatb_param_layer_weights_8, __xlx_apatb_param_layer_weights_9, __xlx_apatb_param_layer_weights_10, __xlx_apatb_param_layer_weights_11, __xlx_apatb_param_layer_weights_12, __xlx_apatb_param_layer_weights_13, __xlx_apatb_param_layer_biases_0, __xlx_apatb_param_layer_biases_1, __xlx_apatb_param_layer_biases_2, __xlx_apatb_param_layer_biases_3, __xlx_apatb_param_layer_biases_4, __xlx_apatb_param_layer_biases_5, __xlx_apatb_param_layer_biases_6, __xlx_apatb_param_layer_biases_7, __xlx_apatb_param_layer_biases_8, __xlx_apatb_param_layer_biases_9, __xlx_apatb_param_layer_biases_10, __xlx_apatb_param_layer_biases_11, __xlx_apatb_param_layer_biases_12, __xlx_apatb_param_layer_biases_13, __xlx_apatb_param_pruned_feature_dram_read, __xlx_apatb_param_pruned_feature_dram_write, __xlx_apatb_param_L3_bitmap, __xlx_apatb_param_L2_bitmap, __xlx_apatb_param_L1_bitmap, __xlx_apatb_param_L0_bitmap, __xlx_apatb_param_bitmap_info, __xlx_apatb_param_total_processed_voxels);
    dump(port0, tcl.AESL_transaction);
    port0.doTCL(tcl);
    CodeState = DUMP_OUTPUTS;
    dump(port4, port4.owriter, tcl.AESL_transaction);
    dump(port5, port5.owriter, tcl.AESL_transaction);
    dump(port6, port6.owriter, tcl.AESL_transaction);
    dump(port7, port7.owriter, tcl.AESL_transaction);
    dump(port8, port8.owriter, tcl.AESL_transaction);
    dump(port37, port37.owriter, tcl.AESL_transaction);
    dump(port38, port38.owriter, tcl.AESL_transaction);
    dump(port39, port39.owriter, tcl.AESL_transaction);
    dump(port40, port40.owriter, tcl.AESL_transaction);
    tcl.AESL_transaction++;
#endif
  } catch (const hls::sim::SimException &e) {
    hls::sim::errExit(e.line, e.msg);
  }
}