//w = 2; //wall thickness
//air = 3; //inside radius of housing
//aor = air + w; //outside radius of housing
//width = 10; //width of housing
//length = aor * 2 * 3; //make diameter, make three x diameter, length of baseplate of housing
//sir = 2; //radius of screw holes in baseplate
//capped = false; //when true, one side is closed
$fn=25;
include <BOSL2/std.scad>

//anchor(wall=2,air=3,width=10,sir=2);

module anchor(wall=2,air=3,width=10,sir=2)
{
    aor = air + wall; //outside radius of housing
    length = aor * 2 * 3; //make diameter, make three x diameter, length of baseplate of housing
    
    difference(){
    union(){
        //create axle housing
        translate([0,0,aor])
        rotate([90,0,0])
        cylinder(h=width, r=aor, center=true);
        
        //create baseplate
        translate([-length/2,-width/2,-wall])
        cube([length,width,wall]);
        
        //create fill under the wings
        translate([-aor*2,-width/2,0])
        cube([aor*2*2,width,aor]);
    }
    
    //remove axle
    translate([0,0,aor])
    rotate([90,0,0])
    cylinder(h=width, r=air, center=true);
    
    //remove wings
    translate([aor*2,0,aor])
    rotate([90,0,0])
    cylinder(h=width, r=aor, center=true);
    
    translate([-aor*2,0,aor])
    rotate([90,0,0])
    cylinder(h=width, r=aor, center=true);
    
    //remove screw holes
    translate([length/2-wall-sir,0,0])
    cylinder(h=width, r=sir, center=true);
    
    translate([-(length/2-wall-sir),0,0])
    cylinder(h=width, r=sir, center=true);
    }
}

function anchor(wall=2,air=3,width=10,sir=2) = no_function("anchor");
