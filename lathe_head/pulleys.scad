include <BOSL2/std.scad>
include <constants.scad>

//TODO: make an option for the square drive one

difference(){
union(){
//rim
rotate_extrude(angle = 360, convexity = 2) {
   translate([df/2,0,0])
   rotate([0,0,270])
   belt_race();
}
//spokes
zrot_copies(n=4) //spokes
translate([df/4,0,0])
onion_ring(df/2-spindleOD-w+1,w*2,5); //make em just, so chunky


//spindle axis
cylinder(h=7,d=spindleOD+w,center=true,$fa=1);
} 

//spindle pass through
cylinder(h=20,d=spindleOD,center=true,$fa=1);
}

//8 inch pulley
//union(){
//rotate_extrude(angle = 360, convexity = 2) {
//   translate([ds/2,0,0])
//   rotate([0,0,270])
//   belt_race();
//}
////spokes
//zrot_copies(n=6){
//translate([ds/4-d_spindle+1,0,0])
//torus(d_maj = (ds-d_spindle)/2, d_min = w,$fn=50);
//}
//} 

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

module onion_ring(d,w,h){
union(){

torus(d_maj = d, d_min = w,$fn=25);

rotate([0,0,7])
down(h/2)
difference(){
   cylinder(d=d+w, h=h,center=true,$fn=25);
   cylinder(d=d-w, h=h,center=true,$fn=25);
}
}
}
