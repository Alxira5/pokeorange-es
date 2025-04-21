const_value = 1
	const ASCORBIA_FAN_CLUB_PRESIDENT
	const ASCORBIA_FAN_CLUB_MEMBER_1
	const ASCORBIA_FAN_CLUB_MEMBER_2
	const ASCORBIA_FAN_CLUB_FEAROW
	const ASCORBIA_FAN_CLUB_MEMBER_3

AscorbiaIslandFanClub_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AscorbiaFanClubPresidentScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_19_FROM_FAN_CLUB
	iftrue .AlreadyGotTM19
	writetext AscorbiaFanClubPresidentText1
	yesorno
	iftrue .AscorbiaFanClubPresYes1
	writetext AscorbiaFanClubPresidentTextNo
	waitbutton
	closetext
	end
	
.AscorbiaFanClubPresYes1:
	writetext AscorbiaFanClubPresidentText2
	yesorno
	iftrue .AscorbiaFanClubPresYes2
	writetext AscorbiaFanClubPresidentTextNo
	waitbutton
	closetext
	end
	
.AscorbiaFanClubPresYes2:
	writetext AscorbiaFanClubPresidentText3
	yesorno
	iftrue .AscorbiaFanClubPresYes3
	writetext AscorbiaFanClubPresidentTextNo
	waitbutton
	closetext
	end
	
.AscorbiaFanClubPresYes3:
	writetext AscorbiaFanClubPresidentText4
	waitbutton
	verbosegiveitem TM_GIGA_DRAIN
	closetext
	setevent EVENT_GOT_TM_19_FROM_FAN_CLUB
	end
	
.AlreadyGotTM19:
	writetext AscorbiaFanClubPresidentText5
	waitbutton
	closetext
	end

AscorbiaFanClubPresidentText1:
	text "Hey there!"
	
	para "¿Conoces algo"
	line "sobre EXEGGUTOR?"
	
	para "¿No te encanta"
	line "lo largo que es"
	cont "su cuello?"
	done
	
AscorbiaFanClubPresidentText2:
	text "¡Oh,si! Es"
	line "magnifico."
	
	para "Ahora, cuentame"
	line "sobre la cuarta"
	cont "cabeza en la cola"
	
	para "¿No es bella?"
	done
	
AscorbiaFanClubPresidentText3:
	text "¿No es sufieciente?"
	
	para "Dime,"
	line "¿No te encanta"
	cont "el verde de sus"
	cont "hojas?"
	done
	
AscorbiaFanClubPresidentText4:
	text "Oh,¡tan verde!"
	
	para "Gracias por "
	line "estar hablando"
	cont "conmigo sobre"
	cont "EXEGGUTOR"
	
	para "Toma,un regalo"
	line "de un fan #MON "
	cont "a otro."
	done
	
AscorbiaFanClubPresidentTextNo:
	text "Oh,ya veo.Perdon"
	line "por molestarte."
	done
	
AscorbiaFanClubPresidentText5:
	text "Hola, otra vez"
	line "Espero que "
	cont "conozcas mas #MON."
	done
	
AscorbiaFanClubFearowScript:
	opentext
	writetext FearowText
	cry FEAROW
	waitbutton
	closetext
	end
	
FearowText:
	text "Fraaah!"
	done
	
AscorbiaFanClubRockerScript:
	jumptextfaceplayer AscorbiaFanClubRockerText
	
AscorbiaFanClubRockerText:
	text "FEAROW aprende"
	line "un poderoso mov."
	cont "volador llamado"
	cont "PICO TALADRO"
	done
	
AscorbiaFanClubFisherScript:
	jumptextfaceplayer AscorbiaFanClubFisherText
	
AscorbiaFanClubFisherText:
	text "¿Sabes algo"
	line "del CABLE LINK?"
	
	para "Ciertos #MON solo"
	line "evolucionan por,"
	cont "intercambio pero"
	cont "el CABLE LINK"
	cont "hace lo mismo"
	done
	
AscorbiaFanClubLassScript:
	jumptextfaceplayer AscorbiaFanClubLassText
	
AscorbiaFanClubLassText:
	text "¿Has oido algo"
	line "sobre la"
	cont " MASTER BALL?"
	
	para "Supuestamente "
	line "atrapa siempre"
	cont "a cualquier"
	cont "#MON."
	
	para "Si tuviera una,"
	line "la usaria en"
	cont "en algun raro"
	cont "#MON como FEAR-"
	cont "OW o TENTACRUEL."
	done

AscorbiaIslandFanClub_MapEventHeader::

.Warps: db 2
	warp_def 9, 15, 3, ASCORBIA_ISLAND
	warp_def 9, 16, 3, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_GENTLEMAN, 1, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubPresidentScript, -1
	person_event SPRITE_FISHER, 4, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubFisherScript, -1
	person_event SPRITE_ROCKER, 7, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubRockerScript, -1
	person_event SPRITE_FEAROW, 8, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, AscorbiaFanClubFearowScript, -1
	person_event SPRITE_LASS, 5, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubLassScript, -1

