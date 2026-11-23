`ifndef DFF_TRANSACTION_SV
`define DFF_TRANSACTION_SV

class transaction;
    rand bit d;
    int unsigned id;

    function new(int unsigned id = 0);
        this.id = id;
    endfunction
endclass

class observation;
    logic d;
    logic q;
    int unsigned cycle;
endclass

`endif
