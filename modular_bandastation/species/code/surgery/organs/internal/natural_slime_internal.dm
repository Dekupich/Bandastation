/obj/item/organ/brain/natural_slime
	name = "slime core"
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'

/obj/item/organ/eyes/natural_slime
	name = "slime 'eyeballs'"
	desc = "Слизевые орган, напоминающий глаза. Склизкие и мягкие."
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'
	synchronized_blinking = TRUE

/obj/item/organ/ears/natural_slime
	name = "slime 'ears'"
	icon_state = "ears"
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'

/obj/item/organ/tongue/natural_slime
	name = "slime 'tongue'"
	icon_state = "tongue"
	desc = "Слизевый орган, напоминающий язык."
	languages_native = list(/datum/language/bubblish)
	say_mod = "булькает"
	liked_foodtypes = MEAT | TOXIC
	disliked_foodtypes = ALCOHOL
	toxic_foodtypes = NONE

/obj/item/organ/tongue/natural_slime/on_mob_insert(mob/living/carbon/owner)
	. = ..()
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/pop)
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/pop2)
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/bubble)
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/squish)

/obj/item/organ/tongue/tajaran/on_mob_remove(mob/living/carbon/owner)
	. = ..()
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/pop)
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/pop2)
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/bubble)
	add_verb(owner, /mob/living/carbon/human/species/natural_slime/proc/squish)

/obj/item/organ/tongue/get_possible_languages()
	return ..() + /datum/language/bubblish

/obj/item/organ/heart/natural_slime
	name = "slime 'heart'"
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'

/obj/item/organ/lungs/natural_slime
	name = "slime 'lungs'"
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'

/obj/item/organ/stomach/natural_slime
	name = "slime 'stomach'"
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'

/obj/item/organ/liver/natural_slime
	name = "slime 'liver'"
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'
	alcohol_tolerance = ALCOHOL_RATE * 3

/obj/item/organ/appendix/natural_slime
	name = "slime 'appendix?'"
	icon = 'icons/bandastation/mob/species/natural_slime/organs.dmi'
	icon_state = "appendix"
