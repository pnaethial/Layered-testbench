class packet;
    rand bit [31:0] input_addr; 
    bit [31:0] output_prefix;  
    bit valid_in;       
    bit valid_out;             
    bit found_match;
    constraint valid_input {
      input_addr inside {32'h50530000,32'h5053C000,32'h5053C500, 32'h5053C572,32'h50523123,32'h983674102,32'h5053c090};
    }

    function void display();
      $display("Packet: input_addr = %h, valid_,in = %b, output_prefix = %h, valid_out = %b", input_addr, valid_in, output_prefix, valid_out);
    endfunction
endclass
