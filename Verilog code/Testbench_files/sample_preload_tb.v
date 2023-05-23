`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2023 09:23:04
// Design Name: 
// Module Name: sample_preload_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sample_preload_tb();
reg tck_pad_i;
reg tms_pad_i;
reg trst_pad_i;
reg tdi_pad_i;

reg bs_chain_tdi_i; // boundary scan input

wire tdo_pad_o;

tap_top uut(.tck_pad_i(tck_pad_i), .tms_pad_i(tms_pad_i), .trst_pad_i(trst_pad_i), .tdo_pad_o(tdo_pad_o), .tdi_pad_i(tdi_pad_i), .bs_chain_tdi_i(bs_chain_tdi_i));

initial begin
tck_pad_i = 0;
forever #5 tck_pad_i = ~ tck_pad_i;
end

// tms values input
initial begin 
trst_pad_i = 1;
#10 trst_pad_i = 0;
 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;
#10 tms_pad_i = 1'b0; // shift_ir state
#45 tms_pad_i = 1'b1; // exit1-ir
#10 tms_pad_i = 1'b1; // update-ir
#10 tms_pad_i = 1'b0; // to prevent from not going into the tms reset

end

// tdi_input_i
initial begin
# 70 tdi_pad_i = 1'b1;
# 10 tdi_pad_i = 1'b0;
end

// bs_chain_tdi_i
initial begin
#145 bs_chain_tdi_i = 1'b1;
#20 bs_chain_tdi_i = 1'b0;
#20 bs_chain_tdi_i = 1'b1;
#20 bs_chain_tdi_i = 1'b0;
end

endmodule
