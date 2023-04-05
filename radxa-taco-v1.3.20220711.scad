
// Radxa Taco v1.3 2022-07-11

// unofficial reproduction focused on ports / standoffs for case fitting

include <sata-laptop-receiver.scad>;
include <radxa-taco-variables.scad>;

module radxa_taco_board() {
    difference() {

        translate([-tinyLittleSmidgeon,-tinyLittleSmidgeon,-tinyLittleSmidgeon])
        color("Green")
        translate([boardCornerRadius,boardCornerRadius,0]) {
            minkowski() {
                    cube([boardWidth-boardCornerRadius*2+tinyLittleSmidgeon*2
                        ,boardLength-boardCornerRadius*2+tinyLittleSmidgeon*2
                        ,boardHeight/2+tinyLittleSmidgeon*2]);
                cylinder(h=boardHeight/2,r=boardCornerRadius,$fn=24);
            };
        };

        // hole near RJ45 / SATA5
        translate([9.8+m25standHoleRadius,23.05+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // hole near DCIN / between SATA1 and SATA2
        translate([94.7+m25standHoleRadius,23.0+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // 108.6mm from left side
        // 79.91mm+1.33=81.24 from nearer side
        translate([108.90+m25standHoleRadius,79.92+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // 2.1mm from left side
        // 79.5mm from near side
        translate([2.40+m25standHoleRadius,79.99+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);
    };

    // RJ45
    // 16.0mm w
    // 21.2mm l
    // 13.3mm h
    // 0.090"/2.3mm overhang
    // top is 15.5mm above bottom of board
    //   15.5-13.3-1.8 = 0.4
    // right side is ~0.680"/17.3mm from left side of board
    //   17.3-16.0 = 1.3
    // left side is 0.080"/2.0mm from left side of board
    union() {
        translate([2.0-tinyLittleSmidgeon,-2.3-tinyLittleSmidgeon,boardHeight+0.2-tinyLittleSmidgeon])
            color("LightGray")
                cube([16.0+(tinyLittleSmidgeon*2),21.2+(tinyLittleSmidgeon*2),13.3+(tinyLittleSmidgeon*2)]);
    };

    // RJ45
    // 16.0mm w
    // 21.3mm l
    // 13.4mm h
    // top is 15.4mm above bottom of board
    //   15.4-13.4-1.8 = 0.2
    // right side is 36.8mm from left side of 1G RJ45
    //   36.8-16.1+2.0 = 22.7
    union() {
        translate([22.8-tinyLittleSmidgeon,-2.3-tinyLittleSmidgeon,boardHeight+0.2-tinyLittleSmidgeon]) {
            color("LightGray")
                cube([16.0+(tinyLittleSmidgeon*2),21.3+(tinyLittleSmidgeon*2),13.3+(tinyLittleSmidgeon*2)]);
        };
    };

    // USB-A 2.0
    // 6.8mm h
    // 14.4mm w
    // 14.0mm l
    // 0.111"/2.8mm overhang
    // top is 9.1mm from bottom of board
    //   9.1-1.9 = 7.2 - 6.8 = 0.4
    // right side is 55.5mm right from left side of 1G RJ45
    //   55.5-14.4+2.0 = 43.1
    union() {
        //translate([43.1-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon,boardHeight+0.4-tinyLittleSmidgeon]) {
        //    color("LightGray")
        //        cube([14.4+(tinyLittleSmidgeon*2),14.0+(tinyLittleSmidgeon*2),6.8+(tinyLittleSmidgeon*2)]);
        //};
        translate([43.7-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon,boardHeight+1.0-tinyLittleSmidgeon]) {
            color("LightGray")
                cube([13.2+(tinyLittleSmidgeon*2),14.0+(tinyLittleSmidgeon*2),6.6+(tinyLittleSmidgeon*2)]);
        };
    };

    // HDMI
    // 5.4mm h
    // 15.0mm w
    // 10.9mm l
    // 0.096"/2.4mm overhang
    // top is 8.2mm above bottom of board
    //   8.2-1.9 = 6.3 - 5.4 = 0.9
    // right side is 74.9mm right of left side of 1G RJ45
    //   74.9-15.0+2.0 = 61.9
    union() {
        
        hdmiTopWidth = 15.0+(tinyLittleSmidgeon*2);
        hdmiBottomWidth = 10.2+(tinyLittleSmidgeon*2);
        hdmiHeight = 5.6+(tinyLittleSmidgeon*2);
        hdmiDepth = 10.9+(tinyLittleSmidgeon*2);

        translate([61.9-tinyLittleSmidgeon,-2.4-tinyLittleSmidgeon,boardHeight+0.8-tinyLittleSmidgeon])
            color("LightGray")
            translate([0,hdmiDepth,0])
            rotate([90,0,0])
            linear_extrude(hdmiDepth)
            polygon(points=[
                [0,hdmiHeight]
                ,[hdmiTopWidth,hdmiHeight]
                ,[hdmiTopWidth,hdmiHeight*.3]
                ,[hdmiTopWidth-(hdmiTopWidth-hdmiBottomWidth)/2,0]
                ,[(hdmiTopWidth-hdmiBottomWidth)/2,0]
                ,[0,hdmiHeight*.3]
                ]);
    };

    // ON BUTTON AND HOUSING
    // housing
    //   7.4mm w
    //   6.0mm l
    //   7.2mm h
    //   top is 9.0mm above bottom of board
    //     9.0-1.8-6.0 = 1.2mm elevation
    //   0.023"/0.3mm overhang
    //     2.5-0.6 = 1.9
    //   right side of housing is 88.5mm right of left side of 1G RJ45
    //     88.5-7.4+2.0 = 83.1
    // button
    //   3.4mm diameter
    //   0.098"/2.5mm overhang
    //   top is 0.308"/7.5mm above bottom of board
    //   7.5-3.4 = 4.1-1.8 = 2.3
    //   right side is 3.477"/88.3mm from left side of board
    //   88.3-3.1 = 85.2
    union() {
        translate([83.1-tinyLittleSmidgeon,-2.5-0.6-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
            union() {
                translate([0,2.5+tinyLittleSmidgeon,0]) {
                    color("LightGray") cube([7.4+(tinyLittleSmidgeon*2),6.0+(tinyLittleSmidgeon*2),7.2+(tinyLittleSmidgeon*2)]);
                };
                translate([(7.4/2.0)+tinyLittleSmidgeon,0.0-tinyLittleSmidgeon,2.3+(3.4/2.0)+tinyLittleSmidgeon]) {
                    rotate([-90,0,0]) {
                        color("Black") cylinder(h=2.5+(tinyLittleSmidgeon*2),d=3.4+(tinyLittleSmidgeon*2),$fn=12);
                    };
                };
            };
        };
    };

    // DCIN
    // 9.8mm w
    // 13.0mm l
    // 10.0mm h
    // 0.060"/1.5mm overhang
    // top is 12.0mm from bottom of board
    //   12.0-10.0-1.8 = 0.2
    // right side is 106.5mm right of left side of 1G RJ45
    //   106.5-9.8+2.0 = 98.7
    union() {
        translate([98.7-tinyLittleSmidgeon,-1.5-tinyLittleSmidgeon,boardHeight+0.2-tinyLittleSmidgeon]) {
            color("LightGray")
                cube([10.0+(tinyLittleSmidgeon*2),13.0+(tinyLittleSmidgeon*2),10.0+(tinyLittleSmidgeon*2)]);
        };
    };

    // TF
    // 14.3mm w
    // 14.8mm l
    // 0.082"/2.1mm h
    // top is 3.9mm above bottom of board
    // 3.9-2.1-1.8= 0.0
    // right side is 4.334"/110.1 from left side of board
    //   110.1-14.7 = 95.4
    // left side is 17.5 left of right side of board
    //   113.7-17.5 = 96.2
    // further side is 1.908"/48.5mm from nearer side of board
    //   48.5-14.8 = 33.7
    union() {
        translate([96.2-tinyLittleSmidgeon,33.6-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
            color("LightGray")
                cube([14.3+(tinyLittleSmidgeon*2),14.7+(tinyLittleSmidgeon*2),2.1+(tinyLittleSmidgeon*2)]);
        };
    };

    // CM4+heatsink
    // 2.162"/54.9mm w
    // 1.570"/39.9mm l
    // 0.628"/16.0mm h
    // right side 3.190"/81.0mm from left side
    // 81.0-54.9 = 26.1mm
    // further side 2.399"/60.9mm from near side
    // 60.9-39.9 = 21.0
    union() {
        translate([26.1-tinyLittleSmidgeon,21.0-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
            color("LightGray")
                cube([54.9+(tinyLittleSmidgeon*2),39.9+(tinyLittleSmidgeon*2),16.0+(tinyLittleSmidgeon*2)]);
        };
    };

    // NGFF M-Key slot for 2280 NVMe
    // 5.7mm w
    // 21.7mm l
    // 8.5mm h
    // 0.5 from further side of board
    union() {
        translate([24.4-tinyLittleSmidgeon,62.7-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
            color("LightGray")
                cube([5.7+(tinyLittleSmidgeon*2),21.7+(tinyLittleSmidgeon*2),8.5+(tinyLittleSmidgeon*2)]);
        };
    };

    // NGFF E-Key slot for WiFi
    // 21.7mm w
    // 7.2mm l
    // 4.1mm h
    // 79.2+24.4-21.7 = 81.9
    union() {
        translate([81.9-tinyLittleSmidgeon,76.4-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
            color("LightGray")
                cube([21.7+(tinyLittleSmidgeon*2),7.2+(tinyLittleSmidgeon*2),4.1+(tinyLittleSmidgeon*2)]);
        };
    };


    // RTL8125B
    // 5.6mm w
    // 5.6mm l
    // 1.3mm h
    // right side is 54.4mm from left side of board
    // 54.4-5.6 = 48.8
    // further edge is 38.8mm from nearer edge
    // 38.8-5.6 = 33.2
    union() {
        translate([48.8-tinyLittleSmidgeon,33.2-tinyLittleSmidgeon,-1.3-tinyLittleSmidgeon]) {
            color("Black")
                cube([5.6+(tinyLittleSmidgeon*2),5.6+(tinyLittleSmidgeon*2),1.3+(tinyLittleSmidgeon*2)]);
        };
    };

    // ASM1806
    // 9.4mm w
    // 9.4mm l
    // 0.9mm h
    // right side is 47.0mm from left side of board
    // 47.0-9.4 = 37.5
    // further side is 76.2mm from nearer side of board
    // 76.2-9.4 = 66.8
    union() {
        translate([37.5-tinyLittleSmidgeon,67.0-tinyLittleSmidgeon,-0.9-tinyLittleSmidgeon]) {
            color("Black")
                cube([9.4+(tinyLittleSmidgeon*2),9.4+(tinyLittleSmidgeon*2),0.9+(tinyLittleSmidgeon*2)]);
        };
    };

    // JMB585
    // 8.7mm w
    // 8.7mm l
    // 1.1mm h
    // right side is 80.6mm from left side of board
    // 80.6-8.7 = 71.9
    // nearer side is 77.5mm from nearer side of board
    // 77.5-8.7 = 68.8
    union() {
        translate([72.2-tinyLittleSmidgeon,68.3-tinyLittleSmidgeon,-1.1-tinyLittleSmidgeon]) {
            color("Black")
                cube([9.0+(tinyLittleSmidgeon*2),9.0+(tinyLittleSmidgeon*2),1.1+(tinyLittleSmidgeon*2)]);
        };
    };

    // transformer near SATA5
    // 6.5mm w
    // 6.5mm l
    // 2.8mm h
    // 7.7mm from left side of board
    //   7.7-6.5 = 1.2
    // further side is 65.4mm from nearer side of board
    //   65.4-6.5 = 58.9
    union() {
        translate([1.1-tinyLittleSmidgeon,58.6-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
            color("Gray")
                cube([6.5+(tinyLittleSmidgeon*2),6.5+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
        };
    };

    // transformer near SATA2
    // 4.9mm w
    // 4.9mm l
    // 2.8mm h
    // right side is 93.1mm from left side of board
    //   93.1-4.9 = 88.2
    // further side is 74.8mm from nearer side of board
    //   74.8-4.9 = 69.9
    union() {
        translate([88.7-tinyLittleSmidgeon,69.9-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
            color("Gray")
                cube([4.9+(tinyLittleSmidgeon*2),4.9+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
        };
    };

    // transformer near SATA2
    // 4.9mm w
    // 4.9mm l
    // 2.8mm h
    // right side is 94.3mm from left side of board
    //   94.3-4.9 = 89.4
    // further side is 47.9mm from nearer side of board
    //   47.9-4.9 = 43.0
    union() {
        translate([89.8-tinyLittleSmidgeon,42.7-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
            color("Gray")
                cube([4.9+(tinyLittleSmidgeon*2),4.9+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
        };
    };

    // MASKROM button opposite drive status LEDs
    // 0.069"/1.8mm wide
    // 0.048"/1.2mm long
    // right side is 1.984"/50.4mm from left side
    //   50.4-1.8 = 48.6
    // top is 0.067"/1.7mm above board
    union() {
        translate([48.3-tinyLittleSmidgeon,-tinyLittleSmidgeon,-tinyLittleSmidgeon]) {
            union() {
                translate([1.2,0,-1.7+0.4]) {
                    color("Black")
                        cube([1.6+(tinyLittleSmidgeon*2),1.2+(tinyLittleSmidgeon*2),0.8+(tinyLittleSmidgeon*2)]);
                }
                translate([0,1.2,-2.6+0.4]) {
                    color("White")
                        cube([4.2+(tinyLittleSmidgeon*2),2.4+(tinyLittleSmidgeon*2),2.6+(tinyLittleSmidgeon*2)]);
                }
            };
        };
    };
    
    // unknown red LED near "ON" button
    // 1.74mm wide
    // 0.83mm long
    // 0.50mm high
    // left side is 80.58 left of Y-axis
    //   80.58-1.74 = 78.84
    // far side is 6.45mm from X-axis
    //   6.45-0.83 = 5.62
    union() {
        translate([78.84-tinyLittleSmidgeon,5.62-tinyLittleSmidgeon,-(0.50+(tinyLittleSmidgeon*2))]) {
            color("Red")
                cube([1.74+(tinyLittleSmidgeon*2),0.84+(tinyLittleSmidgeon*2),0.50+(tinyLittleSmidgeon*2)]);
        };
    };

    // status LED opposite drive status LEDs
    // 0.071"/1.8mm wide
    // 0.067"/1.7mm long
    // 0.048"/1.2mm high
    // right side is 2.336"/59.3mm from left side
    // 59.3-1.8 = 57.5
    union() {
        translate([57.5-tinyLittleSmidgeon,0.0-tinyLittleSmidgeon,-1.2-tinyLittleSmidgeon]) {
            color("Yellow")
                cube([1.8+(tinyLittleSmidgeon*2),1.7+(tinyLittleSmidgeon*2),1.2+(tinyLittleSmidgeon*2)]);
        };
    };

    // unknown ZIF slot near MASKROM button
    // 12.8mm wide
    // 4.6mm long
    // 2.8mm high
    // right side is 75.2 from left side
    //   75.2-12.8 = 62.4
    // far side is 9.4 from nearer side
    //   9.4-4.6 = 4.8
    union() {
        translate([62.4-tinyLittleSmidgeon,4.8-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
            color("White")
                cube([12.8+(tinyLittleSmidgeon*2),4.6+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
        };
    };

    // activity LED 1 (0602 blue side-emit?)
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 63.5mm from left side of board
    union() {
        color("Blue")
        translate([63.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
            cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
        };
    };

    // activity LED 2
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 58.7mm from left side of board
    union() {
        color("Blue")
        translate([58.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
            cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
        };
    };

    // activity LED 3
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is /53.7mm from left side of board
    union() {
        color("Blue")
        translate([53.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
            cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
        };
    };

    // activity LED 4
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 48.5mm from left side of board
    union() {
        color("Blue")
        translate([48.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
            cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
        };
    };

    // activity LED 5
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 43.5mm from left side of board
    union() {
        color("Blue")
        translate([43.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
            cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
        };
    };

    // SATA1 port
    // right edge is 4.215"/107.1mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([90.1+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90])
            color("DarkGray")
            sata_laptop_receiver_smt();

    // SATA2 port
    // right edge is 87.05 mm from left edge
    // far edge 62.42mm from near edge
    translate([68.9+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90+0.12])
            color("DarkGray")
            sata_laptop_receiver_smt();

    // SATA3 port
    // right edge is 2.562"/65.1mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([47.3+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90+0.17])
            color("DarkGray")
            sata_laptop_receiver_smt();

    // SATA4 port
    // right edge is 1.743"/44.3mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([25.8+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90])
            color("DarkGray")
            sata_laptop_receiver_smt();

    // SATA5 port
    // right edge is 0.874"/22.2mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([21.7-sataConnectorWidth,62.6-sataConnectorLength,0])
        rotate([0,180,-90])
            color("DarkGray")
            sata_laptop_receiver_smt();
};

module radxa_taco_board_v2() {
    rotate([180,0,0])
    translate([0,-boardLength,-boardHeight])
    difference() {

        translate([-tinyLittleSmidgeon,-tinyLittleSmidgeon,-tinyLittleSmidgeon])
        color("Green")
        translate([boardCornerRadius,boardCornerRadius,0]) {
            minkowski() {
                    cube([boardWidth-boardCornerRadius*2+tinyLittleSmidgeon*2
                        ,boardLength-boardCornerRadius*2+tinyLittleSmidgeon*2
                        ,boardHeight/2+tinyLittleSmidgeon*2]);
                cylinder(h=boardHeight/2,r=boardCornerRadius,$fn=24);
            }
        };

        // hole near RJ45 / SATA5
        translate([9.8+m25standHoleRadius,23.05+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // hole near DCIN / between SATA1 and SATA2
        translate([94.7+m25standHoleRadius,23.0+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // 108.6mm from left side
        // 79.91mm+1.33=81.24 from nearer side
        translate([108.90+m25standHoleRadius,79.92+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // 2.1mm from left side
        // 79.5mm from near side
        translate([2.40+m25standHoleRadius,79.99+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);
    };

    rotate([180,0,0])
    translate([0,-boardLength,-boardHeight])
    union() {
        // RJ45
        // 16.0mm w
        // 21.2mm l
        // 13.3mm h
        // 0.090"/2.3mm overhang
        // top is 15.5mm above bottom of board
        //   15.5-13.3-1.8 = 0.4
        // right side is ~0.680"/17.3mm from left side of board
        //   17.3-16.0 = 1.3
        // left side is 0.080"/2.0mm from left side of board
        union() {
            translate([2.0-tinyLittleSmidgeon,-2.3-tinyLittleSmidgeon,boardHeight+0.4-tinyLittleSmidgeon])
                color("LightGray")
                    cube([16.0+(tinyLittleSmidgeon*2),21.2+(tinyLittleSmidgeon*2),13.3+(tinyLittleSmidgeon*2)]);
        };

        // RJ45
        // 16.0mm w
        // 21.3mm l
        // 13.4mm h
        // top is 15.4mm above bottom of board
        //   15.4-13.4-1.8 = 0.2
        // right side is 36.8mm from left side of 1G RJ45
        //   36.8-16.1+2.0 = 22.7
        union() {
            translate([22.7-tinyLittleSmidgeon,-2.3-tinyLittleSmidgeon,boardHeight+0.2-tinyLittleSmidgeon]) {
                color("LightGray")
                    cube([16.0+(tinyLittleSmidgeon*2),21.3+(tinyLittleSmidgeon*2),13.4+(tinyLittleSmidgeon*2)]);
            };
        };

        // USB-A 2.0
        // 6.8mm h
        // 14.4mm w
        // 14.0mm l
        // 0.111"/2.8mm overhang
        // top is 9.1mm from bottom of board
        //   9.1-1.9 = 7.2 - 6.8 = 0.4
        // right side is 55.5mm right from left side of 1G RJ45
        //   55.5-14.4+2.0 = 43.1
        union() {
            //translate([43.1-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon,boardHeight+0.4-tinyLittleSmidgeon]) {
            //    color("LightGray")
            //        cube([14.4+(tinyLittleSmidgeon*2),14.0+(tinyLittleSmidgeon*2),6.8+(tinyLittleSmidgeon*2)]);
            //};
            translate([43.7-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon,boardHeight+0.8-tinyLittleSmidgeon]) {
                color("LightGray")
                    cube([13.2+(tinyLittleSmidgeon*2),14.0+(tinyLittleSmidgeon*2),6.6+(tinyLittleSmidgeon*2)]);
            };
        };

        // HDMI
        // 5.4mm h
        // 15.0mm w
        // 10.9mm l
        // 0.096"/2.4mm overhang
        // top is 8.2mm above bottom of board
        //   8.2-1.9 = 6.3 - 5.4 = 0.9
        // right side is 74.9mm right of left side of 1G RJ45
        //   74.9-15.0+2.0 = 61.9
        union() {
            
            hdmiTopWidth = 15.0+(tinyLittleSmidgeon*2);
            hdmiBottomWidth = 10.2+(tinyLittleSmidgeon*2);
            hdmiHeight = 5.6+(tinyLittleSmidgeon*2);
            hdmiDepth = 10.9+(tinyLittleSmidgeon*2);

            translate([61.9-tinyLittleSmidgeon,-2.4-tinyLittleSmidgeon,boardHeight+0.8-tinyLittleSmidgeon])
                color("LightGray")
                translate([0,hdmiDepth,0])
                rotate([90,0,0])
                linear_extrude(hdmiDepth)
                polygon(points=[
                    [0,hdmiHeight]
                    ,[hdmiTopWidth,hdmiHeight]
                    ,[hdmiTopWidth,hdmiHeight*.3]
                    ,[hdmiTopWidth-(hdmiTopWidth-hdmiBottomWidth)/2,0]
                    ,[(hdmiTopWidth-hdmiBottomWidth)/2,0]
                    ,[0,hdmiHeight*.3]
                    ]);
        };

        // ON BUTTON AND HOUSING
        // housing
        //   7.4mm w
        //   6.0mm l
        //   7.2mm h
        //   top is 9.0mm above bottom of board
        //     9.0-1.8-6.0 = 1.2mm elevation
        //   0.023"/0.3mm overhang
        //     2.5-0.6 = 1.9
        //   right side of housing is 88.5mm right of left side of 1G RJ45
        //     88.5-7.4+2.0 = 83.1
        // button
        //   3.4mm diameter
        //   0.098"/2.5mm overhang
        //   top is 0.308"/7.5mm above bottom of board
        //   7.5-3.4 = 4.1-1.8 = 2.3
        //   right side is 3.477"/88.3mm from left side of board
        //   88.3-3.1 = 85.2
        union() {
            translate([83.1-tinyLittleSmidgeon,-2.5-0.6-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
                union() {
                    translate([0,2.5+tinyLittleSmidgeon,0]) {
                        color("LightGray") cube([7.4+(tinyLittleSmidgeon*2),6.0+(tinyLittleSmidgeon*2),7.2+(tinyLittleSmidgeon*2)]);
                    };
                    translate([(7.4/2.0)+tinyLittleSmidgeon,0.0-tinyLittleSmidgeon,2.3+(3.4/2.0)+tinyLittleSmidgeon]) {
                        rotate([-90,0,0]) {
                            color("Black") cylinder(h=2.5+(tinyLittleSmidgeon*2),d=3.4+(tinyLittleSmidgeon*2),$fn=12);
                        };
                    };
                };
            };
        };

        // DCIN
        // 9.8mm w
        // 13.0mm l
        // 10.0mm h
        // 0.060"/1.5mm overhang
        // top is 12.0mm from bottom of board
        //   12.0-10.0-1.8 = 0.2
        // right side is 106.5mm right of left side of 1G RJ45
        //   106.5-9.8+2.0 = 98.7
        union() {
            translate([98.7-tinyLittleSmidgeon,-1.5-tinyLittleSmidgeon,boardHeight+0.2-tinyLittleSmidgeon]) {
                color("LightGray")
                    cube([10.0+(tinyLittleSmidgeon*2),13.0+(tinyLittleSmidgeon*2),10.0+(tinyLittleSmidgeon*2)]);
            };
        };

        // TF
        // 14.3mm w
        // 14.8mm l
        // 0.082"/2.1mm h
        // top is 3.9mm above bottom of board
        // 3.9-2.1-1.8= 0.0
        // right side is 4.334"/110.1 from left side of board
        //   110.1-14.7 = 95.4
        // left side is 17.5 left of right side of board
        //   113.7-17.5 = 96.2
        // further side is 1.908"/48.5mm from nearer side of board
        //   48.5-14.8 = 33.7
        union() {
            translate([96.2-tinyLittleSmidgeon,33.6-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
                color("LightGray")
                    cube([14.3+(tinyLittleSmidgeon*2),14.7+(tinyLittleSmidgeon*2),2.1+(tinyLittleSmidgeon*2)]);
            };
        };

        // CM4+heatsink
        // 2.162"/54.9mm w
        // 1.570"/39.9mm l
        // 0.628"/16.0mm h
        // right side 3.190"/81.0mm from left side
        // 81.0-54.9 = 26.1mm
        // further side 2.399"/60.9mm from near side
        // 60.9-39.9 = 21.0
        union() {
            translate([26.1-tinyLittleSmidgeon,21.0-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
                color("LightGray")
                    cube([54.9+(tinyLittleSmidgeon*2),39.9+(tinyLittleSmidgeon*2),16.0+(tinyLittleSmidgeon*2)]);
            };
        };

        // NGFF M-Key slot for 2280 NVMe
        // 5.7mm w
        // 21.7mm l
        // 8.5mm h
        // 0.5 from further side of board
        union() {
            translate([24.4-tinyLittleSmidgeon,62.7-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
                color("LightGray")
                    cube([5.7+(tinyLittleSmidgeon*2),21.7+(tinyLittleSmidgeon*2),8.5+(tinyLittleSmidgeon*2)]);
            };
        };

        // NGFF E-Key slot for WiFi
        // 21.7mm w
        // 7.2mm l
        // 4.1mm h
        // 79.2+24.4-21.7 = 81.9
        union() {
            translate([81.9-tinyLittleSmidgeon,76.4-tinyLittleSmidgeon,boardHeight-tinyLittleSmidgeon]) {
                color("LightGray")
                    cube([21.7+(tinyLittleSmidgeon*2),7.2+(tinyLittleSmidgeon*2),4.1+(tinyLittleSmidgeon*2)]);
            };
        };
    };

    rotate([180,0,0])
    translate([0,-boardLength,-boardHeight])
    union() {
        // RTL8125B
        // 5.6mm w
        // 5.6mm l
        // 1.3mm h
        // right side is 54.4mm from left side of board
        // 54.4-5.6 = 48.8
        // further edge is 38.8mm from nearer edge
        // 38.8-5.6 = 33.2
        union() {
            translate([48.8-tinyLittleSmidgeon,33.2-tinyLittleSmidgeon,-1.3-tinyLittleSmidgeon]) {
                color("Black")
                    cube([5.6+(tinyLittleSmidgeon*2),5.6+(tinyLittleSmidgeon*2),1.3+(tinyLittleSmidgeon*2)]);
            };
        };

        // ASM1806
        // 9.4mm w
        // 9.4mm l
        // 0.9mm h
        // right side is 47.0mm from left side of board
        // 47.0-9.4 = 37.5
        // further side is 76.2mm from nearer side of board
        // 76.2-9.4 = 66.8
        union() {
            translate([37.5-tinyLittleSmidgeon,67.0-tinyLittleSmidgeon,-0.9-tinyLittleSmidgeon]) {
                color("Black")
                    cube([9.4+(tinyLittleSmidgeon*2),9.4+(tinyLittleSmidgeon*2),0.9+(tinyLittleSmidgeon*2)]);
            };
        };

        // JMB585
        // 8.7mm w
        // 8.7mm l
        // 1.1mm h
        // right side is 80.6mm from left side of board
        // 80.6-8.7 = 71.9
        // nearer side is 77.5mm from nearer side of board
        // 77.5-8.7 = 68.8
        union() {
            translate([72.2-tinyLittleSmidgeon,68.3-tinyLittleSmidgeon,-1.1-tinyLittleSmidgeon]) {
                color("Black")
                    cube([9.0+(tinyLittleSmidgeon*2),9.0+(tinyLittleSmidgeon*2),1.1+(tinyLittleSmidgeon*2)]);
            };
        };

        // transformer near SATA5
        // 6.5mm w
        // 6.5mm l
        // 2.8mm h
        // 7.7mm from left side of board
        //   7.7-6.5 = 1.2
        // further side is 65.4mm from nearer side of board
        //   65.4-6.5 = 58.9
        union() {
            translate([1.1-tinyLittleSmidgeon,58.6-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
                color("Gray")
                    cube([6.5+(tinyLittleSmidgeon*2),6.5+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
            };
        };

        // transformer near SATA2
        // 4.9mm w
        // 4.9mm l
        // 2.8mm h
        // right side is 93.1mm from left side of board
        //   93.1-4.9 = 88.2
        // further side is 74.8mm from nearer side of board
        //   74.8-4.9 = 69.9
        union() {
            translate([88.7-tinyLittleSmidgeon,69.9-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
                color("Gray")
                    cube([4.9+(tinyLittleSmidgeon*2),4.9+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
            };
        };

        // transformer near SATA2
        // 4.9mm w
        // 4.9mm l
        // 2.8mm h
        // right side is 94.3mm from left side of board
        //   94.3-4.9 = 89.4
        // further side is 47.9mm from nearer side of board
        //   47.9-4.9 = 43.0
        union() {
            translate([89.8-tinyLittleSmidgeon,42.7-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
                color("Gray")
                    cube([4.9+(tinyLittleSmidgeon*2),4.9+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
            };
        };

        // MASKROM button opposite drive status LEDs
        // 0.069"/1.8mm wide
        // 0.048"/1.2mm long
        // right side is 1.984"/50.4mm from left side
        //   50.4-1.8 = 48.6
        // top is 0.067"/1.7mm above board
        union() {
            translate([48.3-tinyLittleSmidgeon,-tinyLittleSmidgeon,-tinyLittleSmidgeon]) {
                union() {
                    translate([1.2,0,-1.7+0.4]) {
                        color("Black")
                            cube([1.6+(tinyLittleSmidgeon*2),1.2+(tinyLittleSmidgeon*2),0.8+(tinyLittleSmidgeon*2)]);
                    }
                    translate([0,1.2,-2.6+0.4]) {
                        color("White")
                            cube([4.2+(tinyLittleSmidgeon*2),2.4+(tinyLittleSmidgeon*2),2.6+(tinyLittleSmidgeon*2)]);
                    }
                };
            };
        };
        
        // unknown red LED near "ON" button
        // 1.74mm wide
        // 0.83mm long
        // 0.50mm high
        // left side is 80.58 left of Y-axis
        //   80.58-1.74 = 78.84
        // far side is 6.45mm from X-axis
        //   6.45-0.83 = 5.62
        union() {
            translate([78.84-tinyLittleSmidgeon,5.62-tinyLittleSmidgeon,-(0.50+(tinyLittleSmidgeon*2))]) {
                color("Red")
                    cube([1.74+(tinyLittleSmidgeon*2),0.84+(tinyLittleSmidgeon*2),0.50+(tinyLittleSmidgeon*2)]);
            };
        };

        // status LED opposite drive status LEDs
        // 0.071"/1.8mm wide
        // 0.067"/1.7mm long
        // 0.048"/1.2mm high
        // right side is 2.336"/59.3mm from left side
        // 59.3-1.8 = 57.5
        union() {
            translate([57.5-tinyLittleSmidgeon,0.0-tinyLittleSmidgeon,-1.2-tinyLittleSmidgeon]) {
                color("Yellow")
                    cube([1.8+(tinyLittleSmidgeon*2),1.7+(tinyLittleSmidgeon*2),1.2+(tinyLittleSmidgeon*2)]);
            };
        };

        // unknown ZIF slot near MASKROM button
        // 12.8mm wide
        // 4.6mm long
        // 2.8mm high
        // right side is 75.2 from left side
        //   75.2-12.8 = 62.4
        // far side is 9.4 from nearer side
        //   9.4-4.6 = 4.8
        union() {
            translate([62.4-tinyLittleSmidgeon,4.8-tinyLittleSmidgeon,-2.8-tinyLittleSmidgeon]) {
                color("White")
                    cube([12.8+(tinyLittleSmidgeon*2),4.6+(tinyLittleSmidgeon*2),2.8+(tinyLittleSmidgeon*2)]);
            };
        };

        // activity LED 1
        // 1.4mm w
        // 0.7mm l
        // 0.6mm h
        // 0.3mm overhang
        // right side is 63.5mm from left side of board
        union() {
            translate([63.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
                cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
            };
        };

        // activity LED 2
        // 1.4mm w
        // 0.7mm l
        // 0.6mm h
        // 0.3mm overhang
        // right side is 58.7mm from left side of board
        union() {
            translate([58.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
                cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
            };
        };

        // activity LED 3
        // 1.4mm w
        // 0.7mm l
        // 0.6mm h
        // 0.3mm overhang
        // right side is /53.7mm from left side of board
        union() {
            translate([53.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
                cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
            };
        };

        // activity LED 4
        // 1.4mm w
        // 0.7mm l
        // 0.6mm h
        // 0.3mm overhang
        // right side is 48.5mm from left side of board
        union() {
            translate([48.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
                cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
            };
        };

        // activity LED 5
        // 1.4mm w
        // 0.7mm l
        // 0.6mm h
        // 0.3mm overhang
        // right side is 43.5mm from left side of board
        union() {
            translate([43.5-1.4-tinyLittleSmidgeon,boardLength-0.7+0.3-tinyLittleSmidgeon,-0.6-tinyLittleSmidgeon]) {
                cube([1.7+(tinyLittleSmidgeon*2),1.0+(tinyLittleSmidgeon*2),0.6+(tinyLittleSmidgeon*2)]);
            };
        };

        // SATA1 port
        // right edge is 4.215"/107.1mm from left edge
        // far edge 2.428"/61.7mm from near edge
        translate([90.1+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
            rotate([0,180,-90])
                color("DarkGray")
                sata_laptop_receiver_smt();

        // SATA2 port
        // right edge is 87.05 mm from left edge
        // far edge 62.42mm from near edge
        translate([68.9+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
            rotate([0,180,-90+0.12])
                color("DarkGray")
                sata_laptop_receiver_smt();

        // SATA3 port
        // right edge is 2.562"/65.1mm from left edge
        // far edge 2.428"/61.7mm from near edge
        translate([47.3+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
            rotate([0,180,-90+0.17])
                color("DarkGray")
                sata_laptop_receiver_smt();

        // SATA4 port
        // right edge is 1.743"/44.3mm from left edge
        // far edge 2.428"/61.7mm from near edge
        translate([25.8+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
            rotate([0,180,-90])
                color("DarkGray")
                sata_laptop_receiver_smt();

        // SATA5 port
        // right edge is 0.874"/22.2mm from left edge
        // far edge 2.428"/61.7mm from near edge
        translate([21.7-sataConnectorWidth,62.6-sataConnectorLength,0])
            rotate([0,180,-90])
                color("DarkGray")
                sata_laptop_receiver_smt();
    };
};

module radxa_taco_board_blank() {
    difference() {

        translate([-margin,-margin,-margin])
        translate([boardCornerRadius,boardCornerRadius,0]) {
            minkowski() {
                    cube([boardWidth-boardCornerRadius*2+margin*2
                        ,boardLength-boardCornerRadius*2+margin*2
                        ,boardHeight/2+margin*2]);
                cylinder(h=boardHeight/2,r=boardCornerRadius,$fn=24);
            };
        };
        
        /*
        translate([-tinyLittleSmidgeon,-tinyLittleSmidgeon,-tinyLittleSmidgeon])
        color("Green")
        translate([boardCornerRadius,boardCornerRadius,0]) {
            minkowski() {
                    cube([boardWidth-boardCornerRadius*2+tinyLittleSmidgeon*2
                        ,boardLength-boardCornerRadius*2+tinyLittleSmidgeon*2
                        ,boardHeight/2+tinyLittleSmidgeon*2]);
                cylinder(h=boardHeight/2,r=boardCornerRadius,$fn=24);
            };
        };
        */
        /*
        // hole near RJ45 / SATA5
        translate([9.8+m25standHoleRadius,23.05+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // hole near DCIN / between SATA1 and SATA2
        translate([94.7+m25standHoleRadius,23.0+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // 108.6mm from left side
        // 79.91mm+1.33=81.24 from nearer side
        translate([108.90+m25standHoleRadius,79.92+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);

        // 2.1mm from left side
        // 79.5mm from near side
        translate([2.40+m25standHoleRadius,79.99+m25standHoleRadius,-0.2004])
            cylinder(h=boardHeight*2,r=m25standHoleRadius,$fn=16);
        
        */
    };

    // RJ45
    // 16.0mm w
    // 21.2mm l
    // 13.3mm h
    // 0.090"/2.3mm overhang
    // top is 15.5mm above bottom of board
    //   15.5-13.3-1.8 = 0.4
    // right side is ~0.680"/17.3mm from left side of board
    //   17.3-16.0 = 1.3
    // left side is 0.080"/2.0mm from left side of board
    union() {
        translate([1.9-margin,-2.3-margin,boardHeight+0.4-margin])
            cube([16.1+(margin*2),21.2+(margin*2),13.3+(margin*2)]);
    };

    // RJ45
    // 16.0mm w
    // 21.3mm l
    // 13.4mm h
    // top is 15.4mm above bottom of board
    //   15.4-13.4-1.8 = 0.2
    // right side is 36.8mm from left side of 1G RJ45
    //   36.8-16.1+2.0 = 22.7
    union() {
        translate([22.8-margin,-2.3-margin,boardHeight+0.4-margin]) {
            cube([16.0+(margin*2),21.2+(margin*2),13.3+(margin*2)]);
        };
    };

    // USB-A 2.0
    // 6.8mm h
    // 14.4mm w
    // 14.0mm l
    // 0.111"/2.8mm overhang
    // top is 9.1mm from bottom of board
    //   9.1-1.9 = 7.2 - 6.8 = 0.4
    // right side is 55.5mm right from left side of 1G RJ45
    //   55.5-14.4+2.0 = 43.1
    union() {
        translate([43.6-margin,-2.8-margin,boardHeight+1.1-margin]) {
            cube([13.2+(margin*2),14.0+(margin*2),5.7+(margin*2)]);
        };
    };

    // HDMI
    // 5.4mm h
    // 15.0mm w
    // 10.9mm l
    // 0.096"/2.4mm overhang
    // top is 8.2mm above bottom of board
    //   8.2-1.9 = 6.3 - 5.4 = 0.9
    // right side is 74.9mm right of left side of 1G RJ45
    //   74.9-15.0+2.0 = 61.9
    union() {
        
        hdmiTopWidth = 15.1+(margin*2);
        hdmiBottomWidth = 10.0+(margin*2);
        hdmiHeight = 5.6+(margin*2);
        hdmiDepth = 10.9+(margin*2);

        translate([61.7-margin,-2.4-margin,boardHeight+1.0-margin])
            translate([0,hdmiDepth,0])
            rotate([90,0,0])
            linear_extrude(hdmiDepth)
            polygon(points=[
                [0,hdmiHeight]
                ,[hdmiTopWidth,hdmiHeight]
                ,[hdmiTopWidth,hdmiHeight*.3]
                ,[hdmiTopWidth-(hdmiTopWidth-hdmiBottomWidth)/2,0]
                ,[(hdmiTopWidth-hdmiBottomWidth)/2,0]
                ,[0,hdmiHeight*.3]
                ]);
    };

    // ON BUTTON AND HOUSING
    // housing
    //   7.4mm w
    //   6.0mm l
    //   7.2mm h
    //   top is 9.0mm above bottom of board
    //     9.0-1.8-6.0 = 1.2mm elevation
    //   0.023"/0.3mm overhang
    //     2.5-0.6 = 1.9
    //   right side of housing is 88.5mm right of left side of 1G RJ45
    //     88.5-7.4+2.0 = 83.1
    // button
    //   3.4mm diameter
    //   0.098"/2.5mm overhang
    //   top is 0.308"/7.5mm above bottom of board
    //   7.5-3.4 = 4.1-1.8 = 2.3
    //   right side is 3.477"/88.3mm from left side of board
    //   88.3-3.1 = 85.2
    union() {
        translate([83.2-margin,-2.5-0.6-margin,boardHeight-margin]) {
            union() {
                translate([0,2.5+margin,0]) {
                    cube([7.4+(margin*2),6.0+(margin*2),7.2+(margin*2)]);
                };
                translate([(7.4/2.0)+margin,0.0-margin-tinyLittleSmidgeon,2.3+(3.4/2.0)+margin]) {
                    rotate([-90,0,0]) {
                        cylinder(h=2.5+(margin*2)+tinyLittleSmidgeon*2,d=3.4+(margin*2),$fn=12);
                    };
                };
            };
        };
    };

    // DCIN
    // 9.8mm w
    // 13.0mm l
    // 10.0mm h
    // 0.060"/1.5mm overhang
    // top is 12.0mm from bottom of board
    //   12.0-10.0-1.8 = 0.2
    // right side is 106.5mm right of left side of 1G RJ45
    //   106.5-9.8+2.0 = 98.7
    union() {
        translate([98.8-margin,-1.5-margin-2.0,boardHeight+0.4-margin]) {
            cube([10.0+(margin*2),13.0+(margin*2)+2.0,10.0+(margin*2)]);
        };
    };

    // TF
    // 14.3mm w
    // 14.8mm l
    // 0.082"/2.1mm h
    // top is 3.9mm above bottom of board
    // 3.9-2.1-1.8= 0.0
    // right side is 4.334"/110.1 from left side of board
    //   110.1-14.7 = 95.4
    // left side is 17.5 left of right side of board
    //   113.7-17.5 = 96.2
    // further side is 1.908"/48.5mm from nearer side of board
    //   48.5-14.8 = 33.7
    union() {
        translate([96.2-margin,33.6-margin,boardHeight-margin]) {
            cube([14.3+(margin*2),14.7+(margin*2),2.1+(margin*2)]);
        };
    };

    // CM4+heatsink
    // 2.162"/54.9mm w
    // 1.570"/39.9mm l
    // 0.628"/16.0mm h
    // right side 3.190"/81.0mm from left side
    // 81.0-54.9 = 26.1mm
    // further side 2.399"/60.9mm from near side
    // 60.9-39.9 = 21.0
    union() {
        translate([26.1-margin,21.0-margin,boardHeight-margin]) {
            cube([54.9+(margin*2),39.9+(margin*2),16.0+(margin*2)]);
        };
    };

    // NGFF M-Key slot for 2280 NVMe
    // 5.7mm w
    // 21.7mm l
    // 8.5mm h
    // 0.5 from further side of board
    union() {
        translate([24.4-margin,62.7-margin,boardHeight-margin]) {
            cube([5.7+(margin*2),21.7+(margin*2),8.5+(margin*2)]);
        };
    };

    // NGFF E-Key slot for WiFi
    // 21.7mm w
    // 7.2mm l
    // 4.1mm h
    // 79.2+24.4-21.7 = 81.9
    union() {
        translate([81.9-margin,76.4-margin,boardHeight-margin]) {
            cube([21.7+(margin*2),7.2+(margin*2),4.1+(margin*2)]);
        };
    };


    // RTL8125B
    // 5.6mm w
    // 5.6mm l
    // 1.3mm h
    // right side is 54.4mm from left side of board
    // 54.4-5.6 = 48.8
    // further edge is 38.8mm from nearer edge
    // 38.8-5.6 = 33.2
    union() {
        translate([48.8-margin,33.2-margin,-1.3-margin]) {
            cube([5.6+(margin*2),5.6+(margin*2),1.3+(margin*2)]);
        };
    };

    // ASM1806
    // 9.4mm w
    // 9.4mm l
    // 0.9mm h
    // right side is 47.0mm from left side of board
    // 47.0-9.4 = 37.5
    // further side is 76.2mm from nearer side of board
    // 76.2-9.4 = 66.8
    union() {
        translate([37.5-margin,67.0-margin,-0.9-margin]) {
            cube([9.4+(margin*2),9.4+(margin*2),0.9+(margin*2)]);
        };
    };

    // JMB585
    // 8.7mm w
    // 8.7mm l
    // 1.1mm h
    // right side is 80.6mm from left side of board
    // 80.6-8.7 = 71.9
    // nearer side is 77.5mm from nearer side of board
    // 77.5-8.7 = 68.8
    union() {
        translate([72.2-margin,68.3-margin,-1.1-margin]) {
            cube([9.0+(margin*2),9.0+(margin*2),1.1+(margin*2)]);
        };
    };

    // transformer near SATA5
    // 6.5mm w
    // 6.5mm l
    // 2.8mm h
    // 7.7mm from left side of board
    //   7.7-6.5 = 1.2
    // further side is 65.4mm from nearer side of board
    //   65.4-6.5 = 58.9
    union() {
        translate([1.1-margin,58.6-margin,-2.8-margin]) {
            cube([6.5+(margin*2),6.5+(margin*2),2.8+(margin*2)]);
        };
    };

    // transformer near SATA2
    // 4.9mm w
    // 4.9mm l
    // 2.8mm h
    // right side is 93.1mm from left side of board
    //   93.1-4.9 = 88.2
    // further side is 74.8mm from nearer side of board
    //   74.8-4.9 = 69.9
    union() {
        translate([88.7-margin,69.9-margin,-2.8-margin]) {
            cube([4.9+(margin*2),4.9+(margin*2),2.8+(margin*2)]);
        };
    };

    // transformer near SATA2
    // 4.9mm w
    // 4.9mm l
    // 2.8mm h
    // right side is 94.3mm from left side of board
    //   94.3-4.9 = 89.4
    // further side is 47.9mm from nearer side of board
    //   47.9-4.9 = 43.0
    union() {
        translate([89.8-margin,42.7-margin,-2.8-margin]) {
            cube([4.9+(margin*2),4.9+(margin*2),2.8+(margin*2)]);
        };
    };

    // MASKROM button opposite drive status LEDs
    // 0.069"/1.8mm wide
    // 0.048"/1.2mm long
    // right side is 1.984"/50.4mm from left side
    //   50.4-1.8 = 48.6
    // top is 0.067"/1.7mm above board
    union() {
        translate([48.3-margin,-margin,-margin]) {
            union() {
                translate([1.2,0,-1.7+0.4]) {
                    cube([1.6+(margin*2),1.2+(margin*2),0.8+(margin*2)]);
                }
                translate([0,1.2,-2.6+0.4]) {
                    cube([4.2+(margin*2),2.4+(margin*2),2.6+(margin*2)]);
                }
            };
        };
    };
    
    // unknown red LED near "ON" button
    // 1.74mm wide
    // 0.83mm long
    // 0.50mm high
    // left side is 80.58 left of Y-axis
    //   80.58-1.74 = 78.84
    // far side is 6.45mm from X-axis
    //   6.45-0.83 = 5.62
    union() {
        translate([78.84-margin,5.62-margin,-(0.50+(margin*2))]) {
            cube([1.74+(margin*2),0.84+(margin*2),0.50+(margin*2)]);
        };
    };

    // status LED opposite drive status LEDs
    // 0.071"/1.8mm wide
    // 0.067"/1.7mm long
    // 0.048"/1.2mm high
    // right side is 2.336"/59.3mm from left side
    // 59.3-1.8 = 57.5
    union() {
        translate([57.5-margin,0.0-margin,-1.2-margin]) {
            cube([1.8+(margin*2),1.7+(margin*2),1.2+(margin*2)]);
        };
    };

    // unknown ZIF slot near MASKROM button
    // 12.8mm wide
    // 4.6mm long
    // 2.8mm high
    // right side is 75.2 from left side
    //   75.2-12.8 = 62.4
    // far side is 9.4 from nearer side
    //   9.4-4.6 = 4.8
    union() {
        translate([62.4-margin,4.8-margin,-2.8-margin]) {
            cube([12.8+(margin*2),4.6+(margin*2),2.8+(margin*2)]);
        };
    };

    // activity LED 1
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 63.5mm from left side of board
    union() {
        translate([63.5-1.4-margin,boardLength-0.7+0.3-margin,-0.6-margin]) {
            cube([1.7+(margin*2),1.0+(margin*2),0.6+(margin*2)]);
        };
    };

    // activity LED 2
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 58.7mm from left side of board
    union() {
        translate([58.5-1.4-margin,boardLength-0.7+0.3-margin,-0.6-margin]) {
            cube([1.7+(margin*2),1.0+(margin*2),0.6+(margin*2)]);
        };
    };

    // activity LED 3
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is /53.7mm from left side of board
    union() {
        translate([53.5-1.4-margin,boardLength-0.7+0.3-margin,-0.6-margin]) {
            cube([1.7+(margin*2),1.0+(margin*2),0.6+(margin*2)]);
        };
    };

    // activity LED 4
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 48.5mm from left side of board
    union() {
        translate([48.5-1.4-margin,boardLength-0.7+0.3-margin,-0.6-margin]) {
            cube([1.7+(margin*2),1.0+(margin*2),0.6+(margin*2)]);
        };
    };

    // activity LED 5
    // 1.4mm w
    // 0.7mm l
    // 0.6mm h
    // 0.3mm overhang
    // right side is 43.5mm from left side of board
    union() {
        translate([43.5-1.4-margin,boardLength-0.7+0.3-margin,-0.6-margin]) {
            cube([1.7+(margin*2),1.0+(margin*2),0.6+(margin*2)]);
        };
    };

    // SATA1 port
    // right edge is 4.215"/107.1mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([90.1+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90])
            sata_laptop_receiver_smt_blank();

    // SATA2 port
    // right edge is 87.05 mm from left edge
    // far edge 62.42mm from near edge
    translate([68.9+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90+0.12])
            sata_laptop_receiver_smt_blank();

    // SATA3 port
    // right edge is 2.562"/65.1mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([47.3+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90+0.17])
            sata_laptop_receiver_smt_blank();

    // SATA4 port
    // right edge is 1.743"/44.3mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([25.8+22.32-(2*sataConnectorWidth),62.6-sataConnectorLength,0])
        rotate([0,180,-90])
            sata_laptop_receiver_smt_blank();

    // SATA5 port
    // right edge is 0.874"/22.2mm from left edge
    // far edge 2.428"/61.7mm from near edge
    translate([21.7-sataConnectorWidth,62.6-sataConnectorLength,0])
        rotate([0,180,-90])
            sata_laptop_receiver_smt_blank();
};

module radxa_taco_stands() {
    translate([0,0,0])
    union() {
        // standoffs
        // 17.9mm
        // d1 = 0.180"/4.6mm
        // d2 = 0.020"/5.1mm
        translate([9.8+m25standHoleRadius,23.09+m25standHoleRadius,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1,$fn=6);
                translate([0,0,0])
                    cylinder(h=standoffLength+2,d=2.3,$fn=16);
            };
        };
        translate([94.7+m25standHoleRadius,23.00+m25standHoleRadius,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1,$fn=6);
                translate([0,0,0])
                    cylinder(h=standoffLength+2,d=2.3,$fn=16);
            };
        };
        translate([108.90+m25standHoleRadius,79.92+m25standHoleRadius,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1,$fn=6);
                translate([0,0,0])
                    cylinder(h=standoffLength+2,d=2.3,$fn=16);
            };
        };
        translate([2.40+m25standHoleRadius,79.99+m25standHoleRadius,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1,$fn=6);
                translate([0,0,0])
                    cylinder(h=standoffLength+2,d=2.3,$fn=16);
            };
        };
    };
    
};

module radxa_taco_stands_blank() {
    translate([0,0,0])
    union() {
        // standoffs
        // 17.9mm
        // d1 = 0.180"/4.6mm
        // d2 = 0.020"/5.1mm
        translate([9.90+m25standHoleRadius-margin,23.13+m25standHoleRadius-margin,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1+margin*2,$fn=16);
                translate([0,0,-tinyLittleSmidgeon])
                    cylinder(h=standoffLength+tinyLittleSmidgeon*2,d=2.3,$fn=16);
            };
        };
        translate([94.81+m25standHoleRadius-margin,23.10+m25standHoleRadius-margin,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1+margin*2,$fn=16);
                translate([0,0,-tinyLittleSmidgeon])
                    cylinder(h=standoffLength+tinyLittleSmidgeon*2,d=2.3,$fn=16);
            };
        };
        translate([109.00+m25standHoleRadius-margin,80.02+m25standHoleRadius-margin,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1+margin*2,$fn=16);
                translate([0,0,-tinyLittleSmidgeon])
                    cylinder(h=standoffLength+tinyLittleSmidgeon*2,d=2.3,$fn=16);
            };
        };
        translate([2.50+m25standHoleRadius-margin,80.10+m25standHoleRadius-margin,boardHeight]) {
            difference() {
                cylinder(h=standoffLength,d=5.1+margin*2,$fn=16);
                translate([0,0,-tinyLittleSmidgeon])
                    cylinder(h=standoffLength+tinyLittleSmidgeon*2,d=2.3,$fn=16);
            };
        };
    };
    
};

module radxa_taco_drives() {
    
    // HDD in SATA1

    // 4.188"/106.4mm from buttom
    //   106.4 - 100.0 - 1.8 = 4.6
    // 3.17"/80.5mm from near
    //   80.5-69.9 = 10.6
    // 0.75 = X-offset of drive from SATA port
    translate([108.0-0.75,11.2,-4.6-hddWidth])
    rotate([0,-90,0])
    difference() {

        color("LightGray")
        translate([hddCornerRadius,hddCornerRadius,0]) {
            minkowski() {
                    cube([hddWidth-hddCornerRadius*2
                        ,hddLength-hddCornerRadius*2
                        ,hddHeight/2]);
                cylinder(h=hddHeight/2,r=hddCornerRadius,$fn=24);
            }
        };

        // bottom right
        translate([hddWidth-12.3-hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // bottom left
        translate([8.0+hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top left
        translate([8.0+hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        
        // 7.0mm away from near edge
        // 44.8mm long
        // 6.5mm wide
        // 5.3mm high
        translate([hddWidth-6.5,7.0,0.0])
            cube([6.5,44.8,5.3]);
    };

    // HDD in SATA2

    translate([87.0-0.75,11.2,-4.6-hddWidth])
    rotate([0,-90,0])
    difference() {

        color("LightGray")
        translate([hddCornerRadius,hddCornerRadius,0]) {
            minkowski() {
                    cube([hddWidth-hddCornerRadius*2
                        ,hddLength-hddCornerRadius*2
                        ,hddHeight/2]);
                cylinder(h=hddHeight/2,r=hddCornerRadius,$fn=24);
            }
        };

        // bottom right
        translate([hddWidth-12.3-hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // bottom left
        translate([8.0+hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top left
        translate([8.0+hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        
        // 7.0mm away from near edge
        // 44.8mm long
        // 6.5mm wide
        // 5.3mm high
        translate([hddWidth-6.5,7.0,0.0])
            cube([6.5,44.8,5.3]);
    };


    // HDD in SATA3

    translate([65.2-0.75,11.2,-4.6-hddWidth])
    rotate([0,-90,0])
    difference() {

        color("LightGray")
        translate([hddCornerRadius,hddCornerRadius,0]) {
            minkowski() {
                    cube([hddWidth-hddCornerRadius*2
                        ,hddLength-hddCornerRadius*2
                        ,hddHeight/2]);
                cylinder(h=hddHeight/2,r=hddCornerRadius,$fn=24);
            }
        };

        // bottom right
        translate([hddWidth-12.3-hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // bottom left
        translate([8.0+hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top left
        translate([8.0+hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        
        // 7.0mm away from near edge
        // 44.8mm long
        // 6.5mm wide
        // 5.3mm high
        translate([hddWidth-6.5,7.0,0.0])
            cube([6.5,44.8,5.3]);
    };


    // HDD in SATA4

    translate([43.7-0.75,11.2,-4.6-hddWidth])
    rotate([0,-90,0])
    difference() {

        color("LightGray")
        translate([hddCornerRadius,hddCornerRadius,0]) {
            minkowski() {
                    cube([hddWidth-hddCornerRadius*2
                        ,hddLength-hddCornerRadius*2
                        ,hddHeight/2]);
                cylinder(h=hddHeight/2,r=hddCornerRadius,$fn=24);
            }
        };

        // bottom right
        translate([hddWidth-12.3-hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // bottom left
        translate([8.0+hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top left
        translate([8.0+hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        
        // 7.0mm away from near edge
        // 44.8mm long
        // 6.5mm wide
        // 5.3mm high
        translate([hddWidth-6.5,7.0,0.0])
            cube([6.5,44.8,5.3]);
    };


    // HDD in SATA5

    // 4.236"/107.6mm from left
    // 4.188"/106.4mm from buttom
    //   106.4 - 100.0 - 1.8 = 4.6
    // 3.17"/80.5mm from near
    //   80.5-69.9 = 10.6
    translate([22.0-0.75,11.2,-4.6-hddWidth])
    rotate([0,-90,0])
    difference() {

        color("LightGray")
        translate([hddCornerRadius,hddCornerRadius,0]) {
            minkowski() {
                    cube([hddWidth-hddCornerRadius*2
                        ,hddLength-hddCornerRadius*2
                        ,hddHeight/2]);
                cylinder(h=hddHeight/2,r=hddCornerRadius,$fn=24);
            }
        };

        // bottom right
        translate([hddWidth-12.3-hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // bottom left
        translate([8.0+hddScrewHoleRadius,2.4+hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);

        // top left
        translate([8.0+hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0])
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        
        // 7.0mm away from near edge
        // 44.8mm long
        // 6.5mm wide
        // 5.3mm high
        translate([hddWidth-6.5,7.0,0.0])
            cube([6.5,44.8,5.3]);
    };
};

module radxa_taco() {
    radxa_taco_board();
    //radxa_taco_stands();
    radxa_taco_stands_blank();
    //radxa_taco_drives();
};

//radxa_taco();
//radxa_taco_board();
//radxa_taco_board_v2();
//radxa_taco_board_blank();
//radxa_taco_stands_blank();


