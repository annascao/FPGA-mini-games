module HEX_controller(input logic [2:0] hex_instructions, output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

    `define off 7'b1111111;

    `define zero 7'b1000000;
    `define one 7'b1111001;
    `define two 7'b0100100;
    `define three 7'b0110000;
    `define four 7'b0011001;
    `define five 7'b0010010;
    `define six 7'b0000010;
    `define seven 7'b1111000;
    `define eight 7'b0000000;
    `define nine 7'b0011000;

    `define P 7'b0001100;
    `define L 7'b1000111;
    `define A 7'b0001000;
    `define Y 7'b0010001;
    `define N 7'b1001000;

always_comb begin
    case(hex_instructions)
        3'b000: begin //display nothing
            HEX5 = `off;
            HEX4 = `off;
            HEX3 = `off;
            HEX2 = `off;
            HEX1 = `off;
            HEX0 = `off;
        end
        3'b001: begin //display "PLAY"
            HEX5 = `off;
            HEX4 = `off;
            HEX3 = `P;
            HEX2 = `L;
            HEX1 = `A;
            HEX0 = `Y;
        end
        3'b010: begin //display "2 soon"
            HEX5 = `two;
            HEX4 = `off;
            HEX3 = `five;
            HEX2 = `zero;
            HEX1 = `zero;
            HEX0 = `N;
        end
        3'b100: begin //display reaction time
            HEX5 = `one;
            HEX4 = `one;
            HEX3 = `one;
            HEX2 = `one;
            HEX1 = `one;
            HEX0 = `one;
        end
        default: begin
            HEX5 = `off;
            HEX4 = `off;
            HEX3 = `off;
            HEX2 = `off;
            HEX1 = `off;
            HEX0 = `off;
        end
    endcase
end
endmodule