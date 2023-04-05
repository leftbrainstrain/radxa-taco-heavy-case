
include <radxa-taco-variables.scad>;

margin = 0.1;

// add/remove a tiny amount to/from dimension in order to
// avoid coplanar surfaces that show up weird in preview
tinyLittleSmidgeon = 0.001;

m3ScrewHeadDiameter = 6.0;
m3ScrewHeadRadius = m3ScrewHeadDiameter/2.0;

m3standHoleDiameter = 3.2;
m3standHoleRadius = standHoleDiameter/2.0;


cornerRadius = 2.0; // guesstimate
caseCornerRadius = 3.0;

caseVerticalThickness = 2.0;
//caseLateralThickness = 1.5;
caseLateralThickness = 2.0;

supportTopHeight = sataDriveClearance;
//supportTopHeight = 3.5;
//supportTopHeight = 10.0;

// max height component (other than SATA plug) is
//    transformer that is 2.8mm tall
// created holes for transformers
boardBottomClearance = 2.7;
plateBoardClearance = 2.7;

// top of case bottom z-distance below surface of board
// standoff = 18mm
// button center z = 2.9
// button dia = 3.1
// ==> button rad = 1.65
// 18mm - 2.9 - 1.65 = 13.45
// = 13.85;
baseBoardClearance = 13.8+margin;

baseSideVentWidth = 1.0;
baseSideVentLength = 7.5;
baseSideVentEndRadius = baseSideVentWidth/2.0;

// top of case bottom z-distance below surface of board
// standoff = 18mm
// button center z = 2.9
// button dia = 3.1
// ==> button rad = 1.65
// 18mm - 2.9 - 1.65 = 13.45
shroudBoardBottomClearance = 13.6-margin;

upperSideVentWidth = 1.0;
upperSideVentLength = 13.4;
upperSideVentEndRadius = upperSideVentWidth/2.0;

hddWidth = 100.0;
hddLength = 70.0;
//hddHeight = 6.5;
hddHeight = 7.0;
//hddHeight = 15.0;
hddHeightClearance = 15.0;
//hddHeightClearance = 9.0;
hddCornerRadius = 1.0;
hddScrewHoleRadius = 1.5; // M3

driveTrayVerticalThickness = 2.0;
driveTrayLateralThickness = 2.0;
