
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name display_7_segmenti -dir "/home/mirko/Desktop/ASE/ASE/Test/Test7Segmenti/display_7_segmenti/planAhead_run_1" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/mirko/Desktop/ASE/ASE/Test/Test7Segmenti/display_7_segmenti/display_onBoard.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/mirko/Desktop/ASE/ASE/Test/Test7Segmenti/display_7_segmenti} }
set_property target_constrs_file "Nexys4DDR_Master.ucf" [current_fileset -constrset]
add_files [list {Nexys4DDR_Master.ucf}] -fileset [get_property constrset [current_run]]
link_design
