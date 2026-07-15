module traffic_controller(

    input clk,
    input reset,

    output reg [1:0] north,
    output reg [1:0] east,
    output reg [1:0] south,
    output reg [1:0] west

);

//====================================================
// Light Encoding
//====================================================

parameter RED    = 2'b00;
parameter YELLOW = 2'b01;
parameter GREEN  = 2'b10;

//====================================================
// State Encoding
//====================================================

parameter
    S0 = 3'd0,   // North Green
    S1 = 3'd1,   // North Yellow
    S2 = 3'd2,   // East Green
    S3 = 3'd3,   // East Yellow
    S4 = 3'd4,   // South Green
    S5 = 3'd5,   // South Yellow
    S6 = 3'd6,   // West Green
    S7 = 3'd7;   // West Yellow

//====================================================
// Timing Parameters
//====================================================

parameter GREEN_TIME  = 20;
parameter YELLOW_TIME = 5;

//====================================================
// Registers
//====================================================

reg [2:0] current_state;
reg [2:0] next_state;

reg [5:0] timer;

//====================================================
// State Register + Timer
//====================================================

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        current_state <= S0;
        timer <= 0;
    end

    else
    begin

        current_state <= next_state;

        if(current_state != next_state)
            timer <= 0;
        else
            timer <= timer + 1;

    end

end

//====================================================
// Next State Logic
//====================================================

always @(*)
begin

    next_state = current_state;

    case(current_state)

    //---------------------------------------
    // North Green
    //---------------------------------------

    S0:
    begin
        if(timer >= GREEN_TIME)
            next_state = S1;
    end

    //---------------------------------------
    // North Yellow
    //---------------------------------------

    S1:
    begin
        if(timer >= YELLOW_TIME)
            next_state = S2;
    end

    //---------------------------------------
    // East Green
    //---------------------------------------

    S2:
    begin
        if(timer >= GREEN_TIME)
            next_state = S3;
    end

    //---------------------------------------
    // East Yellow
    //---------------------------------------

    S3:
    begin
        if(timer >= YELLOW_TIME)
            next_state = S4;
    end

    //---------------------------------------
    // South Green
    //---------------------------------------

    S4:
    begin
        if(timer >= GREEN_TIME)
            next_state = S5;
    end

    //---------------------------------------
    // South Yellow
    //---------------------------------------

    S5:
    begin
        if(timer >= YELLOW_TIME)
            next_state = S6;
    end

    //---------------------------------------
    // West Green
    //---------------------------------------

    S6:
    begin
        if(timer >= GREEN_TIME)
            next_state = S7;
    end

    //---------------------------------------
    // West Yellow
    //---------------------------------------

    S7:
    begin
        if(timer >= YELLOW_TIME)
            next_state = S0;
    end

    default:
        next_state = S0;

    endcase

end

//====================================================
// Output Logic
//====================================================

always @(*)
begin

    // Default

    north = RED;
    east  = RED;
    south = RED;
    west  = RED;

    case(current_state)

    //---------------------------------------

    S0:
    begin
        north = GREEN;
    end

    //---------------------------------------

    S1:
    begin
        north = YELLOW;
    end

    //---------------------------------------

    S2:
    begin
        east = GREEN;
    end

    //---------------------------------------

    S3:
    begin
        east = YELLOW;
    end

    //---------------------------------------

    S4:
    begin
        south = GREEN;
    end

    //---------------------------------------

    S5:
    begin
        south = YELLOW;
    end

    //---------------------------------------

    S6:
    begin
        west = GREEN;
    end

    //---------------------------------------

    S7:
    begin
        west = YELLOW;
    end

    endcase

end

endmodule
