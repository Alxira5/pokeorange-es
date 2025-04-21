const_value = 1
	const CLEOPATRA_ISLAND_TAD
	const CLEOPATRA_ISLAND_CROSS
	const CLEOPATRA_ISLAND_ITEMBALL_HYPER_POTION
	const CLEOPATRA_ISLAND_ITEMBALL_MAX_REPEL
	const CLEOPATRA_ISLAND_ITEMBALL_ELIXER
	const CLEOPATRA_ISLAND_RED
	const CLEOPATRA_ISLAND_SEASHELL

CleopatraIsland_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

CleopatraIslandHyperPotion:
	itemball HYPER_POTION

CleopatraIslandMaxRepel:
	itemball MAX_REPEL
	
CleopatraIslandElixer:
	itemball TRADE_STONE
	
CleopatraIslandSign:
	jumptext CleopatraIslandSignText
	
CleopatraIslandSignText:
	text "ISLA CLEOPATRA "

	para "HACIA ASCORBIA"
	done

CrossCleopatraEventScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CleopatraCrossText1
	waitbutton
	closetext
	applymovement PLAYER, PlayerCleopatraMovement
	spriteface CLEOPATRA_ISLAND_CROSS, RIGHT
	showemote EMOTE_SHOCK, CLEOPATRA_ISLAND_CROSS, 15
	opentext
	writetext CleopatraCrossText2
	waitbutton
	closetext
	applymovement PLAYER, PlayerCleopatraMovement2
	applymovement CLEOPATRA_ISLAND_CROSS, CrossCleopatraMovement
	disappear CLEOPATRA_ISLAND_CROSS
	setevent EVENT_CROSS_MET_ON_CLEOPATRA
	playmusic MUSIC_ROUTE_26
	spriteface PLAYER, LEFT
	spriteface CLEOPATRA_ISLAND_TAD, RIGHT
	opentext
	writetext CleopatraCrossText3
	waitbutton
	closetext
	spriteface CLEOPATRA_ISLAND_TAD, UP
	domaptrigger CLEOPATRA_ISLAND, $1
	domaptrigger MURCOTT_ISLAND, $1
	setevent EVENT_MURCOTT_ISLAND_CROSS
	end
	
CleopatraCrossText1:
	text "CROSS: Hmph."
	line "El cinturon de"
	cont "CAMPEON parece"
	cont "que no significa"
	cont "nada."
	
	para "Dices que"
	line "fuertes vienen de"
	cont "KANTO, pero tu no"
	cont "eres mas que un"
	
	para "debil.Me voy"
	line "de aqui"
	
	para "???: <...>"
	done
	
CleopatraCrossText2:
	text "CROSS: Bien,bien."
	line "Si es"
	cont "<PLAYER>!"
	
	para "Desgraciadamente"
	line "mis #MON no"
	cont "estan en "
	cont "condiciones.En"
	
	para "otra ocasion"
	cont "pelearemos."
	done
	
CleopatraCrossText3:
	text "???: Este tipo"
	line "parece bueno. Su"
	cont "nombre es TAD."
	
	para "TAD: Olvida lo"
	line "que ha dicho,"
	cont "Tengo mucha fe"
	cont "en mi AS"
	
	para "POLIWRATH."
	line "Ganamos un"
	cont "certamen volviendo"
	cont "a casa,Kanto y"
	
	para "POLIWRATH luce ese"
	line "cinturon de"
	cont "campeon."
	
	para "De todos modos"
	line "se que quieres"
	cont "combatir. Siempre"
	cont "estoy preparado"
	cont "para luchar."
	done
	
PlayerCleopatraMovement:
	step LEFT
	step_end
	
PlayerCleopatraMovement2:
	step DOWN
	turn_head UP
	step_end
	
CrossCleopatraMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
CleopatraRedEvent:
	checkcode VAR_FACING
	if_equal UP, .RedBattleScript
	opentext
	writetext RedWrongWayText
	waitbutton
	closetext
	end
	
.RedBattleScript
	special Special_FadeOutMusic
	pause 20
	faceplayer
	opentext
	writetext RedText
	waitbutton
	closetext
	winlosstext RedText, 0
	setlasttalked CLEOPATRA_ISLAND_RED
	loadtrainer RED, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	disappear CLEOPATRA_ISLAND_RED
	special Special_FadeInQuickly
	setevent EVENT_RED_ON_CLEOPATRA
	setevent EVENT_BEAT_RED
	playmusic MUSIC_ROUTE_26
	end
	
RedWrongWayText:
	text "<...>"
	
	para "Deberias hablarle"
	line "desde atras."
	done
	
RedText:
	text "<...>"
	done
	
CleopatraTadScript:
	faceplayer
	opentext
	writetext CleopatraTadText1
	yesorno
	iftrue .TadBattle
	closetext
	end
	
.TadBattle
	writetext CleopatraTadText2
	waitbutton
	closetext
	winlosstext CleopatraTadWinLossText, 0
	setlasttalked CLEOPATRA_ISLAND_TAD
	loadtrainer COOLTRAINERM, TAD
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROUTE_26
	opentext
	writetext CleopatraTadText3
	waitbutton
	closetext
	disappear CLEOPATRA_ISLAND_TAD
	special Special_FadeInQuickly
	setevent EVENT_BEAT_COOLTRAINERM_TAD
	end
	
CleopatraTadText1:
	text "TAD:¿Que quieres?"
	line "¿Combatir?"
	done
	
CleopatraTadText2:
	text "TAD:¡VAMOS!"
	done
	
CleopatraTadWinLossText:
	text "Eres alguien"
	line "genial, <PLAYER>!"
	done
	
CleopatraTadText3:
	text "TAD: Tengo"
	line "el presentimiento"
	cont "de que nos "
	cont "veremos otra vez."
	
	para "Adios, por ahora."
	done
	
CleopatraSeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundCleopatraSeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_CLEOPATRA_ISLAND_SEASHELL
	disappear CLEOPATRA_ISLAND_SEASHELL
	end
	
.NoShellBox:
	writetext CleopatraNoShellBox
	waitbutton
	closetext
	end
	
CleopatraNoShellBox:
    text "Que bonita concha"
    line "marina. Parece "
    cont "muy fragil para"
    cont "guardarla en mi "
	cont "mochila."
    done
	
FoundCleopatraSeashell:
	text "Encontraste una"
	line "concha marina."
	done

CleopatraIsland_MapEventHeader::

.Warps: db 0

.CoordEvents: db 1
	xy_trigger 0, 4, 22, CrossCleopatraEventScript

.BGEvents: db 1
	signpost 33, 21, SIGNPOST_READ, CleopatraIslandSign

.ObjectEvents: db 7
	person_event SPRITE_COOLTRAINER_M, 5, 20, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CleopatraTadScript, EVENT_BEAT_COOLTRAINERM_TAD
	person_event SPRITE_ROCKER, 4, 20, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CROSS_MET_ON_CLEOPATRA
	person_event SPRITE_POKE_BALL, 7, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CleopatraIslandHyperPotion, EVENT_CLEOPATRA_ISLAND_HYPER_POTION
	person_event SPRITE_POKE_BALL, 24, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CleopatraIslandMaxRepel, EVENT_CLEOPATRA_ISLAND_MAX_REPEL
	person_event SPRITE_POKE_BALL, 10, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CleopatraIslandElixer, EVENT_CLEOPATRA_ISLAND_ELIXER
	person_event SPRITE_RED, 13, 19, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CleopatraRedEvent, EVENT_RED_ON_CLEOPATRA
	person_event SPRITE_SEASHELL, 24,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CleopatraSeashellScript, EVENT_CLEOPATRA_ISLAND_SEASHELL

