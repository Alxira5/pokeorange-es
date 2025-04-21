const_value = 1
	const KINNOW_JACE
	const KINNOW_KURT
	const KINNOW_KAT
	const KINNOW_ALICE

KinnowShowboatInside_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowShowboatJace:
	faceplayer
	opentext
	writetext KinnowShowboatJaceText1
	waitbutton
	closetext
	winlosstext JaceWinLossText, 0
	loadtrainer JACE, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatJaceText2
	waitbutton
	closetext
	disappear KINNOW_JACE
	special Special_FadeInQuickly
	setevent EVENT_KINNOW_SHOWBOAT_JACE
	end
	
KinnowShowboatJaceText1:
	text "Ah,veo que"
	line "tienes la medalla"
	cont "OJO DE CORAL."
	
	para "Por orden de mi"
	line "maestro,"
	cont "combatamos."
	done
	
JaceWinLossText:
	text "Esplendido,ya"
	line "puedo irme a"
	cont "casa."
	done
	
KinnowShowboatJaceText2:
	text "Necesitaras la"
	line "medalla RUBI"
	cont "MARINO para"
	cont "avanzar."
	done
	
KinnowShowboatKurt:
	faceplayer
	opentext
	checkflag ENGINE_SEA_RUBY_BADGE
	iffalse .NoSeaRuby
	writetext KinnowShowboatKurtText1
	waitbutton
	closetext
	winlosstext KurtWinLossText, 0
	loadtrainer KURT, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatKurtText2
	waitbutton
	closetext
	disappear KINNOW_KURT
	special Special_FadeInQuickly
	setevent EVENT_KINNOW_SHOWBOAT_KURT
	end
	
.NoSeaRuby:
	writetext KinnowShowboatKurtText3
	waitbutton
	closetext
	end

KinnowShowboatKurtText1:
	text "Ah, veo que"
	line "tienes la medalla"
	cont "RUBI MARINO."
	
	para "Estamos"
	line "adiestrados para"
	cont "combatir contra"
	cont "ti."
	done
	
KurtWinLossText:
	text "Tenia la"
	line "esperanza de "
	cont "resistirte<...>"
	done
	
KinnowShowboatKurtText2:
	text "Tengo un acuerdo"
	line "para dejarte"
	cont "pasar si vienes"
	cont "con la medalla"
	cont "CONCHA ESPINA."
	done
	
KinnowShowboatKurtText3:
	text "Ah,no tienes la"
	line "medalla CONCHA"
	cont "ESPINA. Vuelve"
	cont "cuando la tengas."
	done

KinnowShowboatKat:
	faceplayer
	opentext
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iffalse .NoSpikeShell
	writetext KinnowShowboatKatText1
	waitbutton
	closetext
	winlosstext KatWinLossText, 0
	loadtrainer KAT, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatKatText2
	waitbutton
	closetext
	disappear KINNOW_KAT
	special Special_FadeInQuickly
	setevent EVENT_KINNOW_SHOWBOAT_KAT
	end

.NoSpikeShell:	
	writetext KinnowShowboatKatText3
	waitbutton
	closetext
	end
	
KinnowShowboatKatText1:
	text "¡Meow! Es la"
	line "medalla CONCHA"
	cont "ESPINA,"
	cont "¡Luchemos!."
	done
	
KatWinLossText:
	text "Era mucho mas"
	line "divertido cuando"
	cont "vivia en ISLA"
	cont "GOLDEN."
	done
	
KinnowShowboatKatText2:
	text "Meow. Vuelve"
	line "con la medalla"
	cont "ESTRELLA JADE"
	cont "para luchar con"
	cont "EL COMANDANTE."
	done
	
KinnowShowboatKatText3:
	text "Mu<...> No tienes"
	line "la medalla CONCHA"
	cont "¿Combatir?"
	cont "¡No podemos!"
	done
	
KinnowShowboatAlice:
	faceplayer
	opentext
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .NoJadeStar
	writetext KinnowShowboatAliceText1
	waitbutton
	closetext
	winlosstext AliceWinLossText, 0
	loadtrainer ALICE, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatAliceText2
	waitbutton
	closetext
	disappear KINNOW_ALICE
	special Special_FadeInQuickly
	setevent EVENT_KINNOW_SHOWBOAT_ALICE
	end
	
.NoJadeStar:
	writetext KinnowShowboatAliceText3
	waitbutton
	closetext
	end
	
KinnowShowboatAliceText1:
	text "No somos  "
	line "gente aqui<...>"
	cont "Tenemos ordenes"
	cont "de hacerte mas"
	
	para "fuerte."
	done
	
AliceWinLossText:
	text "¡Mision<...>"
	line "conseguida!"
	done
	
KinnowShowboatAliceText2:
	text "¿Nos veremos"
	line "otra vez?"
	done
	
KinnowShowboatAliceText3:
	text "Oh no, cari."
	line "¿Y la ESTRELLA"
	cont "DE JADE?."
	cont "Vuelve cuando"
	cont "la tengas."
	done
	
KinnowShowboatAnne:
	checkevent EVENT_KINNOW_SHOWBOAT_JACE
	iffalse .FrozenNPC
	faceplayer
	opentext
	writetext KinnowShowboatAnneText
	waitbutton
	closetext
	end
	
.FrozenNPC:
	opentext
	writetext FrozenNPCText
	waitbutton
	closetext
	end

KinnowShowboatRoger:
	checkevent EVENT_KINNOW_SHOWBOAT_KAT
	iffalse .FrozenNPC
	faceplayer
	opentext
	writetext KinnowShowboatRogerText
	waitbutton
	closetext
	end

.FrozenNPC:
	opentext
	writetext FrozenNPCText
	waitbutton
	closetext
	end

KinnowShowboatLen:
	checkevent EVENT_KINNOW_SHOWBOAT_KURT
	iffalse .FrozenNPC
	faceplayer
	opentext
	writetext KinnowShowboatLenText
	waitbutton
	closetext
	end

.FrozenNPC:
	opentext
	writetext FrozenNPCText
	waitbutton
	closetext
	end
	
FrozenNPCText:
	text "Parece como si"
	line "la tripulacion del"
	cont "SHOWBOAT"
	cont "estuvieran"
	cont "congelados en"
	
	para "el tiempo."
	done
	
KinnowShowboatAnneText:
	text "¿Que ha pasado?"
	line "Estaba listo"
	cont "para el show"
	cont "cuando yo<...>"
	
	para "¿Me he debilitado?"
	done
	
KinnowShowboatRogerText:
	text "Extraño<...>"
	line "Mi memoria esta"
	cont "en una bruma<...>"
	
	para "Gracias por estar"
	line "hablando con"
	cont "un viejo. Estoy"
	cont "listo para el"
	cont "siguiente show."
	done
	
KinnowShowboatLenText:
	text "Huh<...>¿Que"
	line "ha pasado? ¿Esta"
	cont "el show cancelado?"
	done
	
KinnowShowboatKay:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHINY_CHARM
	iftrue .GotShinyCharmAlready
	writetext ShowboatKayText
	waitbutton
	verbosegiveitem SHINY_CHARM
	setevent EVENT_GOT_SHINY_CHARM
	closetext
	end
	
.GotShinyCharmAlready:
	writetext ShowboatKayText2
	waitbutton
	closetext
	end
	
ShowboatKayText:
	text "Gracias por"
	line "echar a estos"
	cont "idiotas."
	
	para "Espero que esto"
	line "te ayude."
	done
	
ShowboatKayText2:
	text "Estos tipos"
	line "salieron de la"
	cont "nada despues de"
	cont "atracar."
	
	para "Es como si"
	line "estuvieramos"
	cont "congelados aqui."
	done

KinnowShowboatInside_MapEventHeader::

.Warps: db 7
	warp_def  3,  2, 3, KINNOW_SHOWBOAT
	warp_def  4,  6, 3, KINNOW_SHOWBOAT_INSIDE
	warp_def 18,  6, 2, KINNOW_SHOWBOAT_INSIDE
	warp_def 18,  0, 5, KINNOW_SHOWBOAT_INSIDE
	warp_def  4, 22, 4, KINNOW_SHOWBOAT_INSIDE
	warp_def  4, 34, 7, KINNOW_SHOWBOAT_INSIDE
	warp_def 18, 34, 6, KINNOW_SHOWBOAT_INSIDE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 8
	person_event SPRITE_YOUNGSTER,  5,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatJace, EVENT_KINNOW_SHOWBOAT_JACE
	person_event SPRITE_ROCKER, 19,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KinnowShowboatKurt, EVENT_KINNOW_SHOWBOAT_KURT
	person_event SPRITE_KAT,  5, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KinnowShowboatKat, EVENT_KINNOW_SHOWBOAT_KAT
	person_event SPRITE_LASS, 23, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KinnowShowboatAlice, EVENT_KINNOW_SHOWBOAT_ALICE
	person_event SPRITE_RECEPTIONIST,  5, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KinnowShowboatAnne, -1
	person_event SPRITE_LASS, 23, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatKay, -1
	person_event SPRITE_GENTLEMAN,  8, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatRoger, -1
	person_event SPRITE_SUPER_NERD, 23,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatLen, -1
