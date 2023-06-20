module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
    input [63:0]  CurrentPC, SignExtImm64; 
    input         Branch, ALUZero, Uncondbranch; 
    output reg [63:0] NextPC; 

    /* write your code here */ 
    reg [63:0] tempImm;
    
    // always block
    always @(*) begin
        // shift immediate left 2
        tempImm = SignExtImm64 << 2;

        // Uncondotional Branch
        if (Uncondbranch) begin
            NextPC = CurrentPC + tempImm;
        end

        // Conditional Branch
        else if (Branch) begin
            // ALUzero is 1
            if (ALUZero == 1) begin
                NextPC = CurrentPC + tempImm;
            end

            // ALUzero is 0
            else begin
                NextPC = CurrentPC + 4;
            end
            
        end

        // Neither are true
        else begin
            NextPC = CurrentPC + 4;
        end

    end


endmodule