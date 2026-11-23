class monitor;
    virtual dff_if vif;
    mailbox mon2scb;

    function new(virtual dff_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task main(int unsigned cycles);
        observation obs;
        for (int unsigned i = 0; i < cycles; i++) begin
            @(posedge vif.clk);
            #1step;
            obs = new();
            obs.d = vif.d;
            obs.q = vif.q;
            obs.cycle = i;
            mon2scb.put(obs);
            $display("[%0t] MONITOR cycle=%0d d=%0b q=%0b",
                     $time, obs.cycle, obs.d, obs.q);
        end
    endtask
endclass
