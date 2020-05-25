// Apollo spacecraft

//ascent();
//rotate([180,0,45])descent();
//command();
//service();
//serviceRing();
//pinpeg();
//assembly();
plate();
*%translate([0,0,75])cube([220,140,150],center=true);


s=0.38;
w=13*12+10;// (inches)
w1=12*12+3;
h=5*12+8.86;
h1=4*12+10.3-1*12-6.48;
phi=20;
leg=(h+4*12+10.3)/cos(phi);
pd=7;// pin diameter (mm)
ph=15;// pin height
$fs=0.5;

module plate(){
translate([-40,-33,0])ascent();
translate([30,-25,0])rotate([180,0,45])descent();
translate([30,35,0])command();
translate([30,35,0])serviceRing();
translate([-40,33,0])service();
for(i=[0:3])translate([65,i*30-45,0])pinpeg();
}

module assembly(){
ascent();
descent();
translate([0,0,43.8])command();
translate([0,0,(4.5+116-28+77*0.3)*s+43.8])service();
translate([0,0,(4.5+116-28+77*0.3-20)*s+43.8])serviceRing();
}

module ascent(){
difference(){
	union(){
		scale(20)translate([0,0,-2.43])import("lunarAscent.stl",convexity=4);
		translate([0.1,27.8,10])cube(size=[32,1,20],center=true);
	}
	translate([0,0,-1])cube(size=[100,100,2],center=true);
	translate([w/4*s,0,0])pinhole();
	translate([-w/4*s,0,0])pinhole($fn=30);
	difference(){
		cylinder(r=7,h=10,center=true);
		translate([0,0,-2])scale([1,1,1.5])sphere(r=6);
	}
	translate([0,0,-2])scale([1,1,1.5])sphere(r=5.5);// nozzle
	translate([0,0,4])cylinder(r1=0,r2=2,h=3);
	translate([0,0,43.8])rotate([180,0,0])pinhole(fixed=true);
}}

module descent(){
scale(s)
difference(){
	union(){
		translate([0,0,-h/2])
		intersection(){
			cube(size=[w,w,h],center=true);
			rotate([0,0,45])cube(size=[w1,w1,2*h],center=true);
		}
		translate([0,0,-h-40])scale([1,1,2])sphere(r=36,$fn=50);// nozzle
		for(i=[1:4])rotate([0,0,90*i]){
			translate([0,w1/sqrt(2)-5,-1.8])rotate([180+phi,0,0])cylinder(r=5,h=leg,$fn=8);// leg
			translate([0,w1/sqrt(2)+leg*sin(phi)-5,-leg*cos(phi)-4])cylinder(r1=10,r2=0,h=10);
			translate([0,0,-h])difference(){
				linear_extrude(height=4)
					polygon(points=[[22,80],[-22,80],[-3,125],[3,125]],paths=[[0,1,2,3]]);
				translate([0,0,-1])scale(0.9)linear_extrude(height=9)
					polygon(points=[[22,80],[-22,80],[0,132]],paths=[[0,1,2]]);
			}
		}
		translate([0,0,-2])rotate([0,0,45])difference(){
			cube(size=[w1,w1,4],center=true);
			cube(size=[w1-8,w1-8,6],center=true);
		}
	}
	translate([0,0,-h-40])scale([1,1,2])sphere(r=35,$fn=50);
	translate([0,0,36*2-h-40-15])cylinder(r1=1,r2=8,h=20);
	translate([0,0,-50-h-h1])cube(size=100,center=true);
	translate([w/4,0,0])scale(1/s)rotate([180,0,0])pinhole();
	translate([-w/4,0,0])scale(1/s)rotate([180,0,0])pinhole();
}}

module command(){
scale(s)
translate([0,0,4.5+116-28])rotate([180,0,0])
difference(){
	union(){
		scale([1,1,0.3])sphere(r=77,$fn=80);
		translate([0,0,4.5])cylinder(r1=75.5,r2=0,h=116,$fn=80);
	}
	translate([0,0,50+4.5+116-28])cube(size=100,center=true);
	translate([0,0,4.5+116-28])scale(1/s)rotate([180,0,0])pinhole(fixed=true);
	translate([0,0,-77*0.3])scale(1/s)pinhole(fixed=true);
}}

module service(){
scale(s)
translate([0,0,162])rotate([180,0,0])
difference(){
	union(){
		cylinder(r=77,h=162-14,$fn=80);
		translate([0,0,162-10])cylinder(r=76,h=20,center=true,$fn=15);
		translate([0,0,162-14.1])intersection(){
			cylinder(r1=80,r2=76,h=4,$fn=15);
			cylinder(r=77,h=4,$fn=80);
		}
		translate([0,0,-210])scale([1,1,4])sphere(r=55,$fn=80);
	}
	translate([0,0,-200-117])cube(size=400,center=true);
	translate([0,0,-210])scale([1,1,4])sphere(r=54,$fn=80);
	translate([0,0,-10])cylinder(r1=0,r2=10,h=20);
	translate([0,0,162])scale(1/s)rotate([180,0,0])pinhole(fixed=true);
}}

module serviceRing()
scale(s)difference(){
	cylinder(r=77,h=30,$fn=80);
	cylinder(r=76,h=70,center=true,$fn=80);
}

// Parametric Snap Pins (http://www.thingiverse.com/thing:213310)

module pin(r=3.5,l=13,d=2.4,slot=10,nub=0.4,t=1.8,space=0.3,flat=1)
translate(flat*[0,0,r/sqrt(2)-space])rotate((1-flat)*[90,0,0])
difference(){
	rotate([-90,0,0])intersection(){
		union(){
			translate([0,0,-0.01])cylinder(r=r-space,h=l-r-0.98);
			translate([0,0,l-r-1])cylinder(r1=r-space,r2=0,h=r-space/2+1);
			translate([nub+space,0,d])nub(r-space,nub+space);
			translate([-nub-space,0,d])nub(r-space,nub+space);
		}
		cube([3*r,r*sqrt(2)-2*space,2*l+3*r],center=true);
	}
	translate([0,d,0])cube([2*(r-t-space),slot,2*r],center=true);
	translate([0,d-slot/2,0])cylinder(r=r-t-space,h=2*r,center=true,$fn=12);
	translate([0,d+slot/2,0])cylinder(r=r-t-space,h=2*r,center=true,$fn=12);
}

module nub(r,nub)
union(){
	translate([0,0,-nub-0.5])cylinder(r1=r-nub,r2=r,h=nub);
	cylinder(r=r,h=1.02,center=true);
	translate([0,0,0.5])cylinder(r1=r,r2=r-nub,h=5);
}

module pinhole(r=3.5,l=13,d=2.5,nub=0.4,fixed=false,fins=true)
intersection(){
	union(){
		translate([0,0,-0.1])cylinder(r=r,h=l-r+0.1);
		translate([0,0,l-r-0.01])cylinder(r1=r,r2=0,h=r);
		translate([0,0,d])nub(r+nub,nub);
		if(fins)translate([0,0,l-r]){
			cube([2*r,0.01,2*r],center=true);
			cube([0.01,2*r,2*r],center=true);
		}
	}
	if(fixed)cube([3*r,r*sqrt(2),2*l+3*r],center=true);
}

module pinpeg(r=3.5,l=13,d=2.4,nub=0.4,t=1.8,space=0.3)
union(){
	pin(r=r,l=l,d=d,nub=nub,t=t,space=space,flat=1);
	mirror([0,1,0])pin(r=r,l=l,d=d,nub=nub,t=t,space=space,flat=1);
}