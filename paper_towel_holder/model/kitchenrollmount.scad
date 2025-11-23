$fn = 200;

// mount
mx = 60;
my = 80;
mz = 6;
mm = 10;
mo = mz-1;

// fixture
fx = mx-30;
fy = my-mm-5;
fleeway = 0.2;

// magnet
mgd = 4.1;
mgl = 11;

// kitchen roll diameter
dmax = 110;
dmin = 39;
dspace = 10;   // extra space around the kitchen roll
dz = dmax/2 + dspace + mz;

translate([0,120,0]) mount_back();
mount_front();
translate([-mx,0,0]) mount_front_fixture();

module mount_back() {
    difference() {
        union() {
            handle();
            trapezoidal_prism(mx,my,mz,mo,true);
        }
        translate([mx/2,my-mm-20,1]) screw();
        translate([mx/2,mo+20,1]) screw();
    }
}

module mount_front_fixture() {
    difference() {
        translate([(mx-fx-fleeway)/2,my-fy,0]) trapezoidal_prism_panel(fx-fleeway,fy,mz,mo,true);
        translate([mx/2,my-mo-20,1]) screw();
        translate([mx/2,mm+20,1]) screw();
        translate([mx/2,my-fy,mz/2]) rotate([-90,0,0]) cylinder(h=mgl, r=mgd/2);
    }
}

module mount_front() {
    difference() {
        union() {
            translate([0,my,0]) mirror([0,1,0]) handle();
            difference() {
                translate([0,my,0]) mirror([0,1,0]) trapezoidal_prism(mx,my,mz,mo,true);
            }
        }
        translate([(mx-fx)/2,my-fy,0]) trapezoidal_prism_panel(fx,fy+5,mz,mo,true);
        // translate([mx/2,my-mo-20,1]) screw();
        // translate([mx/2,mm+20,1]) screw();
        translate([mx/2,my-fy,mz/2]) rotate([90,0,0]) cylinder(h=mgl, r=mgd/2);
    }
}

module handle() {
    translate([0,my,0]) difference() {
        rotate([90,0,0]) union() {
            hull() {
                translate([mx/2,dz,0]) cylinder(h=mm, r=dmin/2);
                translate([0,-5,0]) cube([mx,5,mm]);
            }
            translate([mx/2,dz,0]) cylinder(h=my-20, r=dmin/2);
            translate([mx/2,dz,my-20]) cylinder(h=20, r1=dmin/2, r2=dmin/2-2);
        }
        translate([-1,-mm-1,-6]) cube([mx+2,mm+2,6]);
    }
}

module screw(r0=(3.6+0.5)/2, r1=(8+1)/2, r2=14/2) {
    translate([0,0,0]) union() {
        translate([0,0,-50]) cylinder(h=100, r=r0);
        translate([0,0,0]) cylinder(h=r1-r0, r1=r0, r2=r1);
        translate([0,0,r1-r0]) cylinder(h=mz, r=r1);
        translate([0,0,r1-r0+mz]) cylinder(h=mz+100, r=r2);
    }
}
module trapezoidal_prism(x,y,z,o,front=false) {
    points = [
        [0,0,0],    // 0
        [x,0,0],   // 1
        [x,y,0],   // 2
        [0,y,0],    // 3
        [o,front?o:0,z],    // 4
        [x-o,front?o:0,z],   // 5
        [x-o,y,z],   // 6
        [o,y,z]     // 7
    ];
    faces = [
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]   // left
    ];
    polyhedron(points, faces);
}
module trapezoidal_prism_panel(x,y,z,o,front=false) {
    points = [
        [o,0,0],    // 0
        [x-o,0,0],   // 1
        [x-o,y,0],   // 2
        [o,y,0],    // 3
        [0,0,z],    // 4
        [x,0,z],   // 5
        [x,front?y-o:y,z],   // 6
        [0,front?y-o:y,z]     // 7
    ];
    faces = [
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]   // left
    ];
    polyhedron(points, faces);
}