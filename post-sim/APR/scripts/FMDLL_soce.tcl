
set TOP_DESIGN "FMDLL"

# Step.1 Design Import
loadConfig ../design_data/${TOP_DESIGN}.conf 1

# Step.2 Floorplan
floorPlan -r 1 0.1 5 5 5 5 

#Step.3 Power planning
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VDD -type tiehi -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}
globalNetConnect VSS -type tielo -pin VSS -inst * -module {}
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin {} -center 1 -stacked_via_top_layer M5 -type core_rings -jog_distance 0.42 -threshold 0.1 -nets {VDD VSS} -follow core -stacked_via_bottom_layer M1 -layer {bottom M5 top M5 right M4 left M4} -width 2 -spacing 0.5 -offset 0.1 -extend_corner {tl lt tr bl br rb lb rt}
sroute -connect { corePin } -layerChangeRange { M1 M5 } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1 M8 } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { M1 M8 }

# Step.4 Placement
set_dont_touch * true

setPlaceMode -fp false
placeDesign -prePlaceOpt
addTieHiLo -cell {TIELO TIEHI} -prefix LTIE
fit
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -preCTS



#Step.5 Clock tree synthesis  
set_ccopt_property buffer_cells   { CLKBUF* }
set_ccopt_property inverter_cells { CLKINV* }
set_ccopt_property logic_cells { CLKAND2* }
set_ccopt_property use_inverters true
set_ccopt_property update_io_latency false
setDesignMode -process 90
create_ccopt_clock_tree_spec -file ccopt.spec
source ccopt.spec
ccopt_design -cts
setOptMode -fixCap false -fixTran true -fixFanoutLoad false 
optDesign -postCTS
optDesign -postCTS -hold


# Step.6 Routing
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

# Step.7 Design For Manufacturing 
addFiller -cell FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1 -prefix FILLER
addMetalFill -layer { M1 M2 M3 M4 M5 M6 M7 M8 } -nets { VSS VDD }

# Step.8 Verification
verifyGeometry
verifyConnectivity -type all -error 1000 -warning 50
verifyProcessAntenna -reportfile ${TOP_DESIGN}.antenna.rpt -error 1000




# Step.9 Data Exports 
set TOP_DESIGN "FMDLL"
setAnalysisMode -cppr both
setAnalysisMode -analysisType bcwc
write_sdf -max_view func_mode_max -typ_view func_mode_max -min_view func_mode_min  -remashold -splitrecrem -recompute_delay_calc ${TOP_DESIGN}.sdf
saveNetlist ${TOP_DESIGN}_apr.v
streamOut ${TOP_DESIGN}.gds -mapFile /usr/cadtool/ee5216/CBDK_TSMC90GUTM_Arm_f1.0/CIC/SOCE/streamOut.map -libName DesignLib -structureName ${TOP_DESIGN} -units 2000 -mode ALL
write_lef_abstract ${TOP_DESIGN}.lef
saveDesign ${TOP_DESIGN}.enc

