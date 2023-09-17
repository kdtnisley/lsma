include <BOSL2/std.scad>
include <constants.scad>

//Anchor block
//probably want to be able to open the top to make it easy to service. zip tie it in place like the printer?

//constants
anchor_depth = 40;
blockOR = (alignOD+2*w)/2;

//block
difference(){
union(){
    //create block to secure the alignment shaft
    translate([0,0,h_align_ax])
    rotate([0,90,0])
    cylinder(h=anchor_depth,d=alignOD+2*w,center=true);
    
    up(h_align_ax/2)
    cube([anchor_depth,h_align_ax*2+alignOD,h_align_ax],center=true);
}

//create socket for alignment shaft
translate([anchor_depth/4,0,h_align_ax])
rotate([0,90,0])
cylinder(h=anchor_depth/2,d=alignOD,center=true,$fa=1);

//create wings to anchor the block
translate([0,h_align_ax+alignOD-w/2-.5,h_align_ax+w])
rotate([0,90,0])
cylinder(h=anchor_depth,d=h_align_ax*2,center=true,$fa=1);

translate([0,-(h_align_ax+alignOD-w/2-.5),h_align_ax+w])
rotate([0,90,0])
cylinder(h=anchor_depth,d=h_align_ax*2,center=true,$fa=1);

//holes for screw to anchor to baseplate
translate([10,26,w-1])
cylinder(h=2*w,d=screwOD,center=true);

translate([10,-26,w-1])
cylinder(h=2*w,d=screwOD,center=true);

translate([-10,26,w-1])
cylinder(h=2*w,d=screwOD,center=true);

translate([-10,-26,w-1])
cylinder(h=2*w,d=screwOD,center=true);
}

