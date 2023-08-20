include <BOSL2/std.scad>
include <modules.scad>
include <BOSL2/screws.scad>

res = 50;
w = 6; //default spoke thickness

shaft = 12.7; //1/2 inch bolt OD
b_od = 70; //bobbin OD about 3 inches
w_od = 65; //whorl race id about 2.5 inches

difference(){
    union(){
    rotate_extrude(angle = 360, convexity = 2) {
       translate([w_od/2+3,0,0])
       rotate([0,0,270])
       belt_race();
    }
    //spokes
    zrot_copies(n=6){
    translate([(w_od-INCH)/2+1.5,0,0])
    torus(d_maj = (w_od-INCH)/2, d_min = w/2,$fn=20);
    }
    
    //support cylinders
   translate([0,0,-5/2]){
   zrot_copies(n=6)
   translate([(w_od-INCH)/2+1.5,0,0])
   difference(){
   cylinder(d=(w_od-INCH)/2+w/2, h=5,center=true,$fn=20);
   cylinder(d=(w_od-INCH)/2-w/2, h=5,center=true,$fn=20);
   }
   }
        
    translate([0,0,-5/2])
    cylinder(h=5,d=INCH,center=true);
        
    }  

translate([0,0,-3])
    rotate([0,0,30])
  nut_trap_inline(10, "1/2");
  cylinder(h=10,d=shaft,center=true);
    
}


