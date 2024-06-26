set ref_cycle  5
set DESIGN_TOP FMDLL
#/*--------------------------------------------------------------*/
#/*----------------------- 1.Read files -------------------------*/
#/*--------------------------------------------------------------*/
#read_file -format verilog ../1.RTL_simulation/FMDLL.v
analyze -format verilog {../1.RTL_simulation/FMDLL.v}

# Top module name
#current_design [get_designs gcd]
elaborate $DESIGN_TOP
set_operating_conditions -min_library fast -min fast \
                        -max_library slow -max slow
#/*--------------------------------------------------------------*/
#/*--------------- 2. Set design constraints --------------------*/ 
#/*--------------------------------------------------------------*/
#set_dont_touch {BUFX2}
set_dont_touch {U2/D1/DDC1/NAND2X2}
set_dont_touch {U2/D1/DDC2/NAND2X2}
set_dont_touch {U2/D1/DDC3/NAND2X2}
set_dont_touch {U2/D1/DDC4/NAND2X2}
set_dont_touch {U2/D1/DDC5/NAND2X2}
set_dont_touch {U2/D1/DDC6/NAND2X2}
set_dont_touch {U2/D1/DDC7/NAND2X2}
set_dont_touch {U2/D1/DDC8/NAND2X2}
set_dont_touch {U2/D1/DDC9/NAND2X2}
set_dont_touch {U2/D1/DDC10/NAND2X2}
set_dont_touch {U2/D1/DDC11/NAND2X2}
set_dont_touch {U2/D1/DDC12/NAND2X2}
set_dont_touch {U2/D1/DDC13/NAND2X2}
set_dont_touch {U2/D1/DDC14/NAND2X2}
set_dont_touch {U2/D1/DDC15/NAND2X2}
set_dont_touch {U2/D1/DDC16/NAND2X2}
set_dont_touch {U2/D1/DDC1/BUFX2}
set_dont_touch {U2/D1/DDC2/BUFX2}
set_dont_touch {U2/D1/DDC3/BUFX2}
set_dont_touch {U2/D1/DDC4/BUFX2}
set_dont_touch {U2/D1/DDC5/BUFX2}
set_dont_touch {U2/D1/DDC6/BUFX2}
set_dont_touch {U2/D1/DDC7/BUFX2}
set_dont_touch {U2/D1/DDC8/BUFX2}
set_dont_touch {U2/D1/DDC9/BUFX2}
set_dont_touch {U2/D1/DDC10/BUFX2}
set_dont_touch {U2/D1/DDC11/BUFX2}
set_dont_touch {U2/D1/DDC12/BUFX2}
set_dont_touch {U2/D1/DDC13/BUFX2}
set_dont_touch {U2/D1/DDC14/BUFX2}
set_dont_touch {U2/D1/DDC15/BUFX2}
set_dont_touch {U2/D1/DDC16/BUFX2}
set_dont_touch {U2/D2/FDE1/NAND2XL}
set_dont_touch {U2/D2/FDE2/NAND2XL}
set_dont_touch {U2/D2/FDE3/NAND2XL}
set_dont_touch {U2/D2/FDE4/NAND2XL}
set_dont_touch {U2/D2/FDE5/NAND2XL}
set_dont_touch {U2/D2/FDE6/NAND2XL}
set_dont_touch {U2/D2/FDE7/NAND2XL}
set_dont_touch {U2/D2/FDE8/NAND2XL}
set_dont_touch {U2/D3/FDE1/NAND2XL}
set_dont_touch {U2/D3/FDE2/NAND2XL}
set_dont_touch {U2/D3/FDE3/NAND2XL}
set_dont_touch {U2/D3/FDE4/NAND2XL}
set_dont_touch {U2/D3/FDE5/NAND2XL}
set_dont_touch {U2/D3/FDE6/NAND2XL}
set_dont_touch {U2/D3/FDE7/NAND2XL}
set_dont_touch {U2/D3/FDE8/NAND2XL}
set_dont_touch {U2/D2/FDE1/BUFX2}
set_dont_touch {U2/D2/FDE2/BUFX2}
set_dont_touch {U2/D2/FDE3/BUFX2}
set_dont_touch {U2/D2/FDE4/BUFX2}
set_dont_touch {U2/D2/FDE5/BUFX2}
set_dont_touch {U2/D2/FDE6/BUFX2}
set_dont_touch {U2/D2/FDE7/BUFX2}
set_dont_touch {U2/D2/FDE8/BUFX2}
set_dont_touch {U2/D3/FDE1/BUFX2}
set_dont_touch {U2/D3/FDE2/BUFX2}
set_dont_touch {U2/D3/FDE3/BUFX2}
set_dont_touch {U2/D3/FDE4/BUFX2}
set_dont_touch {U2/D3/FDE5/BUFX2}
set_dont_touch {U2/D3/FDE6/BUFX2}
set_dont_touch {U2/D3/FDE7/BUFX2}
set_dont_touch {U2/D3/FDE8/BUFX2}

set_dont_touch {U0/P1/DFFSHQX8}
set_dont_touch {U0/P1/BUFX20}
set_dont_touch {U2/CLKBUFX20}

set_dont_touch {U0/P1/Controller1/NAND2XL}
set_dont_touch {U0/P1/Controller1/NOR2XL}
set_dont_touch {U0/P1/Controller1/INVXL}
set_dont_touch {U0/P1/Controller1/BUFX2}

set_dont_touch {U0/P1/Controller2/INVXL}
set_dont_touch {U0/P1/Controller2/BUFX2}
set_dont_touch {U0/P1/Controller2/NOR2XL}

set_dont_touch {U0/P0/BUFX2}
*set_dont_touch {clk_out_tmp}

create_clock -period $ref_cycle [get_ports clk_ext]
set_dont_touch_network [get_clocks clk_ext]
set_fix_hold clk_ext
#set_dont_touch_network [get_ports rst_n]

set_drive 1 [all_inputs] 
set_load [load_of slow/CLKBUFX20/A] [all_outputs]
#/*--------------------------------------------------------------*/
#/*----------------- 3.Check and Link Design --------------------*/ 
#/*--------------------------------------------------------------*/
link 
check_design
uniquify
set_fix_multiple_port_nets -all -buffer_constants  
#/*--------------------------------------------------------------*/
#/*------------------------ 4.Compile ---------------------------*/ 
#/*--------------------------------------------------------------*/

# Setting DRC Constraint
set_max_fanout 30.0 $DESIGN_TOP

# Area Constraint
set_max_area   0

# before synthesis settings
set case_analysis_with_logic_constants true
set_fix_multiple_port_nets -all -buffer_constants

set_clock_gating_style -max_fanout 30

compile  -map_effort medium 

# remove dummy ports
remove_unconnected_ports [get_cells -hierarchical *]
remove_unconnected_ports [get_cells -hierarchical *] -blast_buses

check_design 

set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
define_name_rules name_rule -map {{"\*cell\*" "cell"}}
define_name_rules name_rule -map {{"*-return", "myreturn"}}
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule

set verilogout_show_unconnected_pins true  

#/*--------------------------------------------------------------*/ 
#/*----------------------- 5.Write out files --------------------*/ 
#/*--------------------------------------------------------------*/

report_area > ./FMDLL_syn.report
report_timing -path full -delay max >> ./FMDLL_syn.report
report_power >> ./FMDLL_syn.report

write -format verilog -hierarchy -output ./FMDLL_syn.v
write -format verilog -hierarchy -output ../3.Post_layout_Simulation/APR/design_data/FMDLL_syn.v

write_sdf -version 2.1 -context verilog -load_delay cell ./FMDLL_syn.sdf 
write_sdc ../3.Post_layout_Simulation/APR/design_data/FMDLL_syn.sdc 

exit
