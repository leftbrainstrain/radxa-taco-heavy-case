
include <radxa-taco-v1.3.20220711.scad>;
include <radxa-taco-case-variables.scad>;
include <radxa-taco-case-baseplate.scad>;
include <radxa-taco-case-side-shroud.scad>;
include <radxa-taco-case-upper.scad>;
include <radxa-taco-case-lid.scad>;
include <radxa-taco-case-base.scad>;
include <radxa-taco-case-drive-cage.scad>;
include <radxa-taco-case-drive-tray.scad>;


translate([0,0,450])
//translate([0+0.4,0,150+2*margin])
//translate([0+0.4,0,133.7+margin*2])
{
    color("Pink")
    translate([boardWidth+caseLateralThickness+5.5,0,30])
    rotate([0,180,0]) {
        radxa_taco_lid();
    };
};


translate([0,0,410])
//translate([-margin,-margin,127.2])
{
    color("Pink")
    //translate([boardWidth+caseLateralThickness+5.5,0,30])
    //rotate([0,180,0])
    radxa_taco_upper();
};



// haven't figured out why yet, but trays in cage stick out above where expected,
//   so "+1.0" added to height
translate([caseLateralThickness,caseLateralThickness,290])
//translate([caseLateralThickness
//        ,caseLateralThickness
//        ,27.6+1.0])
{
    // SATA drive trays
    color("Yellow")
    union() {
        
        translate([5.8-driveTrayVerticalThickness-sataConnectorVerticalMargin
                ,8.2
                ,hddWidth+tinyLittleSmidgeon])
        rotate([0,90,0])
        radxa_taco_drive_tray();
        
        translate([27.2-driveTrayVerticalThickness-sataConnectorVerticalMargin
                ,8.2
                ,hddWidth+tinyLittleSmidgeon])
        rotate([0,90,0])
        radxa_taco_drive_tray();
        
        translate([48.8-driveTrayVerticalThickness-sataConnectorVerticalMargin
                ,8.2
                ,hddWidth+tinyLittleSmidgeon])
        rotate([0,90,0])
        radxa_taco_drive_tray();

        translate([70.4-driveTrayVerticalThickness-sataConnectorVerticalMargin
                ,8.2
                ,hddWidth+tinyLittleSmidgeon])
        rotate([0,90,0])
        radxa_taco_drive_tray();

        translate([92.2-driveTrayVerticalThickness-sataConnectorVerticalMargin
                ,8.2
                ,hddWidth+tinyLittleSmidgeon])
        rotate([0,90,0])
        radxa_taco_drive_tray();
    };
};



translate([0,0,170])
//translate([0-margin,0-margin,16.0])
rotate([0,0,0]) {
    color("Orange")
    radxa_taco_shroud();
};



translate([caseLateralThickness,caseLateralThickness,60]) {
//translate([caseLateralThickness,caseLateralThickness,26.2]) {
    radxa_taco_drive_cage();
};



translate([boardWidth+caseLateralThickness,caseLateralThickness,40])
//translate([boardWidth+caseLateralThickness,caseLateralThickness,21.9])
rotate([180,0,180]) {
    radxa_taco_board();
};


translate([0,0,0])
//translate([-margin,-margin,0])
rotate([0,0,0]) {
    color("LightGreen")
    radxa_taco_base();
};

