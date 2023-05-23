`timescale 1ns / 1ps

module fsm_16_tb(); // testing reset condition and bypass instruction
reg tck_pad_i;
reg tms_pad_i;
reg trst_pad_i;
reg tdi_pad_i;

wire tdo_pad_o;

tap_top uut(.tck_pad_i(tck_pad_i), .tms_pad_i(tms_pad_i), .trst_pad_i(trst_pad_i), .tdo_pad_o(tdo_pad_o), .tdi_pad_i(tdi_pad_i));

initial begin
tck_pad_i = 0;
forever #5 tck_pad_i = ~ tck_pad_i;
end

initial begin 
trst_pad_i = 1;
#10 trst_pad_i = 0;
tms_pad_i = 1'b1; // different values for the tms_pad_i is given to change the tap controller state
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;
#10 tms_pad_i = 1'b0; // after checking againresetted using tms reset (5 consecutive 1's)

//to get into reset mode once the chart is in other state
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;

//bypass instruction upload
// now the state is in test_logic_reset so to load the intsruction the shift_ir should be active 
// the sequence from test_logic_reset to shift_ir is "01100"
#10 tms_pad_i = 1'b0;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;
#10 tms_pad_i = 1'b0;

// bypass instruction testbench
// now the bypass instruction is loaded into the IR using TDI input of Tap Controller
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b1;

// update the jtag instruction fed into the jtag_ir into latched_jtag_ir
// for that the tms values should be updated with "11" so that the state will go to update_ir
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b1;


//to get into reset mode once the chart is in other state (update_ir)
//#10 tms_pad_i = 1'b1;
//#10 tms_pad_i = 1'b1;
//#10 tms_pad_i = 1'b1;
//#10 tms_pad_i = 1'b1;
//#10 tms_pad_i = 1'b1; //  bad approach since it resets the latched_jtag_ir





//In bypass instruction: the data values are to be uploaded
// now the state is in update_ir so to load the data the shift_dr should be active 
// the sequence from update_ir to shift_dr is "100"
#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;
//#10 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;
//#10 tms_pad_i = 1'b0;

//once it is in the shift_dr: now the data are to be uploaded using tdi_input
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b0;

// update the jtag instruction fed into the jtag_ir into latched_jtag_ir
// for that the tms values should be updated with "11" so that the state will go to update_ir
//#10 tms_pad_i = 1'b1;
//#10 tms_pad_i = 1'b1;*/



// just ignoring the data value changes in previous tdo_pad_o

// new instruction execution: sample/preload
/*#10 tdi_pad_i = 1'b1;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b0;

#10 tms_pad_i = 1'b1;
#15 tms_pad_i = 1'b0;*/



/*#10 tms_pad_i = 1'b1;
#40 tms_pad_i = 1'b0;

// the instruction code for sample and preload is loaded "0001"
#10 tdi_pad_i = 1'b0;
#10 tdi_pad_i = 1'b0;

#10 tdi_pad_i = 1'b0;

#6 tdi_pad_i = 1'b1;

#4 tms_pad_i = 1'b1;
#8 tms_pad_i = 1'b1;
#10 tms_pad_i = 1'b0;*/

// the change from shift_ir to update_ir to be done: "11"
 
// #20 tms_pad_i = 1'b1;
// #1 tms_pad_i = 1'b0; 





end
endmodule