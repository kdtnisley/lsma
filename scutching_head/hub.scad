include <BOSL2/std.scad>
include <BOSL2/screws.scad>

axle_OD = 16; //mm
hub_OD = 3*INCH; //in mm after conversion
thickness = 20; //mm
res = 50;

spoke_w = 40;
spoke_h = 6;
spoke_d = 15;
spoke_n = 4;

set_d = 2;

difference(){
//hub
cylinder(h=thickness,d=hub_OD,$fn=res);

//things to remove
//axle
cylinder(h=thickness,d=axle_OD,$fn=res/2);

//corners of hub
up(thickness) rounding_cylinder_mask(d=hub_OD, rounding=3, $fn=res);
rotate([0,180,0]) rounding_cylinder_mask(d=hub_OD, rounding=3, $fn=res);
    
//inset spoke sockets
zrot_copies(n=spoke_n) //spokes
translate([hub_OD/2-spoke_d/2,0,thickness/2])
    rotate([10,0,0])
    union(){
        //spoke sockets
        cube([spoke_d,spoke_w,spoke_h],center = true);
        //set screws(s)
        translate([1,0,0])
        cylinder(h = 50,d = set_d,$fn=res,center=true);
    }
    translate([0,0,-2]) rotate([0,0,30])
      nut_trap_inline(10, "5/8");
    translate([0,0,thickness-6]) rotate([0,0,30])
      nut_trap_inline(10, "5/8");
}


