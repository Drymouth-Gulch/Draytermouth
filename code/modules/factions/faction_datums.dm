#define CANEDIT     0x1	// 0001
#define CANINVITE   0x2	// 0010
#define CANKICK 	0x4	// 0100
#define CANPROMOTE	0x8	// 1000
/*
  can_edit_ranks - If this rank can edit others (Find ranks commanded by self, finds ranks commanded by those ranks, etc.)
  can_invite_members - Can invite members to the InviteRank
  can_kick_members - If rank is commanded by this rank, allows kicking from faction
  can_promote_members - Can promote/demote members to higher/lower ranks, ranks have to be commanded by this one
*/

/*
Factions: Because we should all get along
  Name - String, Name for the faction - "Brotherhood of Steel", "Vault 113", etc.
  Goal - String, Goal of the faction, seen by internal members in faction window and status tab. "Seize the West factory" etc.
  Information - String, Details of current base, equipment to use etc. This is just a larger space to give details to all members.
  Members - Tuple list, [...[MOB REF, RANK REF]...] - Allows the faction to track its members and their ranks.
  	- C and DM apparently don't have tuples, so this will be in member_ranks and member as parallel lists
  Ranks - Datum List - List of the ranks relevant to the faction.
  InviteRank - Rank ref, this is the rank new recruits end up in.
  //TODO - Diplomacy - Enemy, Neutral, Ally
*/

/*
Ranks: An excercise in graphing and tree traversal
  Name - Displayname for the rank - "Big Boss", "Overseer" etc.
  commanded_by - Rank ref, graph wizardry to be performed to make a rank tree diagram. If null, it has no commanding officer (like overseer)
  commands - List of Rank Refs, each rank in here should have this rank as their commanded_by

*/

/faction
	var/name = "Faction"
	var/goal = "Seize the means of production"
	var/info = "Overthrow the politburo. We must take the means of production"
	var/members = NULL //List of mobs /mob
	var/member_ranks = NULL //List of ranks, parallel to members. All ranks in here should exist in ranks list /rank
	var/ranks = NULL //list of ranks created for this faction /rank
	var/invite_rank = NULL //default rank for the faction /rank
	
	
/rank
	var/name = "Faction Boss"
	var/commanded_by = NULL //Either /rank reference for the rank that commands this one, or null if no commander (i.e. owner)
	var/commands = NULL
	//If you can set these options for other ranks. can only toggle if you have the ability (i.e. cant let others kick people if you cant)
	var/perm |= CANEDIT | CANINVITE | CANKICK | CANPROMOTE // I dont actually know what im doing, but this looks really impressive, right?
