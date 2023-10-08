include <BOSL2/std.scad>

//constants
//belt=8; //belt width
//w = 3; //race wall thickness
//pulley = 40; //D of pulley
//axle = 5;    //d of shaft
//spoke = 3;   //d of spokes
//numSpokes = 6;
//hub_D = 10;

//TODO: I think the onion ring needs to be taller

//pulley(pulley,belt,axle,hub_D,w,spoke,numSpokes);

module pulley(pulley_D,belt_width,axle_D,hub_D,w,spoke_D,numSpokes){
union(){
//create spokes__________________________________
sdmaj = pulley_D/2-hub_D/2;
zrot_copies(n=numSpokes)
translate([sdmaj/2+(hub_D)/2-w/2,0,0])
onion_ring(sdmaj,spoke_D,(belt_width+2*w)/2,w);
//end create spokes

//create rim of the pulley_______________________
path = arc(angle=[0,180], d=belt_width+w,$fn=25);
circ = circle(d=w,$fn=10);
rotate_extrude(){
//create the diameter of the pulley
translate([pulley_D/2-w,0,0])
//end create pulley rim 

//turn the 3D model of the belt channel back into a 2D shape
translate([belt_width/2+w,0,0])
rotate([0,0,90])
projection(cut = true)
union(){
    path_sweep(circ,path,caps=true);
    xcopies(belt_width+w) sphere(d=w,$fn=10);
}
}//end create pulley rim

//create axle pass through______________________
down((belt_width+2*w)/4)
difference(){
    cylinder(h=(belt_width+2*w)/2, d=hub_D,center=true);
    cylinder(h=(belt_width+2*w)/2, d=axle_D,center=true);
} //end axle pass through
} //end union 
}

module onion_ring(d,w,h,race_wall_thickness){
//up(race_wall_thickness/2)
union(){
           
torus(d_maj = d-w, d_min = w,$fn=25);

rotate([0,0,7])
down(h/2)
difference(){
   cylinder(d=d, h=h,center=true,$fn=25);
   cylinder(d=d-2*w, h=h,center=true,$fn=25);
}
}
}//end spoke module
