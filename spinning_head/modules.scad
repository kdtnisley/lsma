include <BOSL2/std.scad>


module belt_race_3D(pulley_D,belt_width,w){
union(){
//create rim of the pulley_______________________
path = arc(angle=[0,180], d=belt_width+w,$fn=25);
circ = circle(d=w,$fn=10);
rotate_extrude(){
//create the diameter of the pulley
translate([pulley_D/2-w,0,0])
//end create pulley rim 

//turn the 3D model of the belt channel back into a 2D shape
translate([belt_width/2+w,0,0])
rotate([0,0,90])
projection(cut = true)
union(){
    path_sweep(circ,path,caps=true);
    xcopies(belt_width+w) sphere(d=w,$fn=10);
}
}//end create pulley rimpath_sweep
}
}


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

//axis and tube
module inset(w)
{
   cylinder(h = w,d=shaft,$fn=res); //shaft
   cylinder(h = 3,d=tube,$fn=res); //press fit the nylon spacers
}

//slot for belt in pully
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