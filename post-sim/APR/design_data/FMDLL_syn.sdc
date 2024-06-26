###################################################################

# Created by write_sdc on Tue May  7 09:55:01 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max slow -max_library slow\
                         -min fast -min_library fast
set_max_area 0
set_max_fanout 30 [current_design]
set_load -pin_load 0.005194 [get_ports clk_out]
set_load -pin_load 0.005194 [get_ports {Sel[1]}]
set_load -pin_load 0.005194 [get_ports {Sel[0]}]
create_clock [get_ports clk_ext]  -period 5  -waveform {0 2.5}
set_drive 1  [get_ports {M[1]}]
set_drive 1  [get_ports {M[0]}]
set_drive 1  [get_ports {N[3]}]
set_drive 1  [get_ports {N[2]}]
set_drive 1  [get_ports {N[1]}]
set_drive 1  [get_ports {N[0]}]
set_drive 1  [get_ports flag]
set_drive 1  [get_ports rst_n]
set_drive 1  [get_ports clk_ext]
