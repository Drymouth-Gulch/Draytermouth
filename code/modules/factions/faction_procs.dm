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
/rank/proc/
/*
Name: Delete rank
Purpose: Deletes a rank from the faction, any ranks that are commanded by this are now commanded by whatever this rank is commanded by
Params: rank/R - The rank we are deleting
Returns: 1 for successfully deleted and tidied. 0 for error. Will return 0 if there are still rank members (reallocated them first)
*/

/*
Name: Set Rank Perms
Purpose: Scoops permission czechboxes from guiland and applies to the rank. Doesn't care if you have
         permissions to edit, so check can_edit before passing to here
Params: rank/R - The rank we are editing, - list/D the list of new perms
Returns: 1 if success, 0 if fail
*/
