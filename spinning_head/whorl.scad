include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <ShapesNPaths/parametric_pulley.scad>

res = 50;

pulley_D = 4*INCH; //whorl race ID 2.5 in
belt_width = 6;
axle_D = 12.7; //1/2 inch bolt OD
w = 2.5;
spoke_D = 4;
numSpokes = 6;
hub_D = 1*INCH;

difference(){
   pulley(pulley_D,belt_width,axle_D,hub_D,w,spoke_D,numSpokes);
   
   translate([0,0,-3])
   rotate([0,0,30])
      nut_trap_inline(10, "1/2");
}