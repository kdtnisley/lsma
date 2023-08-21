include <BOSL2/std.scad>
include <BOSL2/screws.scad>

//constants
w = 3; //standard wall thickness
support = 0.5 * INCH; //thickness of vertical support
w_s = 30; //width of vertical support
$fa=.1;
$fn=25;

difference(){
union(){
diff()
cube([support+w,w_s+w,15], center=true)
    edge_mask("Z")
        #rounding_edge_mask(l=$parent_size.z+0.01, r=2);

    
translate([0,0,-15/2])
diff()
cube([support+w+20,w_s+w+20,w], center=true)
    edge_mask("Z")
        #rounding_edge_mask(l=$parent_size.z+0.01, r=8);
}
    cube([support,w_s,25], center=true);
   
translate([0,-support/2,0])
rotate([0,90,0])
cylinder(h=support+w*2,d=5,center=true);

translate([0,support/2,0])
rotate([0,90,0])
cylinder(h=support+w*2,d=5,center=true);

translate([w_s/2-w,0,-15/2])
cylinder(h=10,d=5,center=true);

translate([-w_s/2+w,0,-15/2])
cylinder(h=10,d=5,center=true);
}


