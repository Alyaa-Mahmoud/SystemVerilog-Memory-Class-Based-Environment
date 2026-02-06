import pack::*;

class subscriber;

    mailbox mon2sub;
    transaction trans;

    covergroup sub_group;

        reset : coverpoint trans.rst {
            bins high = {1};
            bins low = {0};
        }

        write_read : coverpoint trans.EN {
            bins write = {1};
            bins read = {0};
        }

        address : coverpoint trans.Addr {
            bins addr[] = {[0 : 15]};
        }

        data_in : coverpoint trans.Data_In {
            bins corner_values = {32'h0000_0000 , 32'hFFFF_FFFF};
            bins random_data[4] = default;
        }

        data_out : coverpoint trans.Data_Out {
            bins corner_values = {32'h0000_0000 , 32'hFFFF_FFFF};
            bins random_data[4] = default;
        }

        validity : coverpoint trans.Valid_Out {
            bins valid = {1};
            bins invalid = {0};
        }

    endgroup

    function new(mailbox mon2sub);
        this.mon2sub = mon2sub;
        sub_group = new();
    endfunction //new()

    task sub(); 
        forever begin
            mon2sub.get(trans);  
            sub_group.sample(); 
        end

    endtask

endclass //className extends superClass