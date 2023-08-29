include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <constants.scad>

//bearingSD = dia of dust shield for bearing

//shield mounts to bolt that rests in the bearings
//shield carries the dead head rotating point
//so it's sort of a cap on the bolt

//have it snap onto a hex head bolt
//underside of the head bears on the bearing
//shield comes out parallel with the underside
//rotating point braced against head

//might want a bearing sized washer, just for fun

//that's easy
h_bolt_head = 10;
h_point = 5;

difference(){
union(){
    translate([0,0,h_bolt_head+h_point-2.5])
    cylinder(h=h_point,d1=bearingSD,d2=3,center=true);
        
    translate([0,0,h_bolt_head/2])
    cylinder(h=h_bolt_head,d=bearingSD,center=true);
}

translate([0,0,0])
  rotate([0,0,30])
  nut_trap_inline(10, "1/4");
}
