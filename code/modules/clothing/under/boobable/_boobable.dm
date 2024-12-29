/obj/item/clothing/under/boobable
	name = "Boobable Clothing"
	desc = "A piece of clothing that is lacking the usual NT-brand Bluespace Boob holders"
	icon = 'icons/mob/clothing/under/boobable/BoobableTemplate.dmi'
	icon_state = "size1"
	inhand_icon_state = ""
	worn_icon_state = "size1"
	worn_icon = 'icons/mob/clothing/under/boobable/BoobableTemplate.dmi'

	var/datum/weakref/wearer

	///list holding icon states used for boobables. 1 is flatchested, 18 is eyond measurment. anything in-between is cup A through P
	var/list/icon_state_size = list("size1", "size1", "size2", "size3", "size4", "size5", "size6", "size7", "size8", "size9", "size10", "size11", "size12", "size13", "size14", "size15", "size16", "size16")



/obj/item/clothing/under/boobable/equipped(mob/living/user, slot)
    . = ..()
    if (slot == ITEM_SLOT_ICLOTHING)
        wearer = WEAKREF(user)
        update_appearance(UPDATE_ICON,UPDATE_ICON_STATE)



/obj/item/clothing/under/boobable/dropped(mob/living/user)
    . = ..()
    wearer = null


/obj/item/clothing/under/boobable/update_icon_state()
    ..()
    var/mob/living/carbon/human/humie = wearer?.resolve()
    if(!humie)
        return
    var/obj/item/organ/external/genital/breasts/boob = humie.get_organ_slot(ORGAN_SLOT_BREASTS)
    var/size = clamp(boob.genital_size, 1, 18)
    icon_state = icon_state_size[size + 1]




