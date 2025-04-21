const_value = 1
	const KUMQUAT_POOL_TRAINER_1
	const KUMQUAT_POOL_TRAINER_2
	const KUMQUAT_POOL_TRAINER_TRAD
	const KUMQUAT_POOL_TRAINER_4
	const KUMQUAT_POOL_KEY_TRAINER_MARINA

KumquatHotelPool_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

SwimmerMarinaScript:
	faceplayer
	opentext
	checkevent EVENT_POOL_MASTER_DEFEATED
	iftrue .BeatPoolMaster
	writetext SwimmerMarinaText1
	waitbutton
	winlosstext MarinaWinLoss, 0
	setlasttalked KUMQUAT_POOL_KEY_TRAINER_MARINA
	loadtrainer SWIMMERF, 8
	startbattle
	reloadmapafterbattle
	opentext
	writetext SwimmerMarinaText2
	waitbutton
	playsound SFX_1ST_PLACE
	writetext GotCardKeyPoolText
	waitbutton
	closetext
	setevent EVENT_POOL_MASTER_DEFEATED
	end
	
.BeatPoolMaster:
	writetext AlreadyBeatMarinaText
	waitbutton
	closetext
	end
	
GotCardKeyPoolText:
	text "Obtuviste la"
	line "TARJ.LLAVE NVL1."
	
	para "Puedes usar el"
	line "ascensor del"
	cont " lobby."
	done
	
MarinaWinLoss:
	text "¡Crikey!"
	done
	
AlreadyBeatMarinaText:
	text "Encontre mi GOLDUCK"
	line "en ISLA KINNOW."
	cont "Es mi mejor amigo"
	cont "desde entonces."
	done
	
SwimmerMarinaText1:
	text "¡Nyahah!Soy MARINA"
	line "del KUMQUAT GIM!"
	cont "Puedes llamarme"
	cont "la MAESTRA DE LA"
	cont "PISCINA."
	
	para "Si me vences"
	line "te dare la"
	cont "TARJ.LLAVE para"
	cont "pisos superiores."
	done
	
SwimmerMarinaText2:
	text "¡Crikey! Bien"
	line "hecho,toma tu"
	cont "premio."
	done
	
CooltrainerMTradScript:
	trainer EVENT_BEAT_COOLTRAINER_M_TRAD, COOLTRAINERM, TRAD, CooltrainerMTradSeenText, CooltrainerMTradBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMTradAfterText
	waitbutton
	closetext
	end

CooltrainerMTradSeenText:
	text "MARINA es"
	line "demasiado buena"
	cont "para ti."
	done

CooltrainerMTradBeatenText:
	text "Y tu para mi..."
	done

CooltrainerMTradAfterText:
	text "Aunque ganes a"
	line "MARINA, hay muchos"
	cont "contrincantes mas"
	cont "en el hotel."
	done
	
CooltrainerFMaryScript:
	trainer EVENT_BEAT_COOLTRAINERF_MARY, COOLTRAINERF, MARY, CooltrainerFMarySeenText, CooltrainerFMaryBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerFMaryAfterText
	waitbutton
	closetext
	end

CooltrainerFMarySeenText:
	text "Entrenar bajo"
	line "el mando de LUANA"
	cont "saca de mis #MON"
	cont "lo mejor."
	done

CooltrainerFMaryBeatenText:
	text "El entrenamiento"
	line "nunca acaba."
	done

CooltrainerFMaryAfterText:
	text "¡Tenemos un duro"
	line "trabajo por"
	cont "delante."
	done
	
OtakuDocScript:
	trainer EVENT_BEAT_OTAKU_DOC, OTAKU, DOC, OtakuDocSeenText, OtakuDocBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuDocAfterText
	waitbutton
	closetext
	end

OtakuDocSeenText:
	text "Estoy en la"
	line "cima de mi"
	cont "carrera."
	
	para "Preparate para"
	line "caer."
	done

OtakuDocBeatenText:
	text "¡Maestra SHEILA!"
	done

OtakuDocAfterText:
	text "¿No significa"
	line "nada todo mi"
	cont "esfuerzo?"
	done
	
LassRileyScript:
	trainer EVENT_BEAT_LASS_RILEY, LASS, RILEY, LassRileySeenText, LassRileyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassRileyAfterText
	waitbutton
	closetext
	end

LassRileySeenText:
	text "¡La ternuna lo"
	line "es todo!¡Siente"
	cont "mi ira cuqui!"
	done

LassRileyBeatenText:
	text "¡Kyaa!¡Mis bebes!"
	done

LassRileyAfterText:
	text "Te vas a mi"
	line "lista negra,"
	cont "tio rudo..."
	done

;EVENT_POOL_MASTER_DEFEATED

KumquatHotelPool_MapEventHeader::

.Warps: db 2
	warp_def 15, 9, 3, KUMQUAT_HOTEL_LOBBY
	warp_def 15, 10, 3, KUMQUAT_HOTEL_LOBBY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_F,  5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, CooltrainerFMaryScript, -1
	person_event SPRITE_LASS,  9,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, LassRileyScript, -1
	person_event SPRITE_COOLTRAINER_M,  5,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, CooltrainerMTradScript, -1
	person_event SPRITE_FISHER,  9, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TRAINER, 2, OtakuDocScript, -1
	person_event SPRITE_SWIMMER_GIRL,  8,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SwimmerMarinaScript, -1
