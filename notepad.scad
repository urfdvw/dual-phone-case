include <smooth_prim.scad>

$fa = 1;
$fs = 0.4;

p7_width = 81.7;
p7_thickness = 11.1;
p7_side = 51.5;
p7_r = 5;

note_height = 105.1;
note_width = 65.2;
note_thick = 4;

pen_d = 5.5;
pen_depth = 7.8;
pen_length = 10;

thickness = 2;
large = 500;
err = 0.01;

difference() {

SmoothXYCube([
    p7_width + thickness * 2,
    p7_thickness + thickness * 2,
    note_height + thickness * 2
], p7_r + thickness);

translate([
    thickness,
    thickness,
    - large / 2
])
SmoothXYCube([
    p7_width,
    p7_thickness,
    large
], p7_r + thickness);

translate([
    0,
    p7_thickness + thickness - err,
    - large / 2
])
cube([
    large,
    large,
    large
], p7_r + thickness);

translate([
    thickness * 2,
    p7_thickness / 2 + thickness,
    - large / 2
])
cube([
    p7_width - thickness * 2,
    large,
    large
], p7_r + thickness);

}