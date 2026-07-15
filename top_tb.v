`timescale 1ns / 1ps

module top_tb;

//--------------------------------------------------
// Inputs
//--------------------------------------------------

reg clk;
reg reset;

reg north_emg;
reg east_emg;
reg south_emg;
reg west_emg;

//--------------------------------------------------
// Outputs
//--------------------------------------------------

wire [1:0] north;
wire [1:0] east;
wire [1:0] south;
wire [1:0] west;

//--------------------------------------------------
// Instantiate DUT
//--------------------------------------------------

top uut(

    .clk(clk),
    .reset(reset),

    .north_emg(north_emg),
    .east_emg(east_emg),
    .south_emg(south_emg),
    .west_emg(west_emg),

    .north(north),
    .east(east),
    .south(south),
    .west(west)

);

//--------------------------------------------------
// Clock Generation
//--------------------------------------------------

always #5 clk = ~clk;      // 10 ns Clock

//--------------------------------------------------
// Test Sequence
//--------------------------------------------------

initial
begin

    // Initialize

    clk = 0;
    reset = 1;

    north_emg = 0;
    east_emg  = 0;
    south_emg = 0;
    west_emg  = 0;

    //----------------------------------
    // Reset
    //----------------------------------

    #20;
    reset = 0;

    //----------------------------------
    // Normal Traffic
    //----------------------------------

    #250;

    //----------------------------------
    // North Emergency
    //----------------------------------

    north_emg = 1;

    #100;

    north_emg = 0;

    //----------------------------------
    // Back to Normal
    //----------------------------------

    #150;

    //----------------------------------
    // East Emergency
    //----------------------------------

    east_emg = 1;

    #100;

    east_emg = 0;

    //----------------------------------
    // South Emergency
    //----------------------------------

    #150;

    south_emg = 1;

    #100;

    south_emg = 0;

    //----------------------------------
    // West Emergency
    //----------------------------------

    #150;

    west_emg = 1;

    #100;

    west_emg = 0;

    //----------------------------------
    // Multiple Emergencies
    //----------------------------------

    #150;

    north_emg = 1;
    east_emg  = 1;
    south_emg = 1;

    #100;

    north_emg = 0;
    east_emg  = 0;
    south_emg = 0;

    //----------------------------------

    #2000;

    $stop;

end

//--------------------------------------------------
// Monitor
//--------------------------------------------------

initial
begin

$monitor("Time=%0t | N=%b E=%b S=%b W=%b | N_EMG=%b E_EMG=%b S_EMG=%b W_EMG=%b",

          $time,

          north,
          east,
          south,
          west,

          north_emg,
          east_emg,
          south_emg,
          west_emg);

end

endmodule
