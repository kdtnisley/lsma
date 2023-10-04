include <BOSL2/std.scad>
include <bearing.scad>


//TODO: clean these constants up wow
//TODO: make this a module
p_width = 4*INCH; //pulley diameter
p_thick = 0.5*INCH; //pulley thickness

clearance = 5; //mm clearance between pulley and carriage

h_width = p_width + clearance;
h_thick = p_thick + clearance;

frame = 10; //mm

f_width = h_width + 2*frame;
f_length = h_thick + 2*frame;

axle = 12;

ew = true;

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

//extra width bearing
translate([(f_length/2+INCH)-frame/2,0,frame/2])
rotate([0,0,90])
bearing(wall=3,air=axle/2,width=frame,sir=3);

//TODO: extended width
if (ew)
{
extra = 1*INCH;

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
}
//TODO: corner holes for bolting it down
//find furthest corners (use bounding box?)
//place holes
