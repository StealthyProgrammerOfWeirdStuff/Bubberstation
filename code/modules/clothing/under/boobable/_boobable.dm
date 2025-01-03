/obj/item/clothing/under/boobable
	name = "Boobable Clothing"
	desc = "A piece of clothing that is lacking the usual NT-brand Bluespace Boob holders"
	icon = 'icons/mob/clothing/under/boobable/BoobableTemplate.dmi'
	icon_state = "size1"
	inhand_icon_state = ""
	worn_icon_state = "size1"
	worn_icon = 'icons/mob/clothing/under/boobable/BoobableTemplate.dmi'
	female_sprite_flags = NO_FEMALE_UNIFORM

	var/datum/weakref/wearer
	var/icon_state_name = "size"
	var/last_size = 1
	var/last_icon_state = "size1"

/obj/item/clothing/under/boobable/equipped(mob/living/user, slot)
	. = ..()
	if (slot == ITEM_SLOT_ICLOTHING)
		wearer = WEAKREF(user)
		update_appearance(UPDATE_ICON,UPDATE_ICON_STATE)

/obj/item/clothing/under/boobable/dropped(mob/living/user)
	. = ..()
	wearer = null
	last_size = null
	icon_state = initial(icon_state)
	last_icon_state = initial(last_icon_state)

// here u go, move the stuff in update_icon_state to here, and return the mutable appearance instead of modifying the icon_state
// plus edit the varnames so they're appropiate for overlays
// oh yea i have no idea if find_closest_valid_icon works, sorry!
// oh yea don't forget to move these files into somewhere modular
// /obj/item/clothing/suit/hazardvest/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
// 	. = ..()
// 	if(!isinhands)
// 		. += mutable_appearance(icon_file, icon_state, src, alpha = src.alpha)

/obj/item/clothing/under/boobable/update_icon_state()
	..()
	var/mob/living/carbon/human/humie = wearer?.resolve()
	if(!humie)
		return
	var/obj/item/organ/external/genital/breasts/boob = humie.get_organ_slot(ORGAN_SLOT_BREASTS)
	var/size = 1
	if(boob)
		size = clamp(boob.genital_size, 1, MAX_BREAST_SIZE)
	if(last_size == size)
		icon_state = last_icon_state
		return
	icon_state = find_valid_icon(size)
	last_icon_state = icon_state
	last_size = size

/obj/item/clothing/under/boobable/proc/find_valid_icon(size)
	var/possible_icon_state = "[icon_state_name][size]"
	if(icon_exists(icon, possible_icon_state))
		return possible_icon_state
	return find_closest_valid_icon(size)

/obj/item/clothing/under/boobable/proc/find_closest_valid_icon(size)
	// ensure it's sorted by size
	var/list/icon_states = sort_list(icon_states(icon))
	// find closest size
	var/closest_size = 0
	var/found_state
	for(var/icon_state in icon_states)
		if(!findtext(icon_state, icon_state_name))
			continue
		// get the number index from the icon state searching from the right side
		var/number = findtext(icon_state, regex(@"(\d+)(?!.*\d)"))
		if(isnull(number) || closest_size > number)
			continue
		closest_size = number
		found_state = icon_state

	if(closest_size == 0)
		stack_trace("[src] could not find a valid icon_state, remember it must have a valid index!")
		return icon_state
	return found_state
