const_value = 1
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokeCenter1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

NurseScript_0x60f91:
	jumpstd pokecenternurse

GameboyKidScript_0x6101e:
	jumptextfaceplayer UnknownText_0x62105

LassScript_0x61021:
	jumptextfaceplayer UnknownText_0x62260

PokefanFScript_0x61024:
	faceplayer
	opentext
	writetext UnknownText_0x623fb
	waitbutton
	writetext UnknownText_0x6248c
	yesorno
	iffalse UnknownScript_0x6104b
	takeitem EON_MAIL
	iffalse UnknownScript_0x6104b
	writetext UnknownText_0x62549
	waitbutton
	writetext UnknownText_0x624a4
	waitbutton
	verbosegiveitem REVIVE
	iffalse UnknownScript_0x61051
	writetext UnknownText_0x624e9
	waitbutton
	closetext
	end

UnknownScript_0x6104b:
	writetext UnknownText_0x62509
	waitbutton
	closetext
	end

UnknownScript_0x61051:
	giveitem EON_MAIL
	writetext UnknownText_0x6252a
	waitbutton
	closetext
	end

UnknownText_0x62105:
	text "Esta hack no"
	line "tiene funciones"
	cont "multijugador."

	para "Pero es el"
	line "mejor hack"

	para "de segunda gen"
	line "Palabra de"
	cont "CALENTADASTCG"
	done

UnknownText_0x62260:
	text "Tener un"
	line "#MON de mas"
	cont "nivel no "
	cont "garantiza ganar."

	para "Hay tabla de"
	line "tipos y eso"
	cont "influye."

	para "No hay un"
	line "solo"

	para "#MON que"
	line "sea el mejor."
	done

UnknownText_0x623fb:
	text "Oh, tu mochila"
	line "parece pesada."

	para "Oh! ¿Crees que"
	line "tiene que ver"
	cont "con la carta
    cont "	EON ?"

	para "Mi hija esta"
	line "despues de todo."

	para "¿Puedes ir"
	line "con ella?"
	done

UnknownText_0x6248c:
	text "¿Regalar la "
	line "carta EON?"
	done

UnknownText_0x624a4:
	text "¡Oh,genial!"
	line "¡Gracias cielo!"

	para "Toma, en"
	line "agradecimiento"
	done

UnknownText_0x624e9:
	text "Mi hija estara"
	line "decepcionada"
	done

UnknownText_0x62509:
	text "Oh? ¿No tienes"
	line "una? Que mal."
	done

UnknownText_0x6252a:
	text "Oh<...> Bueno"
	line "otra vez sera."
	done

UnknownText_0x62549:
	text "<PLAYER> gave away"
	line "the EON MAIL."
	done

GoldenrodPokeCenter1F_MapEventHeader:

.Warps: db 0

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 5
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x60f91, -1
	person_event SPRITE_LINK_RECEPTIONIST, 8, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_GAMEBOY_KID, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GameboyKidScript_0x6101e, -1
	person_event SPRITE_LASS, 4, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x61021, -1
	person_event SPRITE_POKEFAN_F, 5, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x61024, -1
