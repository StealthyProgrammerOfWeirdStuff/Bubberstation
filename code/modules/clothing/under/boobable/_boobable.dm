/obj/item/clothing/under/boobable
	name = "Boobable Clothing"
	desc = "A piece of clothing that is lacking the usual NT-brand Bluespace Boob holders"
	icon = 'icons/obj/clothing/under/color.dmi'
	icon_state = "jumpsuit"
	inhand_icon_state = "jumpsuit"
	worn_icon_state = "size1"
	worn_icon = 'icons/mob/clothing/under/boobable/BoobableTemplate.dmi'

//I know the following looks bad, but some people might want to use two sprites for all of the sizes while others want a sprite for each size
//this seems to be the simplest way of doing this

///the icon state shown when the Boobable clothing is worn by someone with breasts of size "flatchested".
var/icon_state_flat = "size1"
var/icon_state_sizeA = "size1"
var/icon_state_sizeB = "size2"
var/icon_state_sizeC = "size3"
var/icon_state_sizeD = "size4"
var/icon_state_sizeE = "size5"
var/icon_state_sizeF = "size6"
var/icon_state_sizeG = "size7"
var/icon_state_sizeH = "size8"
var/icon_state_sizeI = "size9"
var/icon_state_sizeJ = "size10"
var/icon_state_sizeK = "size11"
var/icon_state_sizeL = "size12"
var/icon_state_sizeM = "size13"
var/icon_state_sizeN = "size14"
var/icon_state_sizeO = "size15"
var/icon_state_sizeP = "size16"
var/icon_state_beyond = "size16"


/obj/item/clothing/under/boobable/equipped(mob/living/user, slot)
	. = ..()
	var/obj/item/organ/external/genital/breasts/boob = user.get_organ_slot(ORGAN_SLOT_BREASTS)
	var/translation = boob.breasts_size_to_cup(boob.genital_size)


	if (slot == ITEM_SLOT_ICLOTHING)
		to_chat(world, span_yellowteamradio("attempting to assign correct size"))
		switch(translation)
			if(BREAST_SIZE_FLATCHESTED)
				worn_icon_state = icon_state_flat
			if(BREAST_SIZE_A)
				worn_icon_state = icon_state_sizeA
			if(BREAST_SIZE_B)
				worn_icon_state = icon_state_sizeB
			if(BREAST_SIZE_C)
				worn_icon_state = icon_state_sizeC
			if(BREAST_SIZE_D)
				worn_icon_state = icon_state_sizeD
			if(BREAST_SIZE_E)
				worn_icon_state = icon_state_sizeE
			if(BREAST_SIZE_F)
				worn_icon_state = icon_state_sizeF
			if(BREAST_SIZE_G)
				worn_icon_state = icon_state_sizeG
			if(BREAST_SIZE_H)
				worn_icon_state = icon_state_sizeH
				to_chat(world, span_yellowteamradio("successfully assigned size H!"))
			if(BREAST_SIZE_I)
				worn_icon_state = icon_state_sizeI
			if(BREAST_SIZE_J)
				worn_icon_state = icon_state_sizeJ
			if(BREAST_SIZE_K)
				worn_icon_state = icon_state_sizeK
			if(BREAST_SIZE_L)
				worn_icon_state = icon_state_sizeL
			if(BREAST_SIZE_M)
				worn_icon_state = icon_state_sizeM
			if(BREAST_SIZE_N)
				worn_icon_state = icon_state_sizeN
			if(BREAST_SIZE_O)
				worn_icon_state = icon_state_sizeO
			if(BREAST_SIZE_P)
				worn_icon_state = icon_state_sizeP
			if(BREAST_SIZE_BEYOND_MEASUREMENT)
				worn_icon_state = icon_state_beyond
			else
				worn_icon_state = icon_state_flat
				to_chat(world, span_yellowteamradio("Fallback icon was used"))

			//There is probably a nicer way to do this,but I barely understand dm code enough to fetch the tiddy size and I want this to be inheritable, so here we are.
			//any more experienced coders are welcome to clean this awful switchcase up.
			//I dont even know if I made this switchcase correctly or actually just made a yandere dev if-statement. because it sure looks like one.

