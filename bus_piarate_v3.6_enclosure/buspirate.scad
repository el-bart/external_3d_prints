include <detail/util.scad>

mil = 25.4/1000;

// DP6037 dimensions (mm)
w = 60;
h = 37;
corner_r = 4;
hole_ofs = 4;
hole_r = 3.2/2;

pcb_thk = 1.6;


// Connectors and LEDs
// TODO: Currently hardcoded in lid module

// Fasteners
nut_d = 6.1 + 0.5;  // M3
nut_h = 2.25;  // M3 (normal: 2.25mm; jam nut: 1.8mm)
screw_d = 5.55 + 0.15;  // M3 cap
screw_h = 2.9 + 0.2;  // M3 cap

// Case parameters
thk = 2.1;
standoff_h = 1.5;
standoff_thk = thk;
top_h = 6;
slack = 0.5;
hole_slack = 0.2;

module usb_mini_inner_profile() {
  // TODO: fix 3.1*{0.6,0.4}
  polygon([[-6.9/2, 3.1], [6.9/2, 3.1],
           [6.9/2, 3.1*0.6], [5.87/2, 3.1*0.4], [5.87/2, 0],
           [-5.87/2, 0], [-5.87/2, 3.1*0.4], [-6.9/2, 3.1*0.6]]);
}

usb_mini_thick = 0.5;
usb_mini_ih = 3.1;

module usb_mini_profile(h, ext=0) {
  translate([0, usb_mini_thick+ext, 0])
    linear_extrude(height=h) minkowski() {
      usb_mini_inner_profile();
      circle(r = usb_mini_thick+ext, $fn=18);
    }
}


module case() {
  d = standoff_h + pcb_thk + top_h;
  difference() {
    union() {
      // Main shell
      difference() {
        translate([0, 0, -thk]) 
          roundedCube4([w + 2*slack + 2*thk, 
                        h + 2*slack + 2*thk, 
                        d + thk],
                       r = corner_r + thk, 
                       center = [true, true, false], 
                       $fn=36);
        roundedCube4([w + 2*slack, h + 2*slack, d+1], 
                     r = corner_r, 
                     center = [true, true, false], 
                     $fn=36);
      }
      // Standoffs
      for (i = [-1,+1], j=[-1,+1]) 
        translate([i*(w/2-hole_ofs), j*(h/2-hole_ofs), -thk])
          cylinder(r = hole_r + hole_slack + standoff_thk, 
                   h = thk + standoff_h, $fn=27);
    }
    // Standoff holes
    for (i = [-1,+1], j=[-1,+1]) 
      translate([i*(w/2-hole_ofs), j*(h/2-hole_ofs), -thk-1]) { 
        cylinder(r = hole_r + hole_slack, 
                 h = thk + standoff_h + 2, $fn=27);
        cylinder(r = nut_d/2 + hole_slack, h = 1 + nut_h, $fn=6);
      }
    // Mini-USB
    translate([-w/2-slack+1, 0, standoff_h + pcb_thk]) rotate([90, 0, -90]) usb_mini_profile(thk+2, ext = hole_slack);
  }
}

module lid() {
  difference() {
    union() {
      roundedCube4([w + 2*slack + 2*thk, 
                    h + 2*slack + 2*thk, 
                    thk], 
                   r = corner_r + thk,
                   center = [true, true, false],
                   $fn=36);
      // Standoffs
      for (i = [-1,+1], j=[-1,+1]) 
        translate([i*(w/2-hole_ofs), j*(h/2-hole_ofs), 0])
          cylinder(r = hole_r + hole_slack + standoff_thk, 
                   h = thk + top_h, $fn=27);

    }
    // Standoff holes
    for (i = [-1,+1], j=[-1,+1]) 
      translate([i*(w/2-hole_ofs), j*(h/2-hole_ofs), -1]) { 
        cylinder(r = hole_r + hole_slack, 
                 h = thk + top_h + 2, $fn=27);
        cylinder(r = screw_d/2 + hole_slack, h = 1 + screw_h, $fn=27);
      }
    // ICSP header hole (center is 3.5mm from board edge)
    translate([0,  -h/2 + 3.5, -1]) 
      roundedCube4([500*mil + 2*hole_slack, 
                    100*mil + 2*hole_slack, 
                    thk + 2],
                   r = 20*mil,
                   center = [true, true, false],
                   $fn = 18);
    // Main header hole (center is 8.5mm from board edge)
    translate([-w/2 + 8.5,  0, -1]) 
      roundedCube4([350*mil + 2*hole_slack, 
                    800*mil + 2*hole_slack, 
                    thk + 2],
                   r = 10*mil,
                   center = [true, true, false],
                   $fn = 18);
    // LED holes (0805 chip, 2.5mm from top edge, spaced 10mm)
    for (i = [-3, -1, +1, +3]) 
      translate([i*10/2, h/2 - 2.5, -1])
        roundedCube4([80*mil + 2*hole_slack,
                      50*mil + 2*hole_slack,
                      thk+2],
                     r = 10*mil,
                     center = [true, true, false], $fn=18);
  }
}

echo("M3 cap screw length: ", thk + standoff_h + pcb_thk + top_h + thk - screw_h);

translate([0, h/2 + 5, thk]) case();
translate([0, -h/2 - 5, 0]) lid();