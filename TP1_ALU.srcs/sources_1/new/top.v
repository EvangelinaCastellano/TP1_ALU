module top
#(
    parameter NB_IN         = 8, // Number of bits of the operands
    parameter NB_OUT        = 8, // Number of bits of the result
    parameter NB_OPERATION  = 6  // Number of bits of the operation
)
(
    input   [NB_IN - 1 : 0]         i_data_switch,      // Switch value (data A, data B or code operation)
    input                           i_button_a_data,    // Button to save data A
    input                           i_button_b_data,    // Button to save data B
    input                           i_button_operation, // Button to save code operation
    input                           i_button_result,    // Button to show result on the LEDs

    output  [NB_OUT - 1 : 0]        o_data,             // Result of operation

    input                           i_clock,
    input                           i_button_reset      // Button to reset
);

reg [NB_IN - 1 : 0] data_a;                 // Contains data A
reg [NB_IN - 1 : 0] data_b;                 // Contains data B
reg [NB_OPERATION - 1 : 0] data_operation;  // Contains operation code
reg [NB_OUT -1 : 0] data_out;               // Contains the result of the operation

assign o_data = data_out;                   // The output will be the value of data_out

wire [NB_OUT -1 : 0] alu_to_data_out;       // Connect the ALU output to reg data_out

ALU alu(.i_data_a(data_a), .i_data_b(data_b), .i_operation(data_operation), .o_data(alu_to_data_out)); // Initialize the ALU module 

always @(posedge i_clock) begin
    if (i_button_reset) 
        data_a <= {NB_IN {1'b0}}; // Clean reg 
    else if (i_button_a_data) 
        data_a <= i_data_switch;  // Saves the data A loaded on the switches
end

always @(posedge i_clock) begin
    if (i_button_reset)
        data_b <= {NB_IN {1'b0}}; // Clean reg
    else if (i_button_b_data)
        data_b <= i_data_switch;  // Saves the data B loaded on the switches
end

always @(posedge i_clock) begin
    if (i_button_reset)          
        data_operation <= {NB_OPERATION {1'b0}};              // Clean reg
    else if (i_button_operation)
        data_operation <= i_data_switch[NB_OPERATION -1 : 0]; // Ignore bits 6 and 7 of data_switch because the opcode is 6 bits
end

always @(posedge i_clock) begin
    if (i_button_reset)              
        data_out <= {NB_OUT {1'b0}}; // Clean reg
    else if (i_button_result) 
        data_out <= alu_to_data_out; //Saves the data B loaded on the switches
end

endmodule