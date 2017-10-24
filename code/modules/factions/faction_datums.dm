/*
Factions: Because we should all get along
  Name - String, Name for the faction - "Brotherhood of Steel", "Vault 113", etc.
  Goal - String, Goal of the faction, seen by internal members in faction window and status tab. "Seize the West factory" etc.
  Information - String, Details of current base, equipment to use etc. This is just a larger space to give details to all members.
  Members - Tuple list, [...[MOB REF, RANK REF]...] - Allows the faction to track its members and their ranks.
  Ranks - Datum List - List of the ranks relevant to the faction.
  InviteRank - Rank ref, this is the rank new recruits end up in.
*/

/*
Ranks: An excercise in graphing and tree traversal
  Name - Displayname for the rank - "Big Boss", "Overseer" etc.
  commanded_by - Rank ref, graph wizardry to be performed to make a rank tree diagram. If null, it has no commanding officer (like overseer)
  can_edit_ranks - If this rank can edit others (Find ranks commanded by self, finds ranks commanded by those ranks, etc.)
  can_invite_members - Can invite members to the InviteRank
  can_kick_members - If rank is commanded by this rank, allows kicking from faction
  can_promote_members - Can promote/demote members to higher/lower ranks, ranks have to be commanded by this one
*/


  
