/datum/species/jelly/natural_slime
	name = "\improper Истинный Cлаймомен"
	plural_form = "Истинные Cлаймолюди"
	id = SPECIES_NSLIME
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | RACE_SWAP

	mutantbrain = /obj/item/organ/brain/natural_slime
	mutantheart = /obj/item/organ/heart/natural_slime
	mutantlungs = /obj/item/organ/lungs/natural_slime
	mutanteyes = /obj/item/organ/eyes/natural_slime
	mutantears = /obj/item/organ/ears/natural_slime
	mutanttongue = /obj/item/organ/tongue/natural_slime
	mutantliver = /obj/item/organ/liver/natural_slime
	mutantstomach = /obj/item/organ/stomach/natural_slime

	heatmod = 0.85
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_DAMAGE_LIMIT + 15
	bodytemp_cold_damage_limit = BODYTEMP_COLD_DAMAGE_LIMIT + 30

	species_language_holder = /datum/language_holder/natural_slime

	hair_color_mode = null
	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/jelly/slime,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/jelly/slime,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/jelly/slime,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/jelly/slime,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/jelly/slime,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/jelly/slime,
	)

/datum/species/jelly/natural_slime/get_physical_attributes()
	return "У слизелюдей кровь состоит из желе, и их вакуоли могут очень быстро преобразовывать плазму в неё, если они её вдыхают.\
		Большинство токсичных веществ их лечат, а большинство веществ, предотвращающих токсичность, — вредят!"

/datum/species/jelly/natural_slime/get_species_description()
	return "Эволюционно слаймолюди, как и обычные слаймы являются потомками древних слаймов, населяющих Ксарксис в стародавние времена. О них известно чрезвычайно немного, но согласно исследованиям они схожи с земными паразитическими инфузориями Balantidium coli. \
		Рост конкретного слаймолюда зависит от количества биомассы, но редко превышает 150 см., хотя среди военных Временного Правительства можно встретить и более высоких слаймов в гуманоидных формах."

/datum/species/jelly/natural_slime/get_species_lore()
	return list(
		"Слаймолюди происходят из системы 41 Жертвенника, с планеты Ксарксис, представляющей собой океанический мир. Наиболее примечательной чертой планеты Ксарксис является ее высокоэллиптическая орбита, \
		которая приводит к чередованию продолжительных холодных зим и чуть менее продолжительных жарких летних периодов. Атмосфера планеты состоит из 70% гелия и 17% кислорода 9% углекислого газа и 4% газов-примесей. \
		Сама планета имеет чрезвычайно горячее ядро, содержащее большие количества гелия, что обеспечивает выживание видов в холодные периоды и объясняет большое количество живности в глубинах. \
		Краткая историческая сводка Обнаружение расы слаймолюдей людьми произошло вследствие малого конфликта с одной из общин, кругов, население которого было обнаружено в процессе раскопок магниевых руд.",

		"Шахтерский корпус NT в процессе раскопок столкнулся с потерями большого количества оборудования. Вследствие расследования было обнаружено, \
		что оборудование подвергалось расхищению со стороны одного из племен слаймолюдей проживающего недалеко от места раскопок. \
		Корпорацией было принято решение о налаживании контакта с этим племенем. \
		Контакт происходил на удивление мирно, хоть на тот момент общение с безликими существами вызывало сомнения.",

		"Первый договор с слаймолюдьми был заключен через 2 года. Племя согласилось предоставлять свои рабочие силы в качестве шахтеров, позволяя NT таким образом перебросить силы шахтерского корпуса на другую планету. \
		Также примерно в течение 15 лет были обнаружены и другие “круги”, многие из которых были заинтересованы рассказами сородичей о космических гигантах (на тот момент средний рост слаймолюда был около 120 см из-за отсутствия у них голов, для подражания людям). \
		Для изучения языка и физиологии слаймолюдей было организована первая колония человечества на Ксарксисе, являющаяся небольшим исследовательским аванпостом с персоналом в количестве 50 человек. \
		На аванпосте велась торговля с племенем и предоставлялись бесплатные медицинские услуги для шахтеров-слаймолюдей с целью изучения их физиологии.",

		"Заинтересованный, инопланетными способами лечения на контакт выходит круг Воолооб, традиционные знахари слаймолюдей. \
		Постепенно коренное население было ассимилировано, появились учебные центры с целью подготовки слаймолюдей к работе на объектах NT. \
		На данный момент данный аванпост разросся до планетарной столицы общества слаймолюдей города “Блобу”, который также является самым крупным космопортом планеты. Пещеры же превратили в музейный комплекс, привлекающий большое количество интересующихся культурой слаймолюдей туристов ",
	)

/datum/species/jelly/natural_slime/get_scream_sound(mob/living/carbon/human/species/natural_slime)
	if(natural_slime.physique == FEMALE)
		return 'modular_bandastation/emote_panel/audio/natural_slime/burble.ogg'
	return 'modular_bandastation/emote_panel/audio/natural_slime/burble.ogg'

/datum/species/jelly/natural_slime/get_sigh_sound(mob/living/carbon/human/species/natural_slime)
	if(natural_slime.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/sigh/female_sigh1.ogg',
			'sound/mobs/humanoids/human/sigh/female_sigh2.ogg',
			'sound/mobs/humanoids/human/sigh/female_sigh3.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/sigh/male_sigh1.ogg',
		'sound/mobs/humanoids/human/sigh/male_sigh2.ogg',
		'sound/mobs/humanoids/human/sigh/male_sigh3.ogg',
	)

/datum/species/jelly/natural_slime/get_cough_sound(mob/living/carbon/human/species/natural_slime)
	if(natural_slime.physique == FEMALE)
		return 'modular_bandastation/emote_panel/audio/natural_slime/popcough.ogg'
	return 'modular_bandastation/emote_panel/audio/natural_slime/popcough.ogg'

/datum/species/jelly/natural_slime/get_cry_sound(mob/living/carbon/human/species/natural_slime)
	if(natural_slime.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)

/datum/species/jelly/natural_slime/get_laugh_sound(mob/living/carbon/human/species/natural_slime)
	if(!ishuman(natural_slime))
		return
	if(natural_slime.physique == FEMALE)
		return 'sound/mobs/humanoids/human/laugh/womanlaugh.ogg'
	return pick(
		'sound/mobs/humanoids/human/laugh/manlaugh1.ogg',
		'sound/mobs/humanoids/human/laugh/manlaugh2.ogg',
	)
