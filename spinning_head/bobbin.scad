include <BOSL2/std.scad>
include <modules.scad>

res = 50;
w = 6; //default spoke thickness

shaft = 12.7; //1/2 inch bolt OD
tube = 16; //nylon spacer OD
b_od = 70; //bobbin OD about 3 inches
w_od = 65; //whorl race id about 2.5 inches


difference(){
translate([0,0,w/2]){
union(){
torus(d_maj = b_od+w, d_min = w,$fn=50);

zrot_copies(n=9)
translate([(b_od)/2-tube+w/2,0,0])
torus(d_maj = (b_od-tube)/2, d_min = w,$fn=50);
}
cylinder(h=w,d=tube+w/2,center=true,$fn=res);
}
inset(w);
}