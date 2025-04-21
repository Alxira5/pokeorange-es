const_value = 1
	const KUMQUAT_UMBRELLA_LEFT_1
	const KUMQUAT_UMBRELLA_RIGHT_1
	const KUMQUAT_UMBRELLA_LEFT_2
	const KUMQUAT_UMBRELLA_RIGHT_2
	const KUMQUAT_EAST_SUPERNERD
	const KUMQUAT_EAST_COOLTRAINER_F
	const KUMQUAT_EAST_SIGHTSEER_F_1
	const KUMQUAT_EAST_SIGHTSEER_F_2
	const KUMQUAT_EAST_FISHER
	const KUMQUAT_EAST_COOLTRAINER_M

KumquatIslandEast_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KUMQUAT
	return

KumquatEastUmbrellaScript:
	end
	
KumquatEastSupernerd:
	jumptextfaceplayer KumquatEastSupernerdText
	
KumquatEastSupernerdText:
	text "Hay un casino"
	line "es esta ciudad."
	cont "Es genial."
	done
	
KumquatEastCooltrainerF:
	jumptext KumquatEastCooltrainerFText
	
KumquatEastCooltrainerFText:
	text "Ugh,¿Podrias"
	line "largarte?"
	
	para "Estoy tratando"
	line "de broncearme."
	done
	
KumquatEastSightseerF1:
	jumptextfaceplayer KumquatEastSightseerF1Text
	
KumquatEastSightseerF1Text:
	text "Estuve en el "
	line "hotel de LUANA"
	cont "del ORANGE CREW."
	
	para "¡Es muy lujoso!"
	done

KumquatEastSightseerF2:
	faceplayer
	opentext
	trade 4
	waitbutton
	closetext
	end

KumquatEastFisher:
	jumptextfaceplayer KumquatEastFisherText
	
KumquatEastFisherText:
	text "Hay un viejo"
	line "PROF. que "
	cont "estudia"
	cont "MAGIKARP."
	
	para "Dice que"
	line "le traigan los"
	cont "ejemplares mas"
	cont "grandes vistos"
	cont "nunca, pescados"
	cont "una CAÑA ESPECIAL."
	
	para "No tuve suerte"
	line "con mi CAÑA"
	cont "VIEJA<...>"
	done
	
KumquatEastCooltrainerM:
	faceplayer
	opentext
	checkevent EVENT_KUMQUAT_COOLTRAINER_DRAGON_FANG
	iftrue .AlreadyGotDragonFang
	writetext KumquatEastCooltrainerMText1
	waitbutton
	verbosegiveitem MAGMARIZER
	iffalse KumquatEastCooltrainerMDoneScript
	closetext
	setevent EVENT_KUMQUAT_COOLTRAINER_DRAGON_FANG
	end
	
.AlreadyGotDragonFang:
	writetext KumquatEastCooltrainerMText2
	waitbutton
	closetext
	end
	
KumquatEastCooltrainerMDoneScript:
	closetext
	end
	
KumquatEastCooltrainerMText1:
	text "Pareces fuerte."
	line "Necesito un"
	cont "descanso despues"
	cont "de las peleas"
	cont "del GIM."
	
	para "Toma."
	done
	
KumquatEastCooltrainerMText2:
	text "Parece que"
	line "MAGMAR puede"
	cont "aprovechar esto."
	done
	
KumquatIslandSign:
	jumptext KumquatIslandSignText
	
KumquatIslandSignText:
	text "ISLA KUMQUAT"
	
	para "Dazzling jewel of"
	line "the ORANGE ISLANDS"
	done

KumquatIslandEast_MapEventHeader::

.Warps: db 4
	warp_def 15, 2, 1, KUMQUAT_HOTEL_LOBBY
	warp_def  9,  7, 1, KUMQUAT_HOUSE_1
	warp_def 13,  9, 1, KUMQUAT_HOUSE_2
	warp_def 15, 15, 1, KUMQUAT_CENTER

.CoordEvents: db 0

.BGEvents: db 1
	signpost  7, 17, SIGNPOST_READ, KumquatIslandSign

.ObjectEvents: db 10
	person_event SPRITE_UMBRELLA, 24, 8, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 24, 9, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 22, 14, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 22, 15, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_SUPER_NERD,  9, 16, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KumquatEastSupernerd, -1
	person_event SPRITE_COOLTRAINER_F, 23, 16, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, (1 << MORN) | (1 << DAY), PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatEastCooltrainerF, -1
	person_event SPRITE_SIGHTSEER_F, 18,  6, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KumquatEastSightseerF1, -1
	person_event SPRITE_SIGHTSEER_F, 17, 19, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatEastSightseerF2, -1
	person_event SPRITE_FISHER, 27, 18, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatEastFisher, -1
	person_event SPRITE_COOLTRAINER_M, 12,  6, SPRITEMOVEDATA_WANDER, 2, 0, -1, (1 << NITE), PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatEastCooltrainerM, -1
