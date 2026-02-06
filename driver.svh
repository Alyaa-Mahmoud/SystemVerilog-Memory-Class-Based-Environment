import pack::*;
//driver get transaction from generator through mailbox
class driver;
    virtual intf vif;
    mailbox Seq2drv;
    transaction trans;
     
    function new(virtual intf vif , mailbox Seq2drv);
        this.vif = vif;
        this.Seq2drv = Seq2drv;
    endfunction //new()

    task drv();
        forever begin
            @(vif.cb_driver);
                Seq2drv.get(trans); //get transaction from sequencer mailbox
                //transfer data to interface "mapping""
                vif.cb_driver.Data_In <= trans.Data_In;
                vif.cb_driver.Addr    <= trans.Addr;
                vif.cb_driver.EN      <= trans.EN;
                $display("TIME = %0t , DRIVER: DATA IN = %0d , ADDR = %0d , EN = %0d", $realtime , trans.Data_In
                , trans.Addr , trans.EN);
            end
    endtask

endclass //driver 


