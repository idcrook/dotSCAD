include <util/sub_str.scad>;
include <util/split_str.scad>;
include <hollow_out.scad>;
include <floor_stand.scad>;
include <multi_line_text.scad>;

text = "Coder at Work";
font = "Arial Black";
font_size = 6;
line_spacing = 10;

stand_width = 40;
stand_height = 80;
stand_thickness = 4;
joint_spacing = 1;

module words(text, font, font_size, height, thickness, line_spacing) {
    half_th = thickness / 2;

    color("black")
    translate([0, -height / 1.8, thickness])
        linear_extrude(half_th / 2) {
            multi_line_text(
                split_str(text, " "),
                font = font,
                size = font_size,
                line_spacing = line_spacing,    
                valign = "center", 
                halign = "center"
            );
        }
}

floor_stand(stand_width, stand_height, stand_thickness, joint_spacing, line_spacing) 
    words(text, font, font_size, stand_height, stand_thickness, line_spacing);