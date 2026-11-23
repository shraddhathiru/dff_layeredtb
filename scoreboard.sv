class scoreboard;
    mailbox mon2scb;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task main(int unsigned cycles);
        observation obs;
        logic previous_d;
        bit have_previous;
        previous_d = 1'bx;
        have_previous = 0;

        repeat (cycles) begin
            mon2scb.get(obs);
            if (have_previous && obs.q !== previous_d)
                $error("CHECK FAILED cycle=%0d: q=%0b expected previous d=%0b",
                       obs.cycle, obs.q, previous_d);
            else if (have_previous)
                $display("[%0t] SCOREBOARD PASS cycle=%0d", $time, obs.cycle);

            previous_d = obs.d;
            have_previous = 1;
        end
    endtask
endclass
