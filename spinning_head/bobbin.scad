include <BOSL2/std.scad>
include <modules.scad>

res = 50;
w = 5; //default spoke thickness

shaft = 12.7; //1/2 inch bolt OD
tube = 21.5; //nylon spacer OD
tubeID = 15;
b_od = 2.75*INCH; //bobbin OD about 3 inches
numRings = 7;
d = 16;

union(){ //outer edge
up(w/4)
torus(d_maj = b_od-w, d_min = w,$fn=50);
rotate([0,0,14.4])
difference(){
   cylinder(d=b_od, h=w/2,center=true,$fn=50);
   cylinder(d=b_od-2*w, h=w/2,center=true,$fn=50);
}

zrot_copies(n=numRings) //spokes
translate([tube,0,0])
onion_ring(d,w);

down(w/4)   //hub
bobbin_hub(w);
}

//brake
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


module onion_ring(d,w){
union(){
up(w/4)
torus(d_maj = d, d_min = w,$fn=25);

rotate([0,0,7])
difference(){
   cylinder(d=d+w, h=w/2,center=true,$fn=25);
   cylinder(d=d-w, h=w/2,center=true,$fn=25);
}
}
}
