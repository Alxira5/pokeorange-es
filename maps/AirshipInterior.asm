const_value = 1
	const AIRSHIP_INTERIOR_LAWRENCE
	const AIRSHIP_INTERIOR_ARTICUNO
	const AIRSHIP_INTERIOR_MOLTRES
	const AIRSHIP_INTERIOR_ZAPDOS
	const AIRSHIP_INTERIOR_CAPTURE_RING1

AirshipInterior_MapScriptHeader::

.Triggers: db 1

	dw .Trigger0, 0
	dw .Trigger1, 0

.Trigger0:
	priorityjump AirshipInteriorCutscene
.Trigger1:
	end

AirshipInteriorCutscene:
	checkevent EVENT_MELODY_SENDS_YOU_TO_SHRINE 
	iftrue .SecondEntryCutscene
	applymovement PLAYER, AirshipInteriorHidePersonMovement
	applymovement PLAYER, AirshipInteriorHidePersonMovement2
	opentext
	writetext LawrenceCutsceneMonologue
	waitbutton
	spriteface AIRSHIP_INTERIOR_LAWRENCE, DOWN
	writetext LawrenceCutsceneMonologue2
	waitbutton
	closetext
	special FadeOutPalettes
	warp CHIEFS_HOUSE, 11, 5
	end
	
.SecondEntryCutscene
	spriteface AIRSHIP_INTERIOR_LAWRENCE, LEFT
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, AIRSHIP_INTERIOR_LAWRENCE, 15
	opentext
	writetext LawrenceInteriorText1
	waitbutton
	closetext
	spriteface AIRSHIP_INTERIOR_LAWRENCE, DOWN
	disappear AIRSHIP_INTERIOR_CAPTURE_RING1
	playsound SFX_JUMP_OVER_LEDGE
	applymovement PLAYER, PlayerEscapesRingMovement
	appear AIRSHIP_INTERIOR_CAPTURE_RING1
	domaptrigger AIRSHIP_INTERIOR, $1
	end
	
LawrenceInteriorText1:
	text "LAWRENCE: ¡TU,"
	line "insipido gusano!"
	
	para "Bien, ¡esto"
	line "debería acabar"
	cont "de una vez!"
	
	para "Esto deberia "
	line "dar una gran"
	cont "bienvenida a"
	cont "Lugia"
	done

AirshipInteriorHidePersonMovement:
	hide_person
	step_end
AirshipInteriorHidePersonMovement2:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end
	
PlayerEscapesRingMovement:
	jump_step UP
	step_end
	
	
LawrenceCutsceneMonologue:
	text "Captura de MOLTRES"
	line "confirmada. Yendo"
	cont "hacia ISLA"
	cont "del trueno para"
	cont "el objetivo"
	cont "2: ZAPDOS."
	
	para "???: Pronto, el"
	line "ave legendaria"
	cont "#MON estara"
	cont "en la palma"
	
	para "de mi mano."
	done
	
LawrenceCutsceneMonologue2:
	text "???: Pronto"
	line "voy a conseguirte"
	cont ", LUGIA<...>"
	
	para "Hahahahaha<...>"
	
	para "una buena adicion"
	line "para mi colleccion,"
	cont "sin duda<...>"
	done
	
LawrenceInteriorScript:
	checkevent EVENT_BEAT_LAWRENCE
	iftrue .NeutralLawrence
	faceplayer
	winlosstext AirshipLawrenceWinLoss, 0
	loadtrainer LAWRENCE, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_CASTLE_ROUTE
	opentext
	writetext LawrenceDefeatedText1
	waitbutton
	closetext
	applymovement PLAYER, AirshipInsidePlayerMovement1
	pause 15
	cry ZAPDOS
	pause 15
	cry ARTICUNO
	pause 15
	cry MOLTRES
	disappear AIRSHIP_INTERIOR_ARTICUNO
	disappear AIRSHIP_INTERIOR_MOLTRES
	disappear AIRSHIP_INTERIOR_ZAPDOS
	special Special_FadeInQuickly
	applymovement PLAYER, AirshipInsideLawrenceMovement1
	spriteface AIRSHIP_INTERIOR_LAWRENCE, DOWN
	opentext
	writetext LawrenceDefeatedText2
	waitbutton
	closetext
	spriteface AIRSHIP_INTERIOR_LAWRENCE, UP
	setevent EVENT_BEAT_LAWRENCE
	setevent EVENT_AIRSHIP_BIRDS
	setevent EVENT_MOLTRES_ESCAPES_AIRSHIP
	clearevent EVENT_MELODY_AT_SHRINE
	end
	
.NeutralLawrence:
	faceplayer
	opentext
	writetext LawrenceDefeatedText3
	waitbutton
	closetext
	spriteface AIRSHIP_INTERIOR_LAWRENCE, UP
	end
	
AirshipInsidePlayerMovement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
AirshipInsideLawrenceMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
LawrenceDefeatedText1:
	text "LAWRENCE: <...>"
	
	para "Bien. Sistema."
	line "Suelta las "
	cont "capturas"
	cont "inmediatamente."
	
	para "Protocolo de "
	line "liberación "
	cont "iniciado"
	done
	
LawrenceDefeatedText2:
	text "Ganas por ahora,"
	line "entrenador, pero "
	cont "no pienses que"
	cont "es el final."
	
	para "<...>"
	
	para "LAWRENCE: <...>"
	line "¿Dices que las"
	cont "3 aves no son"
	cont "los tesoros de"
	cont "los que habla"
	cont "la leyenda?"
	
	para "<...>Y perturbarlos"
	line "puede causar la"
	cont "ruina al mundo"
	cont "entero<...>?"
	
	para "Ya veo.Puedes irte"
	line "ya."
	done
	
LawrenceDefeatedText3:
	text "LAWRENCE: Estaba"
	line "equivocado."
	cont "Por favor"
	cont "dejame solo."
	done
	
AirshipLawrenceWinLoss:
	text "¡Imposible!"
	
	para "¿Como puede"
	line "tu esperanza"
	cont "plantar cara"
	cont "a las leyendas?"
	done

AirshipInteriorCaptureRingScript:
	opentext
	writetext AirshipInteriorCaptureRingScriptText
	yesorno
	iftrue .WarpBackToShrine
	closetext
	end
	
.WarpBackToShrine
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp SHAMOUTI_SHRINE, 11, 15
	end
	
AirshipInteriorCaptureRingScriptText:
	text "¿Volver al"
	line "santuario?."
	done
	
ArticunoInteriorScript:
	opentext
	writetext BirdsInteriorScriptText
	cry ARTICUNO
	waitbutton
	closetext
	end

MoltresInteriorScript:
	opentext
	writetext BirdsInteriorScriptText
	cry MOLTRES
	waitbutton
	closetext
	end

ZapdosInteriorScript:
	opentext
	writetext BirdsInteriorScriptText
	cry ZAPDOS
	waitbutton
	closetext
	end

BirdsInteriorScriptText:	
	text "¡Gyaoo!"
	done

.Callbacks: db 0

AirshipInterior_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5	
	person_event SPRITE_LAWRENCE,  3, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LawrenceInteriorScript, -1
	person_event SPRITE_ARTICUNO, 10, 14, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ArticunoInteriorScript, EVENT_AIRSHIP_BIRDS
	person_event SPRITE_MOLTRES, 10, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, MoltresInteriorScript, EVENT_MOLTRES_ESCAPES_AIRSHIP
	person_event SPRITE_ZAPDOS, 10,  6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, ZapdosInteriorScript, EVENT_AIRSHIP_BIRDS
	person_event SPRITE_CAPTURE_RING,  6,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AirshipInteriorCaptureRingScript, EVENT_PLAYER_CAPTURE_RING
