/datum/reagent/stimpak
  name = "Stimpak Chemicals"
  id = "stimpak"
  description = "Chemicals that are contained in a stimpak, pretty good at healing."
  taste_description = "bitterness"
  reagent_state = LIQUID
  color = "#00BFFF"
  metabolism = REM * 1.5 //0.3u per life() 
  scannable = 1
  flags = IGNORE_MOB_SIZE
  
/datum/reagent/stimpak/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  M.heal_organ_damage(6 * removed, 6 * removed) //6 x metabolism, or 1.8 brute/fire heal every life()
  M.add_chemical_effect(CE_OXYGENATED, 1) //Dex
  
/datum/reagent/super_stimpak
  name = "Super Stimpak Chemicals"
  id = "superstimpak"
  description = "chemicals that are contained in a super stimpak, really good at healing." 
  taste_description = "strong bitterness"
  reagent_State = LIQUID
  color = "#00BFFF"
  metabolism = REM * 1.5
  scannable = 1
  flags = IGNORE_MOB_SIZE
 
/datum/reagent/super_stimpak/affect_blood(Var/mob/living/carbon/M, var/alien, var/removed)
  M.heal_organ_damage(9 * removed, 9 * removed) //2.7 brute/fire heal
  M.add_chemical_effect(CE_OXYGENATED, 2) //Dex+
  
/datum/reagent/radx
  name = "Radx"
  id = "radx"
  description = "Heals radiation and toxin related damage."
  taste_description = "unfamiliar"
  reagent_state = LIQUID
  color = "#408000"
  metabolism = REM
  scannable = 1
  flags = IGNORE_MOB_SIZE
  
/datum/reagent/radx/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  M.radiation = max(M.radiation - 30 * removed, 0)
  
/datum/reagent/mentats
  name = "mentat powder"
  id = "mentat"
  description = "A drug that's well known to make you smart and have great vision."
  taste_description = "smartness"
  reagent_state = LIQUID
  color = "#C8A5DC"
  metabolism = REM
  scannable = 1
  flags = IGNORE_MOB_SIZE

/datum/reagent/mentats/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  M.eye_blurry = max(M.eye_blurry - 5, 0)
	M.eye_blind = max(M.eye_blind - 5, 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/eyes/E = H.internal_organs_by_name[BP_EYES]
		if(E && istype(E))
			if(E.damage > 0)
	M.add_chemical_effect(CE_BRAIN_REGEN, 1)
  
/datum/reagent/healing_powder
  name = "Healing Powder"
  id = "healingpowder"
  description = "Some powder you can apply to wounds to heal, has a small chance to make someone druggy."
  taste_description = "powdery"
  reagent_state = LIQUID
  color = "#00BFFF"
  metabolism = REM * 1.5 //0.3u
  scannable = 1
  flags = IGNORE_MOB_SIZE
  
/datum/reagent/healing_powder/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  M.heal_organ_damage(6 * removed, 6 * removed)
  M.druggy = max(M.druggy, 15)

/datum/reagent/poultice
  name = "Poultice"
  id = "poultice"
  description = "A fast acting, potent healing chemical."
  taste_description = "planty"
  reagent_state = LIQUID
  color = "#00BFFF"
  metabolism = REM * 6 //1.2u
  scannable = 1
  flags = IGNORE_MOB_SIZE
  
/datum/reagent/poultice/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  M.heal_organ_damage(9 * removed, 9 * removed) //10.8 heal per life tick, 96 overall heal over ~16 seconds
  
/datum/reagent/radaway
  name = "Radaway"
  id = "radaway"
  description = "A potent anti-toxin drug."
  taste_description = "something that isn't poisonus hopefully"
  reagent_state = LIQUID
  color = "#ff7200"
  metabolism = REM * 2 //0.4u
  scannable = 1
  flags = IGNORE_MOB_SIZE
  
/datum/reagent/radaway/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  M.add_chemical_effect(CE_ANTITOX, 1)
	var/removing = (4 * removed)
	for(var/datum/reagent/R in M.ingested.reagent_list)
		if(istype(R, /datum/reagent/toxin) || (R.id in remove_toxins))
			M.ingested.remove_reagent(R.id, removing)
			return
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(istype(R, /datum/reagent/toxin) || (R.id in remove_toxins))
			M.reagents.remove_reagent(R.id, removing)
			return
  
/datum/reagent/medx
  name = "Medx"
  id = "medx"
  description = "A very potent painkiller and adrenalin based chemical."
  taste_description = "bitterness"
  reagent_state = LIQUID
  color = "#6D6374"
  metabolism = REM
  scannable = 1
  flags = IGNORE_MOB_SIZE
  overdose = 11

/datum/reagent/medx/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  M.add_chemical_effect(CE_PAINKILLER, 200)
	M.AdjustParalysis(-1)
	M.AdjustStunned(-1)
	M.AdjustWeakened(-1)

/datum/reagent/medx/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.druggy = max(M.druggy, 10)
	M.hallucination = max(M.hallucination, 3)

/datum/reagent/fixer
  name = "Fixer"
  id = "fixer"
  description = "A chemical that rapidly purges chems from the body." //Now a chem purger, as there's no such thing as addiction here
  taste_description = "lots of chemicals"
  reagent_state = LIQUID
  color = "#6D6374"
  metabolism = REM * 5 //1u, rapidly removes itself and any other chems
  scannable = 1
  flags = IGNORE_MOB_SIZE
  
/datum/reagent/fixer/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
  for(var/datum/reagent/R in M.ingested.reagent_list)
	  if(R != src) //Removes everything but itself
	  	R.dose = max(R.dose - removed * 5, 0)
  
