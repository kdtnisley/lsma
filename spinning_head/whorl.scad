include <BOSL2/std.scad>
include <modules.scad>
include <BOSL2/screws.scad>

res = 50;
w = 6; //default spoke thickness

shaft = 12.7; //1/2 inch bolt OD
tube = 16; //nylon spacer OD
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
    
    cylinder(h=w,d=INCH,center=true);
    }  

  nut_trap_inline(10, "1/2");
    //TODO: make it just deep enough to cover the nut and have it click in
  cylinder(h=w,d=shaft,center=true);
    
}
//TODO: make half height hollow cylinders that hide under the tori so that it's easy to print
