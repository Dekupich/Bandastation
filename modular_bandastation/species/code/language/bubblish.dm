// MARK: Natural slime language
/datum/language/bubblish
	name = "Пузырчатый"
	desc = "Основной разговорный язык естественных слаймолюдей."
	key = "0"
	flags = TONGUELESS_SPEECH
	space_chance = 50
	syllables = list("блоб","плоп","поп","боп","буп")
	always_use_default_namelist = TRUE
	icon = 'icons/bandastation/mob/species/natural_slime/lang.dmi'
	icon_state = "slime"
	default_priority = 90

/datum/language/bubblish/default_name(gender)
	if(gender == MALE)
		return "[pick(GLOB.first_names_male_natural_slime)][random_name_spacer][pick(GLOB.last_names_natural_slime)]"
	return "[pick(GLOB.first_names_female_natural_slime)][random_name_spacer][pick(GLOB.last_names_natural_slime)]"

/datum/language_holder/natural_slime
	understood_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/bubblish = list(LANGUAGE_ATOM),
	)
	spoken_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/bubblish = list(LANGUAGE_ATOM),
	)
