/obj/item/clothing/under/boobable
	name = "Boobable Clothing"
	desc = "A piece of clothing that is lacking the usual NT-brand Bluespace Boob holders"
	icon = 'icons/obj/clothing/under/color.dmi'
	icon_state = "jumpsuit"
	inhand_icon_state = "jumpsuit"
	worn_icon_state = "jumpsuit"
	worn_icon = 'icons/mob/clothing/under/color.dmi'



/obj/item/clothing/under/boobable/equipped(mob/living/user, slot)
	. = ..()
	var/obj/item/organ/external/genital/breasts/boob = user.get_organ_slot(ORGAN_SLOT_BREASTS)
	var/translation = boob.breasts_size_to_cup(boob.genital_size)


	if (slot == ITEM_SLOT_ICLOTHING)
		log_world("[src] Equipped! By [user]!")
		to_chat(world, span_yellowteamradio("[src] Equipped! By [user]! Size is [translation]. largest natural is [BREAST_SIZE_P]"))

