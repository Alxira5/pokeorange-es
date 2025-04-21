const_value = 1
	const KUMQUATWEST_BOATTOP
	const KUMQUATWEST_BOATBOTTOM
	const KUMQUATWEST_UMBRELLA1
	const KUMQUATWEST_UMBRELLA2
	const KUMQUATWEST_SAILOR1
	const KUMQUATWEST_SAILOR2
	const KUMQUATWEST_FISHER1
	const KUMQUATWEST_SIGHTSEER1
	const KUMQUATWEST_COOLTRAINER_F_1
	const KUMQUATWEST_COOLTRAINER_M_1
	const KUMQUATWEST_COOLTRAINER_F_2
	const KUMQUATWEST_SUPERNERD
	
KumquatIslandWest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KumquatWestUmbrellas:
	end
	
KumquatWestShamoutiSailor:
	faceplayer
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .ToShamouti
	opentext
	writetext KumquatWestShamoutiSailorText
	waitbutton
	closetext
	end
	
.ToShamouti
	opentext
	writetext KumquatWestShamoutiSailorText2
	yesorno
	iftrue .OffWeGo
	closetext
	end
	
.OffWeGo
	writetext KumquatWestShamoutiSailorText3
	waitbutton
	closetext
	warp SHAMOUTI_ISLAND, 13, 21
	end
	
KumquatWestShamoutiSailorText:
	text "Llevo un ferry a"
	line "ISLA SHAMOUTI"
	
	para "Por ahora el"
	line "mar esta muy"
	cont "bravo asi que"
	cont "tendras que"
	cont "esperar."
	done
	
KumquatWestShamoutiSailorText2:
	text "Justo a tiempo,"
	line "chico."
	
	para "Voy a zarpar a"
	line "a ISLA SHAMOUTI"
	cont "¿Quieres venir"
	cont "en mi barco?"
	done
	
KumquatWestShamoutiSailorText3:
	text "¡Nos vamos!"
	done
	
KumquatWestSailor:
	jumptextfaceplayer KumquatWestSailorText
	
KumquatWestSailorText:
	text "Acabo de venir"
	line "de CIUDAD CARMIN."
	
	para "Cuentame los"
	line "placeres de"
	cont "estas islas."
	done
	
KumquatWestFisher:
	faceplayer
	checkevent EVENT_GOT_COIN_CASE
	iftrue .AlreadyGotCoinCase
	opentext 
	writetext KumquatWestFisherText2
	waitbutton
	verbosegiveitem COIN_CASE
	closetext
	setevent EVENT_GOT_COIN_CASE
	end

.AlreadyGotCoinCase
	opentext
	writetext KumquatWestFisherText
	waitbutton
	closetext
	end
	
KumquatWestFisherText:
	text "Quizas tengas"
	line "mejor suerte."
	done
	
KumquatWestFisherText2:
	text "Perdi todo"
	line "mi dinero en"
	cont "el CASINO."
	
	para "No lo necesito"
	line "mas.TOMA"
	done
	
KumquatWestSightseer:
	jumptextfaceplayer KumquatWestSightseerText
	
KumquatWestSightseerText:
	text "¿Que quieres?"
	line "Estoy a remojo"
	cont "con el solecito."
	done
	
GameCornerSign:
	jumptext GameCornerSignText
	
GameCornerSignText:
	text "CASINO"
	
	para "Apuesta todo"
	line "para grandes"
	cont "premios."
	cont "En la vida"
	cont "real,la"
	cont "ludopatia es algo"
	cont "muy peligroso."
	done
	
KumquatWestSuperNerd:
	faceplayer
	opentext
	checkcoins 5000
	if_equal $2, .DontHaveCoinsforPPUP
	special Special_DisplayCoinCaseBalance
	writetext KumquatWestSuperNerdText2
	yesorno
	iftrue .WantPPUP
	writetext KumquatWestSuperNerdText3
	waitbutton
	closetext
	end
	
.DontHaveCoinsforPPUP:
	writetext KumquatWestSuperNerdText1
	waitbutton
	closetext
	end
	
.WantPPUP:
	playsound SFX_TRANSACTION
	waitsfx
	verbosegiveitem PP_UP
	writetext KumquatWestSuperNerdText4
	waitbutton
	closetext
	takecoins 5000
	end

KumquatWestSuperNerdText1:
	text "Sigh<...>"
	line "¿No ves que"
	cont "estoy buscando"
	cont "algo?"
	done
	
KumquatWestSuperNerdText2:
	text "¡Huelo fichas!"
	line "Por solo 5000"
	cont "te doy un "
	cont "precioso MAS PP."
	done
	
KumquatWestSuperNerdText3:
	text "Aw<...>"
	done
	
KumquatWestSuperNerdText4:
	text "¡Oh si!Las"
	line "fichas son"
	cont "lo mejor."
	done
	
KumquatWestCooltrainerF2:
	jumptextfaceplayer KumquatWestCooltrainerF2Text
	
KumquatWestCooltrainerF2Text:
	text "LUANA es la lider"
	line "de gimnasio de"
	cont "esta ciudad."
	
	para "Su ALAKAZAM da"
	line "muy fuerte."
	done

KumquatWestCooltrainerM:
	jumptextfaceplayer KumquatWestCooltrainerMText
	
KumquatWestCooltrainerMText:
	text "He oido que"
	line "el lider del"
	cont "ORANGE CREW"
	cont "tiene #MON"
	cont "dragon que son"
	cont "formidables."
	done

KumquatWestCooltrainerF1:
	jumptextfaceplayer KumquatWestCooltrainerF1Text
	
KumquatWestCooltrainerF1Text:
	text "<...>"
	
	para "Creo que mi"
	line "equipo esta muy"
	cont "balanceado."
	
	para "Todos mis amigos"
	line "fueron derrotados"
    cont "por LUANA."
	done

KumquatIslandWest_MapEventHeader::

.Warps: db 4
	warp_def 17, 12, 2, GAME_CORNER
	warp_def  3, 24, 1, KUMQUAT_HOUSE_3
	warp_def  5, 19, 1, KUMQUAT_HOUSE_4
	warp_def  9, 11, 1, KUMQUAT_MART

.CoordEvents: db 0

.BGEvents: db 1
	signpost 18, 14, SIGNPOST_READ, GameCornerSign


.ObjectEvents: db 12
	person_event SPRITE_SAILBOAT_TOP, 28, 12, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_SAILBOAT_BOTTOM, 28, 12, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 22, 22, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, PAL_OW_ROCK, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 22, 23, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, PAL_OW_ROCK, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_COOLTRAINER_F, 27, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KumquatWestShamoutiSailor, -1
	person_event SPRITE_SAILOR, 10, 17, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSailor, -1
	person_event SPRITE_FISHER, 4, 27, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KumquatWestFisher, -1
	person_event SPRITE_SIGHTSEER_F, 23, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, (1 << MORN) | (1 << DAY), PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSightseer, -1
	person_event SPRITE_COOLTRAINER_F, 11,  8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KumquatWestCooltrainerF1, -1
	person_event SPRITE_COOLTRAINER_M, 12, 22, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestCooltrainerM, -1
	person_event SPRITE_COOLTRAINER_F, 20,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatWestCooltrainerF2, -1
	person_event SPRITE_SUPER_NERD, 16, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, (1 << NITE), PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSuperNerd, -1


