const_value = 1
	const BLUESHOUSE_DAISY

BluesHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

DaisyScript_0x19b0d0:
	faceplayer
	opentext
	checkcode VAR_HOUR
	if_equal $f, UnknownScript_0x19b0de
	writetext UnknownText_0x19b130
	waitbutton
	closetext
	end

UnknownScript_0x19b0de:
	checkflag ENGINE_TEA_IN_BLUES_HOUSE
	iftrue UnknownScript_0x19b11e
	writetext UnknownText_0x19b1b6
	yesorno
	iffalse UnknownScript_0x19b124
	writetext UnknownText_0x19b244
	waitbutton
	special Special_DaisyMassage
	if_equal 0, UnknownScript_0x19b124
	if_equal 1, UnknownScript_0x19b12a
	setflag ENGINE_TEA_IN_BLUES_HOUSE
	writetext UnknownText_0x19b266
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x19b296
	special PlayCurMonCry
	buttonsound
	writetext UnknownText_0x19b2aa
	waitbutton
	closetext
	end

UnknownScript_0x19b11e:
	writetext UnknownText_0x19b2fa
	waitbutton
	closetext
	end

UnknownScript_0x19b124:
	writetext UnknownText_0x19b334
	waitbutton
	closetext
	end

UnknownScript_0x19b12a:
	writetext UnknownText_0x19b377
	waitbutton
	closetext
	end

UnknownText_0x19b130:
	text "DAISY:¡Hola!"
	line "Mi hermano"
	cont "pequeño es el"

	para "lider de gimnasio"
	line "de CIUDAD VERDE."

	para "Pero suele viajar"
	line "con frecuencia."

	para "Eso afecta a los"
	line "los entrenadores"
	done

UnknownText_0x19b1b6:
	text "DAISY:¡Hola! Buen"
	line "momento.Me iba a"
	cont "servir un te."

	para "¿Querrias unirte"
	line "a mi?"

	para "Oh,tus #MON estan"
	line "algo sucios."

	para "¿Te gustaria que"
	line "limpie alguno?"
	done

UnknownText_0x19b244:
	text "DAISY:¿Cual "
	line "deberia limpiar?"
	done

UnknownText_0x19b266:
	text "DAISY: OK,lo"
	line "dejare limpito"
	cont "en nada."
	done

UnknownText_0x19b296:
	text_from_ram StringBuffer3
	text " parece"
	line "contento."
	done

UnknownText_0x19b2aa:
	text "DAISY: Ya esta"
	line "todo hecho."

	para "¿Ves?¿No te "
	line "luce mejor?"

	para "Esta mas bonito"
	line "#MON."
	done

UnknownText_0x19b2fa:
	text "DAISY: Siempre"
	line "tengo mas te"

	para "Ven,"
	line "unete."
	done

UnknownText_0x19b334:
	text "DAISY:¿No quieres"
	line "que limpie a"

	para "a nadie? OK,"
	line "solo te."
	done

UnknownText_0x19b377:
	text "DAISY: Oh,perdon."
	line "No puedo limpiar"
	cont "un huevo."
	done

BluesHouse_MapEventHeader:

.Warps: db 0

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_DAISY, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DaisyScript_0x19b0d0, -1
