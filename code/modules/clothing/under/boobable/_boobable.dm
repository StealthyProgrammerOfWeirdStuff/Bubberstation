/obj/item/clothing/under/boobable
	name = "boobable clothing"
	desc = "A piece of clothing that is lacking the usual NT-brand Bluespace Boob holders"
	icon = 'icons/obj/clothing/under/color.dmi'
	icon_state = "jumpsuit"
	inhand_icon_state = "jumpsuit"
	worn_icon_state = "jumpsuit"
	worn_icon = 'icons/mob/clothing/under/color.dmi'



/obj/item/clothing/under/boobable/equipped(mob/living/user, slot)
	. = ..()
	if (slot == ITEM_SLOT_ICLOTHING)
		log_world(span_yellowteamradio("[src] Equipped!"))

