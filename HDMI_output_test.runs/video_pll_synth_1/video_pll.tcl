# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7z020clg400-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/84546/Desktop/main/HDMI_output_test.cache/wt [current_project]
set_property parent.project_path C:/Users/84546/Desktop/main/HDMI_output_test.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_ip -quiet C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xci
set_property used_in_implementation false [get_files -all c:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xdc]
set_property used_in_implementation false [get_files -all c:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top video_pll -part xc7z020clg400-2 -mode out_of_context

rename_ref -prefix_all video_pll_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef video_pll.dcp
create_report "video_pll_synth_1_synth_report_utilization_0" "report_utilization -file video_pll_utilization_synth.rpt -pb video_pll_utilization_synth.pb"

if { [catch {
  write_verilog -force -mode synth_stub C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

add_files C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_stub.v -of_objects [get_files C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xci]

add_files C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_stub.vhdl -of_objects [get_files C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xci]

add_files C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_sim_netlist.v -of_objects [get_files C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xci]

add_files C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_sim_netlist.vhdl -of_objects [get_files C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xci]

add_files C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll.dcp -of_objects [get_files C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xci]

if {[file isdir C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll]} {
  catch { 
    file copy -force C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_sim_netlist.v C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll
  }
}

if {[file isdir C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll]} {
  catch { 
    file copy -force C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_sim_netlist.vhdl C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll
  }
}

if {[file isdir C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll]} {
  catch { 
    file copy -force C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_stub.v C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll
  }
}

if {[file isdir C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll]} {
  catch { 
    file copy -force C:/Users/84546/Desktop/main/HDMI_output_test.runs/video_pll_synth_1/video_pll_stub.vhdl C:/Users/84546/Desktop/main/HDMI_output_test.ip_user_files/ip/video_pll
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
