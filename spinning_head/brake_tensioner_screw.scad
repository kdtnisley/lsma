include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=50;

//make screw
difference(){
   union(){
shoulder_screw("M10",d=10, length=10, thread_len=10, head_size=12, head="pan",drive="none");
   
   translate([0,0,25.5])
rotate([0,90,0])
cylinder(h=3,d=12,center=true);
   }
   
translate([2.5,0,15])
cube([3,10,4],center=true);

translate([-2.5,0,15])
cube([3,10,4],center=true);
}

