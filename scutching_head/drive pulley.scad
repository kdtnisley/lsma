include <BOSL2/std.scad>
include <../pulley.scad>

pulley_D = 3*INCH;
belt_width = 6;
axle_D = 13;
hub_D = 25; //what is this
w = 3;
spoke_D = 4;
numSpokes = 6;


 pulley(pulley_D,belt_width,axle_D,hub_D,w,spoke_D,numSpokes);