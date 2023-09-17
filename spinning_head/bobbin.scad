include <BOSL2/std.scad>
include <modules.scad>
include <ShapesNPaths/parametric_pulley.scad>

res = 50;
w = 5; //default spoke thickness

shaft = 13.7; //1/2 inch bolt OD plus 1 mm slop
tube = 21.5; //nylon spacer OD
tubeID = 15;
b_od = 2.75*INCH; //bobbin OD about 3 inches
numRings = 7;
d = 16;

union(){
//outer edge
up(w/4)
torus(d_maj = b_od-w, d_min = w,$fn=50);
rotate([0,0,14.4])
difference(){
   cylinder(d=b_od, h=w/2,center=true,$fn=50);
   cylinder(d=b_od-2*w, h=w/2,center=true,$fn=50);
}

//spokes
zrot_copies(n=numRings)
translate([tube,0,1.25])
onion_ring(b_od/2-(tube+3)/2,4,w/2,0); //d,w,h,race_wall_thickness

//hub
down(w/4)   
bobbin_hub(w);
}

//brake (uncomment to enable)
//translate([0,0,w+1])
//belt_race_3D(19,3,w/2);

module bobbin_hub(w){
difference(){
    cylinder(h=w,d=tube+3,$fn=res);
    
    difference(){
        cylinder(h = w-2,d=tube,$fn=res); //press fit bobbin axle tube
        cylinder(h = w-2,d=tubeID,$fn=res); //press fit bobbin axle tube
    }
    cylinder(h = w,d=shaft,$fn=res); //shaft
    }
}