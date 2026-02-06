//Declare all DUT signals that will communicate with the interface
//Give this as a packet to the sequencer
class transaction;
    //rand to get different values for inputs "will be randomize by Sequencer"
    randc logic [31:0] Data_In;
    randc logic [3:0] Addr;
    randc logic EN;

    logic rst;
    logic [31:0] Data_Out;
    logic Valid_Out;

    constraint input_data {
    Data_In dist {
        32'h0                 :/ 10,
        32'hFFFF_FFFF         :/ 10,
        [32'h1 :32'hFFFF_FFFE]:/ 80              
    };
    }
    
endclass
