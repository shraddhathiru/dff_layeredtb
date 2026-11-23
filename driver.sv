class driver;
    virtual dff_if vif;
    mailbox gen2drv;

    function new(virtual dff_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task main(int unsigned count);
        transaction trans;
        vif.d = 1'b0;
        repeat (count) begin
            gen2drv.get(trans);
            @(negedge vif.clk);
            vif.d <= trans.d;
            $display("[%0t] DRIVER item=%0d d=%0b", $time, trans.id, trans.d);
        end
    endtask
endclass
