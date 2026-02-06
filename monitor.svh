import pack::*;
class monitor;
    virtual intf vif; //monitor communicate with virtual interface
    mailbox mon2scb;  //mailbox bet. monitor and scoreboard
    mailbox mon2sub;
    transaction trans;
    
    function new(virtual intf vif , mailbox mon2scb , mailbox mon2sub);
        this.vif = vif;
        this.mon2scb = mon2scb;
        this.mon2sub = mon2sub;
        this.trans = new(); //solve don't care problem
    endfunction

    task mon();
    forever begin

        @(vif.cb_monitor)
        trans.rst       <= vif.rst;
        trans.Data_In   <= vif.cb_monitor.Data_In;
        trans.Addr      <= vif.cb_monitor.Addr;
        trans.EN        <= vif.cb_monitor.EN;

        trans.Data_Out  <= vif.cb_monitor.Data_Out;
        trans.Valid_Out <= vif.cb_monitor.Valid_Out; 

       // $display("TIME = %t , MONITOR: DATA IN = %d , ADDR = %d , EN = %d , DATA OUT = %d , RESET =%d", $realtime , vif.cb_monitor.Data_In
       // , vif.cb_monitor.Addr , vif.cb_monitor.EN , vif.cb_monitor.Data_Out,vif.rst);
        $display("TIME = %0t , MONITOR: DATA IN = %0d , ADDR = %0d , EN = %0d , DATA OUT = %0d , RESET =%0d", $realtime , trans.Data_In
        , trans.Addr , trans.EN , trans.Data_Out , trans.rst);
        $display("TIME = %0t , MONITOR: DATA IN = %0d , ADDR = %0d , EN = %0d , DATA OUT = %0d , RESET =%0d", $realtime , trans.Data_In
        , trans.Addr , trans.EN , trans.Data_Out , vif.rst);
        mon2scb.put(trans);
        mon2sub.put(trans);

    end 
    endtask
    
endclass 