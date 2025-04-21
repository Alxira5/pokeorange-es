const_value = 1
	const MANDARINUNDERGROUND_ENGINEER1
	const MANDARINUNDERGROUND_ENGINEER2

MandarinUndergroundBF1_MapScriptHeader::

.MapTriggers: db 0

.MapCallbacks: db 0

; Engineer Take
TrainerEngineerTake:
	trainer EVENT_BEAT_ENGINEER_TAKE, ENGINEER, TAKE, EngineerTakeSeenText, EngineerTakeWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext EngineerTakeAfterText
	waitbutton
	closetext
	end
	
EngineerTakeSeenText:
	text "Hey,chaval.Este"
	line "sitio esta en"
	cont "construccion. No"
	cont "puedes estar por"
	cont "aqui."
	done
	
EngineerTakeWinText:
	text "¡Scram!"
	done
	
EngineerTakeAfterText:
	text "Estamos"
	line "construyendo una"
	cont "TORRE DE RADIO"
	cont "para los"
	cont "empleados de"
	cont "SILPH S.A"
	
	para "Recuerdame cuales"
	line "eran sus nombres."
	cont "¡Ah si! BOOF y"
	cont "CASSIDY!"
	done

; Engineer Mura
TrainerEngineerMura:
	trainer EVENT_BEAT_ENGINEER_MURA, ENGINEER, MURA, EngineerMuraSeenText, EngineerMuraWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext EngineerMuraAfterText
	waitbutton
	closetext
	end
	
EngineerMuraSeenText:
	text "Ahh, mira lo"
	line "que has hecho."
	
	para "Has pisado mi"
	line "interruptor."
	done
	
EngineerMuraWinText:
	text "Lo has doblado."
	done
	
EngineerMuraAfterText:
	text "Parece que"
	line "tendre que poner"
	cont "uno nuevo."
	done

MandarinUndergroundBF1_MapEventHeader::

.Warps: db 3
	warp_def 4, 3, 3, MANDARIN_UNDERGROUND_ENTRANCE
	warp_def 2, 11, 1, MANDARIN_UNDERGROUND_BF2
	warp_def 12, 6, 4, MANDARIN_UNDERGROUND_ENTRANCE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_SUPER_NERD, 7, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerEngineerTake, -1
	person_event SPRITE_SUPER_NERD, 1, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerEngineerMura, -1
