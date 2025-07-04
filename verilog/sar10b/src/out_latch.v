`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: M Taufiqul Huda
// 
// Create Date: 24.03.2025 16:7:42
// Design Name: 
// Module Name: out_latch
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


module out_latch(
    input FINAL,
    input EN,
    input CKS,
    input [0:9] SWP,
    output CKO,
    output reg [0:9] DATA
    );
    
    always @(posedge FINAL or negedge EN) begin
        if (!EN)
            DATA <= 10'b0;
        else
            DATA <= SWP; // Menyimpan nilai SWP ke DOUT pada CK
    end

    assign CKO = FINAL & CKS; // Logika AND untuk clock
    
endmodule
