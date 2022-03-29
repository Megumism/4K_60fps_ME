Technology	{
		name				= "hu55npkldut_m06f1f0_RDL"
		date				= "Feb 12 2014"
		dielectric			= 3.45e-05
		unitTimeName			= "ns"
		timePrecision			= 1000
		unitLengthName			= "micron"
		lengthPrecision			= 1000
		gridResolution			= 5
		unitVoltageName			= "V"
		voltagePrecision		= 1000000
		unitCurrentName			= "mA"
		currentPrecision		= 1000000
		unitPowerName			= "nw"
		powerPrecision			= 1000
		unitResistanceName		= "kohm"
		resistancePrecision		= 1000000
		unitCapacitanceName		= "pf"
		capacitancePrecision		= 1000000
		unitInductanceName		= "nh"
		inductancePrecision		= 100
		minBaselineTemperature		= 25
		nomBaselineTemperature		= 25
		maxBaselineTemperature		= 25
		fatWireExtensionMode		= 1
		minEdgeMode			= 1
                cornerSpacingMode		= 0

}


Color           43 {
                name                            = "43"
                rgbDefined                      = 1
                redIntensity                    = 180
                greenIntensity                  = 175
                blueIntensity                   = 255
}

Color           47 { 
                name                            = "47"
                rgbDefined                      = 1
                redIntensity                    = 180
                greenIntensity                  = 255
                blueIntensity                   = 255
}

Color           62 {
                name                            = "62"
                rgbDefined                      = 1
                redIntensity                    = 255
                greenIntensity                  = 255
                blueIntensity                   = 190
}

Color           61 {
                name                            = "61"
                rgbDefined                      = 1
                redIntensity                    = 255
                greenIntensity                  = 255
                blueIntensity                   = 100
}

Color           59 {
                name                            = "59"
                rgbDefined                      = 1
                redIntensity                    = 255
                greenIntensity                  = 175
                blueIntensity                   = 255
}

Color           55 {
                name                            = "55"
                rgbDefined                      = 1
                redIntensity                    = 255
                greenIntensity                  = 80
                blueIntensity                   = 255
}

Tile		"unit" {
		width				= 0.2
		height				= 1.4
}

Layer		"AA" {
		layerNumber			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "49"
		lineStyle			= "solid"
		pattern				= "solid"
}

Layer		"NW" {
		layerNumber			= 6
		maskName			= "nwell"
		color				= "magenta"
		lineStyle			= "dash"
		pattern				= "blank"
		blink				= 0
		visible				= 1
		selectable			= 1
}

Layer        "PWELL" {
                         layerNumber            = 10
                            maskName            = "pwell"
                               color            = "magenta"
                           lineStyle            = "solid"
                             pattern            = "dot"
                               blink            = 0
                             visible            = 1
                          selectable            = 1
}


Layer        "HVTP" {
                         layerNumber            = 14
                         isDefaultLayer         = 1
                            maskName            = "implant"
                             visible            = 1
                          selectable            = 1
                               blink            = 0
                               color            = "53"
                           lineStyle            = "solid"
                             pattern            = "dot"
}

Layer        "HVTN" {
                         layerNumber            = 15
                         isDefaultLayer         = 1
                            maskName            = "implant"
                             visible            = 1
                          selectable            = 1
                               blink            = 0
                               color            = "33"
                           lineStyle            = "solid"
                             pattern            = "dot"
}

Layer        "LVTP" {
                         layerNumber            = 16
                         isDefaultLayer         = 1
                            maskName            = "implant"
                             visible            = 1
                          selectable            = 1
                               blink            = 0
                               color            = "54"
                           lineStyle            = "solid"
                             pattern            = "dot"
}

Layer        "LVTN" {
                         layerNumber            = 17
                         isDefaultLayer         = 1
                            maskName            = "implant"
                             visible            = 1
                          selectable            = 1
                               blink            = 0
                               color            = "34"
                           lineStyle            = "solid"
                             pattern            = "dot"
}



Layer           "PO" {
                layerNumber                     = 40
                maskName                        = "poly"
                visible                         = 1
                selectable                      = 1
                blink                           = 0
                color                           = "white"
                lineStyle                       = "solid"
                pattern                         = "blank"
                pitch                           = 0
                defaultWidth                    = 0
                minWidth                        = 0
                minSpacing                      = 0
}


Layer        "CT" {
                         layerNumber            = 85
                      isDefaultLayer            = 1
                            maskName            = "polyCont"
                               color            = "61"
                           lineStyle            = "solid"
                             pattern            = "backSlash"
                               blink            = 0
                             visible            = 1
                          selectable            = 1
                        defaultWidth            = 0.09
                            minWidth            = 0.09
                          minSpacing            = 0.11
}         

Layer           "M1" {
                layerNumber                     = 101
                maskName                        = "metal1"
                isDefaultLayer                  = 1
                visible                         = 1
                selectable                      = 1
                blink                           = 0
                color                           = "cyan"
                lineStyle                       = "solid"
                pattern                         = "dot"
                pitch                           = 0.2
                defaultWidth                    = 0.10
                minWidth                        = 0.09
                minSpacing                      = 0.09
                maxWidth                        = 10
		
         endOfLine2NeighborThreshold            = 0.109
        endOfLine2NeighborMinSpacing            = 0.11
 endOfLine2NeighborSideKeepoutLength            = 0.11
  endOfLine2NeighborSideKeepoutWidth            = 0.2	 	
                fatTblDimension           	= 4
                fatTblThreshold           	= (0,    0.421, 1.501, 4.501)
                fatTblParallelLength            = (0,    0.421, 1.501, 4.501)
                fatTblSpacing           	= (0.09, 0.15,  0.5,   1.5,
                				   0.15, 0.15,  0.5,   1.5,
                				   0.5,  0.5,    0.5,   1.5,
						   1.5,  1.5,   1.5,   1.5)
                unitMinThickness                = 0.1445
                unitNomThickness                = 0.17
                unitMaxThickness                = 0.1955
                minArea                         = 0.042
                minEnclosedArea                 = 0.18
                maxCurrDensity          	= 0.15
}


Layer		"V1" {
		layerNumber			= 121
		maskName			= "via1"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
                blink                           = 0
                lineStyle                       = "solid"
		color				= "43"
		pattern				= "rectangleX"
		pitch				= 0
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.13
		sameNetMinSpacing		= 0.1
		enclosedCutNumNeighbor		= 3
		enclosedCutNeighborRange	= 0.14
		enclosedCutMinSpacing		= 0.13
		enclosedCutToNeighborMinSpacing	= 0.13
		fatTblDimension         	= 3
		fatTblThreshold      		= (0, 0.301, 0.701)
             	fatTblFatContactNumber          = ("11,12", "20,201", "20,201")
             	fatTblFatContactMinCuts         = ("1,1" , "2,2", "4,4")
             	maxCurrDensity          	= 0.015

}

Layer		"M2" {
		layerNumber			= 102
		maskName			= "metal2"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
                lineStyle                       = "solid"
		color				= "yellow"
		pattern				= "dot"
		pitch				= 0.2
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.1
		maxWidth			= 10
		
         endOfLine2NeighborThreshold            = 0.119
        endOfLine2NeighborMinSpacing            = 0.12
 endOfLine2NeighborSideKeepoutLength            = 0.12
  endOfLine2NeighborSideKeepoutWidth            = 0.22	 		
                fatTblDimension           	= 4
                fatTblThreshold           	= (0,    0.421, 1.501, 4.501)
                fatTblParallelLength            = (0,    0.421, 1.501, 4.501)
                fatTblSpacing           	= (0.1,  0.15,  0.5,   1.5,
                				   0.15, 0.15,  0.5,   1.5,
                				   0.5,  0.5,    0.5,   1.5,
						   1.5,  1.5,   1.5,   1.5)
		unitMinThickness		= 0.1785
		unitNomThickness		= 0.21
		unitMaxThickness		= 0.2415
		minArea				= 0.052
		minEnclosedArea			= 0.18
		maxCurrDensity          	= 0.17
}


Layer		"V2" {
		layerNumber			= 122
		maskName			= "via2"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
                blink                           = 0
                lineStyle                       = "solid"
                color                           = "blue"
                pattern                         = "blank"
		pitch				= 0
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.13
		sameNetMinSpacing		= 0.1
		enclosedCutNumNeighbor		= 3
		enclosedCutNeighborRange	= 0.14
		enclosedCutMinSpacing		= 0.13
		enclosedCutToNeighborMinSpacing	= 0.13
		fatTblDimension         	= 3
		fatTblThreshold      		= (0, 0.301, 0.701)
                fatTblFatContactNumber          = ( "21,22" , 30, 30)
                fatTblFatContactMinCuts         = ( "1,1" , 2, 4)   
                maxCurrDensity          	= 0.015
}

Layer		"M3" {
		layerNumber			= 103
		maskName			= "metal3"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
                lineStyle                       = "solid"
                color                           = "red"
                pattern                         = "wave"
		pitch				= 0.2
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.1
		maxWidth			= 10
		
	endOfLine2NeighborThreshold            = 0.119
        endOfLine2NeighborMinSpacing            = 0.12
 endOfLine2NeighborSideKeepoutLength            = 0.12
  endOfLine2NeighborSideKeepoutWidth            = 0.22	 		
                fatTblDimension           	= 4
                fatTblThreshold           	= (0,    0.421, 1.501, 4.501)
                fatTblParallelLength            = (0,    0.421, 1.501, 4.501)
                fatTblSpacing           	= (0.1,  0.15,  0.5,   1.5,
                				   0.15, 0.15,  0.5,   1.5,
                				   0.5,  0.5,    0.5,   1.5,
						   1.5,  1.5,   1.5,   1.5)
		unitMinThickness		= 0.1785
		unitNomThickness		= 0.21
		unitMaxThickness		= 0.2415
		minArea				= 0.052
		minEnclosedArea			= 0.18
		maxCurrDensity          	= 0.17
}


Layer		"V3" {
		layerNumber			= 123
		maskName			= "via3"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
                blink                           = 0
                lineStyle                       = "solid"
                color                           = "yellow"
                pattern                         = "blank"
		pitch				= 0
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.13
		sameNetMinSpacing		= 0.1
		enclosedCutNumNeighbor		= 3
		enclosedCutNeighborRange	= 0.14
		enclosedCutMinSpacing		= 0.13
		enclosedCutToNeighborMinSpacing	= 0.13
		fatTblDimension         	= 3
                fatTblThreshold      		= (0, 0.301, 0.701)
              fatTblFatContactNumber            = ( "31,32" , 40, 40)
             fatTblFatContactMinCuts            = ( "1,1" , 2, 4)
                maxCurrDensity          	= 0.015
}
Layer		"M4" {
		layerNumber			= 104
		maskName			= "metal4"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
                lineStyle                       = "solid"
                color                           = "green"
                pattern                         = "slash"
		pitch				= 0.2
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.1
		maxWidth			= 10
		
	endOfLine2NeighborThreshold            = 0.119
        endOfLine2NeighborMinSpacing            = 0.12
 endOfLine2NeighborSideKeepoutLength            = 0.12
  endOfLine2NeighborSideKeepoutWidth            = 0.22
	 		
                fatTblDimension           	= 4
                fatTblThreshold           	= (0,    0.421, 1.501, 4.501)
                fatTblParallelLength            = (0,    0.421, 1.501, 4.501)
                fatTblSpacing           	= (0.1,  0.15,  0.5,   1.5,
                				   0.15, 0.15,  0.5,   1.5,
                				   0.5,  0.5,    0.5,   1.5,
						   1.5,  1.5,   1.5,   1.5)
		unitMinThickness		= 0.1785
		unitNomThickness		= 0.21
		unitMaxThickness		= 0.2415
		minArea				= 0.052
		minEnclosedArea			= 0.18
		maxCurrDensity          	= 0.17
}


Layer		"V4" {
		layerNumber			= 124
		maskName			= "via4"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
                blink                           = 0
                lineStyle                       = "solid"
                color                           = "white"
                pattern                         = "rectangleX"
		pitch				= 0
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.13
		sameNetMinSpacing		= 0.1
		enclosedCutNumNeighbor		= 3
		enclosedCutNeighborRange	= 0.14
		enclosedCutMinSpacing		= 0.13
		enclosedCutToNeighborMinSpacing	= 0.13
		fatTblDimension         	= 3
                fatTblThreshold      		= (0, 0.301, 0.701)
              fatTblFatContactNumber            = ( "41,42" , 50, 50)
             fatTblFatContactMinCuts            = ( "1,1" , 2, 4)
                maxCurrDensity          	= 0.015
}

Layer		"M5" {
		layerNumber			= 105
		maskName			= "metal5"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
                lineStyle                       = "solid"
                color                           = "magenta"
                pattern                         = "backSlash"
		pitch				= 0.2
		defaultWidth			= 0.1
		minWidth			= 0.1
		minSpacing			= 0.1
		maxWidth			= 10
        
	 endOfLine2NeighborThreshold            = 0.119
        endOfLine2NeighborMinSpacing            = 0.12
 endOfLine2NeighborSideKeepoutLength            = 0.12
  endOfLine2NeighborSideKeepoutWidth            = 0.22	 		
                fatTblDimension           	= 4
                fatTblThreshold           	= (0,    0.421, 1.501, 4.501)
                fatTblParallelLength            = (0,    0.421, 1.501, 4.501)
                fatTblSpacing           	= (0.1,  0.15,  0.5,   1.5,
                				   0.15, 0.15,  0.5,   1.5,
                				   0.5,  0.5,    0.5,   1.5,
						   1.5,  1.5,   1.5,   1.5)
		unitMinThickness		= 0.1785
		unitNomThickness		= 0.21
		unitMaxThickness		= 0.2415
		minArea				= 0.052
		minEnclosedArea			= 0.18
		maxCurrDensity          	= 0.17
}





Layer		"T4V2" {
		layerNumber			= 131
		maskName			= "via5"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "43"
		lineStyle			= "solid"
		pattern				= "blank"
		pitch				= 0
		defaultWidth			= 0.2
		minWidth			= 0.2
		minSpacing			= 0.2
		enclosedCutNumNeighbor		= 3
		enclosedCutNeighborRange	= 0.28
		enclosedCutMinSpacing		= 0.25
		enclosedCutToNeighborMinSpacing	= 0.25
		fatTblDimension         	= 3
                fatTblThreshold      		= (0, 0.601, 1.401)
              fatTblFatContactNumber            = ( "70,71" , 74 , 74)
             fatTblFatContactMinCuts            = ( "1,1" , 2, 4)
                maxCurrDensity          	= 0.029

}

Layer           "T4M2" {
                layerNumber                     = 111
                maskName                        = "metal6"
                isDefaultLayer                  = 1
                visible                         = 1
                selectable                      = 1
                blink                           = 0
                lineStyle                       = "solid"
                color                           = "47"
                pattern                         = "dot"
                pitch                           = 0.4
                defaultWidth                    = 0.2
                minWidth                        = 0.2
                minSpacing                      = 0.2
                maxWidth                        = 10
                fatTblDimension           	= 4
                fatTblThreshold           	= (0,    0.391, 1.501, 4.501)
                fatTblParallelLength            = (0,    1.001, 1.501, 4.501)
                fatTblSpacing           	= (0.20, 0.240, 0.500, 1.500,
                				   0.24, 0.240, 0.500, 1.500,
                				   0.50, 0.500, 0.500, 1.500,
                				   1.50, 1.500, 1.500, 1.500)  
                unitMinThickness                = 0.425
                unitNomThickness                = 0.5
                unitMaxThickness                = 0.575
                minArea                         = 0.14
                minEnclosedArea                 = 0.26
                maxCurrDensity          	= 0.45
                
}

Layer		"RV" {
		layerNumber			= 148
		maskName			= "via6"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "43"
		lineStyle			= "solid"
		pattern				= "rectangleX"
		pitch				= 0
		defaultWidth			= 3
		minWidth			= 3
		minSpacing			= 3
}

Layer		"RDL" {
		layerNumber			= 144
		maskName			= "metal7"
		isDefaultLayer			= 1
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "yellow"
		lineStyle			= "solid"
		pattern				= "blank"
		pitch				= 5
		defaultWidth			= 3
		minWidth			= 3
		minSpacing			= 2
		maxWidth			= 35
		unitMinThickness		= 1.4500
		unitNomThickness		= 1.4500
		unitMaxThickness		= 1.4500
                
}






ContactCode     "VIA1_1"{
                contactCodeNumber = 11
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode	"VIA1_2"{
		contactCodeNumber = 12
		contactSourceType = 0
		cutLayer = "V1"
		lowerLayer = "M1"
		upperLayer = "M2"
		isDefaultContact = 1
		cutWidth = 0.1
		cutHeight = 0.1
		upperLayerEncWidth = 0.0
		upperLayerEncHeight = 0.04
		lowerLayerEncWidth = 0.0
		lowerLayerEncHeight = 0.04
		minNumRows = 1
		minNumCols = 1
		minCutSpacing = 0.1
}

ContactCode     "VIA1_3"{
                contactCodeNumber = 13
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA1_4"{
                contactCodeNumber = 14
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA1_5"{
                contactCodeNumber = 15
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA1_6"{
                contactCodeNumber = 16
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA1_7"{
                contactCodeNumber = 17
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA1_8"{
                contactCodeNumber = 18
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA1_9"{
                contactCodeNumber = 19
                contactSourceType = 0
                cutLayer = "V1"
                lowerLayer = "M1"
                upperLayer = "M2"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode	"VIA1_FAT" {
		contactCodeNumber		= 20
		cutLayer			= "V1"
		lowerLayer			= "M1"
		upperLayer			= "M2"
		isDefaultContact		= 0
		isFatContact                    = 1
		cutWidth			= 0.1
		cutHeight			= 0.1
		upperLayerEncWidth		= 0.03
		upperLayerEncHeight		= 0.03
		lowerLayerEncWidth		= 0.03
		lowerLayerEncHeight		= 0.03
		minCutSpacing			= 0.13
}

ContactCode	"VIA1_FAT1" {
		contactCodeNumber		= 201
		cutLayer			= "V1"
		lowerLayer			= "M1"
		upperLayer			= "M2"
		isDefaultContact		= 0
		isFatContact                    = 1
		cutWidth			= 0.1
		cutHeight			= 0.1
		upperLayerEncWidth		= 0.04
		upperLayerEncHeight		= 0
		lowerLayerEncWidth		= 0.04
		lowerLayerEncHeight		= 0
		minCutSpacing			= 0.13
}

ContactCode     "VIA2_1"{
                contactCodeNumber = 21
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode	"VIA2_2"{
		contactCodeNumber = 22
		contactSourceType = 0
		cutLayer = "V2"
		lowerLayer = "M2"
		upperLayer = "M3"
		isDefaultContact = 1
		cutWidth = 0.1
		cutHeight = 0.1
		upperLayerEncWidth = 0.0
		upperLayerEncHeight = 0.04
		lowerLayerEncWidth = 0.0
		lowerLayerEncHeight = 0.04
		minNumRows = 1
		minNumCols = 1
		minCutSpacing = 0.1
}

ContactCode     "VIA2_3"{
                contactCodeNumber = 23
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA2_4"{
                contactCodeNumber = 24
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA2_5"{
                contactCodeNumber = 25
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA2_6"{
                contactCodeNumber = 26
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA2_7"{
                contactCodeNumber = 27
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA2_8"{
                contactCodeNumber = 28
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA2_9"{
                contactCodeNumber = 29
                contactSourceType = 0
                cutLayer = "V2"
                lowerLayer = "M2"
                upperLayer = "M3"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode	"VIA2_FAT" {
		contactCodeNumber		= 30
		cutLayer			= "V2"
		lowerLayer			= "M2"
		upperLayer			= "M3"
		isDefaultContact		= 0
		isFatContact                    = 1
		cutWidth			= 0.1
		cutHeight			= 0.1
		upperLayerEncWidth		= 0.03
		upperLayerEncHeight		= 0.03
		lowerLayerEncWidth		= 0.03
		lowerLayerEncHeight		= 0.03
		minCutSpacing			= 0.13
}

ContactCode     "VIA3_1"{
                contactCodeNumber = 31
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode	"VIA3_2"{
		contactCodeNumber = 32
		contactSourceType = 0
		cutLayer = "V3"
		lowerLayer = "M3"
		upperLayer = "M4"
		isDefaultContact = 1
		cutWidth = 0.1
		cutHeight = 0.1
		upperLayerEncWidth = 0.0
		upperLayerEncHeight = 0.04
		lowerLayerEncWidth = 0.0
		lowerLayerEncHeight = 0.04
		minNumRows = 1
		minNumCols = 1
		minCutSpacing = 0.1
}

ContactCode     "VIA3_3"{
                contactCodeNumber = 33
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA3_4"{
                contactCodeNumber = 34
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA3_5"{
                contactCodeNumber = 35
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA3_6"{
                contactCodeNumber = 36
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA3_7"{
                contactCodeNumber = 37
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA3_8"{
                contactCodeNumber = 38
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA3_9"{
                contactCodeNumber = 39
                contactSourceType = 0
                cutLayer = "V3"
                lowerLayer = "M3"
                upperLayer = "M4"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode	"VIA3_FAT" {
		contactCodeNumber		= 40
		cutLayer			= "V3"
		lowerLayer			= "M3"
		upperLayer			= "M4"
		isDefaultContact		= 0
		isFatContact                    = 1
		cutWidth			= 0.1
		cutHeight			= 0.1
		upperLayerEncWidth		= 0.03
		upperLayerEncHeight		= 0.03
		lowerLayerEncWidth		= 0.03
		lowerLayerEncHeight		= 0.03
		minCutSpacing			= 0.13
}

ContactCode     "VIA4_1"{
                contactCodeNumber = 41
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode	"VIA4_2"{
		contactCodeNumber = 42
		contactSourceType = 0
		cutLayer = "V4"
		lowerLayer = "M4"
		upperLayer = "M5"
		isDefaultContact = 1
		cutWidth = 0.1
		cutHeight = 0.1
		upperLayerEncWidth = 0.0
		upperLayerEncHeight = 0.04
		lowerLayerEncWidth = 0.0
		lowerLayerEncHeight = 0.04
		minNumRows = 1
		minNumCols = 1
		minCutSpacing = 0.1
}

ContactCode     "VIA4_3"{
                contactCodeNumber = 43
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA4_4"{
                contactCodeNumber = 44
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA4_5"{
                contactCodeNumber = 45
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.04
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA4_6"{
                contactCodeNumber = 46
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.04
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA4_7"{
                contactCodeNumber = 47
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.04
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA4_8"{
                contactCodeNumber = 48
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.04
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}

ContactCode     "VIA4_9"{
                contactCodeNumber = 49
                contactSourceType = 0
                cutLayer = "V4"
                lowerLayer = "M4"
                upperLayer = "M5"
                isDefaultContact = 1
                cutWidth = 0.1
                cutHeight = 0.1
                upperLayerEncWidth = 0.03
                upperLayerEncHeight = 0.03
                lowerLayerEncWidth = 0.03
                lowerLayerEncHeight = 0.03
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.1
}


ContactCode	"VIA4_FAT" {
		contactCodeNumber		= 50
		cutLayer			= "V4"
		lowerLayer			= "M4"
		upperLayer			= "M5"
		isDefaultContact		= 0
		isFatContact                    = 1
		cutWidth			= 0.1
		cutHeight			= 0.1
		upperLayerEncWidth		= 0.03
		upperLayerEncHeight		= 0.03
		lowerLayerEncWidth		= 0.03
		lowerLayerEncHeight		= 0.03
		minCutSpacing			= 0.13
}


ContactCode     "T4V2_1"{
                contactCodeNumber = 70
                contactSourceType = 0
                cutLayer = "T4V2"
                lowerLayer = "M5"
                upperLayer = "T4M2"
                isDefaultContact = 1
                cutWidth = 0.2
                cutHeight = 0.2
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.05
                lowerLayerEncWidth = 0.05
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.2
}

ContactCode     "T4V2_2"{
                contactCodeNumber = 71
                contactSourceType = 0
                cutLayer = "T4V2"
                lowerLayer = "M5"
                upperLayer = "T4M2"
                isDefaultContact = 1
                cutWidth = 0.2
                cutHeight = 0.2
                upperLayerEncWidth = 0.0
                upperLayerEncHeight = 0.05
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.05
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.2
}

ContactCode     "T4V2_3"{
                contactCodeNumber = 72
                contactSourceType = 0
                cutLayer = "T4V2"
                lowerLayer = "M5"
                upperLayer = "T4M2"
                isDefaultContact = 1
                cutWidth = 0.2
                cutHeight = 0.2
                upperLayerEncWidth = 0.05
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.05
                lowerLayerEncHeight = 0.0
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.2
}

ContactCode     "T4V2_4"{
                contactCodeNumber = 73
                contactSourceType = 0
                cutLayer = "T4V2"
                lowerLayer = "M5"
                upperLayer = "T4M2"
                isDefaultContact = 1
                cutWidth = 0.2
                cutHeight = 0.2
                upperLayerEncWidth = 0.05
                upperLayerEncHeight = 0.0
                lowerLayerEncWidth = 0.0
                lowerLayerEncHeight = 0.05
                minNumRows = 1
                minNumCols = 1
                minCutSpacing = 0.2
}

ContactCode	"T4V2_FAT" {
		contactCodeNumber		= 74
		cutLayer			= "T4V2"
		lowerLayer			= "M5"
		upperLayer			= "T4M2"
		isDefaultContact		= 0
		isFatContact                    = 1
		cutWidth			= 0.2
		cutHeight			= 0.2
		upperLayerEncWidth		= 0
		upperLayerEncHeight		= 0.05
		lowerLayerEncWidth		= 0.05
		lowerLayerEncHeight		= 0
		minCutSpacing			= 0.25
}
ContactCode	"RV_1" {
		contactCodeNumber		= 81
		cutLayer			= "RV"
		lowerLayer			= "T4M2"
		upperLayer			= "RDL"
		isDefaultContact		= 1
		cutWidth			= 3
		cutHeight			= 3
		upperLayerEncWidth		= 1.5
		upperLayerEncHeight		= 1.5
		lowerLayerEncWidth		= 1.5
		lowerLayerEncHeight		= 1.5
		minCutSpacing			= 3
}

LayerDataType		"TEXT1" {
		layerNumber			= 101
		dataTypeNumber			= 6
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "yellow"
		lineStyle			= "solid"
		pattern				= "blank"
}

LayerDataType		"TEXT2" {
		layerNumber			= 102
		dataTypeNumber			= 6
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "red"
		lineStyle			= "solid"
		pattern				= "blank"
}

LayerDataType		"TEXT3" {
		layerNumber			= 103
		dataTypeNumber			= 6
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "green"
		lineStyle			= "solid"
		pattern				= "blank"
}

LayerDataType		"TEXT4" {
		layerNumber			= 104
		dataTypeNumber			= 6
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "magenta"
		lineStyle			= "solid"
		pattern				= "blank"
}

LayerDataType		"TEXT5" {
		layerNumber			= 105
		dataTypeNumber			= 6
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "orange"
		lineStyle			= "solid"
		pattern				= "blank"
}


LayerDataType		"TEXT6" {
		layerNumber			= 111
		dataTypeNumber			= 6
		visible				= 1
		selectable			= 1
		blink				= 0
		color				= "purple"
		lineStyle			= "solid"
		pattern				= "blank"
}

LayerDataType        "VIPT" {
                         layerNumber            = 63
                      dataTypeNumber            = 63
                             nonMask            = 0
                             visible            = 0
                          selectable            = 0
                               blink            = 0
                               color            = "black"
                           lineStyle            = "solid"
                             pattern            = "dot"
}

LayerDataType        "AB" {
                         layerNumber            = 197
                         dataTypeNumber         = 4 
                             visible            = 1
                          selectable            = 1
                               blink            = 0
                               color            = "red"
                           lineStyle            = "solid"
                             pattern            = "blank"
}

Layer        "CellName" {
                         layerNumber            = 213
                               blink            = 0
                             visible            = 1
                          selectable            = 1
                               color            = "magenta"
                           lineStyle            = "solid"
                             pattern            = "blank"
}


DensityRule	{
		layer				= "M1"
		windowSize			= 100
		minDensity			= 10
		maxDensity			= 80
}

DensityRule	{
		layer				= "M2"
		windowSize			= 100
		minDensity			= 10
		maxDensity			= 80
}

DensityRule	{
		layer				= "M3"
		windowSize			= 100
		minDensity			= 10
		maxDensity			= 80
}

DensityRule	{
		layer				= "M4"
		windowSize			= 100
		minDensity			= 10
		maxDensity			= 80
}

DensityRule	{
		layer				= "M5"
		windowSize			= 100
		minDensity			= 10
		maxDensity			= 80
}

DensityRule             {
                               layer            = "T4M2"
                          windowSize            = 100 
                          minDensity            = 10
                          maxDensity            = 80
}


PRRule		{
		rowSpacingTopTop		= 0
		rowSpacingTopBot		= 1.5
		rowSpacingBotBot		= 0
		abuttableTopTop			= 1
		abuttableTopBot			= 0
		abuttableBotBot			= 1
}
