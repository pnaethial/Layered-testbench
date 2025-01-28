module LPM(
    input logic clk,
    input logic reset,
    input logic valid_in,
    input logic [31:0] input_addr,
    output logic valid_out,
    output logic [31:0] output_prefix
);
    typedef enum logic [1:0] {
        IDLE,
        MATCHING,
        DONE
    } state_t;

    state_t state, next_state;
    logic [31:0] prefixes[3:0];
    logic [31:0] longest_match;
    logic found_match;

    always_comb begin
        next_state = state;
        valid_out = 0;
      if (valid_in) begin
              $display("enteredmatch");
                longest_match = 32'b0;
                for (int i = 0; i < 4; i++) begin
                    if ((input_addr & prefixes[i]) == prefixes[i]) begin
                        longest_match = prefixes[i];
                    end
                end
      end
      
      output_prefix = longest_match;
      if (input_addr==output_prefix)
        begin
          $display("yeah");
          found_match=1;
        end
      else
        found_match=0;
      valid_out = found_match;
    end
    initial begin
        prefixes[0] = 32'h50530000;
        prefixes[1] = 32'h5053C000;
        prefixes[2] = 32'h5053C500;
        prefixes[3] = 32'h5053C572;
    end
endmodule
