module emergency_controller(

    input clk,
    input reset,

    input emergency,
    input [1:0] direction,

    output reg [1:0] north,
    output reg [1:0] east,
    output reg [1:0] south,
    output reg [1:0] west

);

//--------------------------------------------------
// Light Encoding
//--------------------------------------------------

parameter RED    = 2'b00;
parameter YELLOW = 2'b01;
parameter GREEN  = 2'b10;

//--------------------------------------------------
// Direction Encoding
//--------------------------------------------------

parameter NORTH = 2'b00;
parameter EAST  = 2'b01;
parameter SOUTH = 2'b10;
parameter WEST  = 2'b11;

//--------------------------------------------------
// States
//--------------------------------------------------

parameter IDLE      = 1'b0;
parameter EMERGENCY = 1'b1;

reg state;
reg next_state;

//--------------------------------------------------
// State Register
//--------------------------------------------------

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end

//--------------------------------------------------
// Next-State Logic
//--------------------------------------------------

always @(*)
begin

    case(state)

        IDLE:
        begin
            if(emergency)
                next_state = EMERGENCY;
            else
                next_state = IDLE;
        end

        EMERGENCY:
        begin
            if(emergency)
                next_state = EMERGENCY;
            else
                next_state = IDLE;
        end

        default:
            next_state = IDLE;

    endcase

end

//--------------------------------------------------
// Output Logic
//--------------------------------------------------

always @(*)
begin

    // Default outputs

    north = RED;
    east  = RED;
    south = RED;
    west  = RED;

    case(state)

        //------------------------------------------
        // Normal Mode
        //------------------------------------------

        IDLE:
        begin
            north = RED;
            east  = RED;
            south = RED;
            west  = RED;
        end

        //------------------------------------------
        // Emergency Mode
        //------------------------------------------

        EMERGENCY:
        begin

            case(direction)

                NORTH:
                begin
                    north = GREEN;
                    east  = RED;
                    south = RED;
                    west  = RED;
                end

                EAST:
                begin
                    north = RED;
                    east  = GREEN;
                    south = RED;
                    west  = RED;
                end

                SOUTH:
                begin
                    north = RED;
                    east  = RED;
                    south = GREEN;
                    west  = RED;
                end

                WEST:
                begin
                    north = RED;
                    east  = RED;
                    south = RED;
                    west  = GREEN;
                end

                default:
                begin
                    north = RED;
                    east  = RED;
                    south = RED;
                    west  = RED;
                end

            endcase

        end

    endcase

end

endmodulemodule emergency_controller(

    input clk,
    input reset,

    input emergency,
    input [1:0] direction,

    output reg [1:0] north,
    output reg [1:0] east,
    output reg [1:0] south,
    output reg [1:0] west

);

//--------------------------------------------------
// Light Encoding
//--------------------------------------------------

parameter RED    = 2'b00;
parameter YELLOW = 2'b01;
parameter GREEN  = 2'b10;

//--------------------------------------------------
// Direction Encoding
//--------------------------------------------------

parameter NORTH = 2'b00;
parameter EAST  = 2'b01;
parameter SOUTH = 2'b10;
parameter WEST  = 2'b11;

//--------------------------------------------------
// States
//--------------------------------------------------

parameter IDLE      = 1'b0;
parameter EMERGENCY = 1'b1;

reg state;
reg next_state;

//--------------------------------------------------
// State Register
//--------------------------------------------------

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end

//--------------------------------------------------
// Next-State Logic
//--------------------------------------------------

always @(*)
begin

    case(state)

        IDLE:
        begin
            if(emergency)
                next_state = EMERGENCY;
            else
                next_state = IDLE;
        end

        EMERGENCY:
        begin
            if(emergency)
                next_state = EMERGENCY;
            else
                next_state = IDLE;
        end

        default:
            next_state = IDLE;

    endcase

end

//--------------------------------------------------
// Output Logic
//--------------------------------------------------

always @(*)
begin

    // Default outputs

    north = RED;
    east  = RED;
    south = RED;
    west  = RED;

    case(state)

        //------------------------------------------
        // Normal Mode
        //------------------------------------------

        IDLE:
        begin
            north = RED;
            east  = RED;
            south = RED;
            west  = RED;
        end

        //------------------------------------------
        // Emergency Mode
        //------------------------------------------

        EMERGENCY:
        begin

            case(direction)

                NORTH:
                begin
                    north = GREEN;
                    east  = RED;
                    south = RED;
                    west  = RED;
                end

                EAST:
                begin
                    north = RED;
                    east  = GREEN;
                    south = RED;
                    west  = RED;
                end

                SOUTH:
                begin
                    north = RED;
                    east  = RED;
                    south = GREEN;
                    west  = RED;
                end

                WEST:
                begin
                    north = RED;
                    east  = RED;
                    south = RED;
                    west  = GREEN;
                end

                default:
                begin
                    north = RED;
                    east  = RED;
                    south = RED;
                    west  = RED;
                end

            endcase

        end

    endcase

end

endmodule
