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
G1 X-11.52 Y-4.67 Z0.65 F435.0
M101
G1 X-11.52 Y4.67 Z0.65 F444.673
G1 X-9.22 Y4.67 Z0.65 F477.03
G1 X-9.22 Y-4.67 Z0.65 F444.673
G1 X-6.91 Y-4.67 Z0.65 F477.03
G1 X-6.91 Y4.67 Z0.65 F444.673
G1 X-4.61 Y4.67 Z0.65 F477.03
G1 X-4.61 Y-4.67 Z0.65 F444.673
G1 X-2.3 Y-4.67 Z0.65 F477.03
G1 X-2.3 Y4.67 Z0.65 F444.673
G1 X0.0 Y4.67 Z0.65 F477.03
G1 X0.0 Y-4.67 Z0.65 F444.673
G1 X2.3 Y-4.67 Z0.65 F477.03
G1 X2.3 Y4.67 Z0.65 F444.673
G1 X4.61 Y4.67 Z0.65 F477.03
G1 X4.61 Y-4.67 Z0.65 F444.673
G1 X6.91 Y-4.67 Z0.65 F477.03
G1 X6.91 Y4.67 Z0.65 F444.673
G1 X9.22 Y4.67 Z0.65 F477.03
G1 X9.22 Y-4.67 Z0.65 F444.673
G1 X11.52 Y-4.67 Z0.65 F477.03
G1 X11.52 Y4.67 Z0.65 F444.673
M103
M104 S190.0
(</layer>)
(<layer> 1.062 )
G1 X-11.55 Y0.0 Z1.06 F1802.165
M101
G1 X11.55 Y0.0 Z1.06 F1803.398
G1 X11.55 Y-1.15 Z1.06 F1914.0
G1 X-11.55 Y-1.15 Z1.06 F1803.398
G1 X-11.55 Y-2.3 Z1.06 F1914.0
G1 X11.55 Y-2.3 Z1.06 F1803.398
G1 X11.55 Y-3.46 Z1.06 F1914.0
G1 X-11.55 Y-3.46 Z1.06 F1803.398
G1 X-11.55 Y-4.61 Z1.06 F1914.0
G1 X11.55 Y-4.61 Z1.06 F1803.398
M103
G1 X11.55 Y1.15 Z1.06 F1914.0
M101
G1 X-11.55 Y1.15 Z1.06 F1803.398
G1 X-11.55 Y2.3 Z1.06 F1914.0
G1 X11.55 Y2.3 Z1.06 F1803.398
G1 X11.55 Y3.46 Z1.06 F1914.0
G1 X-11.55 Y3.46 Z1.06 F1803.398
G1 X-11.55 Y4.61 Z1.06 F1914.0
G1 X11.55 Y4.61 Z1.06 F1803.398
M103
(</layer>)
(<layer> 1.422 )
G1 X-11.55 Y0.0 Z1.42 F1802.121
M101
G1 X11.55 Y0.0 Z1.42 F1803.398
G1 X11.55 Y-1.15 Z1.42 F1914.0
G1 X-11.55 Y-1.15 Z1.42 F1803.398
G1 X-11.55 Y-2.3 Z1.42 F1914.0
G1 X11.55 Y-2.3 Z1.42 F1803.398
G1 X11.55 Y-3.46 Z1.42 F1914.0
G1 X-11.55 Y-3.46 Z1.42 F1803.398
G1 X-11.55 Y-4.61 Z1.42 F1914.0
G1 X11.55 Y-4.61 Z1.42 F1803.398
M103
G1 X11.55 Y1.15 Z1.42 F1914.0
M101
G1 X-11.55 Y1.15 Z1.42 F1803.398
G1 X-11.55 Y2.3 Z1.42 F1914.0
G1 X11.55 Y2.3 Z1.42 F1803.398
G1 X11.55 Y3.46 Z1.42 F1914.0
G1 X-11.55 Y3.46 Z1.42 F1803.398
G1 X-11.55 Y4.61 Z1.42 F1914.0
G1 X11.55 Y4.61 Z1.42 F1803.398
M103
(</layer>)
(<raftLayerEnd> </raftLayerEnd>)
(<layer> 1.8 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z1.8 </boundaryPoint>)
(<loop> outer )
G1 X-3.6 Y1.65 Z1.8 F3630.0
M101
G1 X-6.65 Y1.65 Z1.8 F1914.0
G1 X-6.65 Y-1.65 Z1.8 F1914.0
G1 X-3.35 Y-1.65 Z1.8 F1914.0
G1 X-3.35 Y1.33 Z1.8 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y1.91 Z1.8 F1914.0
G1 X-2.79 Y2.21 Z1.8 F1914.0
G1 X-7.21 Y2.21 Z1.8 F1914.0
G1 X-7.21 Y-2.21 Z1.8 F1914.0
G1 X-2.79 Y-2.21 Z1.8 F1914.0
G1 X-2.79 Y1.33 Z1.8 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y0.01 Z1.8 F3630.0
M101
G1 X-5.01 Y-1.2 Z1.8 F1914.0
G1 X-4.25 Y-1.2 Z1.8 F1914.0
G1 X-3.81 Y-0.75 Z1.8 F1914.0
M103
G1 X-3.81 Y0.78 Z1.8 F3630.0
M101
G1 X-5.78 Y-1.2 Z1.8 F1914.0
G1 X-6.2 Y-0.85 Z1.8 F1914.0
G1 X-4.15 Y1.2 Z1.8 F1914.0
G1 X-4.91 Y1.2 Z1.8 F1914.0
G1 X-6.2 Y-0.09 Z1.8 F1914.0
G1 X-6.2 Y0.68 Z1.8 F1914.0
G1 X-5.68 Y1.2 Z1.8 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X2.5 Y2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z1.8 </boundaryPoint>)
(<boundaryPoint> X7.5 Y2.5 Z1.8 </boundaryPoint>)
(<loop> outer )
G1 X3.35 Y0.94 Z1.8 F3630.0
M101
G1 X3.35 Y-1.65 Z1.8 F1914.0
G1 X6.65 Y-1.65 Z1.8 F1914.0
G1 X6.65 Y1.65 Z1.8 F1914.0
G1 X3.35 Y1.65 Z1.8 F1914.0
G1 X3.35 Y1.52 Z1.8 F1914.0
(</loop>)
(<perimeter> outer )
G1 X2.79 Y0.91 Z1.8 F1914.0
G1 X2.79 Y-2.21 Z1.8 F1914.0
G1 X7.21 Y-2.21 Z1.8 F1914.0
G1 X7.21 Y2.21 Z1.8 F1914.0
G1 X2.79 Y2.21 Z1.8 F1914.0
G1 X2.79 Y1.48 Z1.8 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.68 Y-1.2 Z1.8 F3630.0
M101
G1 X6.2 Y-0.68 Z1.8 F1914.0
G1 X6.2 Y0.09 Z1.8 F1914.0
G1 X4.91 Y-1.2 Z1.8 F1914.0
G1 X4.15 Y-1.2 Z1.8 F1914.0
G1 X6.2 Y0.85 Z1.8 F1914.0
G1 X5.78 Y1.2 Z1.8 F1914.0
G1 X3.81 Y-0.78 Z1.8 F1914.0
G1 X3.81 Y-0.01 Z1.8 F1914.0
G1 X5.01 Y1.2 Z1.8 F1914.0
G1 X4.25 Y1.2 Z1.8 F1914.0
G1 X3.81 Y0.75 Z1.8 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 2.16 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z2.16 </boundaryPoint>)
(<loop> outer )
G1 X3.89 Y0.93 Z2.16 F549.775
M101
G1 X3.89 Y-1.11 Z2.16 F1914.0
G1 X6.11 Y-1.11 Z2.16 F1914.0
G1 X6.11 Y1.11 Z2.16 F1914.0
G1 X4.28 Y1.11 Z2.16 F1914.0
(</loop>)
(<loop> outer )
G1 X3.71 Y1.65 Z2.16 F1914.0
G1 X3.35 Y1.65 Z2.16 F1914.0
G1 X3.35 Y-1.65 Z2.16 F1914.0
G1 X6.65 Y-1.65 Z2.16 F1914.0
G1 X6.65 Y1.65 Z2.16 F1914.0
G1 X4.28 Y1.65 Z2.16 F1914.0
(</loop>)
(<perimeter> outer )
G1 X3.71 Y2.21 Z2.16 F1914.0
G1 X2.79 Y2.21 Z2.16 F1914.0
G1 X2.79 Y-2.21 Z2.16 F1914.0
G1 X7.21 Y-2.21 Z2.16 F1914.0
G1 X7.21 Y2.21 Z2.16 F1914.0
G1 X4.28 Y2.21 Z2.16 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.66 Y0.45 Z2.16 F3630.0
M101
G1 X5.45 Y0.66 Z2.16 F1914.0
G1 X4.69 Y0.66 Z2.16 F1914.0
G1 X5.66 Y-0.31 Z2.16 F1914.0
G1 X5.24 Y-0.66 Z2.16 F1914.0
G1 X4.35 Y0.24 Z2.16 F1914.0
G1 X4.35 Y-0.53 Z2.16 F1914.0
G1 X4.47 Y-0.66 Z2.16 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z2.16 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z2.16 </boundaryPoint>)
(<loop> outer )
G1 X-3.89 Y-0.84 Z2.16 F3630.0
M101
G1 X-3.89 Y1.11 Z2.16 F1914.0
G1 X-6.11 Y1.11 Z2.16 F1914.0
G1 X-6.11 Y-1.11 Z2.16 F1914.0
G1 X-4.19 Y-1.11 Z2.16 F1914.0
(</loop>)
(<loop> outer )
G1 X-3.61 Y-1.65 Z2.16 F1914.0
G1 X-3.35 Y-1.65 Z2.16 F1914.0
G1 X-3.35 Y1.65 Z2.16 F1914.0
G1 X-6.65 Y1.65 Z2.16 F1914.0
G1 X-6.65 Y-1.65 Z2.16 F1914.0
G1 X-4.19 Y-1.65 Z2.16 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-3.61 Y-2.21 Z2.16 F1914.0
G1 X-2.79 Y-2.21 Z2.16 F1914.0
G1 X-2.79 Y2.21 Z2.16 F1914.0
G1 X-7.21 Y2.21 Z2.16 F1914.0
G1 X-7.21 Y-2.21 Z2.16 F1914.0
G1 X-4.19 Y-2.21 Z2.16 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-5.66 Y-0.45 Z2.16 F3630.0
M101
G1 X-5.45 Y-0.66 Z2.16 F1914.0
G1 X-4.69 Y-0.66 Z2.16 F1914.0
G1 X-5.66 Y0.31 Z2.16 F1914.0
G1 X-5.24 Y0.66 Z2.16 F1914.0
G1 X-4.35 Y-0.24 Z2.16 F1914.0
G1 X-4.35 Y0.53 Z2.16 F1914.0
G1 X-4.47 Y0.66 Z2.16 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<operatingLayerEnd> </operatingLayerEnd>)
(<layer> 2.52 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z2.52 </boundaryPoint>)
(<loop> outer )
G1 X-5.0 Y1.65 Z2.52 F1581.215
M101
G1 X-6.65 Y1.65 Z2.52 F1914.0
G1 X-6.65 Y-1.65 Z2.52 F1914.0
G1 X-3.35 Y-1.65 Z2.52 F1914.0
G1 X-3.35 Y1.65 Z2.52 F1914.0
G1 X-4.43 Y1.65 Z2.52 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-4.76 Y2.21 Z2.52 F1914.0
G1 X-7.21 Y2.21 Z2.52 F1914.0
G1 X-7.21 Y-2.21 Z2.52 F1914.0
G1 X-2.79 Y-2.21 Z2.52 F1914.0
G1 X-2.79 Y2.21 Z2.52 F1914.0
G1 X-4.18 Y2.21 Z2.52 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y0.78 Z2.52 F3630.0
M101
G1 X-5.78 Y-1.2 Z2.52 F1914.0
G1 X-6.2 Y-0.85 Z2.52 F1914.0
G1 X-4.15 Y1.2 Z2.52 F1914.0
G1 X-4.91 Y1.2 Z2.52 F1914.0
G1 X-6.2 Y-0.09 Z2.52 F1914.0
G1 X-6.2 Y0.68 Z2.52 F1914.0
G1 X-5.68 Y1.2 Z2.52 F1914.0
M103
G1 X-3.81 Y0.01 Z2.52 F3630.0
M101
G1 X-5.01 Y-1.2 Z2.52 F1914.0
G1 X-4.25 Y-1.2 Z2.52 F1914.0
G1 X-3.81 Y-0.75 Z2.52 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z2.52 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z2.52 </boundaryPoint>)
(<loop> outer )
G1 X3.35 Y-1.28 Z2.52 F3630.0
M101
G1 X3.35 Y-1.65 Z2.52 F1914.0
G1 X6.65 Y-1.65 Z2.52 F1914.0
G1 X6.65 Y1.65 Z2.52 F1914.0
G1 X3.35 Y1.65 Z2.52 F1914.0
G1 X3.35 Y-0.7 Z2.52 F1914.0
(</loop>)
(<perimeter> outer )
G1 X2.79 Y-1.04 Z2.52 F1914.0
G1 X2.79 Y-2.21 Z2.52 F1914.0
G1 X7.21 Y-2.21 Z2.52 F1914.0
G1 X7.21 Y2.21 Z2.52 F1914.0
G1 X2.79 Y2.21 Z2.52 F1914.0
G1 X2.79 Y-0.46 Z2.52 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.68 Y-1.2 Z2.52 F3630.0
M101
G1 X6.2 Y-0.68 Z2.52 F1914.0
G1 X6.2 Y0.09 Z2.52 F1914.0
G1 X4.91 Y-1.2 Z2.52 F1914.0
G1 X4.15 Y-1.2 Z2.52 F1914.0
G1 X6.2 Y0.85 Z2.52 F1914.0
G1 X5.78 Y1.2 Z2.52 F1914.0
G1 X3.81 Y-0.78 Z2.52 F1914.0
G1 X3.81 Y-0.01 Z2.52 F1914.0
G1 X5.01 Y1.2 Z2.52 F1914.0
G1 X4.25 Y1.2 Z2.52 F1914.0
G1 X3.81 Y0.75 Z2.52 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 2.88 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z2.88 </boundaryPoint>)
(<loop> outer )
G1 X3.35 Y0.66 Z2.88 F786.582
M101
G1 X3.35 Y-1.65 Z2.88 F1914.0
G1 X6.65 Y-1.65 Z2.88 F1914.0
G1 X6.65 Y1.65 Z2.88 F1914.0
G1 X3.35 Y1.65 Z2.88 F1914.0
G1 X3.35 Y1.24 Z2.88 F1914.0
(</loop>)
(<perimeter> outer )
G1 X2.79 Y0.46 Z2.88 F1914.0
G1 X2.79 Y-2.21 Z2.88 F1914.0
G1 X7.21 Y-2.21 Z2.88 F1914.0
G1 X7.21 Y2.21 Z2.88 F1914.0
G1 X2.79 Y2.21 Z2.88 F1914.0
G1 X2.79 Y1.04 Z2.88 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X6.2 Y0.59 Z2.88 F3630.0
M101
G1 X5.59 Y1.2 Z2.88 F1914.0
G1 X3.9 Y1.2 Z2.88 F1914.0
G1 X3.81 Y0.44 Z2.88 F1914.0
G1 X3.81 Y-0.41 Z2.88 F1914.0
G1 X4.59 Y-1.2 Z2.88 F1914.0
G1 X5.44 Y-1.2 Z2.88 F1914.0
G1 X6.2 Y-1.1 Z2.88 F1914.0
G1 X6.2 Y-0.26 Z2.88 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z2.88 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z2.88 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y-0.17 Z2.88 F3630.0
M101
G1 X-3.35 Y1.65 Z2.88 F1914.0
G1 X-6.65 Y1.65 Z2.88 F1914.0
G1 X-6.65 Y-1.65 Z2.88 F1914.0
G1 X-3.35 Y-1.65 Z2.88 F1914.0
G1 X-3.35 Y-0.74 Z2.88 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y0.03 Z2.88 F1914.0
G1 X-2.79 Y2.21 Z2.88 F1914.0
G1 X-7.21 Y2.21 Z2.88 F1914.0
G1 X-7.21 Y-2.21 Z2.88 F1914.0
G1 X-2.79 Y-2.21 Z2.88 F1914.0
G1 X-2.79 Y-0.54 Z2.88 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y0.41 Z2.88 F3630.0
M101
G1 X-4.59 Y1.2 Z2.88 F1914.0
G1 X-5.44 Y1.2 Z2.88 F1914.0
G1 X-6.2 Y1.1 Z2.88 F1914.0
G1 X-6.2 Y-0.59 Z2.88 F1914.0
G1 X-5.59 Y-1.2 Z2.88 F1914.0
G1 X-3.9 Y-1.2 Z2.88 F1914.0
G1 X-3.81 Y-0.44 Z2.88 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 3.24 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z3.24 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y0.36 Z3.24 F1320.122
M101
G1 X-3.35 Y1.65 Z3.24 F1914.0
G1 X-6.65 Y1.65 Z3.24 F1914.0
G1 X-6.65 Y-1.65 Z3.24 F1914.0
G1 X-3.35 Y-1.65 Z3.24 F1914.0
G1 X-3.35 Y-0.21 Z3.24 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y0.36 Z3.24 F1914.0
G1 X-2.79 Y2.21 Z3.24 F1914.0
G1 X-7.21 Y2.21 Z3.24 F1914.0
G1 X-7.21 Y-2.21 Z3.24 F1914.0
G1 X-2.79 Y-2.21 Z3.24 F1914.0
G1 X-2.79 Y-0.21 Z3.24 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y-0.41 Z3.24 F3630.0
M101
G1 X-4.59 Y-1.2 Z3.24 F1914.0
G1 X-5.44 Y-1.2 Z3.24 F1914.0
G1 X-6.2 Y-1.1 Z3.24 F1914.0
G1 X-6.2 Y-0.26 Z3.24 F1914.0
G1 X-3.81 Y0.44 Z3.24 F1914.0
G1 X-3.9 Y1.2 Z3.24 F1914.0
G1 X-5.59 Y1.2 Z3.24 F1914.0
G1 X-6.2 Y0.59 Z3.24 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z3.24 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z3.24 </boundaryPoint>)
(<loop> outer )
G1 X3.35 Y-0.21 Z3.24 F3630.0
M101
G1 X3.35 Y-1.65 Z3.24 F1914.0
G1 X6.65 Y-1.65 Z3.24 F1914.0
G1 X6.65 Y1.65 Z3.24 F1914.0
G1 X3.35 Y1.65 Z3.24 F1914.0
G1 X3.35 Y0.37 Z3.24 F1914.0
(</loop>)
(<perimeter> outer )
G1 X2.79 Y-0.21 Z3.24 F1914.0
G1 X2.79 Y-2.21 Z3.24 F1914.0
G1 X7.21 Y-2.21 Z3.24 F1914.0
G1 X7.21 Y2.21 Z3.24 F1914.0
G1 X2.79 Y2.21 Z3.24 F1914.0
G1 X2.79 Y0.37 Z3.24 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.59 Y-1.2 Z3.24 F3630.0
M101
G1 X6.2 Y-0.59 Z3.24 F1914.0
G1 X6.2 Y1.1 Z3.24 F1914.0
G1 X5.44 Y1.2 Z3.24 F1914.0
G1 X4.59 Y1.2 Z3.24 F1914.0
G1 X3.81 Y0.41 Z3.24 F1914.0
G1 X3.81 Y-0.44 Z3.24 F1914.0
G1 X3.9 Y-1.2 Z3.24 F1914.0
G1 X4.75 Y-1.2 Z3.24 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 3.6 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z3.6 </boundaryPoint>)
(<loop> outer )
G1 X5.11 Y-1.65 Z3.6 F913.972
M101
G1 X6.65 Y-1.65 Z3.6 F1914.0
G1 X6.65 Y1.65 Z3.6 F1914.0
G1 X3.35 Y1.65 Z3.6 F1914.0
G1 X3.35 Y-1.65 Z3.6 F1914.0
G1 X4.53 Y-1.65 Z3.6 F1914.0
(</loop>)
(<perimeter> outer )
G1 X5.03 Y-2.21 Z3.6 F1914.0
G1 X7.21 Y-2.21 Z3.6 F1914.0
G1 X7.21 Y2.21 Z3.6 F1914.0
G1 X2.79 Y2.21 Z3.6 F1914.0
G1 X2.79 Y-2.21 Z3.6 F1914.0
G1 X4.46 Y-2.21 Z3.6 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X6.2 Y0.59 Z3.6 F3630.0
M101
G1 X5.59 Y1.2 Z3.6 F1914.0
G1 X3.9 Y1.2 Z3.6 F1914.0
G1 X3.81 Y0.44 Z3.6 F1914.0
G1 X3.81 Y-0.41 Z3.6 F1914.0
G1 X4.59 Y-1.2 Z3.6 F1914.0
G1 X5.44 Y-1.2 Z3.6 F1914.0
G1 X6.2 Y-1.1 Z3.6 F1914.0
G1 X6.2 Y-0.26 Z3.6 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z3.6 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z3.6 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y0.11 Z3.6 F3630.0
M101
G1 X-3.35 Y1.65 Z3.6 F1914.0
G1 X-6.65 Y1.65 Z3.6 F1914.0
G1 X-6.65 Y-1.65 Z3.6 F1914.0
G1 X-3.35 Y-1.65 Z3.6 F1914.0
G1 X-3.35 Y-0.47 Z3.6 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y0.03 Z3.6 F1914.0
G1 X-2.79 Y2.21 Z3.6 F1914.0
G1 X-7.21 Y2.21 Z3.6 F1914.0
G1 X-7.21 Y-2.21 Z3.6 F1914.0
G1 X-2.79 Y-2.21 Z3.6 F1914.0
G1 X-2.79 Y-0.54 Z3.6 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y0.41 Z3.6 F3630.0
M101
G1 X-4.59 Y1.2 Z3.6 F1914.0
G1 X-5.44 Y1.2 Z3.6 F1914.0
G1 X-6.2 Y1.1 Z3.6 F1914.0
G1 X-6.2 Y-0.59 Z3.6 F1914.0
G1 X-5.59 Y-1.2 Z3.6 F1914.0
G1 X-3.9 Y-1.2 Z3.6 F1914.0
G1 X-3.81 Y-0.44 Z3.6 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 3.96 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z3.96 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y-0.52 Z3.96 F785.062
M101
G1 X-3.35 Y1.65 Z3.96 F1914.0
G1 X-6.65 Y1.65 Z3.96 F1914.0
G1 X-6.65 Y-1.65 Z3.96 F1914.0
G1 X-3.35 Y-1.65 Z3.96 F1914.0
G1 X-3.35 Y-1.09 Z3.96 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y-0.52 Z3.96 F1914.0
G1 X-2.79 Y2.21 Z3.96 F1914.0
G1 X-7.21 Y2.21 Z3.96 F1914.0
G1 X-7.21 Y-2.21 Z3.96 F1914.0
G1 X-2.79 Y-2.21 Z3.96 F1914.0
G1 X-2.79 Y-1.09 Z3.96 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y-0.41 Z3.96 F3630.0
M101
G1 X-4.59 Y-1.2 Z3.96 F1914.0
G1 X-5.44 Y-1.2 Z3.96 F1914.0
G1 X-6.2 Y-1.1 Z3.96 F1914.0
G1 X-6.2 Y-0.26 Z3.96 F1914.0
G1 X-3.81 Y0.44 Z3.96 F1914.0
G1 X-3.9 Y1.2 Z3.96 F1914.0
G1 X-5.59 Y1.2 Z3.96 F1914.0
G1 X-6.2 Y0.59 Z3.96 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z3.96 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z3.96 </boundaryPoint>)
(<loop> outer )
G1 X3.35 Y0.67 Z3.96 F3630.0
M101
G1 X3.35 Y-1.65 Z3.96 F1914.0
G1 X6.65 Y-1.65 Z3.96 F1914.0
G1 X6.65 Y1.65 Z3.96 F1914.0
G1 X3.35 Y1.65 Z3.96 F1914.0
G1 X3.35 Y1.25 Z3.96 F1914.0
(</loop>)
(<perimeter> outer )
G1 X2.79 Y0.67 Z3.96 F1914.0
G1 X2.79 Y-2.21 Z3.96 F1914.0
G1 X7.21 Y-2.21 Z3.96 F1914.0
G1 X7.21 Y2.21 Z3.96 F1914.0
G1 X2.79 Y2.21 Z3.96 F1914.0
G1 X2.79 Y1.25 Z3.96 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.59 Y-1.2 Z3.96 F3630.0
M101
G1 X6.2 Y-0.59 Z3.96 F1914.0
G1 X6.2 Y1.1 Z3.96 F1914.0
G1 X5.44 Y1.2 Z3.96 F1914.0
G1 X4.59 Y1.2 Z3.96 F1914.0
G1 X3.81 Y0.41 Z3.96 F1914.0
G1 X3.81 Y-0.44 Z3.96 F1914.0
G1 X3.9 Y-1.2 Z3.96 F1914.0
G1 X4.75 Y-1.2 Z3.96 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 4.32 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z4.32 </boundaryPoint>)
(<loop> outer )
G1 X5.38 Y-1.65 Z4.32 F1146.748
M101
G1 X6.65 Y-1.65 Z4.32 F1914.0
G1 X6.65 Y1.65 Z4.32 F1914.0
G1 X3.35 Y1.65 Z4.32 F1914.0
G1 X3.35 Y-1.65 Z4.32 F1914.0
G1 X4.8 Y-1.65 Z4.32 F1914.0
(</loop>)
(<perimeter> outer )
G1 X5.38 Y-2.21 Z4.32 F1914.0
G1 X7.21 Y-2.21 Z4.32 F1914.0
G1 X7.21 Y2.21 Z4.32 F1914.0
G1 X2.79 Y2.21 Z4.32 F1914.0
G1 X2.79 Y-2.21 Z4.32 F1914.0
G1 X4.8 Y-2.21 Z4.32 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X6.2 Y0.59 Z4.32 F3630.0
M101
G1 X5.59 Y1.2 Z4.32 F1914.0
G1 X3.9 Y1.2 Z4.32 F1914.0
G1 X3.81 Y0.44 Z4.32 F1914.0
G1 X3.81 Y-0.41 Z4.32 F1914.0
G1 X4.59 Y-1.2 Z4.32 F1914.0
G1 X5.44 Y-1.2 Z4.32 F1914.0
G1 X6.2 Y-1.1 Z4.32 F1914.0
G1 X6.2 Y-0.26 Z4.32 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z4.32 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z4.32 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y0.38 Z4.32 F3630.0
M101
G1 X-3.35 Y1.65 Z4.32 F1914.0
G1 X-6.65 Y1.65 Z4.32 F1914.0
G1 X-6.65 Y-1.65 Z4.32 F1914.0
G1 X-3.35 Y-1.65 Z4.32 F1914.0
G1 X-3.35 Y-0.2 Z4.32 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y0.38 Z4.32 F1914.0
G1 X-2.79 Y2.21 Z4.32 F1914.0
G1 X-7.21 Y2.21 Z4.32 F1914.0
G1 X-7.21 Y-2.21 Z4.32 F1914.0
G1 X-2.79 Y-2.21 Z4.32 F1914.0
G1 X-2.79 Y-0.2 Z4.32 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y0.41 Z4.32 F3630.0
M101
G1 X-4.59 Y1.2 Z4.32 F1914.0
G1 X-5.44 Y1.2 Z4.32 F1914.0
G1 X-6.2 Y1.1 Z4.32 F1914.0
G1 X-6.2 Y-0.59 Z4.32 F1914.0
G1 X-5.59 Y-1.2 Z4.32 F1914.0
G1 X-3.9 Y-1.2 Z4.32 F1914.0
G1 X-3.81 Y-0.44 Z4.32 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 4.68 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z4.68 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y-0.25 Z4.68 F818.828
M101
G1 X-3.35 Y1.65 Z4.68 F1914.0
G1 X-6.65 Y1.65 Z4.68 F1914.0
G1 X-6.65 Y-1.65 Z4.68 F1914.0
G1 X-3.35 Y-1.65 Z4.68 F1914.0
G1 X-3.35 Y-0.82 Z4.68 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y-0.15 Z4.68 F1914.0
G1 X-2.79 Y2.21 Z4.68 F1914.0
G1 X-7.21 Y2.21 Z4.68 F1914.0
G1 X-7.21 Y-2.21 Z4.68 F1914.0
G1 X-2.79 Y-2.21 Z4.68 F1914.0
G1 X-2.79 Y-0.73 Z4.68 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y-0.41 Z4.68 F3630.0
M101
G1 X-4.59 Y-1.2 Z4.68 F1914.0
G1 X-5.44 Y-1.2 Z4.68 F1914.0
G1 X-6.2 Y-1.1 Z4.68 F1914.0
G1 X-6.2 Y-0.26 Z4.68 F1914.0
G1 X-3.81 Y0.44 Z4.68 F1914.0
G1 X-3.9 Y1.2 Z4.68 F1914.0
G1 X-5.59 Y1.2 Z4.68 F1914.0
G1 X-6.2 Y0.59 Z4.68 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z4.68 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z4.68 </boundaryPoint>)
(<loop> outer )
G1 X3.35 Y0.4 Z4.68 F3630.0
M101
G1 X3.35 Y-1.65 Z4.68 F1914.0
G1 X6.65 Y-1.65 Z4.68 F1914.0
G1 X6.65 Y1.65 Z4.68 F1914.0
G1 X3.35 Y1.65 Z4.68 F1914.0
G1 X3.35 Y0.98 Z4.68 F1914.0
(</loop>)
(<perimeter> outer )
G1 X2.79 Y0.31 Z4.68 F1914.0
G1 X2.79 Y-2.21 Z4.68 F1914.0
G1 X7.21 Y-2.21 Z4.68 F1914.0
G1 X7.21 Y2.21 Z4.68 F1914.0
G1 X2.79 Y2.21 Z4.68 F1914.0
G1 X2.79 Y0.88 Z4.68 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.59 Y-1.2 Z4.68 F3630.0
M101
G1 X6.2 Y-0.59 Z4.68 F1914.0
G1 X6.2 Y1.1 Z4.68 F1914.0
G1 X5.44 Y1.2 Z4.68 F1914.0
G1 X4.59 Y1.2 Z4.68 F1914.0
G1 X3.81 Y0.41 Z4.68 F1914.0
G1 X3.81 Y-0.44 Z4.68 F1914.0
G1 X3.9 Y-1.2 Z4.68 F1914.0
G1 X4.75 Y-1.2 Z4.68 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 5.04 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z5.04 </boundaryPoint>)
(<loop> outer )
G1 X4.5 Y-1.65 Z5.04 F845.154
M101
G1 X6.65 Y-1.65 Z5.04 F1914.0
G1 X6.65 Y1.65 Z5.04 F1914.0
G1 X3.35 Y1.65 Z5.04 F1914.0
G1 X3.35 Y-1.65 Z5.04 F1914.0
G1 X3.92 Y-1.65 Z5.04 F1914.0
(</loop>)
(<perimeter> outer )
G1 X4.5 Y-2.21 Z5.04 F1914.0
G1 X7.21 Y-2.21 Z5.04 F1914.0
G1 X7.21 Y2.21 Z5.04 F1914.0
G1 X2.79 Y2.21 Z5.04 F1914.0
G1 X2.79 Y-2.21 Z5.04 F1914.0
G1 X3.92 Y-2.21 Z5.04 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X6.2 Y0.59 Z5.04 F3630.0
M101
G1 X5.59 Y1.2 Z5.04 F1914.0
G1 X3.9 Y1.2 Z5.04 F1914.0
G1 X3.81 Y0.44 Z5.04 F1914.0
G1 X3.81 Y-0.41 Z5.04 F1914.0
G1 X4.59 Y-1.2 Z5.04 F1914.0
G1 X5.44 Y-1.2 Z5.04 F1914.0
G1 X6.2 Y-1.1 Z5.04 F1914.0
G1 X6.2 Y-0.26 Z5.04 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z5.04 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z5.04 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y-0.5 Z5.04 F3630.0
M101
G1 X-3.35 Y1.65 Z5.04 F1914.0
G1 X-6.65 Y1.65 Z5.04 F1914.0
G1 X-6.65 Y-1.65 Z5.04 F1914.0
G1 X-3.35 Y-1.65 Z5.04 F1914.0
G1 X-3.35 Y-1.08 Z5.04 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y-0.5 Z5.04 F1914.0
G1 X-2.79 Y2.21 Z5.04 F1914.0
G1 X-7.21 Y2.21 Z5.04 F1914.0
G1 X-7.21 Y-2.21 Z5.04 F1914.0
G1 X-2.79 Y-2.21 Z5.04 F1914.0
G1 X-2.79 Y-1.08 Z5.04 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y0.41 Z5.04 F3630.0
M101
G1 X-4.59 Y1.2 Z5.04 F1914.0
G1 X-5.44 Y1.2 Z5.04 F1914.0
G1 X-6.2 Y1.1 Z5.04 F1914.0
G1 X-6.2 Y-0.59 Z5.04 F1914.0
G1 X-5.59 Y-1.2 Z5.04 F1914.0
G1 X-3.9 Y-1.2 Z5.04 F1914.0
G1 X-3.81 Y-0.44 Z5.04 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 5.4 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X-2.5 Y-2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X-2.5 Y2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z5.4 </boundaryPoint>)
(<loop> outer )
G1 X-3.35 Y0.03 Z5.4 F993.827
M101
G1 X-3.35 Y1.65 Z5.4 F1914.0
G1 X-6.65 Y1.65 Z5.4 F1914.0
G1 X-6.65 Y-1.65 Z5.4 F1914.0
G1 X-3.35 Y-1.65 Z5.4 F1914.0
G1 X-3.35 Y-0.55 Z5.4 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-2.79 Y-0.15 Z5.4 F1914.0
G1 X-2.79 Y2.21 Z5.4 F1914.0
G1 X-7.21 Y2.21 Z5.4 F1914.0
G1 X-7.21 Y-2.21 Z5.4 F1914.0
G1 X-2.79 Y-2.21 Z5.4 F1914.0
G1 X-2.79 Y-0.73 Z5.4 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-3.81 Y-0.41 Z5.4 F3630.0
M101
G1 X-4.59 Y-1.2 Z5.4 F1914.0
G1 X-5.44 Y-1.2 Z5.4 F1914.0
G1 X-6.2 Y-1.1 Z5.4 F1914.0
G1 X-6.2 Y-0.26 Z5.4 F1914.0
G1 X-3.81 Y0.44 Z5.4 F1914.0
G1 X-3.9 Y1.2 Z5.4 F1914.0
G1 X-5.59 Y1.2 Z5.4 F1914.0
G1 X-6.2 Y0.59 Z5.4 F1914.0
M103
(</surroundingLoop>)
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X2.5 Y2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X2.5 Y-2.5 Z5.4 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z5.4 </boundaryPoint>)
(<loop> outer )
G1 X3.35 Y0.13 Z5.4 F3630.0
M101
G1 X3.35 Y-1.65 Z5.4 F1914.0
G1 X6.65 Y-1.65 Z5.4 F1914.0
G1 X6.65 Y1.65 Z5.4 F1914.0
G1 X3.35 Y1.65 Z5.4 F1914.0
G1 X3.35 Y0.71 Z5.4 F1914.0
(</loop>)
(<perimeter> outer )
G1 X2.79 Y0.31 Z5.4 F1914.0
G1 X2.79 Y-2.21 Z5.4 F1914.0
G1 X7.21 Y-2.21 Z5.4 F1914.0
G1 X7.21 Y2.21 Z5.4 F1914.0
G1 X2.79 Y2.21 Z5.4 F1914.0
G1 X2.79 Y0.88 Z5.4 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.59 Y-1.2 Z5.4 F3630.0
M101
G1 X6.2 Y-0.59 Z5.4 F1914.0
G1 X6.2 Y1.1 Z5.4 F1914.0
G1 X5.44 Y1.2 Z5.4 F1914.0
G1 X4.59 Y1.2 Z5.4 F1914.0
G1 X3.81 Y0.41 Z5.4 F1914.0
G1 X3.81 Y-0.44 Z5.4 F1914.0
G1 X3.9 Y-1.2 Z5.4 F1914.0
G1 X4.75 Y-1.2 Z5.4 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 5.76 )
(<bridgeRotation> (1+0j) )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z5.76 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z5.76 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z5.76 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z5.76 </boundaryPoint>)
(<perimeter> outer )
G1 X4.77 Y-2.21 Z5.76 F1438.805
M101
G1 X7.21 Y-2.21 Z5.76 F1914.0
G1 X7.21 Y2.21 Z5.76 F1914.0
G1 X-7.21 Y2.21 Z5.76 F1843.797
G1 X-7.21 Y-2.21 Z5.76 F1914.0
G1 X4.19 Y-2.21 Z5.76 F1873.379
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X-6.74 Y-1.62 Z5.76 F3630.0
M101
G1 X6.74 Y-1.62 Z5.76 F1851.62
G1 X6.74 Y-1.08 Z5.76 F1914.0
G1 X-6.74 Y-1.08 Z5.76 F1851.62
G1 X-6.74 Y-0.54 Z5.76 F1914.0
G1 X6.74 Y-0.54 Z5.76 F1851.62
G1 X6.74 Y0.0 Z5.76 F1914.0
G1 X-6.74 Y0.0 Z5.76 F1851.62
G1 X-6.74 Y0.54 Z5.76 F1914.0
G1 X6.74 Y0.54 Z5.76 F1851.62
G1 X6.74 Y1.08 Z5.76 F1914.0
G1 X-6.74 Y1.08 Z5.76 F1851.62
G1 X-6.74 Y1.62 Z5.76 F1914.0
G1 X6.74 Y1.62 Z5.76 F1851.62
M103
(</surroundingLoop>)
(</bridgeRotation>)
(</layer>)
(<layer> 6.12 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z6.12 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z6.12 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z6.12 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z6.12 </boundaryPoint>)
(<loop> outer )
G1 X5.92 Y1.65 Z6.12 F1191.261
M101
G1 X-6.65 Y1.65 Z6.12 F1860.143
G1 X-6.65 Y-1.65 Z6.12 F1914.0
G1 X6.65 Y-1.65 Z6.12 F1853.067
G1 X6.65 Y1.65 Z6.12 F1914.0
G1 X6.49 Y1.65 Z6.12 F1914.0
(</loop>)
(<perimeter> outer )
G1 X5.92 Y2.21 Z6.12 F1914.0
G1 X-7.21 Y2.21 Z6.12 F1854.7
G1 X-7.21 Y-2.21 Z6.12 F1914.0
G1 X7.21 Y-2.21 Z6.12 F1843.797
G1 X7.21 Y2.21 Z6.12 F1914.0
G1 X6.49 Y2.21 Z6.12 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.59 Y-1.2 Z6.12 F3630.0
M101
G1 X6.2 Y-0.59 Z6.12 F1914.0
G1 X6.2 Y1.1 Z6.12 F1914.0
G1 X4.59 Y1.2 Z6.12 F1914.0
G1 X4.75 Y-1.2 Z6.12 F1914.0
G1 X1.35 Y-1.2 Z6.12 F1914.0
G1 X3.74 Y1.2 Z6.12 F1914.0
G1 X2.89 Y1.2 Z6.12 F1914.0
G1 X0.5 Y-1.2 Z6.12 F1914.0
G1 X-0.35 Y-1.2 Z6.12 F1914.0
G1 X2.04 Y1.2 Z6.12 F1914.0
G1 X1.2 Y1.2 Z6.12 F1914.0
G1 X-1.2 Y-1.2 Z6.12 F1914.0
G1 X-2.04 Y-1.2 Z6.12 F1914.0
G1 X0.35 Y1.2 Z6.12 F1914.0
G1 X-0.5 Y1.2 Z6.12 F1914.0
G1 X-2.89 Y-1.2 Z6.12 F1914.0
G1 X-3.74 Y-1.2 Z6.12 F1914.0
G1 X-1.35 Y1.2 Z6.12 F1914.0
G1 X-3.05 Y1.2 Z6.12 F1914.0
G1 X-4.59 Y-1.2 Z6.12 F1914.0
G1 X-6.2 Y-1.1 Z6.12 F1914.0
G1 X-6.2 Y-0.26 Z6.12 F1914.0
G1 X-3.9 Y1.2 Z6.12 F1914.0
G1 X-5.59 Y1.2 Z6.12 F1914.0
G1 X-6.2 Y0.59 Z6.12 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 6.48 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z6.48 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z6.48 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z6.48 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z6.48 </boundaryPoint>)
(<loop> outer )
G1 X-6.11 Y0.3 Z6.48 F630.734
M101
G1 X-6.11 Y-1.11 Z6.48 F1914.0
G1 X6.11 Y-1.11 Z6.48 F1863.763
G1 X6.11 Y1.11 Z6.48 F1914.0
G1 X-6.11 Y1.11 Z6.48 F1863.763
G1 X-6.11 Y0.87 Z6.48 F1914.0
(</loop>)
(<loop> outer )
G1 X-6.65 Y0.31 Z6.48 F1914.0
G1 X-6.65 Y-1.65 Z6.48 F1914.0
G1 X6.65 Y-1.65 Z6.48 F1853.067
G1 X6.65 Y1.65 Z6.48 F1914.0
G1 X-6.65 Y1.65 Z6.48 F1853.067
G1 X-6.65 Y0.88 Z6.48 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-7.21 Y0.31 Z6.48 F1914.0
G1 X-7.21 Y-2.21 Z6.48 F1914.0
G1 X7.21 Y-2.21 Z6.48 F1843.797
G1 X7.21 Y2.21 Z6.48 F1914.0
G1 X-7.21 Y2.21 Z6.48 F1843.797
G1 X-7.21 Y0.88 Z6.48 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.66 Y0.45 Z6.48 F3630.0
M101
G1 X5.45 Y0.66 Z6.48 F1914.0
G1 X4.69 Y0.66 Z6.48 F1914.0
G1 X5.66 Y-0.31 Z6.48 F1914.0
G1 X5.24 Y-0.66 Z6.48 F1914.0
G1 X3.93 Y0.66 Z6.48 F1914.0
G1 X3.16 Y0.66 Z6.48 F1914.0
G1 X4.47 Y-0.66 Z6.48 F1914.0
G1 X3.71 Y-0.66 Z6.48 F1914.0
G1 X2.4 Y0.66 Z6.48 F1914.0
G1 X1.64 Y0.66 Z6.48 F1914.0
G1 X2.95 Y-0.66 Z6.48 F1914.0
G1 X2.18 Y-0.66 Z6.48 F1914.0
G1 X0.87 Y0.66 Z6.48 F1914.0
G1 X0.11 Y0.66 Z6.48 F1914.0
G1 X1.42 Y-0.66 Z6.48 F1914.0
G1 X0.66 Y-0.66 Z6.48 F1914.0
G1 X-0.66 Y0.66 Z6.48 F1914.0
G1 X-1.42 Y0.66 Z6.48 F1914.0
G1 X-0.11 Y-0.66 Z6.48 F1914.0
G1 X-0.87 Y-0.66 Z6.48 F1914.0
G1 X-2.18 Y0.66 Z6.48 F1914.0
G1 X-2.95 Y0.66 Z6.48 F1914.0
G1 X-1.64 Y-0.66 Z6.48 F1914.0
G1 X-2.4 Y-0.66 Z6.48 F1914.0
G1 X-3.71 Y0.66 Z6.48 F1914.0
G1 X-4.47 Y0.66 Z6.48 F1914.0
G1 X-3.16 Y-0.66 Z6.48 F1914.0
G1 X-3.93 Y-0.66 Z6.48 F1914.0
G1 X-5.24 Y0.66 Z6.48 F1914.0
G1 X-5.66 Y0.31 Z6.48 F1914.0
G1 X-4.69 Y-0.66 Z6.48 F1914.0
G1 X-5.45 Y-0.66 Z6.48 F1914.0
G1 X-5.66 Y-0.45 Z6.48 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 6.84 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z6.84 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z6.84 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z6.84 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z6.84 </boundaryPoint>)
(<loop> outer )
G1 X-6.65 Y-0.31 Z6.84 F1428.806
M101
G1 X-6.65 Y-1.65 Z6.84 F1914.0
G1 X6.65 Y-1.65 Z6.84 F1853.067
G1 X6.65 Y1.65 Z6.84 F1914.0
G1 X-6.65 Y1.65 Z6.84 F1853.067
G1 X-6.65 Y0.27 Z6.84 F1914.0
(</loop>)
(<perimeter> outer )
G1 X-7.21 Y-0.31 Z6.84 F1914.0
G1 X-7.21 Y-2.21 Z6.84 F1914.0
G1 X7.21 Y-2.21 Z6.84 F1843.797
G1 X7.21 Y2.21 Z6.84 F1914.0
G1 X-7.21 Y2.21 Z6.84 F1843.797
G1 X-7.21 Y0.27 Z6.84 F1914.0
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.68 Y-1.2 Z6.84 F3630.0
M101
G1 X6.2 Y-0.68 Z6.84 F1914.0
G1 X6.2 Y0.09 Z6.84 F1914.0
G1 X4.91 Y-1.2 Z6.84 F1914.0
G1 X4.15 Y-1.2 Z6.84 F1914.0
G1 X6.2 Y0.85 Z6.84 F1914.0
G1 X5.78 Y1.2 Z6.84 F1914.0
G1 X3.39 Y-1.2 Z6.84 F1914.0
G1 X2.62 Y-1.2 Z6.84 F1914.0
G1 X5.01 Y1.2 Z6.84 F1914.0
G1 X4.25 Y1.2 Z6.84 F1914.0
G1 X1.86 Y-1.2 Z6.84 F1914.0
G1 X1.1 Y-1.2 Z6.84 F1914.0
G1 X3.49 Y1.2 Z6.84 F1914.0
G1 X2.72 Y1.2 Z6.84 F1914.0
G1 X0.33 Y-1.2 Z6.84 F1914.0
G1 X-0.43 Y-1.2 Z6.84 F1914.0
G1 X1.96 Y1.2 Z6.84 F1914.0
G1 X1.2 Y1.2 Z6.84 F1914.0
G1 X-1.2 Y-1.2 Z6.84 F1914.0
G1 X-1.96 Y-1.2 Z6.84 F1914.0
G1 X0.43 Y1.2 Z6.84 F1914.0
G1 X-0.33 Y1.2 Z6.84 F1914.0
G1 X-2.72 Y-1.2 Z6.84 F1914.0
G1 X-3.49 Y-1.2 Z6.84 F1914.0
G1 X-1.1 Y1.2 Z6.84 F1914.0
G1 X-1.86 Y1.2 Z6.84 F1914.0
G1 X-4.25 Y-1.2 Z6.84 F1914.0
G1 X-5.01 Y-1.2 Z6.84 F1914.0
G1 X-2.62 Y1.2 Z6.84 F1914.0
G1 X-3.39 Y1.2 Z6.84 F1914.0
G1 X-5.78 Y-1.2 Z6.84 F1914.0
G1 X-6.2 Y-0.85 Z6.84 F1914.0
G1 X-4.15 Y1.2 Z6.84 F1914.0
G1 X-4.91 Y1.2 Z6.84 F1914.0
G1 X-6.2 Y-0.09 Z6.84 F1914.0
G1 X-6.2 Y0.68 Z6.84 F1914.0
G1 X-5.68 Y1.2 Z6.84 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(<layer> 7.2 )
(<surroundingLoop>)
(<boundaryPerimeter>)
(<boundaryPoint> X7.5 Y2.5 Z7.2 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y2.5 Z7.2 </boundaryPoint>)
(<boundaryPoint> X-7.5 Y-2.5 Z7.2 </boundaryPoint>)
(<boundaryPoint> X7.5 Y-2.5 Z7.2 </boundaryPoint>)
(<loop> outer )
G1 X-6.11 Y0.98 Z7.2 F805.608
M101
G1 X-6.11 Y-1.11 Z7.2 F1914.0
G1 X6.11 Y-1.11 Z7.2 F1863.763
G1 X6.11 Y1.11 Z7.2 F1914.0
G1 X-5.67 Y1.11 Z7.2 F1868.771
(</loop>)
(<loop> outer )
G1 X-5.97 Y1.65 Z7.2 F1914.0
G1 X-6.65 Y1.65 Z7.2 F1914.0
G1 X-6.65 Y-1.65 Z7.2 F1914.0
G1 X6.65 Y-1.65 Z7.2 F1853.067
G1 X6.65 Y1.65 Z7.2 F1914.0
G1 X-5.39 Y1.65 Z7.2 F1865.791
(</loop>)
(<perimeter> outer )
G1 X-5.97 Y2.21 Z7.2 F1914.0
G1 X-7.21 Y2.21 Z7.2 F1914.0
G1 X-7.21 Y-2.21 Z7.2 F1914.0
G1 X7.21 Y-2.21 Z7.2 F1843.797
G1 X7.21 Y2.21 Z7.2 F1914.0
G1 X-5.39 Y2.21 Z7.2 F1859.837
M103
(</perimeter>)
(</boundaryPerimeter>)
G1 X5.66 Y0.45 Z7.2 F3630.0
M101
G1 X5.45 Y0.66 Z7.2 F1914.0
G1 X4.69 Y0.66 Z7.2 F1914.0
G1 X5.66 Y-0.31 Z7.2 F1914.0
G1 X5.24 Y-0.66 Z7.2 F1914.0
G1 X3.93 Y0.66 Z7.2 F1914.0
G1 X3.16 Y0.66 Z7.2 F1914.0
G1 X4.47 Y-0.66 Z7.2 F1914.0
G1 X3.71 Y-0.66 Z7.2 F1914.0
G1 X2.4 Y0.66 Z7.2 F1914.0
G1 X1.64 Y0.66 Z7.2 F1914.0
G1 X2.95 Y-0.66 Z7.2 F1914.0
G1 X2.18 Y-0.66 Z7.2 F1914.0
G1 X0.87 Y0.66 Z7.2 F1914.0
G1 X0.11 Y0.66 Z7.2 F1914.0
G1 X1.42 Y-0.66 Z7.2 F1914.0
G1 X0.66 Y-0.66 Z7.2 F1914.0
G1 X-0.66 Y0.66 Z7.2 F1914.0
G1 X-1.42 Y0.66 Z7.2 F1914.0
G1 X-0.11 Y-0.66 Z7.2 F1914.0
G1 X-0.87 Y-0.66 Z7.2 F1914.0
G1 X-2.18 Y0.66 Z7.2 F1914.0
G1 X-2.95 Y0.66 Z7.2 F1914.0
G1 X-1.64 Y-0.66 Z7.2 F1914.0
G1 X-2.4 Y-0.66 Z7.2 F1914.0
G1 X-3.71 Y0.66 Z7.2 F1914.0
G1 X-4.47 Y0.66 Z7.2 F1914.0
G1 X-3.16 Y-0.66 Z7.2 F1914.0
G1 X-3.93 Y-0.66 Z7.2 F1914.0
G1 X-5.24 Y0.66 Z7.2 F1914.0
G1 X-5.66 Y0.31 Z7.2 F1914.0
G1 X-4.69 Y-0.66 Z7.2 F1914.0
G1 X-5.45 Y-0.66 Z7.2 F1914.0
G1 X-5.66 Y-0.45 Z7.2 F1914.0
M103
(</surroundingLoop>)
(</layer>)
(</extrusion>)
M104 S0
M103
M104 S20
M113 S0
G1 X-5.66 Y0.0 Z5.58 F498.493
M113 S0.0
