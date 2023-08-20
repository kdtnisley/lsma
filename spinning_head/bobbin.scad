include <BOSL2/std.scad>
include <modules.scad>

res = 50;
w = 5; //default spoke thickness

shaft = 12.7; //1/2 inch bolt OD
tube = 21.5; //nylon spacer OD
b_od = 70; //bobbin OD about 3 inches
w_od = 65; //whorl race id about 2.5 inches
numRings = 7;

difference(){
translate([0,0,w/2]){
union(){
   //torus(d_maj = b_od+w, d_min = w,$fn=50);
   
   zrot_copies(n=numRings)
   translate([(b_od)/2-tube+3,0,0])
   torus(d_maj = (b_od-tube)/2, d_min = w,$fn=25);
   
//support cylinders
translate([0,0,-w/4]){
   zrot_copies(n=numRings)
   translate([(b_od)/2-tube+3,0,0])
rotate([0,0,7])
difference(){
   cylinder(d=(b_od-tube)/2+w, h=w/2,center=true,$fn=25);
   cylinder(d=(b_od-tube)/2-w, h=w/2,center=true,$fn=25);
}
}   
}
cylinder(h=w,d=tube+w/2,center=true,$fn=res);
}

inset(w);
}

