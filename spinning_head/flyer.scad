include <BOSL2/std.scad>
include <modules.scad>
include <BOSL2/screws.scad>

//constants
d_arm = 12.5; //mm
w = 3; //standard wall thickness
support = 10; //thickness of vertical support
orifice_length = support + 30;
$fa=2;
$fs=2;


//create fork for the arms
difference(){
union(){
   space = d_arm+w*2;
   up(space/2)
   joint_capsule();
   cylinder(h=space,d=d_arm+2*w,center=true);
   down(space/2)
   rotate([180,0,0])
   joint_capsule();
   
   translate([-w/2,0,0])
   rotate([0,90,0])
   cylinder(h=(d_arm+w*3),d=INCH,center=true);
   }

rotate([0,90,0])
nut_trap_inline(10, "1/2");
   
translate([-d_arm,0,0])
rotate([0,90,0])
cylinder(d=d_arm+2*w, h=w,center = false,$fn=10);
}
