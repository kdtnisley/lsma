include <BOSL2/std.scad>

//treadle flywheel: 16 in (70 rpm)
//first step: 3
//second step: 8
//spindle driver: 3  (1000 rpm)

dt = 406; //flywheel
df = 76;  //first step
ds = 203;  //second step
dc = 76;  //chuck

d_spindle = 5; //axel

w = 3;

//TODO: turn the tori into full height hollowed cylinders so that it's easy to print

//3 inch pully
union(){
rotate_extrude(angle = 360, convexity = 2) {
   translate([df/2,0,0])
   rotate([0,0,270])
   belt_race();
}
//spokes
zrot_copies(n=6){
translate([df/4-d_spindle+1,0,0])
torus(d_maj = (df-d_spindle)/2, d_min = w,$fn=50);
}
} 

//8 inch pully
union(){
rotate_extrude(angle = 360, convexity = 2) {
   translate([ds/2,0,0])
   rotate([0,0,270])
   belt_race();
}
//spokes
zrot_copies(n=6){
translate([ds/4-d_spindle+1,0,0])
torus(d_maj = (ds-d_spindle)/2, d_min = w,$fn=50);
}
} 

//slot for belt in pulley
//for some reason the modules file isn't being found at work
module belt_race()
{
   r_belt = 3;
   w_track = r_belt*2 + 4;
   $fn=50;
   
   translate([0,r_belt,0])
   difference(){
      union(){
      translate([-w_track/2,-r_belt])
      square([w_track,r_belt]);
         
      translate([-4,0,0])
      circle(d=(10-6)/2);
      translate([4,0,0])
      circle(d=(10-6)/2);
                  
      translate([0,-r_belt])
      difference(){
      circle(d=w_track);
      translate([-w_track/2,0])
      square([w_track,w_track/2]);
      }
      }         
   circle(r=r_belt);
}
}
