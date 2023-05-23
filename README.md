# Design-and-Testbench-of-the-JTAG-TAP-Controller
The JTAG (Joint Test Action Group) is used prevalent for the debugging and testing purpose. Thus, the design and test bench are created to understand its behaviour.


**Introduction**

The IEEE 1149.1 standard is created to generalise the JTAG format. The functionality of the JTAG is to Debug access through user data register and to boundary scan through boundary scan register. JTAG is a feature found in relatively high pin count devices. The main component of the JTAG is the TAP (Test Access Port) controller. It consists of 16 FSM States in it. This repository consists of the design of the TAP Controller.

##### **Note:** My contribution in this repository is to write the testbench for executing various instructions of JTAG and reset condition. The design code is taken from the opencore.org authored by Igor Mohor.

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

**1. Reset condition Check**
The reset happens when the test reset pin is asserted or when the value of the tms is 5 consecutive ones ("11111"). The TAP Controller comes to test_logic_reset state once resetted.
