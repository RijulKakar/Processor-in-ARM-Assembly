`timescale 1ns / 1ps

module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);

    // Inputs and Outputs here
    input [63:0] BusW; 
    input [4:0] RA, RB, RW; 
    input RegWr;
    input Clk;
    output [63:0] BusA, BusB; 

    // 32x64 registers - 32 64-bit registers
    reg [63:0] registers [31:0];

    initial begin
        // Initializing regsiter 31, always should be 0
        registers[31] = 0;
    end

    // RA goes into BusA - 2 tics specified
    assign #2 BusA = registers[RA];

    // RB goes into RB - 2 tics specified
    assign #2 BusB = registers[RB];

    always @(negedge Clk) begin
        if (RegWr && RW != 31) begin
            registers[RW] <= #3 BusW; 
        end
    end
    
endmodule
