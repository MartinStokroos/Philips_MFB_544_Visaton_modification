// Quick-and-dirty sketch for a plastic spacer to mount the Visaton G20SC Tweeter to the Philips 22RH544 MFB loudspeaker box.
// Revision 2

do = 94.0;
di = 70.0;
mnt_rad1 = 82/2; //tweeter
mnt_rad2 = 87/2; //brackets
thickness = 2.0;
d_screw1 = 4.4; //tweeter
d_screw2 = 3.7; //bracket
d_head = 5.8; //screw2 head size

difference() {
	cylinder(d=do, h=thickness, center=false,$fn=200);
    cylinder(d=di, h=12.0, center=true,$fn=200);
    
    // mounting holes tweeter
    translate([sqrt(pow(mnt_rad1,2)/2), sqrt(pow(mnt_rad1,2)/2) ,0]) cylinder(d=d_screw1, h=20.0, center=true,$fn=200);
    translate([-sqrt(pow(mnt_rad1,2)/2), sqrt(pow(mnt_rad1,2)/2) ,0]) cylinder(d=d_screw1, h=20.0, center=true,$fn=200);
    translate([sqrt(pow(mnt_rad1,2)/2), -sqrt(pow(mnt_rad1,2)/2) ,0]) cylinder(d=d_screw1, h=20.0, center=true,$fn=200);
    translate([-sqrt(pow(mnt_rad1,2)/2), -sqrt(pow(mnt_rad1,2)/2) ,0]) cylinder(d=d_screw1, h=20.0, center=true,$fn=200);
    
    // gap
    translate([0.0, 23 ,0]) roundCornersCube(31,31,20,3);
}




/*
http://codeviewer.org/view/code:1b36 
Copyright (C) 2011 Sergio Vilches
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
Contact: s.vilches.e@gmail.com


    ----------------------------------------------------------- 
                 Round Corners Cube (Extruded)                
      roundCornersCube(x,y,z,r) Where:                        
         - x = Xdir width                                     
         - y = Ydir width                                     
         - z = Height of the cube                             
         - r = Rounding radious                               
                                                              
      Example: roundCornerCube(10,10,2,1);                    
     *Some times it's needed to use F6 to see good results!   
 	 ----------------------------------------------------------- 
*/

module createMeniscus(h,radius) // This module creates the shape that needs to be substracted from a cube to make its corners rounded.
difference(){        //This shape is basicly the difference between a quarter of cylinder and a cube
   translate([radius/2+0.1,radius/2+0.1,0]){
      cube([radius+0.2,radius+0.1,h+0.2],center=true);         // All that 0.x numbers are to avoid "ghost boundaries" when substracting
   }

   cylinder(h=h+0.2,r=radius,$fn = 100,center=true);
}



module roundCornersCube(x,y,z,r)  // Now we just substract the shape we have created in the four corners
difference(){
   cube([x,y,z], center=true);

translate([x/2-r,y/2-r]){  // We move to the first corner (x,y)
      rotate(0){  
         createMeniscus(z,r); // And substract the meniscus
      }
   }
   translate([-x/2+r,y/2-r]){ // To the second corner (-x,y)
      rotate(90){
         createMeniscus(z,r); // But this time we have to rotate the meniscus 90 deg
      }
   }
      translate([-x/2+r,-y/2+r]){ // ... 
      rotate(180){
         createMeniscus(z,r);
      }
   }
      translate([x/2-r,-y/2+r]){
      rotate(270){
         createMeniscus(z,r);
      }
   }
}

// Helper to create 3D text with correct font and orientation
module t(t, s = 18, style = "") {
  rotate([90, 0, 0])
    linear_extrude(height = 1)
      text(t, size = s, font = str("Liberation Sans", style), $fn = 16);
}




