// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\controllerHdl\controllerHdl_Reset_Delay_block.v
// Created: 2014-09-08 14:12:04
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: controllerHdl_Reset_Delay_block
// Source Path: controllerHdl/Field_Oriented_Control/Open_Loop_Control/Generate_Position_And_Voltage_Ramp/Rotor_Acceleration_To_Velocity/Reset_Delay
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module controllerHdl_Reset_Delay_block
          (
           CLK_IN,
           reset,
           enb_1_2000_0,
           Reset_1,
           In,
           Out
          );


  input   CLK_IN;
  input   reset;
  input   enb_1_2000_0;
  input   Reset_1;
  input   signed [31:0] In;  // sfix32_En22
  output  signed [31:0] Out;  // sfix32_En22


  wire signed [31:0] Constant1_out1;  // sfix32_En22
  wire signed [31:0] Reset_Switch1_out1;  // sfix32_En22
  reg signed [31:0] In_Delay_out1;  // sfix32_En22
  wire signed [31:0] Constant_out1;  // sfix32_En22
  wire signed [31:0] Reset_Switch_out1;  // sfix32_En22


  // <S28>/Constant1
  assign Constant1_out1 = 32'sb00000000000000000000000000000000;



  // <S28>/Reset_Switch1
  assign Reset_Switch1_out1 = (Reset_1 == 1'b0 ? In :
              Constant1_out1);



  // <S28>/In_Delay
  always @(posedge CLK_IN)
    begin : In_Delay_process
      if (reset == 1'b1) begin
        In_Delay_out1 <= 32'sb00000000000000000000000000000000;
      end
      else if (enb_1_2000_0) begin
        In_Delay_out1 <= Reset_Switch1_out1;
      end
    end



  // <S28>/Constant
  assign Constant_out1 = 32'sb00000000000000000000000000000000;



  // <S28>/Reset_Switch
  assign Reset_Switch_out1 = (Reset_1 == 1'b0 ? In_Delay_out1 :
              Constant_out1);



  assign Out = Reset_Switch_out1;

endmodule  // controllerHdl_Reset_Delay_block

