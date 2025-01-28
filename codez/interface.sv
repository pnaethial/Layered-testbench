interface intf();
    logic clk;
    logic reset;
    logic [31:0] input_addr;
    logic valid_in;
    logic [31:0] output_prefix;
    logic valid_out;
endinterface
