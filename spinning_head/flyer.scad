include <BOSL2/std.scad>

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


//create orifice
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

translate([(d_arm-w)/2,0,0])
rotate([0,90,0])
cylinder(h=(d_arm+w*2)/2,d=d_arm+2*w,center=true);

//MODULES
module joint_capsule(bottom_round)
{
difference() {
  cylinder(d=d_arm+2*w, h=30,center = false);
  up(30) rounding_cylinder_mask(d=d_arm+2*w, rounding=3);
    
  if (bottom_round==1){
  zflip()
  rounding_cylinder_mask(d=d_arm+2*w, rounding=3);
  }
  
  translate([0,0,2*w])
  cylinder(d=d_arm, h=30, center=false);
    
  translate([0,0,15])
  rotate([0,90,0])
  cylinder(h=d_arm+2*w,d=4,center=true,$fn=50);
  //chamfer those holes?
}
}
