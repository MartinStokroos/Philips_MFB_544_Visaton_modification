// Quick-and-dirty sketch of a capacitor stand for the Philips 22RH544 MFB loudspeaker box. 

h = 79.6;
dc1=40.6; //diam. old 4700uF
dc2=35.6; //diam. new 4700uF
dc3=13.1; //diam. new 680uF
dc4=22.2; //diam. old 680uF
// All inner-diameters are oversized to compensate for the schrinkage.

difference() {
    union() {
        translate([dc1/2,0,0]) cylinder(d=dc1, h-10, center=false,$fn=150);
        translate([-dc1/2,0,0]) cylinder(d=dc1, h-10, center=false,$fn=150);
        translate([-dc1/2,-20.3,0])cube([dc1,dc1,h-10], center=false);
        translate([0,20,0]) cylinder(d=dc4, 50, center=false,$fn=200);
    }
            
    translate([dc1/2,-3,(h-41)]) cylinder(d=dc2, 41, center=false,$fn=150);
    translate([-dc1/2,-3,(h-41)]) cylinder(d=dc2, 41, center=false,$fn=150);
    translate([0,17,(h-35.5)])cylinder(d=dc3, 35.5, center=false,$fn=150);
            
    translate([-dc1,-28,h/2-1]) cube([2*dc1,20,h/2], center=false);   
    }
