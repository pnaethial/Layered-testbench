class driver;
    virtual intf i_intf;
    mailbox pkt_mb;

    function new(virtual intf i_intf, mailbox pkt_mb);
        this.i_intf = i_intf;
        this.pkt_mb = pkt_mb;
    endfunction

    task run();
        packet pkt;
        forever begin
            pkt_mb.get(pkt); // Get packet from mailbox
            i_intf.input_addr <= pkt.input_addr;
            i_intf.valid_in <= pkt.valid_in;
            $display("Driving Packet to DUT:");
            pkt.display();
            #10; // Wait for DUT to process
        end
    endtask
endclass
