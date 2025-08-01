/obj/machinery/vending/hydronutrients
	name = "\improper NutriMax"
	desc = "A plant nutrients vendor."
	product_slogans = "Вам не надо удобрять почву естественным путём — разве это не чудесно?;Теперь на 50% меньше вони!;Растения тоже люди!"
	product_ads = "Мы любим растения!;Может сами примете?;Самые зелёные кнопки на свете.;Мы любим большие растения.;Мягкая почва..."
	icon_state = "nutri"
	icon_deny = "nutri-deny"
	panel_type = "panel2"
	light_mask = "nutri-light-mask"
	products = list(
		/obj/item/cultivator = 3,
		/obj/item/plant_analyzer = 4,
		/obj/item/reagent_containers/cup/jerrycan/eznutriment = 6,
		/obj/item/reagent_containers/cup/jerrycan/left4zed = 4,
		/obj/item/reagent_containers/cup/jerrycan/robustharvest = 3,
		/obj/item/reagent_containers/spray/pestspray = 20,
		/obj/item/reagent_containers/syringe = 5,
		/obj/item/secateurs = 3,
		/obj/item/shovel/spade = 3,
		/obj/item/storage/bag/plants = 5,
	)
	contraband = list(
		/obj/item/reagent_containers/cup/bottle/ammonia = 10,
		/obj/item/reagent_containers/cup/bottle/diethylamine = 5,
		/obj/item/reagent_containers/cup/bottle/saltpetre = 5,
	)
	refill_canister = /obj/item/vending_refill/hydronutrients
	default_price = PAYCHECK_CREW * 0.8
	extra_price = PAYCHECK_COMMAND * 0.8
	payment_department = ACCOUNT_SRV
	allow_custom = TRUE

/obj/item/vending_refill/hydronutrients
	machine_name = "NutriMax"
	icon_state = "refill_plant"
