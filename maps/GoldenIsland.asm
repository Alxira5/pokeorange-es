const_value = 1
	const GOLDEN_ISLAND_CATMAN_1
	const GOLDEN_ISLAND_CATMAN_2
	const GOLDEN_ISLAND_CATMAN_3
	const GOLDEN_ISLAND_JESSIE
	const GOLDEN_ISLAND_JAMES
	const GOLDEN_ISLAND_CATGUARD_1
	const GOLDEN_ISLAND_CATGUARD_2
	const GOLDEN_ISLAND_ITEM_BALL
	const GOLDEN_ISLAND_FRUIT_TREE
	const GOLDEN_ISLAND_BATTLE_CAT

GoldenIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

GoldenIslandSign:
	jumptext GoldenIslandSignText

GoldenIslandSignText:
	text "ISLA GOLDEN"

	para "¡Los MEOWTH son"
	line "bienvenidos!"
	done

CatManGuardingExitScript:
	jumptextfaceplayer CatManGuardText

CatManGuardText:
	text "La Abundante "
	line "cosecha esta"
	cont "en marcha."

	para "Nadie puede"
	line "pasar ahora."
	done

GoldenIslandAmuletCoin:
	itemball AMULET_COIN

CatManOutside1Script:
	jumptextfaceplayer CatManOutside1Text

CatManOutside1Text:
	text "¡BIENVENIDO A"
	line "ISLA GOLDEN"

	para "Si tienes un"
	line "MEOWTH, nuestro"
	cont "anciano estaria"
	cont "encantado de"
	cont "hablar contigo."
	done

CatManOutside2Script:
	jumptextfaceplayer CatManOutside2Text

CatManOutside2Text:
	text "Nuestro sustento"
	line "depende de MEOWTH"
	cont "y su Mov."
	cont "DIA DE PAGO"
	done

CatManOutside3Script:
	jumptextfaceplayer CatManOutside3Text

CatManOutside3Text:
	text "Si tuviera un"
	line "MEOWTH lo "
	cont "llamaria NYARTH."

	para "Me suena bien."
	done

GoldenIslandLargeStatue:
	jumptext GoldenIslandLargeStatueText

GoldenIslandLargeStatueText:
	text "Una gran estatua"
	line "de MEOWTH de oro"
	cont "macizo."
	done

GoldenIslandSmallStatue:
	jumptext GoldenIslandSmallStatueText

GoldenIslandSmallStatueText:
	text "Una pequeña "
	line "estatua dorada"
	cont "de MEOWTH."
	done

GoldenIslandFruitTree:
	fruittree FRUITTREE_GOLDEN_ISLAND

GoldenIslandRocketEvent:
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext GoldenIslandRocketText
	waitbutton
	closetext
	applymovement GOLDEN_ISLAND_JESSIE, GOLDEN_ISLAND_JESSIE_MOVEMENT
	disappear GOLDEN_ISLAND_JESSIE
	playsound SFX_ENTER_DOOR
	applymovement GOLDEN_ISLAND_JAMES, GOLDEN_ISLAND_JAMES_MOVEMENT
	disappear GOLDEN_ISLAND_JAMES
	playsound SFX_ENTER_DOOR
	setevent EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	domaptrigger GOLDEN_ISLAND, $1
	end

GoldenIslandRocketText:
	text "JESSIE: Parece"
	line "que adoran a"
	cont "MEOWTH aqui."

	para "¿Que debariamos"
	line "hacer JAMES?"

	para "JAMES: Bueno,no"
	line "parece que los"
	cont "habitantes esten"
	cont "al tanto de"
	cont "nuestra presencia."

	para "Deberiamos robarles"
	line "los pokes a estos"
	cont "locos del gato."

	para "JESSIE: ¡Ah haha!"
	line "¡Todos sus"
	cont "#MON seran"
	cont "nuestros!"

	para "JAMES: ¡Ooh!"
	line "Me gusta como"
	cont "piensas, JESSIE!"

	para "JESSIE and JAMES:"
	line "¡Ahahahahahaha!"
	done

GOLDEN_ISLAND_JESSIE_MOVEMENT:
	step UP
	step_end

GOLDEN_ISLAND_JAMES_MOVEMENT:
	step UP
	step UP
	step_end

CatManBattleHouseScript:
	checkevent EVENT_ELDER_GOT_MEOWTH
	iffalse .DontWannaFight
	opentext
	writetext CatManBattleHouseText1
	yesorno
	iftrue .BattleHouseBegin
	writetext DeclineBattleHouseText
	waitbutton
	closetext
	end
	
.DontWannaFight:
	opentext
	writetext CatManBattleHouseNoFightText
	waitbutton
	closetext
	end

.BattleHouseBegin:
	writetext CatManBattleHouseText2
	waitbutton
	winlosstext CatmanDaikonWinLoss, 0
	loadtrainer CATMAN, DAIKON
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText3
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText4
	waitbutton
	winlosstext CatmanKunioWinLoss, 0
	loadtrainer CATMAN, KUNIO
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText5
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText6
	waitbutton
	winlosstext CatmanYoshikawaWinLoss, 0
	loadtrainer CATMAN, YOSHIKAWA
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText7
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText8
	waitbutton
	winlosstext CatmanRenWinLoss, 0
	loadtrainer CATMAN, REN
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText9
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText10
	waitbutton
	winlosstext CatmanMimiWinLoss, 0
	loadtrainer CATMAN, MIMI
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText11
	waitbutton
	closetext
	applymovement GOLDEN_ISLAND_BATTLE_CAT, BATTLE_HOUSE_MOVEMENT1
	disappear GOLDEN_ISLAND_BATTLE_CAT
	playsound SFX_ENTER_DOOR
	setevent EVENT_CAT_BATTLE_HOUSE_CLEARED
	end

BATTLE_HOUSE_MOVEMENT1:
	step UP
	step_end

CatmanDaikonWinLoss:
	text "¡Di lo mejor"
	line "de mi!"
	done

CatmanKunioWinLoss:
	text "Wow,¡no esta"
	line "tan mal!"
	done

CatmanYoshikawaWinLoss:
	text "Hmph."
	done

CatmanRenWinLoss:
	text "¿Puedes hacerlo?"
	done

CatmanMimiWinLoss:
	text "¡Tenemos un"
	line "ganador."
	done

CatManBattleHouseText1:
	text "¡BIENVENIDO A"
	line "LA CASA BATALLA"
	cont "ISLA GOLDEN!"

	para "Al entrar, debes"
	line "debes ganar cinco"
	cont "victorias"
	cont "consecutivas."

	para "Seras recompensado"
	line "con un gran"
	cont "premio."

	para "¿Quieres probar?"
	done
	
CatManBattleHouseNoFightText:
	text "Nyaa<...>"
	line "Bienvenido a"
	cont "la CASA BATALLA"
	cont "de GOLDEN<...>"
	
	para "Tenemos nyaat"
	line "a los "
	cont "participantes."
	
	para "¿Que podemos "
	line "hacer cuando no"
	cont "tenemos a MEOWTH"
	cont "o la paga?"
	cont "Nyaa<...>"
	done

DeclineBattleHouseText:
	text "Muy bien."
	line "La CASA BATALLA"
	cont "esta siempre"
	cont "abierta."
	done

CatManBattleHouseText2:
	text "¡Un participante!"

	para "Bien pues,aqui"
	line "esta tu primer"
	cont "oponente"
	done

CatManBattleHouseText3:
	text "He perdido"
	line "Permiteme pasar"
	cont "siguiente rival,"
	done

CatManBattleHouseText4:
	text "¡Aqui estoy!"
	line "Soy mas fuerte"
	cont "que mi amigo."
	cont "¡Vamos!"
	done

CatManBattleHouseText5:
	text "¡Peleas bien1"
	line "¡Permiteme ser"
	cont "el siguiente!."
	done

CatManBattleHouseText6:
	text "¿Agotado ya?"
	done

CatManBattleHouseText7:
	text "Hmph. Sera"
	line "NOAH quien"
	cont "te derrote."
	done

CatManBattleHouseText8:
	text "Has llegado"
	line "muy lejos ¡pero"
	cont "esto se acaba"
	cont "aqui!"
	done

CatManBattleHouseText9:
	text "GRANT es el"
	line "mas fuerte de"
	cont "nosotros."

	para "Preparate."
	done

CatManBattleHouseText10:
	text "Buen trabajo"
	line "llegando hasta"
	cont "mi. Llevo tiempo"
	cont "esperando un"
	cont "buen desafio."
	done

CatManBattleHouseText11:
	text "¡Felicidades!"
	line "Ve dentro a "
	cont "por tu premio."
	done

GoldenIsland_MapEventHeader::

.Warps: db 8
	warp_def 5, 13, 1, GOLDEN_ISLAND_HOUSE_1
	warp_def 9, 5, 1, GOLDEN_ISLAND_HOUSE_2
	warp_def 19, 3, 1, GOLDEN_ISLAND_HOUSE_3
	warp_def 13, 25, 1, GOLDEN_ISLAND_ELDER_HOUSE
	warp_def 4, 21, 1, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 5, 21, 2, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 27, 11, 5, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 27, 12, 6, GOLDEN_ISLAND_GATE_HOUSE

.CoordEvents: db 2
	xy_trigger 0, 16, 22, GoldenIslandRocketEvent
	xy_trigger 0, 16, 23, GoldenIslandRocketEvent

.BGEvents: db 7
	signpost 9, 15, SIGNPOST_READ, GoldenIslandSign
	signpost 14, 11, SIGNPOST_READ, GoldenIslandLargeStatue
	signpost 14, 12, SIGNPOST_READ, GoldenIslandLargeStatue
	signpost 16, 9, SIGNPOST_UP, GoldenIslandSmallStatue
	signpost 16, 14, SIGNPOST_UP, GoldenIslandSmallStatue
	signpost 20, 10, SIGNPOST_UP, GoldenIslandSmallStatue
	signpost 20, 13, SIGNPOST_UP, GoldenIslandSmallStatue

.ObjectEvents: db 10
	person_event SPRITE_CAT_MAN, 7, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CatManOutside1Script, -1
	person_event SPRITE_CAT_MAN, 12, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManOutside2Script, -1
	person_event SPRITE_CAT_MAN, 17, 14, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManOutside3Script, -1
	person_event SPRITE_JESSIE, 14, 25, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	person_event SPRITE_JAMES, 15, 25, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	person_event SPRITE_CAT_MAN, 27, 11, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGuardingExitScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_CAT_MAN, 27, 12, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGuardingExitScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_POKE_BALL, 25, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenIslandAmuletCoin, EVENT_GOLDEN_ISLAND_AMULET_COIN
	person_event SPRITE_FRUIT_TREE, 1, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenIslandFruitTree, -1
	person_event SPRITE_CAT_MAN, 6, 13, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManBattleHouseScript, EVENT_CAT_BATTLE_HOUSE_CLEARED
