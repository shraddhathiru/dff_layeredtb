class generator;
    mailbox #(transaction) gen2drv;

    function new(mailbox #(transaction) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task main(int unsigned count);
        transaction trans;
        for (int unsigned i = 0; i < count; i++) begin
            trans = new(i);
            if (!trans.randomize())
                $fatal(1, "Randomization failed for item %0d", i);
            gen2drv.put(trans);
        end
    endtask
endclass
