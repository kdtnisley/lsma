include <BOSL2/std.scad>
include <../bearing.scad>
include <../pulley_carrier.scad>

set = 5; //holes for the bolt-down

pulley_d = 80;
pulley_thickness = 20; //the setter + thickness of pulley flange
axle_d = 13;

clearance = 4; //vibes, leaving room for a washer or three
frame = 10;

h_width = pulley_d + 2*clearance;
h_thick = pulley_thickness + 2*clearance;

f_width = h_width + 2*frame;
f_length = h_thick + 2*frame;

extra = 25;

f_total_length = f_length+extra*2;

difference(){
union(){
carrier(p_width=pulley_d,p_thick=pulley_thickness,clearance=clearance,frame=frame,axle=axle_d);

//extended width
difference(){
diff()
cube(size=[f_total_length,f_width,frame], center=true)
    edge_mask([FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT])
        #rounding_edge_mask(l=$parent_size.z+0.01, r=5);

diff()
cube(size=[h_thick+extra*2,h_width,frame], center=true)
    edge_mask([FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT])
        #rounding_edge_mask(l=$parent_size.z+0.01, r=5);
}

// extra bearing for the extra width
translate([(f_length/2+extra)-frame/2,0,frame/2])
rotate([0,0,90])
bearing(wall=3,air=axle_d/2,width=frame,sir=3);

//cap for the one bearing
translate([-h_thick+frame/2,0,frame+axle_d/2-2])
rotate([0,90,0])
cylinder(h=3,d=axle_d);

}
//bolt down holes
translate([(f_total_length-frame)/2,(f_width-frame)/2,0])
cylinder(h=frame*2,d=set,center=true);

translate([-(f_total_length-frame)/2,(f_width-frame)/2,0])
cylinder(h=frame*2,d=set,center=true);

translate([-(f_total_length-frame)/2,-(f_width-frame)/2,0])
cylinder(h=frame*2,d=set,center=true);

translate([(f_total_length-frame)/2,-(f_width-frame)/2,0])
cylinder(h=frame*2,d=set,center=true);
}


