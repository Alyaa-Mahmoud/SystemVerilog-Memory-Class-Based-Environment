interface intf(input logic clk , rst);
    logic [31:0] Data_In;
    logic [3:0] Addr;
    logic EN;
    logic [31:0] Data_Out;
    logic Valid_Out;

    modport mem_port (
    input clk, rst,
    input Data_In,
    input Addr,
    input EN ,
    output Data_Out,
    output Valid_Out
    );

    clocking cb_driver @(posedge clk);

        default output #1ns;
        output Data_In;
        output Addr;
        output EN;

    endclocking

    clocking cb_monitor @(posedge clk);

        default input #0;
        input Data_In;
        input Addr;
        input EN;
        input Data_Out;
        input Valid_Out;

    endclocking

endinterface //intf
