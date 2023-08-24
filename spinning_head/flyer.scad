include <BOSL2/std.scad>
include <modules.scad>
include <BOSL2/screws.scad>

//constants
arm_slop = 2; //mm
d_arm = 12.5+arm_slop; //mm
w = 3; //standard wall thickness
f_h = 3.5 * INCH; //length of flyer tip to tip
set_screw = 4; //mm
$fa=2;
$fs=2;

//create fork for the arms
difference(){
union(){
   cylinder(h = f_h, d=d_arm+w*2,center=true);
   
   //tip socket superstructure
   t_h = (d_arm+w*2)/2; //tip depth
   translate([t_h/2,0,f_h/2])
   rotate([0,90,0])
   cylinder(h=t_h,d=d_arm+w*2,center=true);
   translate([t_h/2,0,-f_h/2])
   rotate([0,90,0])
   cylinder(h=t_h,d=d_arm+w*2,center=true);
   
   translate([0,0,f_h/2])
   sphere(d=d_arm+w*2);
   translate([0,0,-f_h/2])
   sphere(d=d_arm+w*2);   
   
   //nut trap/orifice superstructure
   translate([-w/2,0,0])
   rotate([0,90,0])
   cylinder(h=(d_arm+w*3),d=INCH,center=true);
   }

//bolt head = nut trap
rotate([0,90,0])
nut_trap_inline(15, "1/2");

//orifice trap   
translate([-d_arm+1,0,0])
rotate([0,90,0])
cylinder(h=w*2, d=d_arm+2*w,center = false,$fn=12);
   
//arm sockets
translate([d_arm/2-2,0,f_h/2])
rotate([0,90,0])
cylinder(h = d_arm,d=d_arm,center=true);
translate([d_arm/2-2,0,-f_h/2])
rotate([0,90,0])
cylinder(h = d_arm,d=d_arm,center=true);

//set screw holes in arm sockets
translate([d_arm/3,0,f_h/2+d_arm/2])
cylinder(h=w*2,d=set_screw,center=true);
translate([d_arm/3,0,-(f_h/2+d_arm/2)])
cylinder(h=w*2,d=set_screw,center=true);
}
