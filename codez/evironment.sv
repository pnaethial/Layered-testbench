class environment;
    virtual intf i_intf;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sb;
    mailbox gen2drv_mb, mon2sb_mb;
    function new(virtual intf i_intf);
        this.i_intf = i_intf;
        gen2drv_mb = new();
        mon2sb_mb = new();
        gen = new(gen2drv_mb);
        drv = new(i_intf, gen2drv_mb);
        mon = new(i_intf, mon2sb_mb);
        sb = new(mon2sb_mb);
    endfunction
    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            sb.compare_results();
        join_none
    endtask
endclass
