/datum/species/jelly/natural_slime/get_cough_sound(mob/living/carbon/human/species/natural_slime)
	if(natural_slime.physique == FEMALE)
		return 'modular_bandastation/emote_panel/audio/natural_slime/popcough.ogg'
	return 'modular_bandastation/emote_panel/audio/natural_slime/popcough.ogg'

// MARK: Emotes
/datum/emote/living/carbon/human/natural_slime
	species_type_whitelist_typecache = list(/datum/species/jelly/natural_slime)

/datum/emote/living/carbon/human/natural_slime/pop
	name = "Хлопать ртом"
	key = "pop"
	key_third_person = "pops"
	message = "хлопает ртом."
	message_param = "хлопает ртом на %t."
	message_mime = "бесшумно хлопает ртом."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'modular_bandastation/emote_panel/audio/natural_slime/pop.ogg'

/datum/emote/living/carbon/human/natural_slime/pop2
	name = "Хлопать ртом дважды"
	key = "pop2"
	key_third_person = "pops2"
	message = "дважды хлопает ртом."
	message_param = "дважды хлопает ртом на %t."
	message_mime = "бесшумно дважды хлопает ртом."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'modular_bandastation/emote_panel/audio/natural_slime/pop2.ogg'

/datum/emote/living/carbon/human/natural_slime/bubble
	name = "Булькать"
	key = "bubble"
	key_third_person = "bubbles"
	message = "булькает."
	message_param = "булькает на %t."
	message_mime = "бесшумно булькает."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'modular_bandastation/emote_panel/audio/natural_slime/bubble.ogg'

/datum/emote/living/carbon/human/natural_slime/squish
	name = "Хлюпать"
	key = "squish"
	key_third_person = "squishes"
	message = "хлюпает."
	message_param = "хлюпает на %t."
	message_mime = "бесшумно хлюпает."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'modular_bandastation/emote_panel/audio/slime/jelly_squish.ogg'
