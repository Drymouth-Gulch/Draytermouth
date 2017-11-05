/*
This file is to quickly set up blank turfs so that mapping can get started.
Once the map has been finished and push to the git repo, these turfs will then
be dispersed to correct files, with the actual code being written/applied.

Below is the list of turfs still in this file, that need to be set up after mapping
-To be ported-
Ground
  Desert
  Road
  Pavement
  Mountain
*/

//============GROUND TURFS============//

//Base turf for ground. This handles sunlight procs, has set atmos values, etc.
/turf/ground
	icon = 'icons/turf/dryturfs.dmi'
	name = "\proper ground"
	icon_state = "wasteland1"//

//Main outdoors ground turf. This procs things like wasteland grass (however this should be reviewed to allow other terrain and plant lists
/turf/ground/desert
	name = "\proper desert"
	icon_state = "wasteland1"//

//Roads need to be rewritten to allow for automatic smoothing
/turf/ground/road
	name = "\proper road"
	icon_state = "outermiddle"//

//Pavement needs smoothing as above
/turf/ground/road/pavement
	name = "pavement"
	icon_state = "outershade"//

//This is the turf that is used where rock is mined
/turf/ground/mountain
	name = "\proper mountain"
	icon_state = "mountain0"//


//============WALL TURFS============//
//I have put all the fallotu 13 walls under f13, for ease of mapping. This will be fixed after first map finished
/turf/wall/f13
  name = "Fallout 13 Wall Type"
  icon = 'icons/turf/dryturfs.dmi'

//These need to eventually be reviewed and made into Concrete, or Pre-war metal etc.
/turf/wall/f13/store
	//icon = 'icons/turf/walls/store.dmi'
	icon_state = "store0"//

/turf/wall/f13/store/superstore
	//icon = 'icons/turf/walls/superstore.dmi'
	icon_state = "supermart0"//

//This used to be /composite
/turf/simulated/wall/f13/ruins
	name = "composite wall"
	//icon = 'icons/turf/walls/composite.dmi'
	icon_state = "ruins0"//
