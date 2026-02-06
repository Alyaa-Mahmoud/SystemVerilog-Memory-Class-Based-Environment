
module tb;
import pack::*;

bit clk;
bit rst;

intf intf1(.clk(clk) , .rst(rst)); 
memory DUT(intf1);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

env env_inst = new(intf1);

initial begin
    rst = 1;
    #(CLK_PERIOD) rst = 0;
end

initial begin
    env_inst.seq_inst.num = 50;
    env_inst.test();
end

endmodule
