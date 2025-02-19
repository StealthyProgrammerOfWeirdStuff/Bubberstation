/datum/species/StationGhost
	name = "Station Phantom"
	always_customizable = TRUE
	can_augment = FALSE
	specific_alpha = 200
	markings_alpha = 100
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)

/datum/species/StationGhost/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = "#82c5f8"
	human.dna.features["hair"] = "Long Bedhead"
	human.update_body(is_creating = TRUE)

/datum/species/StationGhost/get_physical_attributes()
	return "Spooky and incorporeal."

/datum/species/StationGhost/get_species_description()
	return "A spooky ghost that resides in maints"

/datum/species/StationGhost/get_species_lore()
	return list(
		"A spooky ghost the haunts the station. Entirely WIP and unobtainable through normal means.",
	)



/mob/living/carbon/human/species/StationGhost
	race = /datum/species/StationGhost
