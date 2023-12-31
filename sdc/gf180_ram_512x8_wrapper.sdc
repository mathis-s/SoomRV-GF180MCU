###############################################################################
# Created by write_sdc
# Fri Dec  1 20:54:14 2023
###############################################################################
current_design gf180_ram_512x8_wrapper
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name CLK -period 25.0000 [get_ports {CLK}]
set_clock_transition 0.1500 [get_clocks {CLK}]
set_clock_uncertainty 0.2500 CLK
set_propagated_clock [get_clocks {CLK}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[0]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[1]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[2]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[3]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[4]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[5]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[6]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[7]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {A[8]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {CEN}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[0]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[1]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[2]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[3]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[4]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[5]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[6]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {D[7]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {GWEN}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[0]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[1]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[2]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[3]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[4]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[5]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[6]}]
set_input_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {WEN[7]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[0]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[1]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[2]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[3]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[4]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[5]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[6]}]
set_output_delay 5.0000 -clock [get_clocks {CLK}] -add_delay [get_ports {Q[7]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {Q[7]}]
set_load -pin_load 0.0729 [get_ports {Q[6]}]
set_load -pin_load 0.0729 [get_ports {Q[5]}]
set_load -pin_load 0.0729 [get_ports {Q[4]}]
set_load -pin_load 0.0729 [get_ports {Q[3]}]
set_load -pin_load 0.0729 [get_ports {Q[2]}]
set_load -pin_load 0.0729 [get_ports {Q[1]}]
set_load -pin_load 0.0729 [get_ports {Q[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {CEN}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {CLK}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {GWEN}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[8]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[7]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[6]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[5]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[4]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[7]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[6]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[5]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[4]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {D[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[7]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[6]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[5]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[4]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {WEN[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 3.0000 [current_design]
set_max_fanout 10.0000 [current_design]
