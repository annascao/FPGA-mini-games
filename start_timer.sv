module start_timer(input logic [3:0] test, input logic clk, output logic [6:0] hex);

logic [31:0] delay;
logic [31:0] counter;

    always_ff @(posedge clk) begin
        if(counter == delay) begin
            //light up start on hex
        end
        else begin
            counter <= counter + 1;
            //light up the delay time on hex
        end
    end

    always_comb begin
        case(test)
            4'd0: delay = 32'd1000;
            4'd1: delay = 32'd1125;
            4'd2: delay = 32'd1250;
            4'd3: delay = 32'd1375;
            4'd4: delay = 32'd1500;
            4'd5: delay = 32'd1625;
            4'd6: delay = 32'd1750;
            4'd7: delay = 32'd1875;
            4'd8: delay = 32'd2000;
            4'd9: delay = 32'd2125;
            4'd10: delay = 32'd2250;
            4'd11: delay = 32'd2375;
            4'd12: delay = 32'd2500;
            4'd13: delay = 32'd2625;
            4'd14: delay = 32'd2750;
            4'd15: delay = 32'd2875;
        endcase
    end
endmodule

