include <BOSL2/std.scad>

axle_OD = 12; //mm
w = 3;
base_w = axle_OD*3;
base_d = 15;

set_d = 4;

$fn=100;

difference(){
union(){
//create base
translate([0,0,w/2])
cube([base_w,base_d,w],center=true);

//create axle housing
translate([0,0,axle_OD/2 + w])
rotate([90,0,0])
cylinder(h=base_d,d=axle_OD+w*2,center=true);

//fill in under the wing curves
translate([-(axle_OD+w*2+base_d)/2,-base_d/2,w])
cube([axle_OD+w*2+base_d,base_d,base_d/2]);
}

//create wing curves
translate([axle_OD/2 +w/2 + base_d/2,0,axle_OD/2 + w])
rotate([90,0,0])
cylinder(h=base_d,d=axle_OD,center=true);

translate([-(axle_OD/2 +w/2 + base_d/2),0,axle_OD/2 + w])
rotate([90,0,0])
cylinder(h=base_d,d=axle_OD,center=true);

//remove axle
translate([0,0,axle_OD/2 + w])
rotate([90,0,0])
cylinder(h=base_d,d=axle_OD,center=true);

//remove anchor screws
translate([base_w/2-w,0,w])
cylinder(h=w*2,d=set_d,center=true);

translate([-(base_w/2-w),0,w])
cylinder(h=w*2,d=set_d,center=true);
}
