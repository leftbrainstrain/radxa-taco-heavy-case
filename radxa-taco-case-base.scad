
include <radxa-taco-v1.3.20220711.scad>;
include <radxa-taco-case-variables.scad>;

margin = 0.1;

// TODO: increase height of base covering uSD card slot, so only base needs to be removed to remove uSD card

//color("Gray")
module radxa_taco_base() {
    difference() {

        union() {
            difference() {
                // base outer surface
                linear_extrude(height=baseBoardClearance+caseVerticalThickness) {
                    color("DarkGray")
                    translate([caseCornerRadius,caseCornerRadius]) {
                        minkowski() {
                            square([boardWidth
                                        +caseLateralThickness*2
                                        -caseCornerRadius*2
                                        +(2*margin)
                                        +4.0
                                ,boardLength
                                        +caseLateralThickness*2
                                        -caseCornerRadius*2
                                        +(2*margin)
                                ]);
                            circle(r=caseCornerRadius,$fn=36);
                        }
                    };
                };
                
                // base inner surface
                translate([caseLateralThickness,caseLateralThickness,caseVerticalThickness])
                linear_extrude(baseBoardClearance+tinyLittleSmidgeon) {
                    color("DarkGray")
                    translate([boardCornerRadius,boardCornerRadius,0]) {
                        minkowski() {
                                square([boardWidth-boardCornerRadius*2+4.0
                                    ,boardLength-boardCornerRadius*2]);
                            circle(r=boardCornerRadius,$fn=36);
                        }
                    };
                };
                
                
                // screw holes
                translate([0.0+caseLateralThickness
                    ,0.0+caseLateralThickness
                    ,0.0])
                union() {
                    
                    translate([102.63,23.27+m25standHoleRadius,-tinyLittleSmidgeon]) {
                        translate([0,0,0.0])
                            cylinder(h=0.2+tinyLittleSmidgeon,d=m25screwHeadDiameter,$fn=16);
                        translate([0,0,0.2])
                            cylinder(h=1.2+tinyLittleSmidgeon,d1=m25screwHeadDiameter,d2=m25standHoleDiameter,$fn=16);
                        translate([0,0,1.4])
                            cylinder(h=caseVerticalThickness-1.4+(2*tinyLittleSmidgeon),d=m25standHoleDiameter,$fn=16);
                    };
                    
                    translate([17.73,23.18+m25standHoleRadius,-tinyLittleSmidgeon]) {
                        translate([0,0,0.0])
                            cylinder(h=0.2+tinyLittleSmidgeon,d=m25screwHeadDiameter,$fn=16);
                        translate([0,0,0.2])
                            cylinder(h=1.2+tinyLittleSmidgeon,d1=m25screwHeadDiameter,d2=m25standHoleDiameter,$fn=16);
                        translate([0,0,1.4])
                            cylinder(h=caseVerticalThickness-1.4+(2*tinyLittleSmidgeon),d=m25standHoleDiameter,$fn=16);
                    };
                    
                    translate([3.54,80.12+m25standHoleRadius,-tinyLittleSmidgeon]) {
                        translate([0,0,0.0])
                            cylinder(h=0.2+tinyLittleSmidgeon,d=m25screwHeadDiameter,$fn=16);
                        translate([0,0,0.2])
                            cylinder(h=1.2+tinyLittleSmidgeon,d1=m25screwHeadDiameter,d2=m25standHoleDiameter,$fn=16);
                        translate([0,0,1.4])
                            cylinder(h=caseVerticalThickness-1.4+(2*tinyLittleSmidgeon),d=m25standHoleDiameter,$fn=16);
                    };
                    
                    translate([110.03,80.18+m25standHoleRadius,-tinyLittleSmidgeon]) {
                        translate([0,0,0.0])
                            cylinder(h=0.2+tinyLittleSmidgeon,d=m25screwHeadDiameter,$fn=16);
                        translate([0,0,0.2])
                            cylinder(h=1.2+tinyLittleSmidgeon,d1=m25screwHeadDiameter,d2=m25standHoleDiameter,$fn=16);
                        translate([0,0,1.4])
                            cylinder(h=caseVerticalThickness-1.4+(2*tinyLittleSmidgeon),d=m25standHoleDiameter,$fn=16);
                    };
                };
                
                
            }; // end difference
            
            /*
            difference() {
                translate([caseLateralThickness,caseLateralThickness,caseVerticalThickness])
                linear_extrude(standoffLength+boardHeight+tinyLittleSmidgeon-0.0) {
                    translate([boardCornerRadius,boardCornerRadius,0]) {
                        minkowski() {
                                square([boardWidth-cornerRadius*2+4.0
                                    ,boardLength-cornerRadius*2]);
                            circle(r=boardCornerRadius,$fn=36);
                        }
                    };
                };
                translate([caseLateralThickness*2,caseLateralThickness*2,caseVerticalThickness-tinyLittleSmidgeon])
                linear_extrude(standoffLength+boardHeight+tinyLittleSmidgeon*3) {
                    translate([boardCornerRadius,boardCornerRadius,0]) {
                        minkowski() {
                                square([boardWidth-boardCornerRadius*2-caseLateralThickness*2+0.1
                                    ,boardLength-boardCornerRadius*2-caseLateralThickness*2]);
                            circle(r=boardCornerRadius,$fn=36);
                        }
                    };
                };
                translate([boardWidth+caseLateralThickness
                    ,caseLateralThickness
                    ,boardHeight+standoffLength+caseVerticalThickness])
                rotate([0,180,0])
                union() {
                    radxa_taco_board_blank();
                    radxa_taco_stands_blank();
                };
            };
            */
            
            // SUPPORTS
            
            translate([caseLateralThickness,caseLateralThickness+54,caseVerticalThickness])
            cube([32,1.5,baseBoardClearance-3.1-margin]);
            
            translate([caseLateralThickness,caseLateralThickness+27.5,caseVerticalThickness])
            cube([32,1.5,baseBoardClearance-3.1-margin]);
            
            // on TF card edge
            translate([caseLateralThickness,caseLateralThickness+1,caseVerticalThickness])
            cube([1.5,28,standoffLength]);
            
            translate([caseLateralThickness,caseLateralThickness+54,caseVerticalThickness])
            cube([1.5,25,standoffLength]);
            
            translate([boardWidth-caseLateralThickness-20,caseLateralThickness+boardLength-1.5,caseVerticalThickness])
            cube([16,1.5,standoffLength]);
            
            // origin to DC IN
            translate([caseLateralThickness+1,caseLateralThickness,caseVerticalThickness])
            cube([4,1.5,standoffLength]);
                    
            translate([caseLateralThickness+16,caseLateralThickness,caseVerticalThickness])
            cube([7,1.5,standoffLength]);
                    
            translate([caseLateralThickness+31,caseLateralThickness,caseVerticalThickness])
            cube([5.5,1.5,standoffLength]);
                    
            translate([caseLateralThickness+52.5,caseLateralThickness,caseVerticalThickness])
            cube([3.5,1.5,standoffLength]);
                    
            translate([caseLateralThickness+71.2,caseLateralThickness,caseVerticalThickness])
            cube([3.6,1.5,standoffLength]);
            
            translate([caseLateralThickness+91.75,caseLateralThickness,caseVerticalThickness])
            cube([3.5,1.5,standoffLength]);
            
            // supports on side with 12V power pins
            difference() {
                union() {
                    
                    translate([caseLateralThickness+boardWidth-1.5,caseLateralThickness+1.5,caseVerticalThickness])
                    cube([1.5,23.5,standoffLength]);
                    
                    translate([caseLateralThickness+boardWidth,caseLateralThickness+1.5,caseVerticalThickness])
                    cube([4.0,1.5,standoffLength+boardHeight]);
                    
                    translate([caseLateralThickness+boardWidth,caseLateralThickness+23.5,caseVerticalThickness])
                    cube([4.0,1.5,standoffLength+boardHeight]);
                    
                    translate([caseLateralThickness+boardWidth-1.5,caseLateralThickness+42.0,caseVerticalThickness])
                    cube([1.5,15,standoffLength]);
                    
                    translate([caseLateralThickness+boardWidth,caseLateralThickness+42.0,caseVerticalThickness])
                    cube([4.0,1.5,standoffLength+boardHeight]);
                    
                    translate([caseLateralThickness+boardWidth,caseLateralThickness+55.50,caseVerticalThickness])
                    cube([4.0,1.5,standoffLength+boardHeight]);
                    
                    translate([caseLateralThickness+boardWidth-1.5,caseLateralThickness+72,caseVerticalThickness])
                    cube([1.5,7,standoffLength]);
                    
                    translate([caseLateralThickness+boardWidth,caseLateralThickness+72,caseVerticalThickness])
                    cube([4.0,1.5,standoffLength+boardHeight]);
                    
                    translate([caseLateralThickness+boardWidth,caseLateralThickness+77.5,caseVerticalThickness])
                    cube([4.0,1.5,standoffLength+boardHeight]);
                };
                
                translate([caseLateralThickness+boardWidth+tinyLittleSmidgeon,caseLateralThickness+boardLength,standoffLength+caseVerticalThickness+margin*3])
                rotate([90,0,0])
                resize([4,0,0])
                linear_extrude(boardLength)
                difference() {
                    square(2);
                    circle(r=2,$fn=32);
                };
            };

        };
        
        // board with ports and standoffs
        translate([boardWidth+caseLateralThickness
            ,caseLateralThickness   
            ,boardHeight+standoffLength+caseVerticalThickness])
        rotate([0,180,0])
        union() {
            radxa_taco_board_blank();
        };

        // vent holes
        // blower fan is approx 30mm wide
        // however, width of output is ~26mm
        // y-offset of heatsink fins cooled by blower direct output is 28.5mm
        // z-offset of heatsink is 3.3mm (top of heatsink, below standoff top)
        //translate([0,28.5+caseLateralThickness,3.3+caseVerticalThickness])
        translate([-tinyLittleSmidgeon,28.5+caseLateralThickness,2.74+caseVerticalThickness])
        union() {
            
            //TODO for-loop
            /*
            translate([0,0,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness,r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness,r=baseSideVentEndRadius,$fn=12);
            };
            */

            translate([0,2,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,4,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,6,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,8,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,10,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,12,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,14,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,16,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,18,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,20,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,22,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

            translate([0,24,0])
            hull() {
                translate([0,0,baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
                translate([0,0,baseSideVentLength-baseSideVentEndRadius]) 
                rotate([0,90,0]) cylinder(h=caseLateralThickness+(2*tinyLittleSmidgeon),r=baseSideVentEndRadius,$fn=12);
            };

        };
    /*
        translate([0,5,0])
            cube([120,90,50]);
    */
    };
};


// board with ports and standoffs
color("SlateGray")
translate([boardWidth+caseLateralThickness
    ,caseLateralThickness
    ,boardHeight+standoffLength+caseVerticalThickness])
rotate([0,180,0])
union() {
    //radxa_taco_board();
    //radxa_taco_board_blank();
    //radxa_taco_stands_blank();
};


/*
translate([boardWidth+caseLateralThickness,caseLateralThickness+margin,21.8+1.0])
rotate([0,180,0])
union() {

    //radxa_taco_board();
    //translate([0,0,0.0])
    //    radxa_taco_stands();
    
};
*/


//color("LightGreen")
//radxa_taco_base();

