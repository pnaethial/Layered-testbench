class generator;
    mailbox pkt_mb; 

    function new(mailbox pkt_mb);
        this.pkt_mb = pkt_mb;
    endfunction

    task run();
        packet pkt;
        forever begin
            pkt = new();
            assert(pkt.randomize()); // Randomize inputs
            pkt.valid_in = 1;
            pkt_mb.put(pkt); // Send packet to the mailbox
            $display("Generated Packet:");
            pkt.display();
            #10; // Delay between packets
        end
    endtask
endclass
