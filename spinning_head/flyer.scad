include <BOSL2/std.scad>
include <modules.scad>

//constants
d_arm = 12.5; //mm
w = 3; //standard wall thickness
support = 10; //thickness of vertical support
orifice_length = support + 30;
$fa=2;
$fs=2;

//TODO: inset hex hole for the bolt

//create orifice
translate([-10,0,0]) //position it
rotate([0,-90,0])
difference() {
  cylinder(d=d_arm+2*w, h=orifice_length,center = false);
  up(orifice_length) rounding_cylinder_mask(d=d_arm+2*w, rounding=2);
    
  cylinder(d=d_arm, h=orifice_length, center=false,$fn=100);
  up(orifice_length) rounding_hole_mask(d=d_arm-.2, rounding=2,$fn=100);

//side holes
up(10)    
union(){
    rotate([90,0,0])
    cylinder(h=d_arm+2*w, d=10,center=true,$fn=50);
    
    //outside smoothing
    translate([0,-(d_arm+2*w)/2,0])
    rotate([90,0,0])
    rounding_hole_mask(d=10-.1, rounding=2,$fn=50);
    
    translate([0,(d_arm+2*w)/2,0])
    rotate([-90,0,0])
    rounding_hole_mask(d=10-.1, rounding=2,$fn=50);
     
    //inside smoothing   
    translate([0,(d_arm-w*1.5)/2,0])
    rotate([90,0,0])
    cylinder(h=5,d1=10,d2=12,center=true,$fn=50);
    
    translate([0,-(d_arm-w*1.5)/2,0])
    rotate([-90,0,0])
    cylinder(h=5,d1=10,d2=12,center=true,$fn=50);    
}
up(20)
difference(){
union(){
  cylinder(d=d_arm+2*w, h=support,center = false);
  rounding_cylinder_mask(d=d_arm+2*w, rounding=2);    
  up(support) rotate([180,0,0]) rounding_cylinder_mask(d=d_arm+2*w, rounding=2,$fn=50);
}
translate([0,0,-3])
  cylinder(d=d_arm+w, h=support+10, center=false,$fn=100);
}
}



//create fork for the arms
space = d_arm+w*2;
up(space/2)
joint_capsule();
cylinder(h=space,d=d_arm+2*w,center=true);
down(space/2)
rotate([180,0,0])
joint_capsule();

translate([0,0,0])
rotate([0,90,0])
cylinder(h=(d_arm+w*2),d=d_arm+2*w,center=true);


