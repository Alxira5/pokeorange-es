const_value = 1
	const CATMAN_DAIKON
	const CATMAN_KUNIO
	const CATMAN_YOSHIKAWA
	const CATMAN_REN
	const CATMAN_MIMI

GoldenIslandHouse1_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Daikon:
	jumptextfaceplayer DaikonText

Kunio:
	jumptextfaceplayer KunioText

Yoshikawa:
	jumptextfaceplayer YoshikawaText

Ren:
	jumptextfaceplayer RenText

Mimi:
	checkevent EVENT_GOT_EXP_ALL
	iftrue .AlreadyGotExpAll
	faceplayer
	opentext
	writetext GiveExpAllText
	waitbutton
	verbosegiveitem CAT_STATUE
	iffalse MimiDoneScript
	setevent EVENT_GOT_EXP_ALL
	closetext
	end

.AlreadyGotExpAll
	jumptextfaceplayer MimiText
	
MimiDoneScript:
	closetext
	end

DaikonText:
	text "¡Eres tan fuerte!"
	done

KunioText:
	text "Eres digno de "
	line "la CASA BATALLA"
	cont "de Isla GOLDEN."
	done

YoshikawaText:
	text "Bien hecho."
	done

RenText:
	text "No ha habido"
	line "nadie que nos"
	cont "haya derrotado"
	cont "en mucho tiempo."
	done

MimiText:
	text "¡Nos vemos!"
	done

GiveExpAllText:
	text "Aqui tienes tu"
	line "premio por"
	cont "derrotarnos."
	cont "<PLAYER>!"
	done

GoldenIslandHouse1_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 1, GOLDEN_ISLAND
	warp_def $7, $4, 1, GOLDEN_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 5
	person_event SPRITE_CAT_MAN, 2, 7, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Daikon, -1
	person_event SPRITE_CAT_MAN, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Kunio, -1
	person_event SPRITE_CAT_MAN, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Yoshikawa, -1
	person_event SPRITE_CAT_MAN, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Ren, -1
	person_event SPRITE_CAT_MAN, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Mimi, -1