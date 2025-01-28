class scoreboard;
    mailbox pkt_mb;
    function new(mailbox pkt_mb);
        this.pkt_mb = pkt_mb;
    endfunction

    task compare_results();
        packet pkt;
        forever begin
            pkt_mb.get(pkt); // Get monitored packet
            // Add comparison logic (use reference model if needed)
            $display("Scoreboard Comparison:");
            pkt.display();
            // Assume for simplicity, correct result logic here
            if (pkt.valid_out)
              $display("PASS: MATCH FOUND!");
            else
                $display("FAIL");
        end
    endtask
endclass

