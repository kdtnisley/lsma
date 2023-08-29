include <BOSL2/std.scad>
include <constants.scad>

//Dead head
dead_depth = 30;

//bearingID = 5; // M8/pass through bearing
//bearingOD = 15; //bearing outer diameter

//TODO: way to lock it to the alignment shaft
//TODO: outriggers to the rear?
//TODO: cut the notch back into the bottom? /print time reduction

difference(){
//create block
translate([-dead_depth/2,0,15])
rotate([90,0,90])
linear_extrude(dead_depth){
hull(){ //wish this didn't cover over the circle divot
translate([0,h_axis-15,0])
circle(d=bearingOD+2*w);
glued_circles(d=30, spread=30, tangent=40);
}}    
    
//create clearance for alignment shaft
translate([0,0,h_align_ax])
rotate([0,90,0])
cylinder(h=dead_depth,d=alignOD,center=true);

//create clearance for rotating shaft
translate([0,0,h_axis])
rotate([0,90,0])
cylinder(h=dead_depth,d=bearingID,center=true);

//create sockets for the bearings
translate([dead_depth/2 - bearingD/2,0,h_axis])
rotate([0,90,0])
cylinder(h=bearingD,d=bearingOD,center=true);

translate([-dead_depth/2 + bearingD/2,0,h_axis])
rotate([0,90,0])
cylinder(h=bearingD,d=bearingOD,center=true);

}

