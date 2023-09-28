`timescale 1ns / 1ps

module testbench ();

    // Declarar y definir los valores de los parámetros
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

    // Registros inicializados en cero
    i_data_switch = {NB_IN {1'b0}};
    i_button_a_data = 1'b0;
    i_button_b_data = 1'b0;
    i_button_operation = 1'b0;
    i_button_result = 1'b0;

    #2 i_data_switch = 8'b10110011; //operando a
    #10 i_button_a_data = 1'b1; // se presiona el boton para cargar el operando a
    #10 i_button_a_data = 1'b0; //se suelta el bonton para cargar el operando a
    #2 i_data_switch = 8'b00000011; //operando b
    #10 i_button_b_data = 1'b1;
    #10 i_button_b_data = 1'b0;

    #10 i_data_switch = 6'b000011; // sra
    #10 i_button_operation = 1'b1;
    #10 i_button_operation = 1'b0;

    #10 i_button_result = 1'b1;    
    #10 i_button_result = 1'b0; 
end    

endmodule
