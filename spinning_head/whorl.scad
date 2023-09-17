include <BOSL2/std.scad>
include <modules.scad>
include <BOSL2/screws.scad>
include <parametric_pulley.scad>

res = 50;

shaft = 12.7; //1/2 inch bolt OD
w_od = 65; //whorl race id about 2.5 inches


pulley_D = 2.5*INCH;
belt_width = 6;
axel_D = 12.7;
w = 2.5;
spoke_D = 4;
numSpokes = 7;
hub_D = 1*INCH;

difference(){
pulley(pulley_D,belt_width,axel_D,hub_D,w,spoke_D,numSpokes);
   
translate([0,0,-3])
rotate([0,0,30])
nut_trap_inline(10, "1/2");
}



//difference(){
//    union(){
//    rotate_extrude(angle = 360, convexity = 2) {
//       translate([w_od/2+3,0,0])
//       rotate([0,0,270])
//       belt_race();
//    }
//    //spokes
//    zrot_copies(n=6){
//    translate([(w_od-INCH)/2+1.5,0,0])
//    torus(d_maj = (w_od-INCH)/2, d_min = w/2,$fn=20);
//    }
//    
//    //support cylinders
//   translate([0,0,-5/2]){
//   zrot_copies(n=6)
//   translate([(w_od-INCH)/2+1.5,0,0])
//   difference(){
//   cylinder(d=(w_od-INCH)/2+w/2, h=5,center=true,$fn=20);
//   cylinder(d=(w_od-INCH)/2-w/2, h=5,center=true,$fn=20);
//   }
//   }
//        
//    translate([0,0,-5/2])
//    cylinder(h=5,d=INCH,center=true);
//        
//    }  
//
//translate([0,0,-3])
//    rotate([0,0,30])
//  nut_trap_inline(10, "1/2");
//  cylinder(h=10,d=shaft,center=true);
//    
//}


