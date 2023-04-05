
include <radxa-taco-v1.3.20220711.scad>;
include <radxa-taco-case-variables.scad>;
include <radxa-taco-case-baseplate.scad>;

//TODO: add side vents to keep SATA2 and SATA3 cooler

//caseLateralThickness = 1.5;
caseLateralThickness = 2.0;

margin = 0.1;

module radxa_taco_shroud() {
    union() {
        difference() {

            union() {
                difference() {
                    // base outer surface
                    //linear_extrude(height=shroudBoardBottomClearance+caseVerticalThickness) {
                    linear_extrude(height=sataDriveClearance+hddWidth+7.0-0.2) {
                        color("DarkGray")
                        translate([caseCornerRadius,caseCornerRadius]) {
                            minkowski() {
                                square([boardWidth
                                            +caseLateralThickness*2
                                            -caseCornerRadius*2
                                            +(2*margin)
                                            +4
                                    ,boardLength
                                            +caseLateralThickness*2
                                            -caseCornerRadius*2
                                            +(2*margin)
                                    ]);
                                circle(r=caseCornerRadius,$fn=36);
                            };
                        };
                    };
                    
                    // base inner surface
                    //translate([caseLateralThickness,caseLateralThickness,caseVerticalThickness])
                    //linear_extrude(shroudBoardBottomClearance) {
                    translate([caseLateralThickness,caseLateralThickness,-tinyLittleSmidgeon])
                    linear_extrude(sataDriveClearance+hddWidth+7.0+tinyLittleSmidgeon*2) {
                        color("DarkGray")
                        translate([boardCornerRadius,boardCornerRadius,0]) {
                            minkowski() {
                                square([boardWidth
                                            -boardCornerRadius*2
                                            +(2*margin)
                                            +4
                                            +0.4
                                    ,boardLength
                                            -boardCornerRadius*2
                                            +(2*margin)
                                            +0.4
                                ]);
                                circle(r=boardCornerRadius,$fn=36);
                            };
                        };
                    };
                };
                
            };
            
            // board with ports and standoffs
            //translate([boardWidth+caseLateralThickness
            //    ,caseLateralThickness+0.75
            //    ,boardHeight+standoffLength+caseVerticalThickness])
            //translate([boardWidth+caseLateralThickness+(margin)
            //    ,caseLateralThickness+(margin)
            //    ,standoffLength-shroudBoardBottomClearance+margin])
            // board with ports and standoffs
            translate([boardWidth+caseLateralThickness+(margin)+0.6
                ,caseLateralThickness+(margin)
                ,5.9+margin])
            rotate([0,180,0])
            union() {
                radxa_taco_board_blank();
            };
            
            // openings for activity LEDs
            translate([49.1+caseLateralThickness
                    ,boardLength+(2*margin)+caseLateralThickness-tinyLittleSmidgeon
                    ,0]) {
                
                // space around activity LEDs
                translate([-0.5,-caseLateralThickness-tinyLittleSmidgeon+1.0,-tinyLittleSmidgeon]) {
                    cube([25,caseLateralThickness,8]);
                };
                
                translate([1.0,0,5.6]) {
                    cube([2.0,caseLateralThickness+1,1.0]);
                };
                translate([6.0,0,5.6]) {
                    cube([2.0,caseLateralThickness+1,1.0]);
                };
                translate([11.0,0,5.6]) {
                    cube([2.0,caseLateralThickness+1,1.0]);
                };
                translate([16.0,0,5.6]) {
                    cube([2.0,caseLateralThickness+1,1.0]);
                };
                translate([21.0,0,5.6]) {
                    cube([2.0,caseLateralThickness+1,1.0]);
                };
                /*
                translate([0,0,6]) {
                    cube([25,caseLateralThickness+1,2]);
                };
                */
            };
            
            // LED and button openings on RJ45/DCIN/USB side
            translate([caseLateralThickness-0.5+0.8,-tinyLittleSmidgeon,0]) {
                translate([33.5,0.0,6.2]) {
                    cube([2.0,caseLateralThickness+tinyLittleSmidgeon*2,2.6]);
                };
                translate([54.3,0.0,5.5]) {
                    cube([2.3,caseLateralThickness+tinyLittleSmidgeon*2,1.2]);
                };
                translate([61.8,0.0,5.7]) {
                    cube([4.8,caseLateralThickness+tinyLittleSmidgeon*2,2.3]);
                };
                
            };
            
            /*
            translate([-1,-1,10]) {
                cube([200,200,200]);
            };
            */
            
            /*
            translate([-1,-1,30]) {
                cube([200,200,200]);
            };
            */
            
            /*
            translate([-1,2,-1]) {
                cube([200,200,200]);
            };
            */

        };
    };
};

/*
// board with ports and standoffs
//translate([boardWidth+caseVerticalThickness,caseVerticalThickness,-2.75])
color("SlateGray")
translate([boardWidth+caseLateralThickness+margin+0.5,caseLateralThickness+margin,6.0])
rotate([0,180,0])
union() {
    //radxa_taco_board();
    color("Blue")
    radxa_taco_board_blank();
};
*/

/*
// board with ports and standoffs
//translate([boardWidth+caseVerticalThickness,caseVerticalThickness,-2.75])
translate([caseLateralThickness+margin,caseLateralThickness+margin,8.82])
union() {
    radxa_taco_baseplate();
};
*/

/*
// status LED opposite drive status LEDs
// 0.071"/1.8mm wide
// 0.067"/1.7mm long
// 0.048"/1.2mm high
// right side is 2.336"/59.3mm from left side
// 59.3-1.8 = 57.5
union() {
    translate([57.5-margin,0.0-margin,-1.2-margin]) {
        color("Yellow")
            cube([1.8+(margin*2),1.7+(margin*2),1.2+(margin*2)]);
    };
};
*/


//radxa_taco_shroud();

