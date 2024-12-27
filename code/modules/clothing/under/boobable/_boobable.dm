/obj/item/clothing/under/boobable
	name = "Boobable Clothing"
	desc = "A piece of clothing that is lacking the usual NT-brand Bluespace Boob holders"
	icon = 'icons/obj/clothing/under/color.dmi'
	icon_state = "jumpsuit"
	inhand_icon_state = "jumpsuit"
	worn_icon_state = "size1"
	worn_icon = 'icons/mob/clothing/under/boobable/BoobableTemplate.dmi'


	var/obj/item/organ/external/genital/breasts/boob = null
	var/rawBoobSize = 1

	//I know the following looks bad, but some people might want to use two sprites for all of the sizes while others want a sprite for each size
	//this seems to be the simplest way of doing this

	///list holding icon states used for boobables. 1 is flatchested, 18 is eyond measurment. anything in-between is cup A through P
	var/list/icon_state_size = list("size1", "size1", "size2", "size3", "size4", "size5", "size6", "size7", "size8", "size9", "size10", "size11", "size12", "size13", "size14", "size15", "size16", "size16")


/obj/item/clothing/under/boobable/equipped(mob/living/user, slot)
	. = ..()
	boob = user.get_organ_slot(ORGAN_SLOT_BREASTS)
	rawBoobSize = boob.genital_size

	if(rawBoobSize < 1 || boob == null)
		rawBoobSize = 1
	else if(rawBoobSize > 18)
		rawBoobSize = 18
	to_chat(world, span_yellowteamradio("Raw Boob genital_size value: [boob.genital_size]"))

	if (slot == ITEM_SLOT_ICLOTHING)
		to_chat(world, span_yellowteamradio("attempting to assign correct size"))
		worn_icon_state = icon_state_size[rawBoobSize + 1]

		update_icon(UPDATE_ICON_STATE)

		to_chat(world, span_yellowteamradio("Used worn_icon_state: [worn_icon_state]"))

/obj/item/clothing/under/boobable/update_icon()
	. = ..()
	worn_icon_state = icon_state_size[rawBoobSize + 1]
	return ..()



