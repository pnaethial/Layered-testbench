class monitor;
    virtual intf i_intf;    
    mailbox pkt_mb;           
    function new(virtual intf i_intf, mailbox pkt_mb);
        this.i_intf = i_intf;
        this.pkt_mb = pkt_mb;
    endfunction
    task run();
        packet pkt;  
        forever begin
            pkt = new(); 
            #5; 
            pkt.input_addr = i_intf.input_addr;    
            pkt.valid_in = i_intf.valid_in;       
            pkt.output_prefix = i_intf.output_prefix; 
            pkt.valid_out = i_intf.valid_out;  
            pkt_mb.put(pkt);
            $display("Monitored Packet from DUT:");
            pkt.display();  
        end
    endtask
endclass
