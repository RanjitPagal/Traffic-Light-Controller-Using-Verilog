module ProjectTLC(
    input clk, rst,
    output reg [1:0] light_M1, 
    output reg [1:0] light_M2,
    output reg [1:0] light_M3,
    output reg [1:0] light_M4,
    output reg [1:0] light_R,
    output reg [1:0] light_S,
    output reg [3:0] count,
    output reg [3:0] ps
);
    
    parameter S1=0, S2=1, S3=2, S4=3, S5=4, S6=5, S7=6, S8=7, S9=8, S10=9;
    parameter Tmg=10, Ttg=7, Tsg=5, Ty=3;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps <= S1;
            count <= 0;
        end else begin
            case (ps)
                S1: if (count < Tmg) count <= count + 1; 
                    else begin ps <= S2; 
                               count <= 0; end
                S2: if (count < Ty) count <= count + 1; 
                    else begin ps <= S3; 
                               count <= 0; end
                S3: if (count < Ttg) count <= count + 1; 
                    else begin ps <= S4; 
                               count <= 0; end
                S4: if (count < Ty) count <= count + 1; 
                    else begin ps <= S5; 
                               count <= 0; end
                S5: if (count < Ttg) count <= count + 1; 
                    else begin ps <= S6; 
                               count <= 0; end
                S6: if (count < Ty) count <= count + 1; 
                    else begin ps <= S7; 
                               count <= 0; end
                S7: if (count < Tsg) count <= count + 1; 
                    else begin ps <= S8; 
                               count <= 0; end
                S8: if (count < Ty) count <= count + 1; 
                    else begin ps <= S9; 
                               count <= 0; end
                S9: if (count < Tsg) count <= count + 1; 
                    else begin ps <= S10; 
                               count <= 0; end
                S10: if (count < Ty) count <= count + 1; 
                    else begin ps <= S1; 
                               count <= 0; end
                default: begin ps <= S1;count <= 0; end
            endcase
        end
    end

    always @(ps) begin
        case (ps)
            S1: begin 
                 light_M1 = 2'b10; 
                 light_M2 = 2'b10; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b00; 
                 light_R = 2'b00; 
                 light_S = 2'b00; end
            S2: begin 
                 light_M1 = 2'b10; 
                 light_M2 = 2'b01; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b00; 
                 light_R = 2'b00; 
                 light_S = 2'b00; end
            S3: begin 
                 light_M1 = 2'b10; 
                 light_M2 = 2'b00; 
                 light_M3 = 2'b10; 
                 light_M4 = 2'b00; 
                 light_R = 2'b00; 
                 light_S = 2'b00; end
            S4: begin 
                 light_M1 = 2'b01; 
                 light_M2 = 2'b00; 
                 light_M3 = 2'b01; 
                 light_M4 = 2'b00; 
                 light_R = 2'b00; 
                 light_S = 2'b00; end
            S5: begin 
                 light_M1 = 2'b00; 
                 light_M2 = 2'b10; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b10; 
                 light_R = 2'b00; 
                 light_S = 2'b00; end
            S6: begin 
                 light_M1 = 2'b00; 
                 light_M2 = 2'b01; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b01; 
                 light_R = 2'b00; 
                 light_S = 2'b00; end
            S7: begin 
                 light_M1 = 2'b00; 
                 light_M2 = 2'b00; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b00; 
                 light_R = 2'b10; 
                 light_S = 2'b00; end
            S8: begin 
                 light_M1 = 2'b00; 
                 light_M2 = 2'b00; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b00; 
                 light_R = 2'b01; 
                 light_S = 2'b00; end
            S9: begin 
                 light_M1 = 2'b00; 
                 light_M2 = 2'b00; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b00; 
                 light_R = 2'b00; 
                 light_S = 2'b10; end
            S10: begin 
                 light_M1 = 2'b00; 
                 light_M2 = 2'b00; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b00; 
                 light_R = 2'b00; 
                 light_S = 2'b01; end
            default: begin 
                 light_M1 = 2'b10; 
                 light_M2 = 2'b10; 
                 light_M3 = 2'b00; 
                 light_M4 = 2'b00; 
                 light_R = 2'b00; 
                 light_S = 2'b00; end
        endcase
    end

endmodule
