`timescale 1ns / 1ps

module testbench ();

    parameter NB_IN         = 8;
    parameter NB_OUT        = 8;
    parameter NB_OPERATION  = 6;

    reg   [NB_IN - 1 : 0]         i_data_switch;
    reg                           i_button_a_data;
    reg                           i_button_b_data;
    reg                           i_button_operation;
    reg                           i_button_result;
    wire  [NB_OUT - 1 : 0]        o_data;
    reg                           i_clock;
    reg                           i_button_reset;



top tb_top(
            .i_data_switch(i_data_switch),
            .i_button_a_data(i_button_a_data),
            .i_button_b_data(i_button_b_data),
            .i_button_operation(i_button_operation),
            .i_button_result(i_button_result),
            .o_data(o_data),
            .i_clock(i_clock),
            .i_button_reset(i_button_reset)
);

initial begin
    i_clock = 1'b0;
    forever #1 i_clock = ~i_clock;
end

initial begin
    i_button_reset = 1'b1;
    #1 i_button_reset = 1'b0;
end

initial begin

    // Initialize the registers to zero
    i_data_switch = {NB_IN {1'b0}};
    i_button_a_data = 1'b0;
    i_button_b_data = 1'b0;
    i_button_operation = 1'b0;
    i_button_result = 1'b0;

    #2 i_data_switch = 8'b10110011; // Operand A
    #10 i_button_a_data = 1'b1;     // The button is pressed to load operand A
    #10 i_button_a_data = 1'b0;     // The button is released 
    #2 i_data_switch = 8'b00000011; // Operand B
    #10 i_button_b_data = 1'b1;     // The button is pressed to load operand B
    #10 i_button_b_data = 1'b0;     // The button is released 

    #10 i_data_switch = 6'b111111;  // NOR operation
    #10 i_button_operation = 1'b1;  // The button is pressed to load the operation
    #10 i_button_operation = 1'b0;  // The button is released 
    #10 i_button_result = 1'b1;     // The button is pressed to load the result 
    #10 i_button_result = 1'b0;     // The button is released 
end    

endmodule
