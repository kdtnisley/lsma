include <BOSL2/std.scad>
include <modules.scad>

//constants
d_arm = 12.5; //mm
w = 3; //standard wall thickness
$fa=2;
$fs=2;

//TODO: carve out support on the orifice end
//TODO: inset hex hole for the bolt

//create orifice
translate([-10,0,0])
rotate([0,-90,0])
difference() {
  cylinder(d=d_arm+2*w, h=30,center = false);
  up(30) rounding_cylinder_mask(d=d_arm+2*w, rounding=2);
    
  cylinder(d=d_arm, h=30, center=false,$fn=100);
  up(30) rounding_hole_mask(d=d_arm-.2, rounding=2,$fn=100);

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


