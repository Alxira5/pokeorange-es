const_value = 1
	const MIKANGYM_FALKNER
	const MIKANGYM_YOUNGSTER1
	const MIKANGYM_YOUNGSTER2
	const MIKANGYM_GYM_GUY

MikanGym_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

FalknerScript_0x683c2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CISSY
	iftrue .FightDone
	writetext UnknownText_0x68473
	waitbutton
	closetext
	winlosstext UnknownText_0x6854a, 0
	loadtrainer CISSY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CISSY
	opentext
	writetext UnknownText_0x685af
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CORAL_EYE_BADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_BUBBLEBEAM
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_SWIMMERF_MARIA
	setevent EVENT_BEAT_LASS_NICOLE
	writetext UnknownText_0x685c8
	domaptrigger MIKAN_ISLAND_ROUTE_53_GATE, $1
	buttonsound
	verbosegiveitem TM_BUBBLEBEAM
	iffalse .NoRoomForBubblebeam
	setevent EVENT_GOT_TM_BUBBLEBEAM
	writetext UnknownText_0x68648
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext UnknownText_0x68735
	waitbutton
.NoRoomForBubblebeam:
	closetext
	end

TrainerSwimmerfMaria:
	trainer EVENT_BEAT_SWIMMERF_MARIA, SWIMMERF, MARIA, SwimmerfMariaSeenText, SwimmerfMariaBeatenText, 0, SwimmerfMariaScript

SwimmerfMariaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x68837
	waitbutton
	closetext
	end

TrainerLassNicole:
	trainer EVENT_BEAT_LASS_NICOLE, LASS, NICOLE, LassNicoleSeenText, LassNicoleBeatenText, 0, LassNicoleScript

LassNicoleScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x688c7
	waitbutton
	closetext
	end

MikanGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CISSY
	iftrue .MikanGymGuyWinScript
	writetext MikanGymGuyText
	waitbutton
	closetext
	end

.MikanGymGuyWinScript:
	writetext MikanGymGuyWinText
	waitbutton
	closetext
	end

MikanGymStatue:
	checkflag ENGINE_CORAL_EYE_BADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext CISSY, 1, $1
	jumpstd gymstatue2

UnknownText_0x68473:
	text "Bienvenido,"
	line "ASPIRANTE."

	para "Soy CISSY del"
	line "ORANGE CREW."

	para "Creci en esta"
	line "isla, con mis"
	cont " #MON de agua,"
	cont "hasta llegar"
	cont " a lo que somos."

	para "Bueno,¿Por"
	line "que no "
	cont "empezamos?"
	done

UnknownText_0x6854a:
	text "¿Que?!"

	para "¡Mis #MON!"
	line "perfectos de agua!"

	para "Muy bie. Te has"
	line "ganado esto."

	para "Es medalla oficial"
	line "del ORGANGE CREW,"
	cont "la medalla OJO"
	cont "DE CORAL."
	done

UnknownText_0x685af:
	text "<PLAYER> obtuvo"
	line "MEDALLA OJO DE"
	cont "CORAL."
	done

UnknownText_0x685c8:
	text "Estoy muy"
	line "impresionada."

	para "Esta medalla hace"
	line "qye tus #MON"
	cont "de hasta nivel 35"
	cont "te obedezcan."

	para "Toma esto"
	line "tambien."
	done

UnknownText_0x68648:
	text "Usando esta MT"
	line "un #MON podra"

	para "aprender un "
	line "nuevo movimiento."

	para "Esta MT contiene"
	line "RAYO BURBUJA."

	para "Reduce la vel."
	line "del enemigo"

	para "a la vez que le"
	line "causa daño."

	para "Es una poderosa"
	line "herramienta."
	cont "Usala bien."
	done

UnknownText_0x68735:
	text "Tu siguiente "
	line "prueba es ISLA"
	cont "NAVEL."

	para "Buena suerte."
	done

SwimmerfMariaSeenText:
	text "Mi CORSOLA y yo"
	line "somos imbatibles."
	done

SwimmerfMariaBeatenText:
	text "¡Noooooo!"
	done

UnknownText_0x68837:
	text "Mi CORSOLA<...>"
	done

LassNicoleSeenText:
	text "Espero que seas"
	line "mejor entrenador"
	cont "que los que han"
	cont "venido antes que"
	cont "tu."
	done

LassNicoleBeatenText:
	text "¡Guau!"
	done

UnknownText_0x688c7:
	text "No soy nada"
	line "comparado con"
	cont "CISSY."

	para "No te vengas"
	line "arriba por "
	cont "vencerme."
	done

MikanGymGuyText:
	text "Mira, mas carne"
	line "fresca.."

	para "Escucha chico,"
	line "CiSSY no es"
	cont "ninguna broma."
	cont "Usa #MON de agua"
	cont "muy fuertes."

	para "Pero si tienes"
	line "tipos planta o"
	cont "electrico, puedes"
	cont "tener opciones."
	done

MikanGymGuyWinText:
	text "¡Buen combate!"
	line "Sigue asi y seras"

	para "CAMPEON en tiempo"
	line "record."
	done

MikanGym_MapEventHeader::

.Warps: db 2
	warp_def 17, 4, 2, MIKAN_ISLAND
	warp_def 17, 5, 2, MIKAN_ISLAND

.CoordEvents: db 0

.BGEvents: db 2
	signpost 17, 9, SIGNPOST_READ, MikanGymStatue
	signpost 7, 6, SIGNPOST_READ, MikanGymStatue

.ObjectEvents: db 4
	person_event SPRITE_CISSY, 3, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FalknerScript_0x683c2, -1
	person_event SPRITE_SWIMMER_GIRL, 11, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerfMaria, -1
	person_event SPRITE_LASS, 7, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerLassNicole, -1
	person_event SPRITE_GYM_GUY, 15, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MikanGymGuyScript, -1
