include <BOSL2/std.scad>
include <../bearing.scad>
include <../pulley_carrier.scad>

pulley_radius = 4*INCH;
pulley_thickness = 0.5*INCH;
axle_radius = 12;

clearance = 4;
frame = 10;

h_width = pulley_radius + clearance;
h_thick = pulley_thickness + clearance;

f_width = h_width + 2*frame;
f_length = h_thick + 2*frame;

extra = 1*INCH;

carrier(p_width=pulley_radius,p_thick=pulley_thickness,clearance=clearance,frame=frame,axle=axle_radius);

difference(){
diff()
cube(size=[f_length+extra*2,f_width,frame], center=true)
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
bearing(wall=3,air=axle_radius/2,width=frame,sir=3);

