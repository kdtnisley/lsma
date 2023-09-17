include <BOSL2/std.scad>
include <ShapesNPaths/parametric_pulley.scad>

pulley_D = 2*INCH;
belt_width = 6;
w = 3;
axle_D = 6;
hub_D = axle_D + 2*w;
spoke_D = 4;
numSpokes = 5;

pulley(pulley_D,belt_width,axle_D,hub_D,w,spoke_D,numSpokes);
