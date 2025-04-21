const_value = 1
	const KRISSHOUSE1F_MOM1

KrissHouse1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MotherScript:
	opentext
	faceplayer
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .MotherOrangeCrewText
	writetext MotherText
	waitbutton
	closetext
	end
	
.MotherOrangeCrewText:
	checkevent EVENT_BEAT_RED
	iftrue .MotherBattle
	writetext MotherBeatOrangeCrewText
	waitbutton
	closetext
	end
	
.MotherBattle ;TODO
	writetext MotherBeatRedText
	waitbutton
	closetext
	end

TVScript:
	checkevent EVENT_EON_DUO_WILD
	iftrue .TvScriptNormal
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iffalse .TvScriptNormal
	opentext
	writetext EonDuoTVSpecial
	waitbutton
	writebyte LATIAS
	special ShowPokedexEntry
	writebyte LATIOS
	special ShowPokedexEntry
	closetext
	setevent EVENT_EON_DUO_WILD
	special InitRoamMons
	end

.TvScriptNormal
	jumptext TVText

EonDuoTVSpecial:
	text "¡Noticias!"
	line "Dos #MON"
	cont "han sido vistos"
	cont "volando como"
	cont "aviones."
	
	para "Se les ha"
	line "visto por varias"
	cont "islas."
	cont "Esta noticia"
	
	para "es obra de"
	line "HAMLIN TV."
	done

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MotherText:
	text "Mama:Entrenar..."
	line "Todos los niños"
	cont "se van de casa"
	cont "algun dia..."
	cont "Eso dicen en TV."

	para "Sabes, fui"
	line "entrenadora hace"
	cont "mucho tiempo."

;	para "Si te vuelves"
;	line "mas fuerte,"
;	cont "combatiremos."
	done
	
MotherBeatOrangeCrewText:
	text "Mama: Hora de"
	line "irse."
	
	para "Estare pendiente"
	line "de ti."
	
	para "Una vez luche en"
	line "la LIGA AÑIL."
	cont "He oido que tiene"
	cont "un nuevo CAMPEON."
	cont "Hay rumores de"
	cont "que ha venido a"
	cont "a desafiar al"
	cont "CAMPEON de"
	cont "nuestras ISLAS,"
	cont "que eres TU."
	
	para "Fue visto por"
	line "ultima vez en"
	cont "ISLA CLEOPATRA."
	done

MotherBeatRedText:
	text "Mama:¿Has"
	line "vencido al"
	cont "CAMPEON de"
	cont "la LIGA AÑIL?"
	
	para "Parece que has"
	line "terminado por"
	cont "ser mejor"
	cont "entrenador de lo"
	cont "que yo nunca fui."
	cont "¡Estoy orgulloss!"
	cont "Seguro que pelear"
	cont "contra mi hijo"
	para "CAMPEON es un buen"
	para "combate POKEMON,"
	line "¿No crees?"
	done

StoveText:
	text "Un buen"
	line "plato de"
	cont "MAMA<...>"

	para "¡CARNE VOLCANO!"
	done

SinkText:
	text "El fregadero esta"
	line "impecable. A mama"
	cont "le encanta lo"
	cont "limpio."
	done

FridgeText:
	text "Veamos que hay"
	line "en el frigo<...>"

	para "AGUA FRESCA"
	line "sabrosa LIMONADA."
	done

TVText:
	text "Hay una serie."
	line "TV: Llegare"

	para "a ser el mejor,"
	line "el mejor que<...>"

	para "habra jamas..."
	line "¡Se me ha puesto"
	cont "la piel de"
	cont "gallina."
	done

KrissHouse1F_MapEventHeader::

.Warps: db 3
	warp_def 7, 6, 2, VALENCIA_ISLAND
	warp_def 7, 7, 2, VALENCIA_ISLAND
	warp_def 0, 9, 1, KRISS_HOUSE_2F

.CoordEvents: db 0

.BGEvents: db 4
	signpost 1, 0, SIGNPOST_READ, StoveScript
	signpost 1, 1, SIGNPOST_READ, SinkScript
	signpost 1, 2, SIGNPOST_READ, FridgeScript
	signpost 1, 4, SIGNPOST_READ, TVScript

.ObjectEvents: db 1
	person_event SPRITE_MOM, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MotherScript, -1
