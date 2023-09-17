include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=50;

w=3;
//make anchor block
difference(){
union(){
   rotate([0,90,0])
   cylinder(h=10,d=10+2*w,center=true);
   
   translate([0,0,-(10+2*w)/4])
   cube([10,(10+2*w)+10,(10+2*w)/2], center=true);
   
   translate([0,13,-8])
cylinder(h=3,d=10);

translate([0,-13,-8])
cylinder(h=3,d=10);
}

rotate([0,90,0])
screw_hole("M10,10",anchor=CENTER,thread=true);

translate([0,(10+2*w)/2+5,0])
rotate([0,90,0])
cylinder(h=10,d=10,center=true);

translate([0,-((10+2*w)/2+5),0])
rotate([0,90,0])
cylinder(h=10,d=10,center=true);

translate([0,13,-9])
cylinder(h=5,d=3);

translate([0,-13,-9])
cylinder(h=5,d=3);
}
