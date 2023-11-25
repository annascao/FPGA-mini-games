/*
1. flip switch to turn on game
2. press key to start delay timer
3. once delay timer is finished, light up led, begin reaction speed timer
4. on key press, stop reaction speed timer, display time on hex display
    --> if key press is too soon, reset delay counter, and restart
*/

module game1_fsm (input logic clk, switch, key, delay_done, output logic rflag, new_number, output logic [2:0] hex_instructions);

    enum logic [8:0] {
        off = 9'b0000_0_0_000,
        idle = 9'b0001_0_0_000,
        start_delay = 9'b0010_1_0_000,
        click = 9'b0011_0_1_001,
        too_soon = 9'b0100_0_0_010,
        display_reaction_time = 9'b0101_0_0_100
    } current_state;

    assign hex_instructions = current_state[2:0]; // 000 = display nothing, 001 = display click, 010 = too soon, 100 = display reaction time
    assign rflag = current_state[3];
    assign new_number = current_state[4];

    always_ff @(posedge clk) begin
        if(~switch) current_state <= off;
        else begin
        case(current_state)
            idle: begin
                if(~key) current_state <= start_delay;
                else current_state <= idle;
            end
            start_delay: begin
                if(~key && ~delay_done) current_state <= too_soon;
                else if (delay_done) current_state <= click;
                else current_state <= start_delay;
            end
            click: begin
                if(~key) current_state <= display_reaction_time;
                else current_state <= click;
            end
            too_soon: begin
                if(~key) current_state <= start_delay;
                else current_state <= too_soon;
            end
            display_reaction_time: begin
                current_state <= current_state;
            end
            default: current_state <= idle;
        endcase
        end
    end

endmodule