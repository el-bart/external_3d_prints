use<detail/stage_1.scad>
use<detail/stage_2.scad>
use<detail/stage_3.scad>
use<detail/stage_4.scad>

sf = 2; // scale factor
off_d = 40*sf; // offset diameter
stages = [1,1,1,1];

if(stages[0])
  translate(off_d*[0,0,0])
    scale(sf*[1,1,1])
      stage_1();

if(stages[1])
  translate(off_d*[0,1,0])
    scale(sf*[1,1,1])
      stage_2();

if(stages[2])
  translate(off_d*[1,1,0])
    scale(sf*[1,1,1])
      stage_3();

if(stages[3])
  translate(off_d*[1,0,0])
    scale(sf*[1,1,1])
      stage_4();
