include <BOSL2/std.scad>
include <modules.scad>

res = 50;
w = 6; //default spoke thickness

shaft = 12.7; //1/2 inch bolt OD
tube = 16; //nylon spacer OD
b_od = 70; //bobbin OD about 3 inches
w_od = 65; //whorl race id about 2.5 inches


union(){
rotate_extrude(angle = 360, convexity = 2) {
   translate([w_od/2+3,0,0])
   rotate([0,0,270])
   belt_race();
}
//spokes
zrot_copies(n=9){
translate([(w_od)/2-tube+3,0,0])
torus(d_maj = (w_od-tube)/2, d_min = w/2,$fn=50);
}
//TODO: add hole for nut
}  
