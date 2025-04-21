const_value = 1
	const KUMQUAT_SUITES_SHELDON

KumquatHotelSuites_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteSheldonScript:
	faceplayer
	checkevent EVENT_SUITE_MASTER_DEFEATED
	iftrue .BeatSuiteMaster
	checkevent EVENT_BEAT_ATHLETE_BARNEY
	iftrue .TrainerCheck1
	opentext
	writetext SheldonNotReadyText
	waitbutton
	closetext
	end
	
.BeatSuiteMaster:
	opentext
	writetext AlreadyBeatSheldonText
	waitbutton
	closetext
	end
	
.TrainerCheck1:
	checkevent EVENT_BEAT_ATHLETE_BRUCE
	iftrue .TrainerCheck2
	opentext
	writetext SheldonNotReadyText
	waitbutton
	closetext
	end
	
.TrainerCheck2
	checkevent EVENT_BEAT_ATHLETE_LARS
	iftrue .TrainerCheck3
	opentext
	writetext SheldonNotReadyText
	waitbutton
	closetext
	end

.TrainerCheck3
	checkevent EVENT_BEAT_ATHLETE_ED
	iftrue .FightSheldon
	opentext
	writetext SheldonNotReadyText
	waitbutton
	closetext
	end
	
.FightSheldon
	opentext
	checkevent EVENT_SUITE_MASTER_DEFEATED
	iftrue .BeatSuiteMaster
	writetext AthleteSheldonText1
	waitbutton
	winlosstext SheldonWinLoss, 0
	setlasttalked KUMQUAT_SUITES_SHELDON
	loadtrainer ATHLETE, 7
	startbattle
	reloadmapafterbattle
	opentext
	writetext AthleteSheldonText2
	waitbutton
	playsound SFX_1ST_PLACE
	writetext GotCardKeySuiteText
	waitbutton
	closetext
	setevent EVENT_SUITE_MASTER_DEFEATED
	end
	
SheldonNotReadyText:
	text "Bienvenido a las"
	line "SUITES. Debes"
	cont "entrar en las"
	cont "habitaciones hasta"
	
	para "dar con la"
	line "TARJ.LLAVE."
	done
	
GotCardKeySuiteText:
	text "Conseguiste la"
	line "TARJ.LLAVE NVL 2."
	
	para "La TARJ.LLAVE"
	line "te abrira"
	cont "la planta mas"
	cont "alta."
	done
	
SheldonWinLoss:
	text "¡Brillante!"
	done
	
AlreadyBeatSheldonText:
	text "He estado "
	line "trabajando para"
	cont "LUANA mucho"
	cont "tiempo.Creo que"
	
	para "te ha cogido"
	line "cariño."
	done
	
AthleteSheldonText1:
	text "¿Quien lo "
	line "hubiera dicho?"
	
	para "¡Correcto!"
	line "Soy el Maestro"
	cont "de las SUITES:"
    cont "SHELDON!"
	
	para "Si quieres la"
	line "TARJ. LLAVE,"
	cont "¡Tendras que"
	cont "vencerme!"
	done
	
AthleteSheldonText2:
	text "Esplendido."
	
	para "Toma la TARJ.LLAVE"
	line "LUANA te esta"
	cont "esperando."
	done

KumquatHotelSuites_MapEventHeader::

.Warps: db 5
	warp_def  0,  5, 1, KUMQUAT_HOTEL_TOP_ROOM_2
	warp_def  0,  9, 1, KUMQUAT_HOTEL_TOP_ROOM_3
	warp_def  0, 13, 1, KUMQUAT_HOTEL_ELEVATOR
	warp_def  4,  5, 1, KUMQUAT_HOTEL_BOTTOM_ROOM_2
	warp_def  4,  9, 1, KUMQUAT_HOTEL_BOTTOM_ROOM_3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  1, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AthleteSheldonScript, -1
