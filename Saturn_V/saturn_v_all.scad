use <stage_1.scad>
use <stage_2.scad>
use <stage_3.scad>
use <stage_4.scad>
use <top_stage_4_child_protective_ball.scad>

translate([0, 0, 0])
  stage_1();
translate([50, 50, 0])
  stage_2();
translate([-60, -50, 0])
  stage_3();
translate([-50, 50, 0])
  stage_4();
translate([30, -30, 0])
  protective_ball();
