include <smooth_prim.scad>

$fa = 1;
$fs = 0.4;

thickness = 2;
rim = 2.5;

large = 2000;
err = 0.01;

a5_thickness = 9.8;
a5_height = 154;
a5_width = 76.4;
a5_right_top = 32.8;
a5_right_bottom = 71.4;
a5_left_top = 43.3;
a5_left = 6.4;
a5_button_err = 2;

p7_shift = a5_width + 2 * thickness;
p7_height = 148.7 + 19.8;
p7_width = 81.7;
p7_thickness = 12.5;
p7_cam_center = 29.2;
p7_cam_width = 77.3;
p7_cam_height = 32;
p7_top = 55.4;
p7_bottom = 96.3;

clip_height = 50;
clip_width = 20;
clip_thickness = 1;

round_r = 2;


difference(){
    union() {
        translate([
            0,
            -0.5 * a5_height - thickness,
            0
        ])
        SmoothCube([
            a5_width + 2 * thickness + round_r * 2,
            a5_height + 2 * thickness,
            a5_thickness + 2 * thickness,
        ], round_r);

        translate([
            p7_shift - err,
            -0.5 * p7_height - thickness,
            0
        ])
        SmoothCube([
            p7_width + 2 * thickness,
            p7_height + 2 * thickness,
            p7_thickness + 2 * thickness,
        ], round_r);
    }
    // rim
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
    // phone
    translate([
        thickness,
        -0.5 * a5_height,
        thickness
    ])
    SmoothCube([
        large,
        a5_height,
        a5_thickness,
    ], round_r);
    // port
    translate([
        -large / 2,
        0.5 * a5_height - a5_left_top - a5_left / 2,
        thickness
    ])
    SmoothCube([
        large,
        a5_left + 2 * a5_button_err,
        a5_thickness
    ], 2);
    // rim
    translate([
        p7_shift + rim + thickness,
        -0.5 * p7_height + rim,
        thickness
    ])
    cube([
        large,
        p7_height - 2 * rim,
        large,
    ]);
    // phone
    translate([
        p7_shift + thickness,
        -0.5 * p7_height,
        thickness
    ])
    SmoothCube([
        large,
        p7_height,
        p7_thickness,
    ], round_r);
    // cam
    translate([
        p7_shift + thickness,
        - 0.5 * p7_cam_center + (
            p7_height / 2 - p7_cam_center
        ),
        - large / 2
    ])
    SmoothCube([
        large,
        p7_cam_height,
        large,
    ], 2);
}

translate([
    a5_width + thickness - clip_width / 2,
    -clip_height / 2,
    thickness,
])
scale([
    clip_width / 2 / clip_thickness,
    1,
    1
])
rotate([-90, 0, 0])
cylinder(r=clip_thickness, h=clip_height);


translate([
    p7_shift + p7_width + thickness - clip_width / 2,
    -clip_height / 2,
    thickness,
])
scale([
    clip_width / 2 / clip_thickness,
    1,
    1
])
rotate([-90, 0, 0])
cylinder(r=clip_thickness, h=clip_height);