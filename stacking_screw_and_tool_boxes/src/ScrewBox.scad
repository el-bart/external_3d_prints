boxLen=200;
boxWid=100;
boxHgt=30;
boxThick=1.6;
numSections=4;
dividerCount=numSections-3;
straightSide=false;

slopeSections=4;

rotate([0,0,90])
  screwBox();

module screwBox() {
  difference() {
    // outerbox
    translate([0,0,boxHgt/2])
      cube([boxLen,boxWid,boxHgt],center=true);
    if (straightSide) {
      // innerbox
      translate([0,0,0.1+(boxHgt/2+boxThick/2)])
        cube([boxLen-boxThick*2,boxWid-boxThick*2,boxHgt-boxThick+0.1],center=true);
    } else {
      // innerbox
      translate([0,0-boxHgt/2,0.1+(boxHgt/2+boxThick/2)])
        cube([boxLen-boxThick*2,boxWid-boxHgt-boxThick*2,boxHgt-boxThick+0.1],center=true);
      // slope
      translate([0,boxWid/2-boxHgt-boxThick,boxHgt+boxThick])
        rotate([0,90,0])cylinder(boxLen-boxThick*2,boxHgt,boxHgt,center=true,$fn=slopeSections);
    }
  }
  // dividers
  for (sep=[1:dividerCount]) {
    translate([(boxLen-boxThick)/2-sep*(boxLen-boxThick)/numSections,0,boxHgt/2])
      cube([boxThick,boxWid,boxHgt],center=true);
  }
  // rim
  rotate([180,0,0])union() {
    translate([0,0,0-boxHgt])difference() {
      cube([boxLen+boxThick*2+0.8,boxWid+boxThick*2+0.8,boxThick*2],center=true);
      cube([boxLen,boxWid,boxThick*2+1],center=true);
      // extra cut out for stacking
      translate([0,0,0-boxThick/2-0.1])cube([boxLen+0.8,boxWid+0.8,boxThick],center=true);
      // 45 degree support for outer edge
      translate([0,boxWid/2+boxThick*1.05,boxThick*0.7071])
        rotate([45,0,0])cube([boxLen+boxThick*2+1,boxThick,boxThick*2],center=true);
      translate([0,0-(boxWid/2+boxThick*1.05),boxThick*0.7071])
        rotate([-45,0,0])cube([boxLen+boxThick*2+1,boxThick,boxThick*2],center=true);
      translate([boxLen/2+boxThick*1.05,0,boxThick*0.7071])
        rotate([0,-45,0])cube([boxThick,boxWid+boxThick*2+1,boxThick*2],center=true);
      translate([0-(boxLen/2+boxThick*1.05),0,boxThick*0.7071])
        rotate([0,45,0])cube([boxThick,boxWid+boxThick*2+1,boxThick*2],center=true);
    }
  }
}
