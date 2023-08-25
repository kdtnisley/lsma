include <BOSL2/std.scad>

//treadle flywheel: 16 in (70 rpm)
//first step: 3
//second step: 8
//spindle driver: 3  (1000 rpm)

dt = 406; //flywheel
df = 76;  //first step
ds = 203;  //second step
dc = 76;  //chuck

bearingID = 5; // M8/pass through bearing
bearingOD = 15; //bearing outer diameter
bearingSD = bearingOD - 2; //dia of dust shield for bearing
alignOD = 10; //OD of alignment shaft

w = 3;

h_axis = 6*INCH; //height of center of rotating axis from plank
h_align_ax = 1*INCH; //height of center of alignment axis from plank
w_stance = 4*INCH; //center to center of attachment holes to plank
w_pulley = 15; //width of drive pulley, no clearance

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


//Dead head
dead_depth = 30;

difference(){
union(){
//create block to secure the alignment shaft
translate([0,0,h_align_ax])
rotate([0,90,0])
cylinder(h=dead_depth,d=alignOD+2*w,center=true);

}

//create socket for alignment shaft
translate([dead_depth/4,0,h_align_ax])
rotate([0,90,0])
cylinder(h=dead_depth/2,d=alignOD,center=true);
}

//Anchor block
//probably want to be able to open the top to make it easy to service. zip tie it in place like the printer?
anchor_depth = 30;
blockOR = (alignOD+2*w)/2;

difference(){
union(){
//create block to secure the alignment shaft
translate([0,0,h_align_ax])
rotate([0,90,0])
cylinder(h=anchor_depth,d=alignOD+2*w,center=true);

//maybe stack it up on polygons? look at the wall options?

up(w/2)
cube([anchor_depth,40+blockOR*3,w],center=true);
}

//create socket for alignment shaft
translate([anchor_depth/4,0,h_align_ax])
rotate([0,90,0])
cylinder(h=anchor_depth/2,d=alignOD,center=true);
}
