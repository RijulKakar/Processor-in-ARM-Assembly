`define AND   4'b0000
`define OR    4'b0001
`define ADD   4'b0010
`define SUB   4'b0110
`define PassB 4'b0111


module ALU(BusW, BusA, BusB, ALUCtrl, Zero);
    
    output  [63:0] BusW;
    input   [63:0] BusA, BusB;
    input   [3:0]  ALUCtrl;
    output         Zero;
    
    reg     [63:0] tempBusW;
    reg            zero;
    
    always @(ALUCtrl or BusA or BusB) begin
        case(ALUCtrl)
            `AND: begin
                tempBusW = BusA & BusB;
            end
        endcase

        case(ALUCtrl)
            `OR: begin
                tempBusW = BusA | BusB;
            end
        endcase

        case(ALUCtrl)
            `ADD: begin
                tempBusW = BusA + BusB;
            end
        endcase

        case(ALUCtrl)
            `SUB: begin
                tempBusW = BusA - BusB;
            end
        endcase

        case(ALUCtrl)
            `PassB: begin
                tempBusW = BusB;
            end
        endcase

        if (BusW == 0) zero = 1;
        else zero = 0;
    end

    assign BusW = tempBusW;
    assign Zero = zero;
endmodule