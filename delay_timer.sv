// delay timer --> after "random" delay, an led will light up, prompting the user to press a button.
// should receive a new delay value after key press during game

module delay_timer(input logic [3:0] delay_code, input logic clk, output logic delay_done);

    reg [31:0] delay_ms = 32'd0;
    reg [31:0] counter = 32'd0;

    always_ff @(posedge clk) begin
        if(counter == delay_ms) begin
            counter <= 32'd0;
            delay_done <= 1'b1;
        end
        else begin
            counter <= counter + 1;
            delay_done <= 1'b0;
        end
    end

    always_comb begin
        case(delay_code)
            4'd0: begin
                delay_ms = 32'd1000;
            end
            4'd1: begin
                delay_ms = 32'd1125;
            end
            4'd2: begin
                delay_ms = 32'd1250;
            end
            4'd3: begin
                delay_ms = 32'd1375;
            end
            4'd4: begin
                delay_ms = 32'd1500;
            end
            4'd5: begin
                delay_ms = 32'd1625;
            end
            4'd6: begin
                delay_ms = 32'd1750;
            end
            4'd7: begin
                delay_ms = 32'd1875;
            end
            4'd8: begin
                delay_ms = 32'd2000;
            end
            4'd9: begin
                delay_ms = 32'd2125;
            end
            4'd10: begin
                delay_ms = 32'd2250;
            end
            4'd11: begin
                delay_ms = 32'd2375;
            end
            4'd12: begin
                delay_ms = 32'd2500;
            end
            4'd13: begin
                delay_ms = 32'd2625;
            end
            4'd14: begin
                delay_ms = 32'd2750;
            end
            4'd15: begin
                delay_ms = 32'd2875;
            end
        endcase
    end


endmodule

