//bearing for the lathe

$fn=100;

id = 32;
od = 35;
t = 38;

difference(){
   cylinder(h = t, d = od);
   cylinder(h=t, d=id);
}