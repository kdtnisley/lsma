include <BOSL2/std.scad>

//treadle flywheel: 16 in (70 rpm)
//first step: 3
//second step: 8
//spindle driver: 3  (1000 rpm)

//drive pulley diameters
dt = 406; //flywheel
df = 76;  //first step
ds = 203;  //second step
dc = 76;  //chuck

bearingID = 5; // M8/pass through bearing
bearingOD = 15; //bearing outer diameter
bearingSD = bearingOD - 2; //dia of dust shield for bearing
bearingD = 5; //thickness of bearing
alignOD = 10; //OD of alignment shaft
screwOD = 5; //OD of woodscrew
spindleOD = 10; //axel

w = 3;

h_axis = 6*INCH; //height of center of rotating axis from plank
h_align_ax = 1*INCH; //height of center of alignment axis from plank
w_stance = 4*INCH; //center to center of attachment holes to plank
w_pulley = 15; //width of drive pulley, no clearance
