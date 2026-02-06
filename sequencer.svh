import pack::*;
class sequencer;
    transaction trans;
    mailbox Seq2drv; 
    int num;

    function new(mailbox Seq2drv);
        this.Seq2drv = Seq2drv; 
    endfunction
    
    task seq();
        repeat(num)
        begin
            trans = new();
            trans.Data_In   = $urandom();
            trans.Addr      = $urandom_range(0, 15);
            trans.EN        = 1; 
            Seq2drv.put(trans);
            $display("TIME = %0t , SEQUENCER: DATA IN = %0d , ADDR = %0d , EN = %0d", $realtime , trans.Data_In
            , trans.Addr , trans.EN);
        end
        repeat(num)
        begin
            trans = new();
            trans.Data_In   = $urandom();
            trans.Addr      = $urandom_range(0, 15);
            trans.EN        = 0; 
            Seq2drv.put(trans);
            $display("TIME = %0t , SEQUENCER: DATA IN = %d , ADDR = %0d , EN = %0d", $realtime , trans.Data_In
            , trans.Addr , trans.EN);
        end
    endtask
endclass 
