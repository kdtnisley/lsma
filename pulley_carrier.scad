include <BOSL2/std.scad>
include <bearing.scad>


//p_width = 4*INCH; //pulley diameter
//p_thick = 0.5*INCH; //pulley thickness
//
//clearance = 5; //mm clearance between pulley and carriage
//
//h_width = p_width + clearance;
//h_thick = p_thick + clearance;
//
//frame = 10; //mm
//
//f_width = h_width + 2*frame;
//f_length = h_thick + 2*frame;
//
//axle = 12;

module carrier(p_width=50,p_thick=10,clearance=5,frame=10,axle=12)
{
h_width = p_width + clearance*2;
h_thick = p_thick + clearance;

f_width = h_width + 2*frame;
f_length = h_thick + 2*frame;

difference(){
diff()
cube(size=[f_length,f_width,frame], center=true)
    edge_mask([FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT])
        #rounding_edge_mask(l=$parent_size.z+0.01, r=5);

diff()
cube(size=[h_thick,h_width,frame], center=true)
    edge_mask([FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT])
        #rounding_edge_mask(l=$parent_size.z+0.01, r=5);
}     

translate([h_thick/2+frame/2,0,frame/2])
rotate([0,0,90])
bearing(wall=3,air=axle/2,width=frame,sir=3);

translate([-(h_thick/2+frame/2),0,frame/2])
rotate([0,0,90])
bearing(wall=3,air=axle/2,width=frame,sir=3);

}