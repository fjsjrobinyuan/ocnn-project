
set TopModule "minkowski_net_14_layer_pipeline"
set ClockPeriod 5
set ClockList ap_clk
set AxiliteClockList {}
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 1
set FftOrFirFlag 0
set NbRWValue 3
set intNbAccess 1
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix minkowski_net_14_layer_pipeline_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xcu250:-figd2104:-2L-e
set SourceFiles {sc {} c {../.././streaming_bitmap_constructor.cpp ../.././morton_reorder_buffer.cpp ../.././dynamic_access.cpp ../.././systolic_array.cpp ../.././complete_pipeline.cpp ../.././minkowski_net.cpp ../../streaming_bitmap_constructor.cpp ../../morton_reorder_buffer.cpp ../../dynamic_access.cpp ../../systolic_array.cpp ../../complete_pipeline.cpp ../../minkowski_net.cpp}}
set SourceFlags {sc {} c {{ } {} { } {} { } {} { } {} { } {} { } {} {} {} {} {} {} {}}}
set DirectiveFile {}
set TBFiles {verilog ../../minkowski_testbench.cpp bc ../../minkowski_testbench.cpp sc ../../minkowski_testbench.cpp vhdl ../../minkowski_testbench.cpp c {} cas ../../minkowski_testbench.cpp}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set TBInstNames {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../../.
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 1
set PlatformFiles {{DefaultPlatform {xilinx/virtexuplus/virtexuplus}}}
set HPFPO 0
