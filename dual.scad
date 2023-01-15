$fa = 1;
$fs = 0.4;

p7_height = 148.7 + 19.8;
p7_width_top = 81.7;
p7_width_top = 82.2;
p7_thickness = 12.5;
p7_cam_center = 29.2;
p7_cam_width = 77.3;
p7_cam_height = 32;
p7_top = 55.4;
p7_bottom = 96.3;

a5_thickness = 9.8;
a5_height = 153.5;
a5_width = 76.4;
a5_right_top = 32.8;
a5_right_bottom = 71.4;
a5_left_top = 43.3;
a5_left = 6.4;
a5_button_err = 2;

a5_clip_height = 80;
a5_clip_width = 20;
a5_clip_thickness = 1;


thickness = 2;
rim = 5;

large = 2000;

difference(){
translate([
    0,
    -0.5 * a5_height - thickness,
    0
])
cube([
    a5_width + 2 * thickness,
    a5_height + 2 * thickness,
    a5_thickness + 2 * thickness,
]);

translate([
    rim + thickness,
    -0.5 * a5_height + rim,
    thickness
])
cube([
    large,
    a5_height - 2 * rim,
    large,
]);

translate([
    thickness,
    -0.5 * a5_height,
    thickness
])
cube([
    large,
    a5_height,
    a5_thickness,
]);

translate([
    -large / 2,
    0.5 * a5_height - a5_left_top - a5_left,
    thickness
])
cube([
    large,
    a5_left + 2 * a5_button_err,
    a5_thickness
]);

translate([
    -large / 2,
    0.5 * a5_height - a5_left_top - a5_left,
    thickness
])
cube([
    large,
    a5_left + 2 * a5_button_err,
    a5_thickness
]);

// cube(
//     [

//     ]
// )

}

translate([
    a5_width + thickness - a5_clip_width / 2,
    -a5_clip_height / 2,
    thickness,
])
scale([
    a5_clip_width / 2 / a5_clip_thickness,
    1,
    1
])
rotate([-90, 0, 0])
cylinder(r=a5_clip_thickness, h=a5_clip_height);