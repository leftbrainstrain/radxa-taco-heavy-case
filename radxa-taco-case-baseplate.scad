
include <radxa-taco-v1.3.20220711.scad>;
include <radxa-taco-case-variables.scad>;
include <radxa-taco-case-base.scad>;

margin = 0.1;

module radxa_taco_baseplate() {
    difference() {
        union() {
            // outer surface
            translate([0,0,0])
            linear_extrude(height=supportTopHeight-plateBoardClearance) {
                color("DarkGray")
                translate([boardCornerRadius,boardCornerRadius]) {
                    minkowski() {
                            square([boardWidth-boardCornerRadius*2+4.0
                                ,boardLength-boardCornerRadius*2]);
                        circle(r=boardCornerRadius,$fn=36);
                    };
                };
            };
            
            translate([0,0,-plateBoardClearance+tinyLittleSmidgeon])
            linear_extrude(height=plateBoardClearance+tinyLittleSmidgeon*2) {
                difference() {
                    translate([boardCornerRadius,boardCornerRadius]) {
                        minkowski() {
                                square([boardWidth-boardCornerRadius*2+4.0
                                    ,boardLength-boardCornerRadius*2]);
                            circle(r=boardCornerRadius,$fn=36);
                        };
                    };
                    translate([boardCornerRadius+caseLateralThickness
                            ,boardCornerRadius+caseLateralThickness]) {
                        minkowski() {
                                square([boardWidth-boardCornerRadius*2-caseLateralThickness*2+4.0
                                    ,boardLength-boardCornerRadius*2-caseLateralThickness*2]);
                            circle(r=boardCornerRadius,$fn=36);
                        };
                    };
                    translate([boardWidth-tinyLittleSmidgeon,2.90-margin]) {
                        square([4+tinyLittleSmidgeon*2,39.2]);
                    };
                    translate([boardWidth-tinyLittleSmidgeon,57.10-margin]) {
                        square([4+tinyLittleSmidgeon*2,15]);
                    };
                    translate([18.7,boardLength-caseLateralThickness-tinyLittleSmidgeon]) {
                        square([71,caseLateralThickness+tinyLittleSmidgeon*2]);
                    };
                    translate([22.73,0-tinyLittleSmidgeon]) {
                        square([13.98,caseLateralThickness+tinyLittleSmidgeon*2]);
                    };
                    translate([52.73,0-tinyLittleSmidgeon]) {
                        square([23.00,caseLateralThickness+tinyLittleSmidgeon*2]);
                    };
                };
            };
        };

        // screw holes to attach to board
        translate([boardWidth
            ,0.0
            ,2.0])
        rotate([0,180,0])
        union() {
            translate([8.7+m25standHoleRadius,23.05+m25standHoleRadius,-2.0])
                cylinder(h=3.001,d=m25screwHeadDiameter,$fn=16);
            translate([93.50+m25standHoleRadius,23.00+m25standHoleRadius,-2.0])
                cylinder(h=3.001,d=m25screwHeadDiameter,$fn=16);
            translate([108.40+m25standHoleRadius,79.92+m25standHoleRadius,-2.0])
                cylinder(h=3.001,d=m25screwHeadDiameter,$fn=16);
            translate([1.60+m25standHoleRadius,79.99+m25standHoleRadius,-2.0])
                cylinder(h=3.001,d=m25screwHeadDiameter,$fn=16);

            // holes to attach standoffs to case
            translate([8.7+m25standHoleRadius,23.05+m25standHoleRadius,1.0])
                cylinder(h=1.001,r1=m25screwHeadRadius,r2=m25standHoleRadius,$fn=16);
            translate([93.50+m25standHoleRadius,23.00+m25standHoleRadius,1.0])
                cylinder(h=1.001,r1=m25screwHeadRadius,r2=m25standHoleRadius,$fn=16);
            translate([108.40+m25standHoleRadius,79.92+m25standHoleRadius,1.0])
                cylinder(h=1.001,r1=m25screwHeadRadius,r2=m25standHoleRadius,$fn=16);
            translate([1.60+m25standHoleRadius,79.99+m25standHoleRadius,1.0])
                cylinder(h=1.001,r1=m25screwHeadRadius,r2=m25standHoleRadius,$fn=16);
        };
        
        // board with ports and standoffs
        translate([boardWidth
            ,0.0
            ,-plateBoardClearance])
        rotate([0,180,0])
        union() {
            //radxa_taco_board();

            // RTL8125B
            // 5.6mm w
            // 5.6mm l
            // 1.3mm h
            // right side is 54.4mm from left side of board
            // 54.4-5.6 = 48.8
            // further edge is 38.8mm from nearer edge
            // 38.8-5.6 = 33.2
            //translate([48.8-(margin*2),32.75+(margin*2),-10.0])
            //    color("Black")
            //        cube([5.6+(margin*4),5.6+(margin*4),10.0]);
            
            // heat sink for RTL8125B (8.7 x 8.7 x 5)
            translate([46.0-(margin*2),31.0-(margin*2),-10.0])
                color("Black")
                    cube([10.7+(margin*4),10.7+(margin*4),10.0]);

            // ASM1806
            // 9.4mm w
            // 9.4mm l
            // 0.9mm h
            // right side is 47.0mm from left side of board
            // 47.0-9.4 = 37.6
            // further side is 76.2mm from nearer side of board
            // 76.2-9.4 = 66.8
            //translate([37.45-(margin*2),66.87-(margin*2),-5])
            //    color("Black")
            //        cube([9.4+(margin*4),9.4+(margin*4),5]);
            
            // ASM1806 heat sink (12x12x3)
            translate([36,64,-5])
                color("Black")
                    cube([16.0,16.0,5.0]);

            // JMB585
            // 8.7mm w
            // 8.7mm l
            // 1.1mm h
            // right side is 80.6mm from left side of board
            // 80.6-8.7 = 71.9
            // nearer side is 77.5mm from nearer side of board
            // 77.5-8.7 = 68.8
            //translate([72.3-(margin*2),68.6-(margin*2),-10.0])
            //    color("Black")
            //        cube([8.7+(margin*4),8.7+(margin*4),10.0]);
            //translate([71.4-(margin*2),68.3-(margin*2),-10.0])
            //    color("Black")
            //        cube([9.0+(margin*4),9.0+(margin*4),10.0]);
            
            // JMB585 heat sink (12x12x3)
            translate([68,65,-5])
                color("Black")
                    cube([16.0,16.0,5.0]);

            // transformer near SATA5
            // 6.5mm w
            // 6.5mm l
            // 2.8mm h
            // 7.7mm from left side of board
            //   7.7-6.5 = 1.2
            // further side is 65.4mm from nearer side of board
            //   65.4-6.5 = 58.9
            //translate([1.1-(margin*2),58.6-(margin*2),-2.8-margin-1])
            //    color("Gray")
            //        cube([6.5+(margin*4),6.5+(margin*4),2.8+(margin*2)+2]);
            translate([0.2-(margin*2),58.5-(margin*2),-2.8-margin-1])
                color("Gray")
                    cube([8.0+(margin*4),8.0+(margin*2),2.8+(margin*2)+2]);

            // transformer near SATA2
            // 4.9mm w
            // 4.9mm l
            // 2.8mm h
            // right side is 93.1mm from left side of board
            // 93.1-4.9 = 88.2
            // further side is 74.8mm from nearer side of board
            // 74.8-4.9 = 69.9
            //translate([88.7-(margin*2),69.9-(margin*2),-2.8-margin-1])
            //    color("Gray")
            //        cube([4.9+(margin*4),4.9+(margin*4),2.8+margin+2]);
            translate([88.3-(margin*2),69.2-(margin*2),-2.8-margin-1])
                color("Gray")
                    cube([5.5+(margin*4),5.5+(margin*4),2.8+margin+2]);

            // transformer near SATA2
            // 4.9mm w
            // 4.9mm l
            // 2.8mm h
            // right side is 94.3mm from left side of board
            //   94.3-4.9 = 89.4
            // further side is 47.9mm from nearer side of board
            //   47.9-4.9 = 43.0
            //translate([89.7-(margin*2),42.9-(margin*2),-2.8-1])
            //    color("Gray")
            //        cube([4.9+(margin*4),4.9+(margin*4),2.8+margin+2]);
            translate([89.4-(margin*2),42.5-(margin*2),-2.8-1])
                color("Gray")
                    cube([5.5+(margin*4),5.5+(margin*4),2.8+margin+2]);


            // unknown button opposite drive status LEDs
            // 0.069"/1.8mm wide
            // 0.048"/1.2mm long
            // right side is 1.984"/50.4mm from left side
            //   50.4-1.8 = 48.6
            // top is 0.067"/1.7mm above board
            translate([48.6,0.0,-1.7])
                color("Black")
                    cube([1.8,1.2,0.8]);

            // unknown LED opposite drive status LEDs
            // 0.071"/1.8mm wide
            // 0.067"/1.7mm long
            // 0.048"/1.2mm high
            // right side is 2.336"/59.3mm from left side
            // 59.3-1.8 = 57.5
            translate([57.5,0.0,-1.2])
                color("Yellow")
                    cube([1.8,1.7,1.2]);

            // SATA1
            // right edge is 108.0 mm from left edge
            // far edge 61.7mm from near edge
            translate([107.6-sataConnectorWidth-margin,62.0-sataConnectorLength-margin,0])
                rotate([0,180,-90])
                    cube([sataConnectorLength+0.6+(margin*2),sataConnectorWidth+(margin*2),20.0]);

            // SATA2
            // right edge is 86.9mm from left edge
            // far edge 61.7mm from near edge
            translate([86.4-sataConnectorWidth-margin,62.0-sataConnectorLength-margin,0])
                rotate([0,180,-90])
                    cube([sataConnectorLength+0.6+(margin*2),sataConnectorWidth+(margin*2),20.0]);

            // SATA3
            // right edge is 65.3mm from left edge
            // far edge 61.7mm from near edge
            translate([64.7-sataConnectorWidth-margin,62.0-sataConnectorLength-margin,0])
                rotate([0,180,-90])
                    cube([sataConnectorLength+0.6+(margin*2),sataConnectorWidth+(margin*2),20.0]);

            // SATA4
            // right edge is 44.3mm from left edge
            translate([43.4-sataConnectorWidth-margin,62.0-sataConnectorLength-margin,0])
                rotate([0,180,-90])
                    cube([sataConnectorLength+0.6+(margin*2),sataConnectorWidth+(margin*2),20.0]);

            // SATA5
            // right edge is 0.874"/22.2mm from left edge
            translate([21.7-sataConnectorWidth-margin,62.0-sataConnectorLength-margin,0])
                rotate([0,180,-90])
                    cube([sataConnectorLength+0.6+(margin*2),sataConnectorWidth+(margin*2),20.0]);

            
            // SATA 1 bottom air holes, for bottom of drive
            translate([111.8,20,-sataDriveClearance-tinyLittleSmidgeon])
            union() {
                translate([0,0,0])
                cylinder(h=sataDriveClearance,r=0.75,$fn=12);
                
                translate([0,10,0])
                cylinder(h=sataDriveClearance,r=0.75,$fn=12);
                
                translate([0,20,0])
                cylinder(h=sataDriveClearance,r=0.75,$fn=12);
                
                translate([0,30,0])
                cylinder(h=sataDriveClearance,r=0.75,$fn=12);
                
                translate([0,40,0])
                cylinder(h=sataDriveClearance,r=0.75,$fn=12);
                
                translate([0,50,0])
                cylinder(h=sataDriveClearance,r=0.75,$fn=12);
            };
            
            // SATA 1 bottom air holes
            translate([108.2-10,20,-sataDriveClearance-tinyLittleSmidgeon])
            union() {
                translate([0,0,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,10,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,20,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,30,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,40,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,50,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
            };
            
            // SATA 2 bottom air holes
            translate([87.0-10,20,-sataDriveClearance-tinyLittleSmidgeon])
            union() {
                translate([0,0,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,10,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,20,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,30,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,40,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
            };
            
            // SATA 3 bottom air holes
            translate([65.4-10,20,-sataDriveClearance-tinyLittleSmidgeon])
            union() {
                translate([0,0,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                //translate([0,10,0])
                //cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                //translate([0,20,0])
                //cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,30,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,40,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,50,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
            };
            
            // SATA 4 bottom air holes
            translate([44.1-10,20,-sataDriveClearance-tinyLittleSmidgeon])
            union() {
                translate([0,0,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,10,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,20,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,30,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,40,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
            };
            
            // SATA 5 bottom air holes
            translate([22.45-10,20,-sataDriveClearance-tinyLittleSmidgeon])
            union() {
                translate([0,0,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,10,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,20,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,30,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,40,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
                
                translate([0,50,0])
                cylinder(h=sataDriveClearance,r=1.0,$fn=12);
            };
            
            // cavity for 12V fan wires
            translate([-4.0-(margin),3.0-(margin*2),-5-margin-1]) {
                color("Gray")
                    cube([4+(margin*2),2.0+(margin*2),10]);
            };
            
        };
    };

    // supports
    translate([boardWidth
        ,0.0
        ,-plateBoardClearance])
    rotate([0,180,0])
    union() {
        
        // screw hole support
        // 0.360"/9.1mm from left side
        // 0.899"/22.8mm from nearer side
        translate([8.70+m25standHoleRadius,23.05+m25standHoleRadius,-plateBoardClearance])
        difference(){
            cylinder(h=plateBoardClearance,r=3.0,$fn=16);
            translate([0,0,-tinyLittleSmidgeon])
                cylinder(h=plateBoardClearance+(2*tinyLittleSmidgeon),r=m25standHoleRadius,$fn=16);
        };

        // screw hole support
        // 3.716"/94.4mm from left side of board
        // 0.893"/22.7mm from nearer side of board
        translate([93.50+m25standHoleRadius,23.00+m25standHoleRadius,-plateBoardClearance])
        difference(){
            cylinder(h=plateBoardClearance,r=3.0,$fn=16);
            translate([0,0,-tinyLittleSmidgeon])
                cylinder(h=plateBoardClearance+(2*tinyLittleSmidgeon),r=m25standHoleRadius,$fn=16);
        };

        // screw hole support
        // 4.274"/108.6mm from left side
        // 3.122"/79.3mm from nearer side
        translate([108.40+m25standHoleRadius,79.92+m25standHoleRadius,-plateBoardClearance])
        difference(){
            cylinder(h=plateBoardClearance,r=3.0,$fn=16);
            translate([0,0,-tinyLittleSmidgeon])
                cylinder(h=plateBoardClearance+(2*tinyLittleSmidgeon),r=m25standHoleRadius,$fn=16);
        };

        // screw hole support
        // 0.082"/2.1mm from left side
        // 3.130"/79.5mm from near side
        translate([1.60+m25standHoleRadius,79.99+m25standHoleRadius,-plateBoardClearance])
        difference(){
            cylinder(h=plateBoardClearance,r=3.0,$fn=16);
            translate([0,0,-tinyLittleSmidgeon])
                cylinder(h=plateBoardClearance+(2*tinyLittleSmidgeon),r=m25standHoleRadius,$fn=16);
        };
        
        // 4-pin power connector edge
        translate([0,1,-plateBoardClearance])
            cube([1,9,plateBoardClearance]);
        
        translate([0,12.5,-plateBoardClearance])
            cube([1,12.5,plateBoardClearance]);
        
        translate([-4,42,-plateBoardClearance]) {
            cube([5,15,plateBoardClearance]);
        };
        
        translate([-4,72,-plateBoardClearance]) {
            cube([5,11,plateBoardClearance]);
        };
    };
};


translate([boardWidth,0,-2.75])
rotate([0,180,0])
union() {
    //radxa_taco_board();
    //radxa_taco_stands();
    //radxa_taco_drives();
};

//radxa_taco_baseplate();

/*
translate([-caseLateralThickness,-caseLateralThickness,-22.8-boardHeight+margin]) {
    radxa_taco_base();
};
*/
