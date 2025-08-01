/datum/antagonist/nukeop/support
	name = ROLE_OPERATIVE_OVERWATCH
	show_to_ghosts = TRUE
	send_to_spawnpoint = TRUE
	nukeop_outfit = /datum/outfit/syndicate/support

/datum/antagonist/nukeop/support/greet()
	owner.current.playsound_local(get_turf(owner.current), 'sound/machines/printer.ogg', 100, 0, use_reverb = FALSE)
	to_chat(owner, span_big("Вы - [name]! Вы были временно назначены для обеспечения разведданными с камер наблюдения и управления коммуникациями для оперативной группы!"))
	to_chat(owner, span_red("Используйте свои инструменты, чтобы настроить свое оборудование так, как вам нравится, но не пытайтесь покинуть свою рабочую зону."))
	owner.announce_objectives()

/datum/antagonist/nukeop/support/on_gain()
	..()
	for(var/datum/mind/teammate_mind in nuke_team.members)
		var/mob/living/our_teammate = teammate_mind.current
		if(!istype(our_teammate)) // If an agent is purchased after the death of an agent -- when they no longer have a body, we skip that mind because they're invalid.
			continue

		our_teammate.AddComponent( \
			/datum/component/simple_bodycam, \
			camera_name = "operative bodycam", \
			c_tag = "[our_teammate.real_name]", \
			network = OPERATIVE_CAMERA_NET, \
			emp_proof = FALSE, \
		)
		our_teammate.playsound_local(get_turf(owner.current), 'sound/items/weapons/egloves.ogg', 100, 0)
		to_chat(our_teammate, span_notice("К команде присоединился агент разведки. Улыбнитесь камере!"))

	RegisterSignal(nuke_team, COMSIG_NUKE_TEAM_ADDITION, PROC_REF(late_bodycam))

	owner.current.grant_language(/datum/language/codespeak)

/datum/antagonist/nukeop/support/get_spawnpoint()
	return pick(GLOB.nukeop_overwatch_start)

/datum/antagonist/nukeop/support/forge_objectives()
	var/datum/objective/overwatch/objective = new
	objective.owner = owner
	objectives += objective

/datum/antagonist/nukeop/support/proc/late_bodycam(datum/source, mob/living/new_teammate)
	SIGNAL_HANDLER
	new_teammate.AddComponent( \
		/datum/component/simple_bodycam, \
		camera_name = "operative bodycam", \
		c_tag = "[new_teammate.real_name]", \
		network = OPERATIVE_CAMERA_NET, \
		emp_proof = FALSE, \
	)
	to_chat(new_teammate, span_notice("Вы экипированы нательной камерой через которую наблюдает агент разведки. Убедитесь, что покажете хорошее представление!"))

/datum/objective/overwatch
	explanation_text = "Обеспечьте разведывательную поддержку и наблюдение за вашей оперативной группой!"

/datum/objective/overwatch/check_completion()
	return GLOB.station_was_nuked
