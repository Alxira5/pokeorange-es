const_value = 1
	const IVYSLAB_IVY
	const IVYSLAB_IVYS_AIDE
	const IVYSLAB_POKE_BALL1
	const IVYSLAB_POKE_BALL2
	const IVYSLAB_POKE_BALL3

IvysLab_MapScriptHeader:

.MapTriggers: db 1
	maptrigger .Trigger0

.MapCallbacks: db 1
	dbw MAPCALLBACK_OBJECTS, .Callback_MoveIvy

.Trigger0:
	priorityjump IvysLab_AutowalkUpToIvy
	end

.Callback_MoveIvy:
	checktriggers
	iftrue .Skip
	moveperson IVYSLAB_IVY, $1, $4
.Skip:
	return

IvysLab_AutowalkUpToIvy:
	applymovement PLAYER, IvysLab_WalkUpToIvyMovement
	showemote EMOTE_SHOCK, IVYSLAB_IVY, 15
	spriteface IVYSLAB_IVY, RIGHT
	opentext
	writetext IvyText_Intro
	waitbutton
	closetext
	applymovement IVYSLAB_IVY, IvysLab_IvyToDefaultPositionMovement1
	spriteface PLAYER, UP
	applymovement IVYSLAB_IVY, IvysLab_IvyToDefaultPositionMovement2
	spriteface PLAYER, RIGHT
	opentext
	writetext IvyText_ChooseAPokemon
	waitbutton
	dotrigger $1
	closetext
	end

LabTryToLeaveScript:
	spriteface IVYSLAB_IVY, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x78f70
	end

CharmanderPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue LookAtIvyPokeBallScript
	spriteface IVYSLAB_IVY, DOWN
	refreshscreen
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCharmanderText
	yesorno
	iffalse DidntChooseStarterScript
	disappear IVYSLAB_POKE_BALL1
	setevent EVENT_GOT_CHARMANDER_FROM_IVY
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 10, BERRY
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, IvyDirectionsScript
	applymovement PLAYER, AfterCharmanderMovement
	jump IvyDirectionsScript

SquirtlePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue LookAtIvyPokeBallScript
	spriteface IVYSLAB_IVY, DOWN
	refreshscreen
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeSquirtleText
	yesorno
	iffalse DidntChooseStarterScript
	disappear IVYSLAB_POKE_BALL2
	setevent EVENT_GOT_SQUIRTLE_FROM_IVY
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 10, BERRY
	closetext
	applymovement PLAYER, AfterSquirtleMovement
	jump IvyDirectionsScript

BulbasaurPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue LookAtIvyPokeBallScript
	spriteface IVYSLAB_IVY, DOWN
	refreshscreen
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeBulbasaurText
	yesorno
	iffalse DidntChooseStarterScript
	disappear IVYSLAB_POKE_BALL3
	setevent EVENT_GOT_BULBASAUR_FROM_IVY
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 10, BERRY
	closetext
	applymovement PLAYER, AfterBulbasaurMovement
	jump IvyDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

IvyDirectionsScript:
	spriteface PLAYER, UP
	opentext
	writetext IvyDirectionsText1
	waitbutton
	closetext
	spriteface IVYSLAB_IVY, LEFT
	opentext
	writetext IvyDirectionsText2
	waitbutton
	closetext
	spriteface IVYSLAB_IVY, DOWN
	opentext
	writetext IvyDirectionsText3
	waitbutton
	writetext PlayerGetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	waitbutton
	writetext IvyDescribesMrPokemonText
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_IVY
	dotrigger $5
	domaptrigger VALENCIA_ISLAND, $1
	end

ProfIvyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GS_BALL_FROM_TRACEY
	iftrue .GoOn
	writetext IvyDescribesMrPokemonText
	waitbutton
	closetext
	end

.GoOn:
	checkevent EVENT_SHOWED_GS_BALL_TO_IVY
	iftrue .FinalIvyText
	setevent EVENT_SHOWED_GS_BALL_TO_IVY
	writetext IvyAdventureText
	waitbutton
	closetext
	end

.FinalIvyText:
	writetext FinalIvyText
	waitbutton
	closetext
	end

LookAtIvyPokeBallScript:
	opentext
	writetext IvyPokeBallText
	waitbutton
	closetext
	end

IvysLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue .CanHeal
	writetext IvysLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext IvysLabHealingMachineText2
	yesorno
	iftrue IvysLabHealingMachine_HealParty
	closetext
	end

IvysLabHealingMachine_HealParty:
	special HealParty
	playmusic MUSIC_NONE
	writebyte 1 ; Machine is in Ivy's Lab
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

IvysLabWindow:
	jumptext IvysLabWindowText
	end

AideScript_WalkPotions1:
	applymovement IVYSLAB_IVYS_AIDE, AideWalksRight1
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement IVYSLAB_IVYS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotions2:
	applymovement IVYSLAB_IVYS_AIDE, AideWalksRight2
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement IVYSLAB_IVYS_AIDE, AideWalksLeft2
	end

AideScript_GivePotions:
	opentext
	writetext AideText_GiveYouPotions
	buttonsound
	itemtotext POKE_BALL, $1
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 10
	writetext AideText_ExplainBalls
	buttonsound
	itemnotify
	closetext
	dotrigger $2
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

IvysAideScript:
	faceplayer
	opentext
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

IvysLabTravelTip1:
	jumptext IvysLabTravelTip1Text

IvysLabTravelTip2:
	jumptext IvysLabTravelTip2Text

IvysLabTravelTip3:
	jumptext IvysLabTravelTip3Text

IvysLabTravelTip4:
	jumptext IvysLabTravelTip4Text

IvysLabTrashcan:
	jumptext IvysLabTrashcanText

IvysLabPC:
	jumptext IvysLabPCText

IvysLabBookshelf:
	jumpstd difficultbookshelf

IvysLab_WalkUpToIvyMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step_end

MovementData_0x78f70:
	step UP
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

IvysLab_IvyToDefaultPositionMovement1:
	step UP
	step_end

IvysLab_IvyToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCharmanderMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterSquirtleMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterBulbasaurMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

IvyAdventureText:
	text "<...><...>"

	para "IVY: Esto es<...>"

	para "<PLAYER>, esto"
	line "es un objeto"
	cont "importante."

	para "La GS BALL."
	line "Parece que no"
	cont "es posible"
	cont "abrirla.No sabemos"

	para "su proposito o"
	line "quien la ha hecho."
	cont "Dasela al PROF.OAK"
	cont "en PUEBLO PALETA."

	para "Parece que el no"
	line "lo sabe tampoco."

	para "Hay un hombre que"
	line "podria arrojar luz"
	cont "al asunto,."

	para "Su nombre es SAM."
	line "Es sobrino del"
	cont "PROF.OAK."

	para "Esta de visita"
	line "en ISLA HAMLIN."

	para "Ya que estas en"
	line "el archipielago"
	cont "naranja, te pido"

	para "que se la lleves,"
	line "por favor."

	para "Solo puedo contar"
	line "contigo."
	done

FinalIvyText:
	text "IVY: SAM OAK es"
	line "un profesor de"
	cont "region de ALOLA."
	
	para "SAM OAK"
	line "esta aqui para"
	cont "estudiar las "
	cont "formas"
	
	para "#MON unicas"
	line "en este"
	cont "ARCHIPELAGO."
	cont "Son distintas a"
	cont "las de KANTO."
	
	para "Muchos #MON"
	line "muestran signos"
	cont "iguales a los"
	cont "de ALOLA."
	
	para "Como profesor "
	line "me encantaria"
	cont "que los atrapes"
	cont "para poder"
	cont "estudiarlos."
	
	para "¡Buena suerte!"
	line "<PLAYER>!"
	done

IvyText_Intro:
	text "IVY: ¡<PLAYER>!"
	line "¡Estamos aqui!"

	para "Hoy es el dia"
	line "que empieza tu"
	cont "viaje #MON. "

	para "Como #MON"
	line "PROFESOR, te"
	cont "dare una cosa."

	para "Llamada"
	line "#DEX. Graba"
	cont "los datos de los"
	cont "#MON que veas.."

	para "Te voy a dar "
	line "un #MON"

	para "que he capturado"
	line "recientemente."
	done

IvyText_ChooseAPokemon:
	text "Quiero que "
	line "elijas uno de los"

	para "#MON de"
	line "estas  POKEBALLS."

	para "Sera tu primer"
	line "#MON y compi,"
	cont " <PLAYER>!"

	para "Vamos,¡Elige!"
	done

LabWhereGoingText:
	text "IVY: ¡Espera!"
	line "¿Que haces?"
	
	para "<...>"
	
	para "¿Quieres 1 min"
	line "para pensarlo?"
	done
	
LabGoForAWalkText:
	text "IVY: Hmm<...>"
	line "¿Po que no "
	cont "damos un paseo?"
	done

TakeCharmanderText:
	text "IVY: ¿Coges"
	line "a CHARMANDER,el"
	cont "#MON de fuego?"
	done

TakeSquirtleText:
	text "IVY: ¿Quieres a"
	line "SQUIRTLE, el"
	cont "#MON de agua?"
	done

TakeBulbasaurText:
	text "IVY: ¿Asi que"
	line "BULBASAUR, el"
	cont "#MON de planta?"
	done

DidntChooseStarterText:
	text "IVY: Piensalo"
	line "detenidamente."

	para "Tu compañero"
	line "sera clave."
	done

ChoseStarterText:
	text "IVY: Pienso"
	line "que es un gran"
	cont "#MON."
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

IvyDirectionsText1:
	text "Ve al  oeste de"
	line "VALENCIA para"
	cont "encontrar el"
	cont "puerto."

	para "Ahi puedes coger"
	line "un barco hacia "
	cont "ISLA TANGELO."
	done

IvyDirectionsText2:
	text "Si tu #MON esta"
	line "herido, deberias"

	para "curarlo con esta"
	line "maquina."

	para "Sientete libre"
	line "de usarla"
	cont "cuando quieras."
	done

IvyDirectionsText3:
	text "¡Una cosa mas!"
	line "<PLAYER>, aqui"
	cont "tienes tu #DEX"
	done

PlayerGetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

IvyDescribesMrPokemonText:
	text "¡Buena suerte,"
	line "<PLAYER>!"
	done

IvyPokeBallText:
	text "Contiene un"
	line "#MON capturado"
	cont "por la PROF.IVY."
	done

IvysLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

IvysLabHealingMachineText2:
	text "¿Quieres curar"
	line "tus #MON?"
	done

AideText_GiveYouPotions:
	text "HOPE: <PLAYER>!"

	para "Usala en tu"
	line "aventura #DEX."
	done

AideText_ExplainBalls:
	text "HOPE: Para "
	line "completar la #DEX"
	cont ",has de atrapar"
	cont "#MON."

	para "Lanza # BALLS"
	line "#MON salvajes"
	cont "para atraparlos."
	done

IvysLabWindowText:
	text "Ventana abierta."

	para "Una brisa "
	line "marina te."
	cont "recorre."
	done

IvysLabTravelTip1Text:
	text "<PLAYER> abrio"
	line "un libro."

	para "Travel Tip 1:"

	para "Pulsa START para"
	line "abrir el MENU."
	done

IvysLabTravelTip2Text:
	text "<PLAYER> abrio"
	line "un libro."

	para "Travel Tip 2:"

	para "Graba tu viaje"
	line "con GUARDAR."
	done

IvysLabTravelTip3Text:
	text "<PLAYER> abrio a"
	line "book."

	para "Travel Tip 3:"

	para "Abre tu bolsa"
	line "y pulsa SELECT"
	cont "para cambiar"
	cont "objetos."
	done

IvysLabTravelTip4Text:
	text "<PLAYER> abrio"
	line "un libro."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

IvysLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.IVY"
	cont "ate is in there<...>"
	done

IvysLabPCText:
	text "REGIONAL VARIETY"
	line "OF #MON"

	para "<...>It says on the"
	line "screen<...>"
	done

IvysLab_MapEventHeader::

.Warps: db 2
	warp_def 11, 4, 1, VALENCIA_ISLAND
	warp_def 11, 5, 1, VALENCIA_ISLAND

.CoordEvents: db 4
	xy_trigger 1, 6, 4, LabTryToLeaveScript
	xy_trigger 1, 6, 5, LabTryToLeaveScript
	xy_trigger 5, 8, 4, AideScript_WalkPotions1
	xy_trigger 5, 8, 5, AideScript_WalkPotions2

.BGEvents: db 16
	signpost 1, 2, SIGNPOST_READ, IvysLabHealingMachine
	signpost 0, 5, SIGNPOST_READ, IvysLabWindow
	signpost 1, 6, SIGNPOST_READ, IvysLabBookshelf
	signpost 1, 7, SIGNPOST_READ, IvysLabBookshelf
	signpost 1, 8, SIGNPOST_READ, IvysLabBookshelf
	signpost 1, 9, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 0, SIGNPOST_READ, IvysLabTravelTip1
	signpost 7, 1, SIGNPOST_READ, IvysLabTravelTip2
	signpost 7, 2, SIGNPOST_READ, IvysLabTravelTip3
	signpost 7, 3, SIGNPOST_READ, IvysLabTravelTip4
	signpost 7, 6, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 7, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 8, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 9, SIGNPOST_READ, IvysLabBookshelf
	signpost 3, 9, SIGNPOST_READ, IvysLabTrashcan
	signpost 5, 1, SIGNPOST_DOWN, IvysLabPC

.ObjectEvents: db 5
	person_event SPRITE_IVY, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, PAL_OW_PURPLE, ProfIvyScript, -1
	person_event SPRITE_SCIENTIST_F, 9, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, IvysAideScript, -1
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CharmanderPokeBallScript, EVENT_CHARMANDER_POKEBALL_IN_IVYS_LAB
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SquirtlePokeBallScript, EVENT_SQUIRTLE_POKEBALL_IN_IVYS_LAB
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BulbasaurPokeBallScript, EVENT_BULBASAUR_POKEBALL_IN_IVYS_LAB
