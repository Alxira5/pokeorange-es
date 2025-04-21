const_value = 1
	const INFO_WAITRESS
	const WAITRESS_SATOMI
	const WAITRESS_NAOMI
	const WAITRESS_SAORI
	const WAITRESS_JUN

KinnowCafe_MapScriptHeader::

.MapTriggers: db 0

.MapCallbacks: db 0

WaitressInfo:
	opentext
	faceplayer
	writetext InfoTextCafe
	waitbutton
	closetext
	end

InfoTextCafe:
	text "¡Bienvenido a"
	line "PIA CARROT!"

	para "Por favor,"
	line "pelea con el"
	cont "corazon."
	done

WaitressSatomi:
	trainer EVENT_BEAT_WAITRESS_SATOMI, WAITRESS, SATOMI, WaitressSatomiSeenText, WaitressSatomiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressSatomiAfterText
	waitbutton
	closetext
	end

WaitressSatomiSeenText:
	text "El propietario"
	line "busca cruzar los"
	cont "mares para ver"
	cont "nuevos  #MON!"
	done

WaitressSatomiBeatenText:
	text "¡Wow!Si solo el"
	line "propietario"
	cont "estuviera aqui."
	done

WaitressSatomiAfterText:
	text "El propietario"
	line "es mas fuerte"
	cont "que cualquiera"
	cont "de los presentes."
	done

WaitressNaomi:
	trainer EVENT_BEAT_WAITRESS_NAOMI, WAITRESS, NAOMI, WaitressNaomiSeenText, WaitressNaomiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressNaomiAfterText
	waitbutton
	closetext
	end

WaitressNaomiSeenText:
	text "¿Con que quieres"
	line "las patatas?"
	done

WaitressNaomiBeatenText:
	text "¿Para llevar?"
	done

WaitressNaomiAfterText:
	text "Fanservice "
	line "lleva un extra."
	done

WaitressSaori:
	trainer EVENT_BEAT_WAITRESS_SAORI, WAITRESS, SAORI, WaitressSaoriSeenText, WaitressSaoriBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressSaoriAfterText
	waitbutton
	closetext
	end

WaitressSaoriSeenText:
	text "Marchando un"
	line "especial."
	done

WaitressSaoriBeatenText:
	text "¡No! ¡Perdi!"
	done

WaitressSaoriAfterText:
	text "Se suponia que"
	line "iba a ser "
	cont "especial<...>"
	done

WaitressJun:
	trainer EVENT_BEAT_WAITRESS_JUN, WAITRESS, JUN, WaitressJunSeenText, WaitressJunBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressJunAfterText
	waitbutton
	closetext
	end

WaitressJunSeenText:
	text "¿Vienes a"
	line "desafiarnos?"

	para "Vale,¡Peleemos!"
	done

WaitressJunBeatenText:
	text "Bien hecho."
	done

WaitressJunAfterText:
	text "Buena suerte en"
	line "tu viaje."

	para "Me recuerdas al"
	line "PROPIETARIO."
	done

KinnowCafe_MapEventHeader::

.Warps: db 2
	warp_def 9, 2, 6, KINNOW_ISLAND
	warp_def 9, 3, 6, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_F, 6, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WaitressInfo, -1
	person_event SPRITE_COOLTRAINER_F, 2, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, WaitressSatomi, -1
	person_event SPRITE_COOLTRAINER_F, 3, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 0, WaitressNaomi, -1
	person_event SPRITE_COOLTRAINER_F, 5, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, WaitressSaori, -1
	person_event SPRITE_COOLTRAINER_F, 7, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, WaitressJun, -1
