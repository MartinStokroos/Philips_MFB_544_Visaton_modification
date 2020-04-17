// Quick-and-dirty sketch for a plastic spacer to mount the Visaton G50FFL Squawker in the Philips 22RH544 MFB loudspeaker box. 

do = 134.0; // diameter AD0211
di = 106.0;
mnt_rad = 126/2;
thickness = 5.0;
d_screw = 4.0;

difference() {
	cylinder(d=do, h=thickness, center=false,$fn=200);
    cylinder(d=di, h=12.0, center=true,$fn=200);
    
    // mounting holes
    translate([sqrt(pow(mnt_rad,2)/2), sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw, h=12.0, center=true,$fn=200);
    translate([-sqrt(pow(mnt_rad,2)/2), sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw, h=12.0, center=true,$fn=200);
    translate([sqrt(pow(mnt_rad,2)/2), -sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw, h=12.0, center=true,$fn=200);
    translate([-sqrt(pow(mnt_rad,2)/2), -sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw, h=12.0, center=true,$fn=200);
    
    // gaps
    translate([24.0, 43.0 ,0]) cylinder(d=20.0, h=12.0, center=true,$fn=200);
    translate([-24.0, -43.0 ,0]) cylinder(d=20.0, h=12.0, center=true,$fn=200);
}
