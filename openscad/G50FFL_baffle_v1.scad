// Quick-and-dirty design sketch for a new plastic baffle for the Visaton G50FFL, which meets the form-factor of the AD0211 Squawker.
// Revision 1.2

do = 134.0; // diameter AD0211
di = 110; //cutout cabinet
thickness = 5.0; //ring

mnt_rad = 126/2;
depth = -12.0; //depth of the driver behind the baffle

d_screw1 = 4.0;
d_head1 = 7.1;

d_dome_bot = 66.67;
d_dome_top = 54.0; //53.0 in rev. 1.0
d_screw2 = 4.8;
d_head2 = 9.4; // Rev. 1.2, better fit for washer.

h_dome = 3.9; //rev. 1.0, space between suspension and rim changed from 3.8 to 3.9.
r_sphere = 123; //122 with rev. 1.0
sphere_offs = r_sphere-10.0;

difference() {
	union() {
        cylinder(d=do, h=thickness, center=false,$fn=200);
        translate([0, 0, depth]) cylinder(d=di, h=12.1, center=false,$fn=200);
    }
    
    // mounting holes
    translate([sqrt(pow(mnt_rad,2)/2), sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw1, h=12.0, center=true,$fn=200);
    translate([-sqrt(pow(mnt_rad,2)/2), sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw1, h=12.0, center=true,$fn=200);
    translate([sqrt(pow(mnt_rad,2)/2), -sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw1, h=12.0, center=true,$fn=200);
    translate([-sqrt(pow(mnt_rad,2)/2), -sqrt(pow(mnt_rad,2)/2) ,0]) cylinder(d=d_screw1, h=12.0, center=true,$fn=200);
    
    translate([sqrt(pow(mnt_rad,2)/2), sqrt(pow(mnt_rad,2)/2) ,thickness-2.0]) cylinder(d=d_head1, h=10.0, center=false,$fn=200);
    translate([-sqrt(pow(mnt_rad,2)/2), sqrt(pow(mnt_rad,2)/2) ,thickness-2.0]) cylinder(d=d_head1, h=10.0, center=false,$fn=200);
    translate([sqrt(pow(mnt_rad,2)/2), -sqrt(pow(mnt_rad,2)/2) ,thickness-2.0]) cylinder(d=d_head1, h=10.0, center=false,$fn=200);
    translate([-sqrt(pow(mnt_rad,2)/2), -sqrt(pow(mnt_rad,2)/2) ,thickness-2.0]) cylinder(d=d_head1, h=10.0, center=false,$fn=200);
    
    // dome cut out
    cylinder(d=d_dome_top, h=30, center=true,$fn=200);
    translate([0, 0, -10+depth+h_dome]) cylinder(d=d_dome_bot, h=10, center=false,$fn=200);
    translate([0, 0, sphere_offs]) sphere(r_sphere, $fn=300);
    
    //G50FFL holes
    translate([40, 0, 0]) cylinder(d=d_screw2, h=30.0, center=true,$fn=200);
    translate([0, 40, 0]) cylinder(d=d_screw2, h=30.0, center=true,$fn=200);
    translate([-40, 0, 0]) cylinder(d=d_screw2, h=30.0, center=true,$fn=200);
    translate([0, -40, 0]) cylinder(d=d_screw2, h=30.0, center=true,$fn=200);
    
    translate([40, 0, depth+3.0]) cylinder(d=d_head2, h=30.0, center=false,$fn=200); // rev. 1.2, changed depth offset from 2.8 to 3.0
    translate([0, 40, depth+3.0]) cylinder(d=d_head2, h=30.0, center=false,$fn=200);
    translate([-40, 0, depth+3.0]) cylinder(d=d_head2, h=30.0, center=false,$fn=200);
    translate([0, -40, depth+3.0]) cylinder(d=d_head2, h=30.0, center=false,$fn=200);
}