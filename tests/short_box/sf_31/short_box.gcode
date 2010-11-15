(beginning of start.txt)
G21 (set units to mm)
G90 (set positioning to absolute)
G92 X0 Y0 Z0 (set origin to current position)
M108 S255 (set extruder speed to maximum)
M104 S190 T0 (set extruder temperature)
M109 S135 T0 (set heated-build-platform temperature)
G1 X-54.0 Y-15.0 Z9.0 F3300.0 (move to waiting position)
M6 T0 (wait for tool to heat up)
(G04 P8500 (Wait t/1000 seconds)
M101 (Extruder on, forward)
G04 P6500 (Wait t/1000 seconds)
M103 (Extruder off)
(start wipe)
G1 X-54.0 Y15.0 Z9.0 F2000.0
G1 X-35.0 Y15.0 Z9.0 F2000.0
(end wipe)
(end of start.txt)
(<creation> skeinforge </creation>)
(<version> 10.09.21 </version>)
(<extruderInitialization>)
G90
G21
M103
(<craftTypeName> extrusion </craftTypeName>)
M105
(<bridgeWidthMultiplier> 1.0 </bridgeWidthMultiplier>)
(<decimalPlacesCarried> 3 </decimalPlacesCarried>)
(<layerThickness> 0.32 </layerThickness>)
(<threadSequenceString> loops perimeter infill </threadSequenceString>)
(<maximumZDrillFeedRatePerSecond> 8.0 </maximumZDrillFeedRatePerSecond>)
(<maximumZTravelFeedRatePerSecond> 8.0 </maximumZTravelFeedRatePerSecond>)
(<operatingFeedRatePerSecond> 42.25 </operatingFeedRatePerSecond>)
(<operatingFlowRate> 255.0 </operatingFlowRate>)
(<orbitalFeedRatePerSecond> 21.125 </orbitalFeedRatePerSecond>)
(<travelFeedRatePerSecond> 10.0 </travelFeedRatePerSecond>)
(<coolingRate> 3.0 </coolingRate>)
(<heatingRate> 10.0 </heatingRate>)
(<baseTemperature> 185.0 </baseTemperature>)
(<interfaceTemperature> 185.0 </interfaceTemperature>)
(<objectFirstLayerInfillTemperature> 185.0 </objectFirstLayerInfillTemperature>)
(<objectFirstLayerPerimeterTemperature> 185.0 </objectFirstLayerPerimeterTemperature>)
(<objectNextLayersTemperature> 190.0 </objectNextLayersTemperature>)
(<supportLayersTemperature> 180.0 </supportLayersTemperature>)
(<supportedLayersTemperature> 180.0 </supportedLayersTemperature>)
(<perimeterWidth> 0.448 </perimeterWidth>)
(<profileName> ABS </profileName>)
(<procedureDone> carve </procedureDone>)
(<procedureDone> preface </procedureDone>)
(<procedureDone> inset </procedureDone>)
(<procedureDone> fill </procedureDone>)
(<procedureDone> speed </procedureDone>)
(<procedureDone> temperature </procedureDone>)
(<procedureDone> raft </procedureDone>)
(<procedureDone> jitter </procedureDone>)
(<procedureDone> clip </procedureDone>)
(<procedureDone> export </procedureDone>)
(</extruderInitialization>)
(<extrusion>)
M113 S1.0
M108 S255.0
M104 S185.0
(<layer> 0.16 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z0.16 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z0.16 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z0.16 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z0.16 </boundaryPoint>)
(<loop> outer )
M108 S255.0
G1 X4.31 Y0.33 Z0.16 F600.0
M101
G1 X4.31 Y4.31 Z0.16 F760.5
G1 X-4.31 Y4.31 Z0.16 F760.5
G1 X-4.31 Y-4.31 Z0.16 F760.5
G1 X4.31 Y-4.31 Z0.16 F760.5
G1 X4.31 Y-0.12 Z0.16 F760.5
(</loop>)
(<perimeter> outer )
G1 X4.78 Y0.22 Z0.16 F507.0
G1 X4.78 Y4.78 Z0.16 F507.0
G1 X-4.78 Y4.78 Z0.16 F507.0
G1 X-4.78 Y-4.78 Z0.16 F507.0
G1 X4.78 Y-4.78 Z0.16 F507.0
G1 X4.78 Y-0.22 Z0.16 F507.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X3.9 Y3.84 Z0.16 F180.0
M101
G1 X-3.9 Y3.84 Z0.16 F760.5
G1 X-3.9 Y3.36 Z0.16 F760.5
G1 X3.9 Y3.36 Z0.16 F760.5
G1 X3.9 Y2.88 Z0.16 F760.5
G1 X-3.9 Y2.88 Z0.16 F760.5
G1 X-3.9 Y2.4 Z0.16 F760.5
G1 X3.9 Y2.4 Z0.16 F760.5
G1 X3.9 Y1.92 Z0.16 F760.5
G1 X-3.9 Y1.92 Z0.16 F760.5
G1 X-3.9 Y1.44 Z0.16 F760.5
G1 X3.9 Y1.44 Z0.16 F760.5
G1 X3.9 Y0.96 Z0.16 F760.5
G1 X-3.9 Y0.96 Z0.16 F760.5
G1 X-3.9 Y0.48 Z0.16 F760.5
G1 X3.9 Y0.48 Z0.16 F760.5
G1 X3.9 Y-0.0 Z0.16 F760.5
G1 X-3.9 Y0.0 Z0.16 F760.5
G1 X-3.9 Y-0.48 Z0.16 F760.5
G1 X3.9 Y-0.48 Z0.16 F760.5
G1 X3.9 Y-0.96 Z0.16 F760.5
G1 X-3.9 Y-0.96 Z0.16 F760.5
G1 X-3.9 Y-1.44 Z0.16 F760.5
G1 X3.9 Y-1.44 Z0.16 F760.5
G1 X3.9 Y-1.92 Z0.16 F760.5
G1 X-3.9 Y-1.92 Z0.16 F760.5
G1 X-3.9 Y-2.4 Z0.16 F760.5
G1 X3.9 Y-2.4 Z0.16 F760.5
G1 X3.9 Y-2.88 Z0.16 F760.5
G1 X-3.9 Y-2.88 Z0.16 F760.5
G1 X-3.9 Y-3.36 Z0.16 F760.5
G1 X3.9 Y-3.36 Z0.16 F760.5
G1 X3.9 Y-3.84 Z0.16 F760.5
G1 X-3.9 Y-3.84 Z0.16 F760.5
M103
(</surroundingLoop>)
(</layer>)
(<layer> 0.48 )
M104 S190.0
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z0.48 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z0.48 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z0.48 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z0.48 </boundaryPoint>)
(<loop> outer )
G1 X-3.83 Y-3.82 Z0.48 F492.914
M101
G1 X-3.83 Y-3.83 Z0.48 F2535.0
G1 X3.83 Y-3.83 Z0.48 F2535.0
G1 X3.83 Y3.83 Z0.48 F2535.0
G1 X-3.83 Y3.83 Z0.48 F2535.0
G1 X-3.83 Y-3.37 Z0.48 F2535.0
(</loop>)
(<loop> outer )
G1 X-4.31 Y-3.82 Z0.48 F2535.0
G1 X-4.31 Y-4.31 Z0.48 F2535.0
G1 X4.31 Y-4.31 Z0.48 F2535.0
G1 X4.31 Y4.31 Z0.48 F2535.0
G1 X-4.31 Y4.31 Z0.48 F2535.0
G1 X-4.31 Y-3.37 Z0.48 F2535.0
(</loop>)
(<perimeter> outer )
G1 X-4.78 Y-3.82 Z0.48 F2535.0
G1 X-4.78 Y-4.78 Z0.48 F2535.0
G1 X4.78 Y-4.78 Z0.48 F2535.0
G1 X4.78 Y4.78 Z0.48 F2535.0
G1 X-4.78 Y4.78 Z0.48 F2535.0
G1 X-4.78 Y-3.37 Z0.48 F2535.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.36 Y3.42 Z0.48 F600.0
M101
G1 X-3.36 Y-3.42 Z0.48 F2535.0
G1 X-2.88 Y-3.42 Z0.48 F2535.0
G1 X-2.88 Y3.42 Z0.48 F2535.0
G1 X-2.4 Y3.42 Z0.48 F2535.0
G1 X-2.4 Y-3.42 Z0.48 F2535.0
G1 X-1.92 Y-3.42 Z0.48 F2535.0
G1 X-1.92 Y3.42 Z0.48 F2535.0
G1 X-1.44 Y3.42 Z0.48 F2535.0
G1 X-1.44 Y-3.42 Z0.48 F2535.0
G1 X-0.96 Y-3.42 Z0.48 F2535.0
G1 X-0.96 Y3.42 Z0.48 F2535.0
G1 X-0.48 Y3.42 Z0.48 F2535.0
G1 X-0.48 Y-3.42 Z0.48 F2535.0
G1 X-0.0 Y-3.42 Z0.48 F2535.0
G1 X0.0 Y3.42 Z0.48 F2535.0
G1 X0.48 Y3.42 Z0.48 F2535.0
G1 X0.48 Y-3.42 Z0.48 F2535.0
G1 X0.96 Y-3.42 Z0.48 F2535.0
G1 X0.96 Y3.42 Z0.48 F2535.0
G1 X1.44 Y3.42 Z0.48 F2535.0
G1 X1.44 Y-3.42 Z0.48 F2535.0
G1 X1.92 Y-3.42 Z0.48 F2535.0
G1 X1.92 Y3.42 Z0.48 F2535.0
G1 X2.4 Y3.42 Z0.48 F2535.0
G1 X2.4 Y-3.42 Z0.48 F2535.0
G1 X2.88 Y-3.42 Z0.48 F2535.0
G1 X2.88 Y3.42 Z0.48 F2535.0
G1 X3.36 Y3.42 Z0.48 F2535.0
G1 X3.36 Y-3.42 Z0.48 F2535.0
M103
(</surroundingLoop>)
(</layer>)
(<operatingLayerEnd> </operatingLayerEnd>)
(<layer> 0.8 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z0.8 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z0.8 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z0.8 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z0.8 </boundaryPoint>)
(<loop> outer )
G1 X3.9 Y-4.31 Z0.8 F600.0
M101
G1 X4.31 Y-4.31 Z0.8 F2535.0
G1 X4.31 Y4.31 Z0.8 F2535.0
G1 X-4.31 Y4.31 Z0.8 F2535.0
G1 X-4.31 Y-4.31 Z0.8 F2535.0
G1 X3.45 Y-4.31 Z0.8 F2535.0
(</loop>)
(<perimeter> outer )
G1 X3.9 Y-4.78 Z0.8 F2535.0
G1 X4.78 Y-4.78 Z0.8 F2535.0
G1 X4.78 Y4.78 Z0.8 F2535.0
G1 X-4.78 Y4.78 Z0.8 F2535.0
G1 X-4.78 Y-4.78 Z0.8 F2535.0
G1 X3.45 Y-4.78 Z0.8 F2535.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X3.9 Y3.84 Z0.8 F600.0
M101
G1 X-3.9 Y3.84 Z0.8 F2535.0
G1 X-3.9 Y3.36 Z0.8 F2535.0
G1 X3.9 Y3.36 Z0.8 F2535.0
G1 X3.9 Y2.88 Z0.8 F2535.0
G1 X-3.9 Y2.88 Z0.8 F2535.0
G1 X-3.9 Y2.4 Z0.8 F2535.0
G1 X3.9 Y2.4 Z0.8 F2535.0
G1 X3.9 Y1.92 Z0.8 F2535.0
G1 X-3.9 Y1.92 Z0.8 F2535.0
G1 X-3.9 Y1.44 Z0.8 F2535.0
G1 X3.9 Y1.44 Z0.8 F2535.0
G1 X3.9 Y0.96 Z0.8 F2535.0
G1 X-3.9 Y0.96 Z0.8 F2535.0
G1 X-3.9 Y0.48 Z0.8 F2535.0
G1 X3.9 Y0.48 Z0.8 F2535.0
G1 X3.9 Y-0.0 Z0.8 F2535.0
G1 X-3.9 Y0.0 Z0.8 F2535.0
G1 X-3.9 Y-0.48 Z0.8 F2535.0
G1 X3.9 Y-0.48 Z0.8 F2535.0
G1 X3.9 Y-0.96 Z0.8 F2535.0
G1 X-3.9 Y-0.96 Z0.8 F2535.0
G1 X-3.9 Y-1.44 Z0.8 F2535.0
G1 X3.9 Y-1.44 Z0.8 F2535.0
G1 X3.9 Y-1.92 Z0.8 F2535.0
G1 X-3.9 Y-1.92 Z0.8 F2535.0
G1 X-3.9 Y-2.4 Z0.8 F2535.0
G1 X3.9 Y-2.4 Z0.8 F2535.0
G1 X3.9 Y-2.88 Z0.8 F2535.0
G1 X-3.9 Y-2.88 Z0.8 F2535.0
G1 X-3.9 Y-3.36 Z0.8 F2535.0
G1 X3.9 Y-3.36 Z0.8 F2535.0
G1 X3.9 Y-3.84 Z0.8 F2535.0
G1 X-3.9 Y-3.84 Z0.8 F2535.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 1.12 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z1.12 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z1.12 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z1.12 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z1.12 </boundaryPoint>)
(<loop> outer )
G1 X-3.63 Y-3.83 Z1.12 F600.0
M101
G1 X3.83 Y-3.83 Z1.12 F2535.0
G1 X3.83 Y3.83 Z1.12 F2535.0
G1 X-3.83 Y3.83 Z1.12 F2535.0
G1 X-3.83 Y-3.58 Z1.12 F2535.0
(</loop>)
(<loop> outer )
G1 X-4.31 Y-4.06 Z1.12 F2535.0
G1 X-4.31 Y-4.31 Z1.12 F2535.0
G1 X4.31 Y-4.31 Z1.12 F2535.0
G1 X4.31 Y4.31 Z1.12 F2535.0
G1 X-4.31 Y4.31 Z1.12 F2535.0
G1 X-4.31 Y-3.61 Z1.12 F2535.0
(</loop>)
(<perimeter> outer )
G1 X-4.78 Y-4.06 Z1.12 F2535.0
G1 X-4.78 Y-4.78 Z1.12 F2535.0
G1 X4.78 Y-4.78 Z1.12 F2535.0
G1 X4.78 Y4.78 Z1.12 F2535.0
G1 X-4.78 Y4.78 Z1.12 F2535.0
G1 X-4.78 Y-3.61 Z1.12 F2535.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.36 Y3.42 Z1.12 F600.0
M101
G1 X-3.36 Y-3.42 Z1.12 F2535.0
G1 X-2.88 Y-3.42 Z1.12 F2535.0
G1 X-2.88 Y3.42 Z1.12 F2535.0
G1 X-2.4 Y3.42 Z1.12 F2535.0
G1 X-2.4 Y-3.42 Z1.12 F2535.0
G1 X-1.92 Y-3.42 Z1.12 F2535.0
G1 X-1.92 Y3.42 Z1.12 F2535.0
G1 X-1.44 Y3.42 Z1.12 F2535.0
G1 X-1.44 Y-3.42 Z1.12 F2535.0
G1 X-0.96 Y-3.42 Z1.12 F2535.0
G1 X-0.96 Y3.42 Z1.12 F2535.0
G1 X-0.48 Y3.42 Z1.12 F2535.0
G1 X-0.48 Y-3.42 Z1.12 F2535.0
G1 X-0.0 Y-3.42 Z1.12 F2535.0
G1 X0.0 Y3.42 Z1.12 F2535.0
G1 X0.48 Y3.42 Z1.12 F2535.0
G1 X0.48 Y-3.42 Z1.12 F2535.0
G1 X0.96 Y-3.42 Z1.12 F2535.0
G1 X0.96 Y3.42 Z1.12 F2535.0
G1 X1.44 Y3.42 Z1.12 F2535.0
G1 X1.44 Y-3.42 Z1.12 F2535.0
G1 X1.92 Y-3.42 Z1.12 F2535.0
G1 X1.92 Y3.42 Z1.12 F2535.0
G1 X2.4 Y3.42 Z1.12 F2535.0
G1 X2.4 Y-3.42 Z1.12 F2535.0
G1 X2.88 Y-3.42 Z1.12 F2535.0
G1 X2.88 Y3.42 Z1.12 F2535.0
G1 X3.36 Y3.42 Z1.12 F2535.0
G1 X3.36 Y-3.42 Z1.12 F2535.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 1.44 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z1.44 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z1.44 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z1.44 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z1.44 </boundaryPoint>)
(<loop> outer )
G1 X3.22 Y-4.31 Z1.44 F600.0
M101
G1 X4.31 Y-4.31 Z1.44 F2535.0
G1 X4.31 Y4.31 Z1.44 F2535.0
G1 X-4.31 Y4.31 Z1.44 F2535.0
G1 X-4.31 Y-4.31 Z1.44 F2535.0
G1 X2.77 Y-4.31 Z1.44 F2535.0
(</loop>)
(<perimeter> outer )
G1 X3.22 Y-4.78 Z1.44 F2535.0
G1 X4.78 Y-4.78 Z1.44 F2535.0
G1 X4.78 Y4.78 Z1.44 F2535.0
G1 X-4.78 Y4.78 Z1.44 F2535.0
G1 X-4.78 Y-4.78 Z1.44 F2535.0
G1 X2.77 Y-4.78 Z1.44 F2535.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X3.9 Y3.84 Z1.44 F600.0
M101
G1 X-3.9 Y3.84 Z1.44 F2535.0
G1 X-3.9 Y3.36 Z1.44 F2535.0
G1 X3.9 Y3.36 Z1.44 F2535.0
G1 X3.9 Y2.88 Z1.44 F2535.0
G1 X-3.9 Y2.88 Z1.44 F2535.0
G1 X-3.9 Y2.4 Z1.44 F2535.0
G1 X3.9 Y2.4 Z1.44 F2535.0
G1 X3.9 Y1.92 Z1.44 F2535.0
G1 X-3.9 Y1.92 Z1.44 F2535.0
G1 X-3.9 Y1.44 Z1.44 F2535.0
G1 X3.9 Y1.44 Z1.44 F2535.0
G1 X3.9 Y0.96 Z1.44 F2535.0
G1 X-3.9 Y0.96 Z1.44 F2535.0
G1 X-3.9 Y0.48 Z1.44 F2535.0
G1 X3.9 Y0.48 Z1.44 F2535.0
G1 X3.9 Y-0.0 Z1.44 F2535.0
G1 X-3.9 Y0.0 Z1.44 F2535.0
G1 X-3.9 Y-0.48 Z1.44 F2535.0
G1 X3.9 Y-0.48 Z1.44 F2535.0
G1 X3.9 Y-0.96 Z1.44 F2535.0
G1 X-3.9 Y-0.96 Z1.44 F2535.0
G1 X-3.9 Y-1.44 Z1.44 F2535.0
G1 X3.9 Y-1.44 Z1.44 F2535.0
G1 X3.9 Y-1.92 Z1.44 F2535.0
G1 X-3.9 Y-1.92 Z1.44 F2535.0
G1 X-3.9 Y-2.4 Z1.44 F2535.0
G1 X3.9 Y-2.4 Z1.44 F2535.0
G1 X3.9 Y-2.88 Z1.44 F2535.0
G1 X-3.9 Y-2.88 Z1.44 F2535.0
G1 X-3.9 Y-3.36 Z1.44 F2535.0
G1 X3.9 Y-3.36 Z1.44 F2535.0
G1 X3.9 Y-3.84 Z1.44 F2535.0
G1 X-3.9 Y-3.84 Z1.44 F2535.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 1.76 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z1.76 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z1.76 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z1.76 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z1.76 </boundaryPoint>)
(<loop> outer )
G1 X-3.42 Y-3.83 Z1.76 F600.0
M101
G1 X3.83 Y-3.83 Z1.76 F2535.0
G1 X3.83 Y3.83 Z1.76 F2535.0
G1 X-3.83 Y3.83 Z1.76 F2535.0
G1 X-3.83 Y-3.79 Z1.76 F2535.0
(</loop>)
(<loop> outer )
G1 X-3.42 Y-4.31 Z1.76 F2535.0
G1 X4.31 Y-4.31 Z1.76 F2535.0
G1 X4.31 Y4.31 Z1.76 F2535.0
G1 X-4.31 Y4.31 Z1.76 F2535.0
G1 X-4.31 Y-4.31 Z1.76 F2535.0
G1 X-3.87 Y-4.31 Z1.76 F2535.0
(</loop>)
(<perimeter> outer )
G1 X-3.42 Y-4.78 Z1.76 F2535.0
G1 X4.78 Y-4.78 Z1.76 F2535.0
G1 X4.78 Y4.78 Z1.76 F2535.0
G1 X-4.78 Y4.78 Z1.76 F2535.0
G1 X-4.78 Y-4.78 Z1.76 F2535.0
G1 X-3.87 Y-4.78 Z1.76 F2535.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.36 Y3.42 Z1.76 F600.0
M101
G1 X-3.36 Y-3.42 Z1.76 F2535.0
G1 X-2.88 Y-3.42 Z1.76 F2535.0
G1 X-2.88 Y3.42 Z1.76 F2535.0
G1 X-2.4 Y3.42 Z1.76 F2535.0
G1 X-2.4 Y-3.42 Z1.76 F2535.0
G1 X-1.92 Y-3.42 Z1.76 F2535.0
G1 X-1.92 Y3.42 Z1.76 F2535.0
G1 X-1.44 Y3.42 Z1.76 F2535.0
G1 X-1.44 Y-3.42 Z1.76 F2535.0
G1 X-0.96 Y-3.42 Z1.76 F2535.0
G1 X-0.96 Y3.42 Z1.76 F2535.0
G1 X-0.48 Y3.42 Z1.76 F2535.0
G1 X-0.48 Y-3.42 Z1.76 F2535.0
G1 X-0.0 Y-3.42 Z1.76 F2535.0
G1 X0.0 Y3.42 Z1.76 F2535.0
G1 X0.48 Y3.42 Z1.76 F2535.0
G1 X0.48 Y-3.42 Z1.76 F2535.0
G1 X0.96 Y-3.42 Z1.76 F2535.0
G1 X0.96 Y3.42 Z1.76 F2535.0
G1 X1.44 Y3.42 Z1.76 F2535.0
G1 X1.44 Y-3.42 Z1.76 F2535.0
G1 X1.92 Y-3.42 Z1.76 F2535.0
G1 X1.92 Y3.42 Z1.76 F2535.0
G1 X2.4 Y3.42 Z1.76 F2535.0
G1 X2.4 Y-3.42 Z1.76 F2535.0
G1 X2.88 Y-3.42 Z1.76 F2535.0
G1 X2.88 Y3.42 Z1.76 F2535.0
G1 X3.36 Y3.42 Z1.76 F2535.0
G1 X3.36 Y-3.42 Z1.76 F2535.0
M103
(</surroundingLoop>)
(</layer>)
(</extrusion>)
M104 S0
M103
(Beginning of end.txt)
M109 S95 T0 (set heated-build-platform temperature)
G1 X0.0 Y54.0 Z1.76 F600.0
M102 (Extruder on, reverse)
G04 P2000 (Wait t/1000 seconds)
M103 (Extruder off)
G04 P90000 (wait t/1000 seconds)
M106 (conveyor on)
G04 P2000 (wait t/1000 seconds)
M104 S180 T0 (set extruder temperature)
M109 S130 T0 (set heated-build-platform temperature)
G04 P7000 (wait t/1000 seconds)
M107 (conveyor off)
(start wipe)
G1 X-53.0 Y-15.5 Z9.0 F600.0
G1 X-53.0 Y0.0 Z9.0 F600.0
G1 X-53.0 Y15.5 Z9.0 F600.0
(end wipe)
G1 X0.0 Y0.0 Z9.0 F600.0
G1 X0.0 Y0.0 Z0.0 F480.0
M104 S0 T0 (set extruder temperature)
M109 S0 T0 (set heated-build-platform temperature)
(end of end.txt)
M113 S0.0
