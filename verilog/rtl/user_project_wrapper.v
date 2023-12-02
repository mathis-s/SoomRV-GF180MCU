// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */


module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdd,		// User area 5.0V supply
    inout vss,		// User area ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/


wire OUT_powerOff;
wire OUT_reboot;
wire OUT_busOE;
wire [32 - 1:0] OUT_bus;
wire [32 - 1:0] IN_bus;
wire IN_busReady;
wire OUT_busValid;
wire [0:0] OUT_DC_ce;
wire [0:0] OUT_DC_we;
wire [8:0] OUT_DC_addr;
wire [31:0] OUT_DC_data;
wire [3:0] OUT_DC_wm;
wire [31:0] IN_DC_data;
wire OUT_IC_ce;
wire OUT_IC_we;
wire [8:0] OUT_IC_addr;
wire [31:0] OUT_IC_data;
wire [0:0] OUT_IC_wm;
wire [31:0] IN_IC_data;
wire OUT_DCT_ce;
wire OUT_DCT_we;
wire [6:0] OUT_DCT_addr;
wire [21:0] OUT_DCT_data;
wire [0:0] OUT_DCT_wm;
wire [21:0] IN_DCT_data;
wire OUT_ICT_ce;
wire OUT_ICT_we;
wire [6:0] OUT_ICT_addr;
wire [21:0] OUT_ICT_data;
wire [0:0] OUT_ICT_wm;
wire [21:0] IN_ICT_data;
wire [39:0] OUT_dbg;
wire [15:0] OUT_dbgMemC;

wire clk = wb_clk_i;
wire rst = wb_rst_i;

assign io_oeb = ~{{32{OUT_busOE}}, 6'b111110};
assign io_out[0] = 1'b0;
//assign io_out[1] = ;
//assign io_out[2] = ;
//assign io_out[3] = ;
assign io_out[4] = wb_clk_i;
assign io_out[5] = OUT_busValid;
assign io_out[37:6] = OUT_bus;

assign IN_bus = io_in[37:6];
assign IN_busReady = io_in[0];

SoC soc
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    
    .OUT_powerOff(OUT_powerOff),
    .OUT_reboot(OUT_reboot),
    .OUT_busOE(OUT_busOE),
    .OUT_bus(OUT_bus),
    .IN_bus(IN_bus),
    .IN_busReady(IN_busReady),
    .OUT_busValid(OUT_busValid),
    .OUT_DC_ce(OUT_DC_ce),
    .OUT_DC_we(OUT_DC_we),
    .OUT_DC_addr(OUT_DC_addr),
    .OUT_DC_data(OUT_DC_data),
    .OUT_DC_wm(OUT_DC_wm),
    .IN_DC_data(IN_DC_data),
    .OUT_IC_ce(OUT_IC_ce),
    .OUT_IC_we(OUT_IC_we),
    .OUT_IC_addr(OUT_IC_addr),
    .OUT_IC_data(OUT_IC_data),
    .OUT_IC_wm(OUT_IC_wm),
    .IN_IC_data(IN_IC_data),
    .OUT_DCT_ce(OUT_DCT_ce),
    .OUT_DCT_we(OUT_DCT_we),
    .OUT_DCT_addr(OUT_DCT_addr),
    .OUT_DCT_data(OUT_DCT_data),
    .OUT_DCT_wm(OUT_DCT_wm),
    .IN_DCT_data(IN_DCT_data),
    .OUT_ICT_ce(OUT_ICT_ce),
    .OUT_ICT_we(OUT_ICT_we),
    .OUT_ICT_addr(OUT_ICT_addr),
    .OUT_ICT_data(OUT_ICT_data),
    .OUT_ICT_wm(OUT_ICT_wm),
    .IN_ICT_data(IN_ICT_data),
    .OUT_dbg(OUT_dbg),
    .OUT_dbgMemC(OUT_dbgMemC)
);

(*keep*) gf180_ram_512x8_wrapper dcache0
(
    .CLK(clk),
    .CEN(OUT_DC_ce),
    .GWEN(OUT_DC_we),
    .WEN({8{~OUT_DC_wm[0]}}),
    .A(OUT_DC_addr),
    .D(OUT_DC_data[7:0]),
    .Q(IN_DC_data[7:0])

`ifdef USE_POWER_PINS
    ,.VDD(vdd)
	,.VSS(vss)
`endif
);

(*keep*) gf180_ram_512x8_wrapper dcache1
(
    .CLK(clk),
    .CEN(OUT_DC_ce),
    .GWEN(OUT_DC_we),
    .WEN({8{~OUT_DC_wm[1]}}),
    .A(OUT_DC_addr),
    .D(OUT_DC_data[15:8]),
    .Q(IN_DC_data[15:8])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper dcache2
(
    .CLK(clk),
    .CEN(OUT_DC_ce),
    .GWEN(OUT_DC_we),
    .WEN({8{~OUT_DC_wm[2]}}),
    .A(OUT_DC_addr),
    .D(OUT_DC_data[23:16]),
    .Q(IN_DC_data[23:16])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper dcache3
(
    .CLK(clk),
    .CEN(OUT_DC_ce),
    .GWEN(OUT_DC_we),
    .WEN({8{~OUT_DC_wm[3]}}),
    .A(OUT_DC_addr),
    .D(OUT_DC_data[31:24]),
    .Q(IN_DC_data[31:24])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper icache0
(
    .CLK(clk),
    .CEN(OUT_IC_ce),
    .GWEN(OUT_IC_we),
    .WEN({8{~OUT_IC_wm[0]}}),
    .A(OUT_IC_addr),
    .D(OUT_IC_data[7:0]),
    .Q(IN_IC_data[7:0])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper icache1
(
    .CLK(clk),
    .CEN(OUT_IC_ce),
    .GWEN(OUT_IC_we),
    .WEN({8{~OUT_IC_wm[0]}}),
    .A(OUT_IC_addr),
    .D(OUT_IC_data[15:8]),
    .Q(IN_IC_data[15:8])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper icache2
(
    .CLK(clk), .CEN(rst),
    .GWEN(OUT_IC_ce),
    .WEN({8{~OUT_IC_wm[0]}}),
    .A(OUT_IC_addr),
    .D(OUT_IC_data[23:16]),
    .Q(IN_IC_data[23:16])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper icache3
(
    .CLK(clk),
    .CEN(rst),
    .GWEN(OUT_IC_ce),
    .WEN({8{~OUT_IC_wm[0]}}),
    .A(OUT_IC_addr),
    .D(OUT_IC_data[31:24]),
    .Q(IN_IC_data[31:24])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);


(*keep*) gf180_ram_512x8_wrapper dct0
(
    .CLK(clk),
    .CEN(OUT_DCT_ce),
    .GWEN(OUT_DCT_we),
    .WEN(8'h00),
    .A({2'b0, OUT_DCT_addr}),
    .D(OUT_DCT_data[7:0]),
    .Q(IN_DCT_data[7:0])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper dct1
(
    .CLK(clk),
    .CEN(OUT_DCT_ce),
    .GWEN(OUT_DCT_we),
    .WEN(8'h00),
    .A({2'b0, OUT_DCT_addr}),
    .D(OUT_DCT_data[15:8]),
    .Q(IN_DCT_data[15:8])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);
// We only map 64 MiB of cacheable RAM in the core,
// so we the upper part of the cache tags is constant.
assign IN_DCT_data[21:16] = 6'b100000;


(*keep*) gf180_ram_512x8_wrapper ict0
(
    .CLK(clk),
    .CEN(OUT_ICT_ce),
    .GWEN(OUT_ICT_we),
    .WEN(8'h00),
    .A({2'b0, OUT_ICT_addr}),
    .D(OUT_ICT_data[7:0]),
    .Q(IN_ICT_data[7:0])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);

(*keep*) gf180_ram_512x8_wrapper ict1
(
    .CLK(clk),
    .CEN(OUT_ICT_ce),
    .GWEN(OUT_ICT_we),
    .WEN(8'h00),
    .A({2'b0, OUT_ICT_addr}),
    .D(OUT_ICT_data[15:8]),
    .Q(IN_ICT_data[15:8])

//`ifdef USE_POWER_PINS
//    ,.VDD(vdd)
//	,.VSS(vss)
//`endif
);
assign IN_ICT_data[21:16] = 6'b100000;

endmodule	// user_project_wrapper

`default_nettype wire
