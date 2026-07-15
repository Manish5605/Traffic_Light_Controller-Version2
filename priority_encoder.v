module priority_encoder(

input north_emg,
input east_emg,
input south_emg,
input west_emg,

output reg emergency,
output reg [1:0] direction

);

parameter NORTH = 2'b00;
parameter EAST  = 2'b01;
parameter SOUTH = 2'b10;
parameter WEST  = 2'b11;

always @(*)
begin

    emergency = 1'b0;
    direction = NORTH;

    if(north_emg)
    begin
        emergency = 1'b1;
        direction = NORTH;
    end

    else if(east_emg)
    begin
        emergency = 1'b1;
        direction = EAST;
    end

    else if(south_emg)
    begin
        emergency = 1'b1;
        direction = SOUTH;
    end

    else if(west_emg)
    begin
        emergency = 1'b1;
        direction = WEST;
    end

end

endmodule
