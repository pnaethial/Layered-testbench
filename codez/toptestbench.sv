`include "interface.sv"
`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"module Testbench();
    intf i_intf();
    initial begin
        i_intf.clk = 0;
        forever #5 i_intf.clk = ~i_intf.clk;
    end

    initial begin
        i_intf.reset = 1;
        #10 i_intf.reset = 0;
    end

    LPM dut (
        .clk(i_intf.clk),
        .reset(i_intf.reset),
        .input_addr(i_intf.input_addr),
        .valid_in(i_intf.valid_in),
        .output_prefix(i_intf.output_prefix),
        .valid_out(i_intf.valid_out)
    );

    environment env;
    initial begin
        env = new(i_intf);
        env.run();
        #100 $finish;
    end
endmodule
