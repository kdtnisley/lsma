include <BOSL2/std.scad>
include <modules.scad>

//constants
d_arm = 12.5; //mm
w = 3; //standard wall thickness
$fa=2;
$fs=2;

//create joints for flyer arms
union(){
    joint_capsule(1);
    
    translate([d_arm/2,0,-d_arm/2])
    rotate([0,90,0])
    joint_capsule(1);
    
    translate([w*3.1,0,w])
    rotate([-90,90,0])
    rotate_extrude(angle = 90, convexity = 2){
        translate([(d_arm+2*w)/2,0,0])
        circle(d=d_arm+2*w);
        }
}
