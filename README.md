# Design-and-Testbench-of-the-JTAG-TAP-Controller
The JTAG (Joint Test Action Group) is used prevalent for the debugging and testing purpose. Thus, the design and test bench are created to understand its behaviour.


**Introduction**

The IEEE 1149.1 standard is created to generalise the JTAG format. The functionality of the JTAG is to Debug access through user data register and to boundary scan through boundary scan register. JTAG is a feature found in relatively high pin count devices. The main component of the JTAG is the TAP (Test Access Port) controller. It consists of 16 FSM States in it. This repository consists of the design of the TAP Controller.

Note: My contribution in this repository is to write the testbench for executing various instructions of JTAG and reset condition. The design code is taken from the opencore.org authored by Igor Mohor
