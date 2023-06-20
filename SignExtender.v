module SignExtender(InstructionBits, Control, Extended);
    // inputs and outputs here
    input [25:0] InstructionBits;
    input [2:0] Control;
    output reg [63:0] Extended;

    // logic here
    reg extBit;


    always @(*) begin
        // I type
        if (Control == 3'b000) begin
            extBit = InstructionBits[21];
            Extended = {{63-11{extBit}}, InstructionBits[21:10]};
        end

        // D type
        if (Control == 3'b001) begin
            extBit = InstructionBits[20];
            // extBit = {55{Instr25_0[20]}, Instr25_0[20:12]};
            Extended = {{63-8{extBit}}, InstructionBits[20:12]};
        end

        // B type
        if (Control == 3'b010) begin
            extBit = InstructionBits[25];
            Extended = {{63-25{extBit}}, InstructionBits};
        end

        // CB type
        if (Control == 3'b011) begin
            extBit = InstructionBits[23];
            Extended = {{63-18{extBit}}, InstructionBits[23:5]};
        end

        // MOVZ - No Shift
        if (Control == 3'b100) begin
            Extended = InstructionBits[20:5];
        end

        // MOVZ - 16 bits
        if (Control == 3'b101) begin
            Extended = {InstructionBits[20:5], {16{1'b0}}};
        end

        // MOVZ - 32 bits
        if (Control == 3'b110) begin
            Extended = {InstructionBits[20:5], {32{1'b0}}};
        end

        // MOVZ - 48 bits
        if (Control == 3'b111) begin
            Extended = {InstructionBits[20:5], {48{1'b0}}};
        end
    end

    // assign Extended = tempExtended;
    

endmodule