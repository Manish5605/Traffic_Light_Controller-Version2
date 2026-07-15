module top(

    input clk,
    input reset,

    input north_emg,
    input east_emg,
    input south_emg,
    input west_emg,

    output [1:0] north,
    output [1:0] east,
    output [1:0] south,
    output [1:0] west

);

//--------------------------------------------------
// Internal Wires
//--------------------------------------------------

wire emergency;
wire [1:0] direction;

// Normal Controller Outputs
wire [1:0] normal_north;
wire [1:0] normal_east;
wire [1:0] normal_south;
wire [1:0] normal_west;

// Emergency Controller Outputs
wire [1:0] emg_north;
wire [1:0] emg_east;
wire [1:0] emg_south;
wire [1:0] emg_west;

//--------------------------------------------------
// Normal Traffic Controller
//--------------------------------------------------

traffic_controller traffic_inst(

    .clk(clk),
    .reset(reset),

    .north(normal_north),
    .east(normal_east),
    .south(normal_south),
    .west(normal_west)

);

//--------------------------------------------------
// Priority Encoder
//--------------------------------------------------

priority_encoder priority_inst(

    .north_emg(north_emg),
    .east_emg(east_emg),
    .south_emg(south_emg),
    .west_emg(west_emg),

    .emergency(emergency),
    .direction(direction)

);

//--------------------------------------------------
// Emergency Controller
//--------------------------------------------------

emergency_controller emergency_inst(

    .clk(clk),
    .reset(reset),

    .emergency(emergency),
    .direction(direction),

    .north(emg_north),
    .east(emg_east),
    .south(emg_south),
    .west(emg_west)

);

//--------------------------------------------------
// Output Selection
//--------------------------------------------------

assign north = (emergency) ? emg_north : normal_north;
assign east  = (emergency) ? emg_east  : normal_east;
assign south = (emergency) ? emg_south : normal_south;
assign west  = (emergency) ? emg_west  : normal_west;

endmodule
