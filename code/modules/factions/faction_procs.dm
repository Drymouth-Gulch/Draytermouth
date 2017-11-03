//Proc Template	for pseudo code and future endeavors. 
/*
Name:
Purpose:
Params:
Returns:
*/


/*
Name: under chain of command
Purpose: Checks if current rank (src) has CoC of /rank/R, and thus has edit/promote priveledges
Params: rank/R -> The rank datum that we want to check
Returns: 1 for we can command, and 0 for we cant
*/
/rank/proc/under_command(/rank/R)
	for(/rank/C in commands)
		if(C == R) //If the current rank found in loop is the rank we're checking
			return 1
		else
			if(under_command(/rank/C)) //Recursively checks for the children of C
	return 0		
		
/*
Name: Set commanded by
Purpose: Moves a rank under another rank, and tidies up any other connects
Params: rank/R - The rank we are now commanded by
Returns: 1 for successful, 0 for error
*/
/rank/proc/set_commanded_by(/rank/R)
	if(is_type(commanded_by,/rank)) //Remove self from old commander list
		var/rank/C = commanded_by
		C.commands.remove(src)
		commanded_by = R
		R.commands.add(src)
		return 1
	return 0 //eg, if commanded by is null ,we are trying to make the owner commanded by something
/*
Name: Delete rank
Purpose: Deletes a rank from the faction, any ranks that are commanded by this are now commanded by whatever this rank is commanded by
Params: rank/R - The rank we are deleting
Returns: 1 for successfully deleted and tidied. 0 for error. Will return 0 if there are still rank members (reallocated them first)
*/
/rank/proc/delete_rank(/rank/R)
	if(!R.commanded_by)
		return 0 //Has no commander, so is the faction owner. Can't delete
	if(is_type(R.commanded_by,/rank))
		var/rank/C = R.commanded_by
		for(/rank/U in commands)
			U.commanded_by = C //Set the underling to be commanded by R's commander, to squish the gap
		if(is_type(fac,/faction)
			fac.ranks.remove(src) //remove this rank from this faction
		else
			return 0 //we couldn't delete self from faction, cos we aren't in a faction. This shouldn't ever happen
		del(src)
	else
		return 0
/*
Name: Set Rank Perms
Purpose: Scoops permission czechboxes from guiland and applies to the rank. Doesn't care if you have
         permissions to edit, so check can_edit before passing to here
Params: rank/R - The rank we are editing, - list/P the list of new perms
Returns: 1 if success, 0 if fail
*/
/*
#define CANEDIT     0x1	// 0001
#define CANINVITE   0x2	// 0010
#define CANKICK 	0x4	// 0100
#define CANPROMOTE	0x8	// 1000
*/
/rank/proc/set_perms(/rank/R,/list/P) //perms are good to keep your hair curly
	var/newPerms = NULL
	if(P[1]) //why does byond start with 1
		newPerms &= CANEDIT
	if(P[2]) //why does byond start with 1
		newPerms &= CANINVITE
	if(P[3]) //why does byond start with 1
		newPerms &= CANKICK
	if(P[4]) //why does byond start with 1
		newPerms &= CANPROMOTE
	R.perms = newPerms
	//Hooray!

/*
Name: SaveRank
Purpose: Saves new rank details and either generates a new rank, or updates a current one
Params: /rank - the rank we are saving. /mob/user - the person calling the save (to check can_edit). /list/D - Data list of name, commanded by, perm list etc.
Returns: 1 for success, 0 for failure. failure being, this is the owner rank (commanded_by = null), !can_edit etc.
*/
/rank/proc/save_rank(/rank/R, /mob/User, list/D)
	if(!User.rank) //user doesn't have a rank
		return
	if(User.rank.faction != R.faction) //If user is trying to edit another faction's rank somehow
		return
	if(User.rank.perms != CAN_EDIT) //cant edit
		return
	
	//LAZYBOYE




