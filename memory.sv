module memory(intf.mem_port a);

logic [31:0] mem [15:0];
integer i;

always@(posedge a.clk) begin

  if(a.rst) begin
    for(i = 0 ; i < 16 ; i = i + 1) begin
      mem[i] <= 0;
    end
    a.Data_Out <= 0;
    a.Valid_Out <= 0;
    end
    else if(a.EN) begin
      mem[a.Addr] <= a.Data_In;
      a.Valid_Out <= 0;
    end 

    else begin
      a.Data_Out <= mem[a.Addr];
      a.Valid_Out <= 1;
    end
end

endmodule 