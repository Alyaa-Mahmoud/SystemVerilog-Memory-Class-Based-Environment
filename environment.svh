import pack::*;
class env;
    //classes instances
    sequencer seq_inst;
    driver drv_inst;
    monitor mon_inst;
    scoreboard scb_inst;
    subscriber sub_inst;

    mailbox Seq2drv;
    mailbox mon2scb;
    mailbox mon2sub;
    //declare classes handles
    function new(virtual intf vif);
        Seq2drv = new(1);
        mon2scb = new(1);
        mon2sub = new(1);
        seq_inst = new(Seq2drv);
        drv_inst = new(vif , Seq2drv);
        mon_inst = new(vif , mon2scb , mon2sub);
        scb_inst = new(mon2scb);
        sub_inst = new(mon2sub);
    endfunction

    task run();
        fork
            seq_inst.seq();
            drv_inst.drv();
            mon_inst.mon();
            scb_inst.scb();
            sub_inst.sub();
        join_any
    endtask

    task sync();
        wait(scb_inst.count_scb == 2*seq_inst.num + 2);
        $stop;
    endtask

    task test();
        run();
        sync();
    endtask
    
endclass 
