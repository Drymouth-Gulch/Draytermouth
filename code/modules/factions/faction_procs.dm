//Proc Template	for pseudo code and future endeavors. 
/*
Name:
Purpose:
Params:
Returns:
*/


/*
Name: can edit
Purpose: Checks if current rank (src) can edit rank R
Params: rank/R -> The rank datum that we want to check
Returns: 1 for we can edit, and 0 for we cant
- Edit is based on wether this rank falls under our chain of command
*/
/rank/proc/can_edit(/rank/R)
	var/hit_null = 0
	var/rank/cur_rank = R
	while(!hit_null)
		if(is_type(cur_rank.commanded_by, /rank))
			if(cur_rank.commanded_by == src)
				return 1
			else
				cur_rank = cur_rank.commanded_by
		else
			hit_null = 1
	return 0

/*
Name: Set commanded by
Purpose: Moves a rank under another rank, and tidies up any other connects
Params: rank/R - The rank we are now commanded by
Returns: 1 for successful, 0 for error
*/

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
