include <BOSL2/std.scad>
include <BOSL2/screws.scad>

//axle = 12; //make clearance hole
//w = 2;   //tube thickness at edge
//set = 3; //clearance hole for set screws
//depth=50;//depth of axle clearance hole (bigger than total length)
//flange = 20; //length of extension

$fn=50;

module set_bushing(axle = 12,w = 2,set = 3,flange = 20,nut_s="1/2"){
   depth = flange + 20;
difference(){
hull(){
nut(nut_s,thickness="thin",thread="none");

down(flange/2)
cylinder(h=flange,d=axle+2*w,center=true);
}
//axle clearance

cylinder(h=depth,d=axle,center=true);
//set screw holes
down(flange-(w+set/2))
rotate([0,90,0])
    cylinder(h=INCH,d=set,center=true);
}
}