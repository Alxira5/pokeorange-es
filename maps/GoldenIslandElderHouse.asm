const_value = 1
	const ELDER_HOUSE_JESSIE
	const ELDER_HOUSE_JAMES
	const ELDER_HOUSE_ELDER
	const ELDER_HOUSE_MEOWTH

GoldenIslandElderHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GoldenIslandElderScript:
	checkevent EVENT_SAVED_CAT_ELDER
	iftrue .ElderTradeScript
	faceplayer
	opentext
	writetext ElderPleaseSaveMeText
	waitbutton
	closetext
	spriteface ELDER_HOUSE_JESSIE, UP
	spriteface ELDER_HOUSE_JAMES, UP
	spriteface ELDER_HOUSE_MEOWTH, UP
	showemote EMOTE_QUESTION, ELDER_HOUSE_JESSIE, 15
	showemote EMOTE_QUESTION, ELDER_HOUSE_JAMES, 15
	showemote EMOTE_QUESTION, ELDER_HOUSE_MEOWTH, 15
	playmusic MUSIC_ROCKET_OVERTURE
	opentext
	writetext ElderHouseJessieText1
	waitbutton
	closetext
	applymovement ELDER_HOUSE_JESSIE, ELDER_HOUSE_ROCKET_MOVEMENT1
	applymovement ELDER_HOUSE_JAMES, ELDER_HOUSE_ROCKET_MOVEMENT2
	opentext
	writetext ElderHouseJessieText2
	waitbutton
	closetext
    playmusic MUSIC_ROCKET_MOTTO
	opentext
	writetext ElderHouseJessieText3
	waitbutton
	closetext
	waitbutton
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	playmusic MUSIC_ROCKET_OVERTURE
	opentext
	writetext ElderHouseJessieText4
	waitbutton
	closetext	
	winlosstext JessieJamesWinLoss, 0
	loadtrainer JESSIE_JAMES, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	setevent EVENT_SAVED_CAT_ELDER
	disappear ELDER_HOUSE_JAMES
	disappear ELDER_HOUSE_JESSIE
	disappear ELDER_HOUSE_MEOWTH
	special Special_FadeInQuickly
	opentext
	writetext SavedElderText
	waitbutton
	verbosegiveitem MORO_TROPHY
	writetext ElderFarewellText
	waitbutton
	closetext
	end

.ElderTradeScript:
	faceplayer
	opentext
	checkevent EVENT_ELDER_GOT_MEOWTH
	iftrue .AlreadyGaveMeowth	
	writetext ElderTradeScriptText1
	yesorno
	iffalse .SaidNo
	special Special_BillsGrandfather
	iffalse .SaidNo
	if_not_equal MEOWTH, .SaidNo
	playsound SFX_DEX_FANFARE_50_79
	writetext GaveMeowthText
	waitsfx
	writetext ElderTradeScriptText4
	waitbutton
;	special SpecialTakeMeowth
	closetext
	setevent EVENT_ELDER_GOT_MEOWTH
	end
	
.AlreadyGaveMeowth
	writetext ElderTradeScriptText2
	waitbutton
	closetext
	end
	
.SaidNo
	writetext ElderTradeScriptText3
	waitbutton
	closetext
	end
	
ElderTradeScriptText1:
	text "Hay una desgracia"
	line "sobre MEOWTH."
	
	para "Necesitamos un"
	line "MEOWTH "
	cont "desesperadamente"
	cont "para garantizar"
	cont "nuestro sustento"
	cont "<...>"
	
	para "¿Podrias"
	line "encontrar uno?"
	done
	
ElderTradeScriptText2:
	text "¡Gracias!<...>"
	line "¡Has salvado"
	cont "nuestro pueblo!"
	done
	
ElderTradeScriptText3:
	text "Oh<...> Porfa"
	line "vuelve si"
	line "encuentras un"
	cont " MEOWTH<...>"
	done
	
ElderTradeScriptText4:
	text "¡Oh!¡Es un"
	line "MEOWTH de la"
	cont "buena suerte."
	
	para "Oh,¡gracias,"
	line "gracias!"
	cont "Con esto,mi"
	cont "pueblo estara"
	cont "a salvo."
	done
	
GaveMeowthText:
	text "¡<PLAYER> dio MEOWTH"
	line "al anciano!"
	done

ElderPleaseSaveMeText:
	text "¡Ayuda, por favor!"
	done

ElderHouseJessieText1:
	text "JESSIE: Hey,tu"
	line "¿Quien te"
	cont "crees?"
	done

ElderHouseJessieText2:
	text "JESSIE: ¿Vienes"
	line "a detenernos?"

	para "¡Nos llevaremos"
	line "tus #MON !"

	para "JAMES: ¡Ooh!¡Eso"
	line "suena diabolico"
	cont "JESSIE!"

	para "MEOWTH: Si,"
	line "suena muy bien"
	cont "chicos."
	done

ElderHouseJessieText3:
	text "JAMES: Primero<...>"

	para "Para proteger"
	line "al mundo de la"
	cont "devastacion."

	para "Para unir a "
	line "los pueblos en"
	cont "una sola nacion"
	done
	
ElderHouseJessieText4:
	text "<...> <...> <...>"

	para "JAMES: ¿Dices"
	line "que habias"
	cont "escuchado "
	cont "antes nuestro"
	cont "lema?"

	para "JESSIE: No puede"
	line "ser,salvo"
    cont "que<...>"
	cont "¡BUTCH y CASSIDY"
	cont "nos hayan"
	cont "robado nuestro"
	cont "lema."

	para "JAMES: No"
	line "habran podido..."

	para "MEOWTH: HEY! "
	line "Cortar el rollo"
	cont "y robar sus"
	cont "#MON ya"

	para "JESSIE: ¡Ahahahaha!"
	line "Muy bien."
	done

JessieJamesWinLoss:
	text "¡El TEAM ROCKET"
	line "despega de"
	cont "nuevo!."
	done

ElderHouseRocketScript:
	opentext
	writetext ElderRocketText
	waitbutton
	closetext
	end

ElderRocketText:
	text "ROCKETS: ¡Dadnos"
	line "todos los #MON"
	cont "que tengais!"
	done

SavedElderText:
	text "Gracias por"
	line "salvarme."

	para "Casi nos roban"
	line "esos idiotas"
	cont "del"
	cont "TEAM ROCKET"

	para "El MEOWTH"
	line "me engaño."
	cont "Dijo que traeria"
	cont "buena fortuna."

	para "Supongo que"
	line "la busqueda de"
	cont "MEOWTH sigue."

	para "si consigues"
	line "encontrar uno"
	cont "traemelo, por "
	cont "favor."

	para "Ah,parece que"
	line "lo soltaron."
	cont "Puedes tenerlo."
	done

ElderFarewellText:
	text "Bien, joven"
	line "entrenador."
	done

ELDER_HOUSE_ROCKET_MOVEMENT1:
	step UP
	turn_head LEFT
	step_end

ELDER_HOUSE_ROCKET_MOVEMENT2:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

GoldenIslandElderHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 4, GOLDEN_ISLAND
	warp_def $7, $4, 4, GOLDEN_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 4
	person_event SPRITE_JESSIE, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ElderHouseRocketScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_JAMES, 5, 5, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ElderHouseRocketScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_CAT_MAN, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenIslandElderScript, -1
	person_event SPRITE_ROCKET_MEOWTH, 5, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ElderHouseRocketScript, EVENT_SAVED_CAT_ELDER