#include <iostream>
#include "hls_stream.h"
#include "hls_directio.h"

using namespace std;

struct __cosim_T_144__ {char data[144];};
extern "C" void fpga_fifo_push_144(__cosim_T_144__* val, hls::stream<__cosim_T_144__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_144(__cosim_T_144__* val, hls::stream<__cosim_T_144__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_144(hls::stream<__cosim_T_144__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_144(hls::stream<__cosim_T_144__>* fifo) {
  return fifo->exist();
}
extern "C" bool fpga_direct_valid_144(hls::directio<__cosim_T_144__, 0>* direct) {
  return direct->valid();
}
extern "C" void fpga_direct_load_144(__cosim_T_144__* val, hls::directio<__cosim_T_144__, 0>* direct) {
  *val = direct->read();
}
extern "C" void fpga_direct_store_144(__cosim_T_144__* val, hls::directio<__cosim_T_144__, 0>* direct) {
  direct->write(*val);
}
struct __cosim_T_256__ {char data[256];};
extern "C" void fpga_fifo_push_256(__cosim_T_256__* val, hls::stream<__cosim_T_256__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_256(__cosim_T_256__* val, hls::stream<__cosim_T_256__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_256(hls::stream<__cosim_T_256__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_256(hls::stream<__cosim_T_256__>* fifo) {
  return fifo->exist();
}
extern "C" bool fpga_direct_valid_256(hls::directio<__cosim_T_256__, 0>* direct) {
  return direct->valid();
}
extern "C" void fpga_direct_load_256(__cosim_T_256__* val, hls::directio<__cosim_T_256__, 0>* direct) {
  *val = direct->read();
}
extern "C" void fpga_direct_store_256(__cosim_T_256__* val, hls::directio<__cosim_T_256__, 0>* direct) {
  direct->write(*val);
}
