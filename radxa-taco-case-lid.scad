include <fan-5015-blower.scad>;
include <radxa-taco-case-variables.scad>;

// TODO: move fan mounts a little closer to vent

module radxa_taco_lid() {
    union() {
        difference() {
            linear_extrude(caseVerticalThickness) {
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
            
            /*
            // fan screw hole
            translate([64.1+caseLateralThickness,48.8+caseLateralThickness,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,r=2.2,$fn=16);
            }
            
            // fan screw hole
            translate([104.4+caseLateralThickness,8.5+caseLateralThickness,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,r=2.2,$fn=16);
            }
            */
            
            /*
            // fan screw hole
            translate([64.1+caseLateralThickness,46.8+caseLateralThickness,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,r=2.2,$fn=16);
            }
            
            // fan screw hole
            translate([104.4+caseLateralThickness,6.5+caseLateralThickness,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,r=2.2,$fn=16);
            }
            */
            
            // fan screw hole
            translate([64.1+caseLateralThickness,46.2+caseLateralThickness,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,r=2.2,$fn=16);
            }
            
            // fan screw hole
            translate([105.8+caseLateralThickness,7.3+caseLateralThickness,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,r=2.2,$fn=16);
            }
            
            // x: 2.65-3.55 : avg=3.1
            // y: 2.65-3.55 : avg=3.1
            translate([caseLateralThickness*2-2.4+3.1
                    ,caseLateralThickness*2-2.4+3.1
                    ,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d1=m3ScrewHeadDiameter,d2=m3standHoleDiameter,$fn=16);
            };
            translate([boardWidth+caseLateralThickness*2+margin*2+2.5-3.1
                    ,caseLateralThickness*2-2.5+3.1
                    ,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d1=m3ScrewHeadDiameter,d2=m3standHoleDiameter,$fn=16);
            };
            
            // x: 0.50-1.40 : avg=0.95
            // y: 2.55-3.45 : avg=3.0
            translate([boardWidth+caseLateralThickness*2+margin*2+0.95
                    ,boardLength+caseLateralThickness*2+margin*2-3.0
                    ,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d1=m3ScrewHeadDiameter,d2=m3standHoleDiameter,$fn=16);
            };
            
            translate([caseLateralThickness*2-2.5+3.1
                    ,boardLength+caseLateralThickness*2+margin-1.4-3.1
                    ,-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d1=m3ScrewHeadDiameter,d2=m3standHoleDiameter,$fn=16);
            };
        }; // end difference
        
        difference() {
            translate([caseLateralThickness+margin,caseLateralThickness+margin,caseVerticalThickness])
            linear_extrude(caseVerticalThickness) {
                color("DarkGray")
                translate([cornerRadius,cornerRadius,0]) {
                    minkowski() {
                        square([boardWidth
                                    -boardCornerRadius*2
                                    +4
                            ,boardLength
                                    -boardCornerRadius*2
                                    ]);
                        circle(r=boardCornerRadius,$fn=36);
                    }
                };
            };
            translate([caseLateralThickness*2+margin,caseLateralThickness*2+margin,caseVerticalThickness-tinyLittleSmidgeon])
            linear_extrude(caseVerticalThickness+tinyLittleSmidgeon*2) {
                color("DarkGray")
                translate([cornerRadius,cornerRadius,0]) {
                    minkowski() {
                            square([boardWidth
                                    -cornerRadius*2
                                    -caseLateralThickness*2
                                    +4.0
                                ,boardLength
                                    -boardCornerRadius*2
                                    -caseLateralThickness*2
                                    ]);
                        circle(r=boardCornerRadius,$fn=36);
                    };
                };
            };
            
            //notch for attachment to upper
            translate([caseLateralThickness*2-2.4+2.8
                    ,caseLateralThickness*2-2.4+2.8
                    ,caseVerticalThickness-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d=8.7+margin*2,$fn=32);
            };
            
            //notch for attachment to upper
            translate([boardWidth+caseLateralThickness*2+margin*2+2.5-2.8
                    ,caseLateralThickness*2-2.5+2.8
                    ,caseVerticalThickness-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d=8.7+margin*2,$fn=32);
            };
            
            //notch for attachment to upper
            /*
            translate([boardWidth+caseLateralThickness*2+margin*2+2.5-2.8
                    ,boardLength+caseLateralThickness*2+margin*2-1.5-2.8
                    ,caseVerticalThickness-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d=8.7+margin*2,$fn=32);
            };
            */
            translate([boardWidth+caseLateralThickness*2+margin*2+1.0
                    ,boardLength+caseLateralThickness*2+margin*2-3.0
                    ,caseVerticalThickness-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d=8.7+margin*2,$fn=32);
            };
            
            //notch for attachment to upper
            translate([caseLateralThickness*2-2.5+2.8
                    ,boardLength+caseLateralThickness*2+margin-1.4-2.8
                    ,caseVerticalThickness-tinyLittleSmidgeon]) {
                cylinder(h=caseVerticalThickness+tinyLittleSmidgeon*2,d=8.7+margin*2,$fn=32);
            };
            
            // notch for fan outlet
            translate([61.0,caseLateralThickness-tinyLittleSmidgeon,caseVerticalThickness+tinyLittleSmidgeon]) {
                cube([19.5,caseLateralThickness*2,caseVerticalThickness]);
            };
        }; // end difference
        
    }; // end union
    
    /*
    color("Blue")
    translate([109.8+caseLateralThickness,caseLateralThickness-0.9,caseVerticalThickness+margin+tinyLittleSmidgeon])
    //translate([108+caseLateralThickness,caseLateralThickness,caseVerticalThickness+margin+tinyLittleSmidgeon+10])
    rotate([0,0,92.3])
        fan5015blower();
    */
    
};

//radxa_taco_lid();
