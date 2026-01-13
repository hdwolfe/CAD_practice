// Units: millimeters
$fn = 128;  // smoothness

// Overall dimensions mm
total_length = 105.063;  //1062px in image3, 536 in image 2
cone_length  = 1.9601;
body_length  = total_length - cone_length;

// Diameters at key points mm
base_diameter   = 20.581;
2_diameter  = 19.984;
3_diameter  = 17.445;
4_diameter  = 23.051;
5_diameter  = 21.169;
6_diameter  = 20.581;
7_diameter  = 20.777;
8_diameter  = 19.405;
9_diameter  = 20.385;
10_diameter = 20.189;
11_diameter = 20.777;
12_diameter = 19.797;
13_diameter = 16.073;
14_diameter = 15.877;
15_diameter = 16.073;
upper_diameter  = 10.781;
tip_radius = 5.3905;   // bluntness of the tip (mm)
tip_overlap = 6.2;  // ensures clean union

// Profile definition (radius vs height) mm
profile = [
    [0,0],
    [base_diameter/2, 0],
    [base_diameter/2, 1.960],
    [2_diameter/2, 2.215],
    [3_diameter/2, 2.548],
    [3_diameter/2, 4.508],
    [4_diameter/2, 6.826],
    [4_diameter/2, 10.781],
    [5_diameter/2, 11.369],
    [5_diameter/2, 30.186],
    [6_diameter/2, 30.774],
    [6_diameter/2, 32.734],
    [7_diameter/2, 32.930],
    [7_diameter/2, 37.046],
    [8_diameter/2, 37.438],
    [8_diameter/2, 38.811],
    [9_diameter/2, 39.595],
    [9_diameter/2, 41.947],
    [10_diameter/2, 42.339],
    [11_diameter/2, 42.731],
    [11_diameter/2, 44.299],
    [12_diameter/2, 45.475],
    [12_diameter/2, 73.505],
    [13_diameter/2, 86.834],
    [14_diameter/2, 87.030],
    [15_diameter/2, 87.226],
    [upper_diameter/2, body_length],
    [0,body_length]
];

// Revolve profile around Z axis
union() {
    rotate_extrude(convexity=10)
        polygon(profile);

        translate([0, 0, body_length + tip_radius - tip_overlap])
        sphere(r = tip_radius, $fn = 128);
}
