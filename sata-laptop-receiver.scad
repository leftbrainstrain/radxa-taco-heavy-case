
sataConnectorLength = 43.55;
sataConnectorWidth = 4.82;

sataConnectorLateralMargin = 0.6;
sataConnectorVerticalMargin = 0.4;

module sata_laptop_receiver_smt() {
    union() {
        // 3.77mm w
        // 4.84mm l
        // 1.45mm h
        cube([3.77,4.82,1.45]);

        // 3.80mm w
        // 3.42mm l
        // 2.90mm h
        translate([0,0.71,0])
            cube([3.77,3.42,2.90]);

        translate([43.57-3.77,0,0])
            cube([3.77,4.82,1.45]);

        translate([43.57-3.77,0.71,0])
            cube([3.77,3.42,2.90]);

        translate([3.75,0.71,1.45])
            cube([36.05,3.42,7.95]);

        translate([1.90,1.4,0.0])
            cube([1.85,1.96,10.56]);

        // 36.0+3.75 = 39.75
        translate([39.80,1.4,0.0])
            cube([1.85,1.96,10.56]);
    };
};

module sata_laptop_receiver_smt_blank() {
    union() {
        cube([43.55,4.82,1.45]);

        translate([0.0,0.71,1.45])
            cube([43.55,3.42,11.0]);
    };
};

//sata_laptop_receiver_smt_blank();
