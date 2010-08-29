G21 ;metric is good!
G90 ;absolute positioning
T0; select new extruder
M104 S200
G92 E0 ;zero the extruded length
G1 Z8.0 F90.0 ;clear the bolt heads
G28 Y0 ;go home
G28 X0
G1 X135.0 F3000.0
G28 Z0
G92 Z0 ;Adjust Z height for optimum 1st layer adhesion
G1 Z8.0 F90.0
M109 S210
M113 S0.75
G1 Z0.4 F90.0
G1 X10.0 E360 F1500.0
G92 E0
(<creation> skeinforge </creation>)
(<version> 10.08.19 </version>)
(<extruderInitialization>)
G90
G21
M103
(<craftTypeName> extrusion </craftTypeName>)
M105
(<bridgeWidthMultiplier> 1.0 </bridgeWidthMultiplier>)
(<decimalPlacesCarried> 3 </decimalPlacesCarried>)
(<layerThickness> 0.36 </layerThickness>)
(<threadSequenceString> loops perimeter infill </threadSequenceString>)
(<maximumZDrillFeedRatePerSecond> 8.0 </maximumZDrillFeedRatePerSecond>)
(<maximumZTravelFeedRatePerSecond> 8.0 </maximumZTravelFeedRatePerSecond>)
(<operatingFeedRatePerSecond> 29.0 </operatingFeedRatePerSecond>)
(<operatingFlowRate> 255.0 </operatingFlowRate>)
(<orbitalFeedRatePerSecond> 14.5 </orbitalFeedRatePerSecond>)
(<travelFeedRatePerSecond> 55.0 </travelFeedRatePerSecond>)
(<coolingRate> 3.0 </coolingRate>)
(<heatingRate> 10.0 </heatingRate>)
(<baseTemperature> 200.0 </baseTemperature>)
(<interfaceTemperature> 190.0 </interfaceTemperature>)
(<objectFirstLayerInfillTemperature> 190.0 </objectFirstLayerInfillTemperature>)
(<objectFirstLayerPerimeterTemperature> 190.0 </objectFirstLayerPerimeterTemperature>)
(<objectNextLayersTemperature> 190.0 </objectNextLayersTemperature>)
(<supportLayersTemperature> 190.0 </supportLayersTemperature>)
(<supportedLayersTemperature> 190.0 </supportedLayersTemperature>)
(<perimeterWidth> 0.576 </perimeterWidth>)
(<profileName> ABS </profileName>)
(<procedureDone> carve </procedureDone>)
(<procedureDone> preface </procedureDone>)
(<procedureDone> inset </procedureDone>)
(<procedureDone> fill </procedureDone>)
(<procedureDone> speed </procedureDone>)
(<procedureDone> temperature </procedureDone>)
(<procedureDone> raft </procedureDone>)
(<procedureDone> chamber </procedureDone>)
(<procedureDone> jitter </procedureDone>)
(<procedureDone> clip </procedureDone>)
(<procedureDone> unpause </procedureDone>)
(<procedureDone> export </procedureDone>)
(</extruderInitialization>)
(<extrusion>)
M140 S60.0
M141 S30.0
M142 S0.0
M113 S1.0
M108 S255.0
M104 S200.0
(<layer> 0.648 )
M108 S255.0
G1 X-9.22 Y-8.12 Z0.65 F435.0
M101
G1 X-9.22 Y6.97 Z0.65 F440.931
G1 X-6.91 Y8.12 Z0.65 F472.213
G1 X-6.91 Y-8.12 Z0.65 F440.505
G1 X-4.61 Y-8.12 Z0.65 F477.03
G1 X-4.61 Y8.12 Z0.65 F440.505
G1 X-2.3 Y8.12 Z0.65 F477.03
G1 X-2.3 Y-8.12 Z0.65 F440.505
G1 X0.0 Y-8.12 Z0.65 F477.03
G1 X0.0 Y8.12 Z0.65 F440.505
G1 X2.3 Y8.12 Z0.65 F477.03
G1 X2.3 Y-8.12 Z0.65 F440.505
G1 X4.61 Y-8.12 Z0.65 F477.03
G1 X4.61 Y8.12 Z0.65 F440.505
G1 X6.91 Y8.12 Z0.65 F477.03
G1 X6.91 Y-8.12 Z0.65 F440.505
G1 X9.22 Y-8.12 Z0.65 F477.03
G1 X9.22 Y8.12 Z0.65 F440.505
M103
M104 S190.0
(</layer>)
(<layer> 1.062 )
G1 X-9.24 Y0.0 Z1.06 F1812.976
M101
G1 X9.24 Y0.0 Z1.06 F1819.923
G1 X9.24 Y-1.15 Z1.06 F1914.0
G1 X-9.24 Y-1.15 Z1.06 F1819.923
G1 X-9.24 Y-2.3 Z1.06 F1914.0
G1 X9.24 Y-2.3 Z1.06 F1819.923
G1 X9.24 Y-3.46 Z1.06 F1914.0
G1 X-9.24 Y-3.46 Z1.06 F1819.923
G1 X-9.24 Y-4.61 Z1.06 F1914.0
G1 X9.24 Y-4.61 Z1.06 F1819.923
G1 X9.24 Y-5.76 Z1.06 F1914.0
G1 X-9.24 Y-5.76 Z1.06 F1819.923
G1 X-9.24 Y-6.91 Z1.06 F1914.0
G1 X9.24 Y-6.91 Z1.06 F1819.923
G1 X9.24 Y-8.06 Z1.06 F1914.0
G1 X-9.24 Y-8.06 Z1.06 F1819.923
M103
G1 X-9.24 Y1.15 Z1.06 F1908.12
M101
G1 X9.24 Y1.15 Z1.06 F1819.923
G1 X9.24 Y2.3 Z1.06 F1914.0
G1 X-9.24 Y2.3 Z1.06 F1819.923
G1 X-9.24 Y3.46 Z1.06 F1914.0
G1 X9.24 Y3.46 Z1.06 F1819.923
G1 X9.24 Y4.61 Z1.06 F1914.0
G1 X-9.24 Y4.61 Z1.06 F1819.923
G1 X-9.24 Y5.76 Z1.06 F1914.0
G1 X9.24 Y5.76 Z1.06 F1819.923
G1 X9.24 Y6.91 Z1.06 F1914.0
G1 X-9.24 Y6.91 Z1.06 F1819.923
G1 X-6.94 Y8.06 Z1.06 F1914.0
G1 X9.24 Y8.06 Z1.06 F1831.901
M103
(</layer>)
(<layer> 1.422 )
G1 X-9.24 Y0.0 Z1.42 F1812.967
M101
G1 X9.24 Y0.0 Z1.42 F1819.923
G1 X9.24 Y-1.15 Z1.42 F1914.0
G1 X-9.24 Y-1.15 Z1.42 F1819.923
G1 X-9.24 Y-2.3 Z1.42 F1914.0
G1 X9.24 Y-2.3 Z1.42 F1819.923
G1 X9.24 Y-3.46 Z1.42 F1914.0
G1 X-9.24 Y-3.46 Z1.42 F1819.923
G1 X-9.24 Y-4.61 Z1.42 F1914.0
G1 X9.24 Y-4.61 Z1.42 F1819.923
G1 X9.24 Y-5.76 Z1.42 F1914.0
G1 X-9.24 Y-5.76 Z1.42 F1819.923
G1 X-9.24 Y-6.91 Z1.42 F1914.0
G1 X9.24 Y-6.91 Z1.42 F1819.923
G1 X9.24 Y-8.06 Z1.42 F1914.0
G1 X-9.24 Y-8.06 Z1.42 F1819.923
M103
G1 X-9.24 Y1.15 Z1.42 F1908.12
M101
G1 X9.24 Y1.15 Z1.42 F1819.923
G1 X9.24 Y2.3 Z1.42 F1914.0
G1 X-9.24 Y2.3 Z1.42 F1819.923
G1 X-9.24 Y3.46 Z1.42 F1914.0
G1 X9.24 Y3.46 Z1.42 F1819.923
G1 X9.24 Y4.61 Z1.42 F1914.0
G1 X-9.24 Y4.61 Z1.42 F1819.923
G1 X-9.24 Y5.76 Z1.42 F1914.0
G1 X9.24 Y5.76 Z1.42 F1819.923
G1 X9.24 Y6.91 Z1.42 F1914.0
G1 X-9.24 Y6.91 Z1.42 F1819.923
G1 X-6.94 Y8.06 Z1.42 F1914.0
G1 X9.24 Y8.06 Z1.42 F1831.901
M103
(</layer>)
(<raftLayerEnd> </raftLayerEnd>)
(<layer> 1.8 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z1.8 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-4.476 Y5.0 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y4.827 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z1.8 </boundaryPoint>)
(<loop> inner )
G1 X3.35 Y3.09 Z1.8 F3630.0
M101
G1 X3.35 Y-3.35 Z1.8 F1914.0
G1 X-3.35 Y-3.35 Z1.8 F1914.0
G1 X-3.35 Y3.35 Z1.8 F1914.0
G1 X3.03 Y3.35 Z1.8 F1914.0
(</loop>)
(<loop> outer )
G1 X3.6 Y4.15 Z1.8 F1914.0
G1 X4.15 Y4.15 Z1.8 F1914.0
G1 X4.15 Y-4.15 Z1.8 F1914.0
G1 X-4.15 Y-4.15 Z1.8 F1914.0
G1 X-4.15 Y4.15 Z1.8 F1914.0
G1 X3.03 Y4.15 Z1.8 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.6 Y4.71 Z1.8 F1914.0
G1 X4.71 Y4.71 Z1.8 F1914.0
G1 X4.71 Y-4.71 Z1.8 F1904.059
G1 X-4.71 Y-4.71 Z1.8 F1904.059
G1 X-4.71 Y4.62 Z1.8 F1905.85
G1 X-4.43 Y4.71 Z1.8 F1914.0
G1 X3.03 Y4.71 Z1.8 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z1.8 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z1.8 F3630.0
M101
G1 X2.79 Y-2.79 Z1.8 F1914.0
G1 X-2.79 Y-2.79 Z1.8 F1914.0
G1 X-2.79 Y2.79 Z1.8 F1914.0
G1 X2.5 Y2.79 Z1.8 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 2.16 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z2.16 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z2.16 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z2.16 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z2.16 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z2.16 F1172.075
M101
G1 X3.35 Y3.35 Z2.16 F1914.0
G1 X3.35 Y-3.35 Z2.16 F1914.0
G1 X-3.35 Y-3.35 Z2.16 F1914.0
G1 X-3.35 Y3.35 Z2.16 F1914.0
G1 X2.5 Y3.35 Z2.16 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z2.16 F1914.0
G1 X4.15 Y4.15 Z2.16 F1914.0
G1 X4.15 Y-4.15 Z2.16 F1914.0
G1 X-4.15 Y-4.15 Z2.16 F1914.0
G1 X-4.15 Y4.15 Z2.16 F1914.0
G1 X2.5 Y4.15 Z2.16 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z2.16 F1914.0
G1 X4.71 Y4.71 Z2.16 F1914.0
G1 X4.71 Y-4.71 Z2.16 F1904.059
G1 X-4.71 Y-4.71 Z2.16 F1904.059
G1 X-4.71 Y4.71 Z2.16 F1904.059
G1 X2.5 Y4.71 Z2.16 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z2.16 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z2.16 F3630.0
M101
G1 X2.79 Y-2.79 Z2.16 F1914.0
G1 X-2.79 Y-2.79 Z2.16 F1914.0
G1 X-2.79 Y2.79 Z2.16 F1914.0
G1 X2.5 Y2.79 Z2.16 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<operatingLayerEnd> </operatingLayerEnd>)
(<layer> 2.52 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z2.52 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z2.52 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z2.52 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z2.52 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z2.52 F1172.075
M101
G1 X3.35 Y3.35 Z2.52 F1914.0
G1 X3.35 Y-3.35 Z2.52 F1914.0
G1 X-3.35 Y-3.35 Z2.52 F1914.0
G1 X-3.35 Y3.35 Z2.52 F1914.0
G1 X2.5 Y3.35 Z2.52 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z2.52 F1914.0
G1 X4.15 Y4.15 Z2.52 F1914.0
G1 X4.15 Y-4.15 Z2.52 F1914.0
G1 X-4.15 Y-4.15 Z2.52 F1914.0
G1 X-4.15 Y4.15 Z2.52 F1914.0
G1 X2.5 Y4.15 Z2.52 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z2.52 F1914.0
G1 X4.71 Y4.71 Z2.52 F1914.0
G1 X4.71 Y-4.71 Z2.52 F1904.059
G1 X-4.71 Y-4.71 Z2.52 F1904.059
G1 X-4.71 Y4.71 Z2.52 F1904.059
G1 X2.5 Y4.71 Z2.52 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z2.52 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z2.52 F3630.0
M101
G1 X2.79 Y-2.79 Z2.52 F1914.0
G1 X-2.79 Y-2.79 Z2.52 F1914.0
G1 X-2.79 Y2.79 Z2.52 F1914.0
G1 X2.5 Y2.79 Z2.52 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 2.88 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z2.88 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z2.88 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z2.88 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z2.88 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z2.88 F1172.075
M101
G1 X3.35 Y3.35 Z2.88 F1914.0
G1 X3.35 Y-3.35 Z2.88 F1914.0
G1 X-3.35 Y-3.35 Z2.88 F1914.0
G1 X-3.35 Y3.35 Z2.88 F1914.0
G1 X2.5 Y3.35 Z2.88 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z2.88 F1914.0
G1 X4.15 Y4.15 Z2.88 F1914.0
G1 X4.15 Y-4.15 Z2.88 F1914.0
G1 X-4.15 Y-4.15 Z2.88 F1914.0
G1 X-4.15 Y4.15 Z2.88 F1914.0
G1 X2.5 Y4.15 Z2.88 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z2.88 F1914.0
G1 X4.71 Y4.71 Z2.88 F1914.0
G1 X4.71 Y-4.71 Z2.88 F1904.059
G1 X-4.71 Y-4.71 Z2.88 F1904.059
G1 X-4.71 Y4.71 Z2.88 F1904.059
G1 X2.5 Y4.71 Z2.88 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z2.88 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z2.88 F3630.0
M101
G1 X2.79 Y-2.79 Z2.88 F1914.0
G1 X-2.79 Y-2.79 Z2.88 F1914.0
G1 X-2.79 Y2.79 Z2.88 F1914.0
G1 X2.5 Y2.79 Z2.88 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 3.24 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z3.24 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z3.24 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z3.24 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z3.24 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z3.24 F1172.075
M101
G1 X3.35 Y3.35 Z3.24 F1914.0
G1 X3.35 Y-3.35 Z3.24 F1914.0
G1 X-3.35 Y-3.35 Z3.24 F1914.0
G1 X-3.35 Y3.35 Z3.24 F1914.0
G1 X2.5 Y3.35 Z3.24 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z3.24 F1914.0
G1 X4.15 Y4.15 Z3.24 F1914.0
G1 X4.15 Y-4.15 Z3.24 F1914.0
G1 X-4.15 Y-4.15 Z3.24 F1914.0
G1 X-4.15 Y4.15 Z3.24 F1914.0
G1 X2.5 Y4.15 Z3.24 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z3.24 F1914.0
G1 X4.71 Y4.71 Z3.24 F1914.0
G1 X4.71 Y-4.71 Z3.24 F1904.059
G1 X-4.71 Y-4.71 Z3.24 F1904.059
G1 X-4.71 Y4.71 Z3.24 F1904.059
G1 X2.5 Y4.71 Z3.24 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z3.24 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z3.24 F3630.0
M101
G1 X2.79 Y-2.79 Z3.24 F1914.0
G1 X-2.79 Y-2.79 Z3.24 F1914.0
G1 X-2.79 Y2.79 Z3.24 F1914.0
G1 X2.5 Y2.79 Z3.24 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 3.6 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z3.6 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z3.6 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z3.6 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z3.6 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z3.6 F1172.075
M101
G1 X3.35 Y3.35 Z3.6 F1914.0
G1 X3.35 Y-3.35 Z3.6 F1914.0
G1 X-3.35 Y-3.35 Z3.6 F1914.0
G1 X-3.35 Y3.35 Z3.6 F1914.0
G1 X2.5 Y3.35 Z3.6 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z3.6 F1914.0
G1 X4.15 Y4.15 Z3.6 F1914.0
G1 X4.15 Y-4.15 Z3.6 F1914.0
G1 X-4.15 Y-4.15 Z3.6 F1914.0
G1 X-4.15 Y4.15 Z3.6 F1914.0
G1 X2.5 Y4.15 Z3.6 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z3.6 F1914.0
G1 X4.71 Y4.71 Z3.6 F1914.0
G1 X4.71 Y-4.71 Z3.6 F1904.059
G1 X-4.71 Y-4.71 Z3.6 F1904.059
G1 X-4.71 Y4.71 Z3.6 F1904.059
G1 X2.5 Y4.71 Z3.6 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z3.6 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z3.6 F3630.0
M101
G1 X2.79 Y-2.79 Z3.6 F1914.0
G1 X-2.79 Y-2.79 Z3.6 F1914.0
G1 X-2.79 Y2.79 Z3.6 F1914.0
G1 X2.5 Y2.79 Z3.6 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 3.96 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z3.96 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z3.96 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z3.96 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z3.96 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z3.96 F1172.075
M101
G1 X3.35 Y3.35 Z3.96 F1914.0
G1 X3.35 Y-3.35 Z3.96 F1914.0
G1 X-3.35 Y-3.35 Z3.96 F1914.0
G1 X-3.35 Y3.35 Z3.96 F1914.0
G1 X2.5 Y3.35 Z3.96 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z3.96 F1914.0
G1 X4.15 Y4.15 Z3.96 F1914.0
G1 X4.15 Y-4.15 Z3.96 F1914.0
G1 X-4.15 Y-4.15 Z3.96 F1914.0
G1 X-4.15 Y4.15 Z3.96 F1914.0
G1 X2.5 Y4.15 Z3.96 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z3.96 F1914.0
G1 X4.71 Y4.71 Z3.96 F1914.0
G1 X4.71 Y-4.71 Z3.96 F1904.059
G1 X-4.71 Y-4.71 Z3.96 F1904.059
G1 X-4.71 Y4.71 Z3.96 F1904.059
G1 X2.5 Y4.71 Z3.96 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z3.96 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z3.96 F3630.0
M101
G1 X2.79 Y-2.79 Z3.96 F1914.0
G1 X-2.79 Y-2.79 Z3.96 F1914.0
G1 X-2.79 Y2.79 Z3.96 F1914.0
G1 X2.5 Y2.79 Z3.96 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 4.32 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z4.32 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z4.32 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z4.32 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z4.32 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z4.32 F1172.075
M101
G1 X3.35 Y3.35 Z4.32 F1914.0
G1 X3.35 Y-3.35 Z4.32 F1914.0
G1 X-3.35 Y-3.35 Z4.32 F1914.0
G1 X-3.35 Y3.35 Z4.32 F1914.0
G1 X2.5 Y3.35 Z4.32 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z4.32 F1914.0
G1 X4.15 Y4.15 Z4.32 F1914.0
G1 X4.15 Y-4.15 Z4.32 F1914.0
G1 X-4.15 Y-4.15 Z4.32 F1914.0
G1 X-4.15 Y4.15 Z4.32 F1914.0
G1 X2.5 Y4.15 Z4.32 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z4.32 F1914.0
G1 X4.71 Y4.71 Z4.32 F1914.0
G1 X4.71 Y-4.71 Z4.32 F1904.059
G1 X-4.71 Y-4.71 Z4.32 F1904.059
G1 X-4.71 Y4.71 Z4.32 F1904.059
G1 X2.5 Y4.71 Z4.32 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z4.32 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z4.32 F3630.0
M101
G1 X2.79 Y-2.79 Z4.32 F1914.0
G1 X-2.79 Y-2.79 Z4.32 F1914.0
G1 X-2.79 Y2.79 Z4.32 F1914.0
G1 X2.5 Y2.79 Z4.32 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 4.68 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z4.68 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z4.68 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z4.68 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z4.68 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z4.68 F1172.075
M101
G1 X3.35 Y3.35 Z4.68 F1914.0
G1 X3.35 Y-3.35 Z4.68 F1914.0
G1 X-3.35 Y-3.35 Z4.68 F1914.0
G1 X-3.35 Y3.35 Z4.68 F1914.0
G1 X2.5 Y3.35 Z4.68 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z4.68 F1914.0
G1 X4.15 Y4.15 Z4.68 F1914.0
G1 X4.15 Y-4.15 Z4.68 F1914.0
G1 X-4.15 Y-4.15 Z4.68 F1914.0
G1 X-4.15 Y4.15 Z4.68 F1914.0
G1 X2.5 Y4.15 Z4.68 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z4.68 F1914.0
G1 X4.71 Y4.71 Z4.68 F1914.0
G1 X4.71 Y-4.71 Z4.68 F1904.059
G1 X-4.71 Y-4.71 Z4.68 F1904.059
G1 X-4.71 Y4.71 Z4.68 F1904.059
G1 X2.5 Y4.71 Z4.68 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z4.68 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z4.68 F3630.0
M101
G1 X2.79 Y-2.79 Z4.68 F1914.0
G1 X-2.79 Y-2.79 Z4.68 F1914.0
G1 X-2.79 Y2.79 Z4.68 F1914.0
G1 X2.5 Y2.79 Z4.68 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 5.04 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z5.04 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z5.04 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z5.04 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z5.04 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z5.04 F1172.075
M101
G1 X3.35 Y3.35 Z5.04 F1914.0
G1 X3.35 Y-3.35 Z5.04 F1914.0
G1 X-3.35 Y-3.35 Z5.04 F1914.0
G1 X-3.35 Y3.35 Z5.04 F1914.0
G1 X2.5 Y3.35 Z5.04 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z5.04 F1914.0
G1 X4.15 Y4.15 Z5.04 F1914.0
G1 X4.15 Y-4.15 Z5.04 F1914.0
G1 X-4.15 Y-4.15 Z5.04 F1914.0
G1 X-4.15 Y4.15 Z5.04 F1914.0
G1 X2.5 Y4.15 Z5.04 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z5.04 F1914.0
G1 X4.71 Y4.71 Z5.04 F1914.0
G1 X4.71 Y-4.71 Z5.04 F1904.059
G1 X-4.71 Y-4.71 Z5.04 F1904.059
G1 X-4.71 Y4.71 Z5.04 F1904.059
G1 X2.5 Y4.71 Z5.04 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y-2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z5.04 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z5.04 F3630.0
M101
G1 X2.79 Y-2.79 Z5.04 F1914.0
G1 X-2.79 Y-2.79 Z5.04 F1914.0
G1 X-2.79 Y2.79 Z5.04 F1914.0
G1 X2.5 Y2.79 Z5.04 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(<layer> 5.4 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X5.0 Y-5.0 Z5.4 </boundaryPoint>)
(<boundaryPoint> X5.0 Y5.0 Z5.4 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y5.0 Z5.4 </boundaryPoint>)
(<boundaryPoint> X-5.0 Y-5.0 Z5.4 </boundaryPoint>)
(<loop> inner )
G1 X3.08 Y3.35 Z5.4 F1172.075
M101
G1 X3.35 Y3.35 Z5.4 F1914.0
G1 X3.35 Y-3.35 Z5.4 F1914.0
G1 X-3.35 Y-3.35 Z5.4 F1914.0
G1 X-3.35 Y3.35 Z5.4 F1914.0
G1 X2.5 Y3.35 Z5.4 F1914.0
(</loop>)
(<loop> outer )
G1 X3.08 Y4.15 Z5.4 F1914.0
G1 X4.15 Y4.15 Z5.4 F1914.0
G1 X4.15 Y-4.15 Z5.4 F1914.0
G1 X-4.15 Y-4.15 Z5.4 F1914.0
G1 X-4.15 Y4.15 Z5.4 F1914.0
G1 X2.5 Y4.15 Z5.4 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.08 Y4.71 Z5.4 F1914.0
G1 X4.71 Y4.71 Z5.4 F1914.0
G1 X4.71 Y-4.71 Z5.4 F1904.059
G1 X-4.71 Y-4.71 Z5.4 F1904.059
G1 X-4.71 Y4.71 Z5.4 F1904.059
G1 X2.5 Y4.71 Z5.4 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y-2.5 Z5.4 </boundaryPoint>)
(<perimeter> inner )
G1 X2.79 Y2.5 Z5.4 F3630.0
M101
G1 X2.79 Y-2.79 Z5.4 F1914.0
G1 X-2.79 Y-2.79 Z5.4 F1914.0
G1 X-2.79 Y2.79 Z5.4 F1914.0
G1 X2.5 Y2.79 Z5.4 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
(</surroundingLoop>)
(</surroundingLoop>)
(</layer>)
(</extrusion>)
M104 S0
M103
M104 S20
M113 S0
G1 X0.0 Y0.0 Z6.78 F1190.235
M113 S0.0
