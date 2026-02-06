import pack::*;
//get data from mon2scb mailbox
//check output given from dut to monitor correct or not
class scoreboard;
    mailbox mon2scb;
    logic [31:0] mem [15:0]; //reference model
    transaction trans;
    int count_scb = 0;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task scb();
        forever begin
        mon2scb.get(trans);

        if (trans.rst) begin
            foreach (mem[i]) 
            mem[i] = 0;
            $display("TIME = %0t , Scoreboard - Memory Reset" , $realtime);
        end
        else if (trans.EN) begin
            mem[trans.Addr] = trans.Data_In;
            $display("TIME = %0t , Scoreboard - Write  DATA IN : %0d", $realtime , trans.Data_In);
        end 
        else begin
            if (trans.Data_Out == mem[trans.Addr]) begin
                $display("TIME = %0t , Read Pass , Address = %0d , Data_Expected = %0d , Actual_Data = %0d , Valid = %0d", $realtime , 
                trans.Addr ,mem[trans.Addr],trans.Data_Out,trans.Valid_Out);
            end else begin
                $display("TIME = %0t , Read Fail , Address = %0d , Data_Expected = %0d , Actual_Data = %0d , Valid = %0d", $realtime , 
                trans.Addr ,mem[trans.Addr],trans.Data_Out,trans.Valid_Out);
            end
        end
        count_scb++;
    end
    endtask
endclass
