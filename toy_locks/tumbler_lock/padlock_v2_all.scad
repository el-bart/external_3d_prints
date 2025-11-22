for(n=[1:6])
  translate([0, (n-1)*20, 0])
    import( str("padlock_tumbler_", n, ".stl") );

translate([20, 0, -15])
  import("padlockv2_body3x_nosprings.stl");

translate([20, 24, 0])
  import("padlockv2_cap.stl");

translate([40, 10, 0])
  import("padlockv2_shackle3x.stl");

translate([-20, -20, 0])
  import("padlockv2_spacer.stl");

for(n=[0:2])
  translate([-30, n*10, 0])
    import("padlockv2_spring.stl");
