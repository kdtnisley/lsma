// holding hook for the spinning wheel
include <BOSL2/std.scad>

$fn=40;
eps = 0.01;

difference(){
union(){
translate([eps, 15, 0])
   rotate_extrude(angle=270, convexity=10)
       translate([10, 0]) circle(d=5);
rotate_extrude(angle=90, convexity=10)
   translate([5, 0]) circle(d=5);

translate([5,1.5,0])
cuboid([30,3,10], rounding=2,edges=[BACK,TOP+RIGHT,TOP+LEFT,BOTTOM+RIGHT,BOTTOM+LEFT]);

translate([10,15,0])
sphere(d=5);
}

translate([15,2,0])
rotate([90,0,0])
cylinder(h=6,d=3,center=true);
}