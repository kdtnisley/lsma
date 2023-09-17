include <BOSL2/std.scad>
include <constants.scad>

//Live block
//skin and bez may be useful for profile shape
live_depth = 30;

difference(){
union(){
//create block to secure the alignment shaft
translate([0,0,h_align_ax])
rotate([0,90,0])
cylinder(h=live_depth,d=alignOD+2*w,center=true);

}

//create socket for alignment shaft
translate([live_depth/4,0,h_align_ax])
rotate([0,90,0])
cylinder(h=live_depth/2,d=alignOD,center=true);
}
