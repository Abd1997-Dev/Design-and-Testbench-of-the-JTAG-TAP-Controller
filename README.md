# Design-and-Testbench-of-the-JTAG-TAP-Controller
The JTAG (Joint Test Action Group) is used prevalent for the debugging and testing purpose. Thus, the design and test bench are created to understand its behaviour.


**Introduction**

The IEEE 1149.1 standard is created to generalise the JTAG format. The functionality of the JTAG is to Debug access through user data register and to boundary scan through boundary scan register. JTAG is a feature found in relatively high pin count devices. The main component of the JTAG is the TAP (Test Access Port) controller. It consists of 16 FSM States in it. This repository consists of the design and verification of the TAP Controller.

There are five pins in the TAP Controller; TMS (Test mode Select), Trst (Test reset), Tck (Test clock), TDI (Test Data input), and TDO (Test data output).

**TAP Controller**

It is the important component of JTAG. It consists of 16 FSM States as shown in fig. 1. The state changes based on the value of TMS. The TMS value is mentioned in the line connecting each states.

<p align="center">
<img src="https://user-images.githubusercontent.com/73669849/232761135-9bc30a2d-ca1d-42e6-96ae-542aadb05527.png" width="400" height="500">
</p>
<p align = "center">
Fig.1 -16 FSM States of TAP Controller
</p>

**Test bench or Execution of the Instruction**

**1. Reset condition Check:**
The reset happens when the test reset pin is asserted or when the value of the tms is 5 consecutive ones ("11111"). The TAP Controller comes to test_logic_reset state once resetted.

**2. Execution of the Bypass Instruction:**
To execute this instruction, first the corresponding instruction has to be loaded into the instruction register. This can be achieved by sending data through Test Data input and keeping shift_ir state in FSM as high. The instruction for bypass is given by the opencore verilog tap defines is "1111". Once this instruction is loaded into the instruction register then whatever value we are sending through the tdi while keeping shift_dr state as high will be placed in the one bit register Bypass Register and transfered to the following IC which is in the design.

**3. Execution of the Sample/Preload Instruction:**
The steps for this instruction execution is also same as the above one. But here the corresponding instruction value as per the given code is "0001". Once this instruction is loaded into the instruction register, whatever values we are sending through TDI is fed into the boundary scan register.

## Conclusion:
Thus the verilog code for the JTAG TAP Controller is taken from opencores.org and understood. The Testbench code is written and understood the working of the TAP Controller.



##### **Note:** My contribution in this repository is to write the testbench for executing various instructions of JTAG and reset condition. The design code is taken from the opencore.org authored by Igor Mohor.


