/*
For this laboratory assignment, you will use Altera Quartus II software and DE-115 FPGA kit and design an 4-byte
RAM (Memory) that has the Input/output definitions below:
- EN signal enables the module, The output must be in high impedance state if EN=0.
- W/R signal defines the operation mode. Output shows the data in the given adrress when W/R =1 (Read
mode). The Data will be stored to the Address location if W/R = 0.
- CLK is the pulse signal which should be connected to Flip Flops. You may use the pushbutton as a
controllable clock signal to test your device is working properly.
- 4 Byte will be addressed using 2-bit Address input.
- Each Adress stores 8-bit data.
- You are expected to test your device and to demonstrate it by using the output LEDs.

*/


module lab5(
input [7:0]inputR,input[1:0]address,input enable,input WR,input clk,
output [7:0]outputR);
wire [7:0]firstOut;
wire[7:0]secOut;
wire [7:0]thrdHout;
wire[7:0]frthOut;
wire[3:0]demuxOut;

demux(enable,address[0],address[1],demuxOut[0],demuxOut[1],demuxOut[2]);
oneByteMem(inputR[7:0],WR,clk,demuxOut[0],firstOut[7:0]);
oneByteMem(inputR[7:0],WR,clk,demuxOut[1],secOut[7:0]);
oneByteMem(inputR[7:0],WR,clk,demuxOut[2],thrdHout[7:0]);
oneByteMem(inputR[7:0],WR,clk,demuxOut[3],frthOut[7:0]);

and a0(outputR[0],firstOut[0],secOut[0],thrdHout[0],frthOut[0]);
and a1(outputR[1],firstOut[1],secOut[1],thrdHout[1],frthOut[1]);
and a2(outputR[2],firstOut[2],secOut[2],thrdHout[2],frthOut[2]);
and a3(outputR[3],firstOut[3],secOut[3],thrdHout[3],frthOut[3]);
and a4(outputR[4],firstOut[4],secOut[4],thrdHout[4],frthOut[4]);
and a5(outputR[5],firstOut[5],secOut[5],thrdHout[5],frthOut[5]);
and a6(outputR[6],firstOut[6],secOut[6],thrdHout[6],frthOut[6]);
and a7(outputR[7],firstOut[7],secOut[7],thrdHout[7],frthOut[7]);
endmodule
