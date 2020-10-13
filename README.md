# grad-introCam

### Features
- Quickcreation of shots
-
-
-
-

# How To
1. Put grad-introCam in your node_modules folder.

2. Include cfgFunctions in your description.ext like this
```
class cfgFunctions {
	#include "node_modules\grad-introCam\cfgFunctions.hpp"	
};
```

3. Add cam shot definitions to USER\userIntro.hpp

You can add as many as you like. There are currently three different camera types:
"FREE" - moves between two points
"ATTACHED" - moves along with a vehicle/unit
"ROTATE" - rotates around a point/unit/vehicle



Blending between sceens is also an Option:
`["BLEND",  duration, textType, blendOut (optional), blendIn (optional)]`

Possible text types:
"PLAIN"

Parameters: https://community.bistudio.com/wiki/BIS_fnc_textTiles

![](https://community.bistudio.com/wikidata/images/thumb/2/24/BIS_fnc_textTiles.gif/400px-BIS_fnc_textTiles.gif)

"DYNAMIC"

Parameters: https://community.bistudio.com/wiki/BIS_fnc_dynamicText

![](https://community.bistudio.com/wikidata/images/thumb/2/22/BIS_fnc_dynamicText_v2.gif/400px-BIS_fnc_dynamicText_v2.gif)

"TYPETEXT"

Parameters: https://community.bistudio.com/wiki/BIS_fnc_typeText

![](https://community.bistudio.com/wikidata/images/thumb/f/fe/BIS_fnc_typeText.gif/400px-BIS_fnc_typeText.gif)

"TYPETEXT2"

Parameters: https://community.bistudio.com/wiki/BIS_fnc_typeText2

![](https://community.bistudio.com/wikidata/images/thumb/e/e3/BIS_fnc_typeText2.gif/400px-BIS_fnc_typeText2.gif)

"INFOTEXT"

Parameters: https://community.bistudio.com/wiki/BIS_fnc_infoText

![](https://community.bistudio.com/wikidata/images/thumb/1/15/BIS_fnc_infoText.gif/800px-BIS_fnc_infoText.gif)




