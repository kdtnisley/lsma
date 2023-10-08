include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <../set_bushing.scad>

axle = 13;
w=2;
set = 3;

//for drive pulley
set_bushing(axle,w,set,flange = 10,nut_s="1/2");
//needs a regular lil bushing too

//hub - needs two
translate([30,0,0])
set_bushing(axle,w,set,flange = 15,nut_s="5/8");