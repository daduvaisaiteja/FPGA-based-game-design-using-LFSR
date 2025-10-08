# Define the input pins for A and B

#set_property -dict {PACKAGE_PIN F14 IOSTANDARD SSTL135} [get_ports clk_fpga]
#create_clock -period 10.000 -name sans_clk_pin -waveform {0.000 5.000} -add [get_ports clk_fpga]

set_property PACKAGE_PIN F14 [get_ports clk_fpga]
    set_property IOSTANDARD LVCMOS33 [get_ports clk_fpga]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_fpga]

set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { teamSwitch }]

# On-board Slide switches
set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]
set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]
set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]
set_property -dict { PACKAGE_PIN F2    IOSTANDARD LVCMOS33 } [get_ports { led[3] }]
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { led[4] }]
set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { led[5] }]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { led[6] }]
set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { led[7] }]
set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { led[8] }]
set_property -dict { PACKAGE_PIN C3    IOSTANDARD LVCMOS33 } [get_ports { led[9] }]
set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { led[10] }]
set_property -dict { PACKAGE_PIN A2    IOSTANDARD LVCMOS33 } [get_ports { led[11] }]
set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { led[12] }]
set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { led[13] }]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { led[14] }]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { led[15] }]

set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS33} [get_ports {seg[0]}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {seg[1]}]
set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS33} [get_ports {seg[2]}]
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports {seg[3]}]
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports {seg[4]}]
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {seg[5]}]
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS33} [get_ports {seg[6]}]

set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33 } [get_ports dp]

set_property -dict {PACKAGE_PIN H3    IOSTANDARD LVCMOS33 } [get_ports { an[0] }]
set_property -dict {PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { an[1] }]
set_property -dict {PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { an[2] }]
set_property -dict {PACKAGE_PIN E4    IOSTANDARD LVCMOS33 } [get_ports { an[3] }]

set_property -dict {PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports reset]

set_property -dict {PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports Play]

#set_property CFGBVS VCCO [current_design]

#set_property CONFIG_VOLTAGE 3.3 [current_design]


    #set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]
#set_property ALLOW_COMBINATION_LOOPS TRUE [get_nets CG1/CG1_3/Game_Over_reg_2]
#set_property ALLOW_COMBINATION_LOOPS TRUE [get_nets CG1/CG1_3/Game_Over_reg_3]
#set_property ALLOW_COMBINATION_LOOPS TRUE [get_nets CG1/CG1_3/Game_Over_reg_4]
#set_property ALLOW_COMBINATION_LOOPS TRUE [get_nets CG1/CG1_3/Innings_Over_reg_1]
#set_property ALLOW_COMBINATION_LOOPS TRUE [get_nets CG1/CG1_3/seg_OBUF[6]_inst_i_18_n_0]







