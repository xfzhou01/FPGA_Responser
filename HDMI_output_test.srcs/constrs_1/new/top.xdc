#Clock signal
set_property PACKAGE_PIN U18 [get_ports {sys_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {sys_clk}]
create_clock -period 10.000 -waveform {0.000 5.000} [get_ports sys_clk]

set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_n]


set_property PACKAGE_PIN N18 [get_ports TMDS_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_p]


set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_n[0]}]


set_property PACKAGE_PIN V20 [get_ports {TMDS_data_p[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_p[0]}]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_n[1]}]


set_property PACKAGE_PIN T20 [get_ports {TMDS_data_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_p[1]}]


set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_n[2]}]


set_property PACKAGE_PIN N20 [get_ports {TMDS_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_p[2]}]


set_property PACKAGE_PIN V16 [get_ports {HDMI_OEN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {HDMI_OEN[0]}]

set_property PACKAGE_PIN N15 [get_ports {key1}]
set_property IOSTANDARD LVCMOS33 [get_ports {key1}]

set_property PACKAGE_PIN N16 [get_ports {key2}]
set_property IOSTANDARD LVCMOS33 [get_ports {key2}]

set_property PACKAGE_PIN T17 [get_ports {key3}]
set_property IOSTANDARD LVCMOS33 [get_ports {key3}]

set_property PACKAGE_PIN R17 [get_ports {key4}]
set_property IOSTANDARD LVCMOS33 [get_ports {key4}]

set_property PACKAGE_PIN M14 [get_ports {debug1}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug1}]

set_property PACKAGE_PIN M15 [get_ports {debug2}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug2}]

set_property PACKAGE_PIN K16 [get_ports {debug3}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug3}]

set_property PACKAGE_PIN J16 [get_ports {debug4}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug4}]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets video_pll_m0/inst/clk_in1_video_pll]