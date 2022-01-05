include<detail/config.scad>
use<stage_1.scad>
use<stage_2.scad>
use<stage_3.scad>
use<stage_4.scad>

off_d = 75*scale_factor; // offset diameter
stages = [1,1,1,1];

if(stages[0])
  translate(off_d*[0,0,0])
    scale(scale_factor*[1,1,1])
      stage_1();

if(stages[1])
  translate(off_d*[0,1,0])
    scale(scale_factor*[1,1,1])
      stage_2();

if(stages[2])
  translate(off_d*[1,1,0])
    scale(scale_factor*[1,1,1])
      stage_3();

if(stages[3])
  translate(off_d*[1,0,0])
    scale(scale_factor*[1,1,1])
      stage_4();
