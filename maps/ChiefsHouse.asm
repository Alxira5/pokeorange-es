const_value = 1

ChiefsHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

ShamoutiChiefScript:
	faceplayer
	opentext
	checkevent EVENT_SHAMOUTI_QUEST_STARTED
	iftrue .AcceptedShamoutiQuest
	writetext ShamoutiChiefText1
	waitbutton
	closetext
	setevent EVENT_SHAMOUTI_QUEST_STARTED
	special FadeOutPalettes
	warp AIRSHIP_CUTSCENE, 5, 21
	end
	
.AcceptedShamoutiQuest
	checkevent EVENT_LUGIA_FOUGHT
	iftrue .RockClimbScript
	writetext ShamoutiChiefText2
	waitbutton
	closetext
	end
	
.RockClimbScript
	checkevent EVENT_RECEIVED_ROCK_CLIMB
	iftrue .AlreadyGotRockClimb
	writetext ShamoutiChiefText3
	waitbutton
	verbosegiveitem HM_ROCK_CLIMB
	waitbutton
	writetext ShamoutiChiefText4
	waitbutton
	closetext
	setevent EVENT_RECEIVED_ROCK_CLIMB
	end
	
.AlreadyGotRockClimb
	writetext ShamoutiChiefText4
	waitbutton
	closetext
	end

ShamoutiChiefText2:
	text "Si quieres mas"
	line "detalles,por favor"
	cont "a mi casa,justo"
	cont "detras de este"
	cont "edificio.Mi"
	cont "nieta te dira"
	cont "el resto."
	
	para "Le dire al"
	line "GUARDIAN en la"
	cont "playa que te "
	cont "deje cruzar."
	done

ShamoutiChiefText1:
	text "CHIEF:¿Ah, eres"
	line "un turista?"
	
	para "<...>"
	
	para "CHIEF: Asi que"
	line "te llamas <PLAYER>,"
	cont "y eres el actual"
	cont "CAMPEON"
	
	para "del ORANGE"
	line "CREW."
	
	para "¡Que maravillosa"
	line "coincidencia!"
	cont "Veras,cada"
	cont "año celebramos"
	
	para "un festival en "
	line "honor a los "
	cont "guardianes, los"
	cont "dioses del fuego"
	cont "rayo,hielo y"
	cont "del mar."
	
	para "Ellos nos,"
	line "protegen, al"
	cont "mundo entero"
	
	para "Cuentan las"
	line "leyendas que si"
	cont "los dioses son"
	cont "molestados, solo"
	cont "un gran entrenador"
	cont "podra devolver"
	cont "el equilibrio al"
	cont "mundo."
	
	para "Normalmente no"
	line "dejariamos formar"
	cont "parte al primer "
	cont "entrenador que"
	cont "que veamos, pero"
	cont "eres un campeon y"
	cont "hay señales de"
	cont "un castillo volador"
	cont "en los cielos."
	
	para "Estoy preocupado"
	line "por los dioses"
	cont "guadianes."
	cont "Por favor, ¡mira "
	cont "esto, CAMPEON!"
	
	para "Si quieres mas"
	line "detalles,ve "
	cont "a la casa justo"
	cont "detras de este"
	cont "edificio.Mi"
	cont "nieta hara"
	cont "el resto."
	
	para "Hare que el"
	line "GUARDIAN en la "
	cont "playa sepa que"
	cont "cruzas."
	done

ShamoutiChiefText3:
	text "No puedo "
	line "agradecerte lo"
	cont "suficiente"
	cont "PLAYER>!"
	
	para "La profecia se"
	line "ha cumplido,asi"
	cont "que perfecto."
	
	para "Por supuesto,"
	line "toma una "
	cont "recompensa por"
	cont "las molestias."
	done

ShamoutiChiefText4:
	text "Esta MO te"
	line "permitira "
	cont "trepar muros."
	
	para "No todos,pero"
	line "podras sacarle"
	cont "partido."
	done


ChiefSage1Script:
	jumptext ChiefSage1Text
	
ChiefSage1Text:
	text "<...>Y ella"
	line "'dijo, no pero"
	cont "tengo KRABBYS"
	cont "jajaja."
	done
	
ChiefSage2Script:
	jumptext ChiefSage2Text
	
ChiefSage2Text:
	text "Jajja<...>"
	line "KRABBYS<...>"
	done

ChiefsHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $1, 4, SHAMOUTI_ISLAND
	warp_def $7, $2, 4, SHAMOUTI_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 3
	person_event SPRITE_GRAMPS,  4, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShamoutiChiefScript, -1
	person_event SPRITE_SAGE,  3,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ChiefSage1Script, -1
	person_event SPRITE_SAGE,  4,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ChiefSage2Script, -1
