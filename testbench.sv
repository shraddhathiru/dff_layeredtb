`timescale 1ns/1ps
`include "design.sv"
`include "interface.sv"
`include "environment.sv"

module testbench;
    localparam int unsigned NUM_ITEMS = 20;

    logic clk = 1'b0;
    always #5 clk = ~clk;

    dff_if bus(clk);
    dff dut(.clk(clk), .d(bus.d), .q(bus.q));
    environment env;

    initial begin
        env = new(bus);
        env.test(NUM_ITEMS);
        $display("Test completed.");
        $finish;
    end
endmodule
