const_value = 1
	const CRYSTAL_CAVE_B1_BROCK
	const CRYSTAL_CAVE_B1_ITEM1
	const CRYSTAL_CAVE_B1_ONIX

CrystalCaveB1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

CrystalCaveB1BrockScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .BrockDefeated
    writetext CrystalCaveB2BrockText
	waitbutton
	closetext
	winlosstext BrockWinLoss, 0
	loadtrainer BROCK, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext BrockWonText
	waitbutton
	closetext
	setevent EVENT_BEAT_BROCK
	special HealParty
	end

.BrockDefeated:
	checkevent EVENT_CRYSTAL_ONIX_DEFEATED
	iftrue .BrockLeaving
	writetext BrockDefeatedText
	waitbutton
	closetext
	end

.BrockLeaving:
	writetext BrockStayingText
	waitbutton
	closetext
	special Special_FadeInQuickly
	disappear CRYSTAL_CAVE_B1_BROCK
	end

CrystalOnixScript:
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .BattleCrystalOnix
	writetext EarnTheRightText
	waitbutton
	closetext
	end

.BattleCrystalOnix:
	writetext CrystalOnixText
	pause 15
	cry ONIX
	closetext
	loadwildmon ONIX, 20
	writecode VAR_BATTLETYPE, BATTLETYPE_CRYSTAL_ONIX
	startbattle
	disappear CRYSTAL_CAVE_B1_ONIX
	reloadmapafterbattle
	end

CrystalCaveB1TMDragonTail:
	itemball TM_DRAGON_TAIL

CrystalOnixText:
	text "¡Grraaahr!"
	done

CrystalCaveB2BrockText:
	text "¡Lo lograste!"
	line "Me disculpo,¿cual"
	cont "es tu nombre?"

	para "<...><...><...><...>"

	para "Asi que te llamas"
	line "<PLAYER>."

	para "Bien, como"
	line "prometi esta"
	cont "es la lucha "
	cont "para desafiar al"
	cont "ONIX de CRISTAL"
	done

BrockWinLoss:
	text "Bien hecho,"
	line "<PLAYER>."
	done

BrockWonText:
	text "Fue una pelea"
	line "dificil, <PLAYER>."

	para "Has ganado el "
	line "derecho a desafiar"
	cont "al ONIX de CRISTAL"

	para "Eres un entrenador"
	line "muy talentoso."
	done

BrockDefeatedText:
	text "Has ganado el "
	line "derecho a desafiar"
	cont "al ONIX de CRISTAL"
	done

BrockStayingText:
	text "¡Sorprendente!"
	
	para "Has demostrado"
	line "una habilidad que"
	cont "solo he visto en"
	cont "dos entrenadores."
	
	para "Tengo varias"
	line "muestras, asi que"
	cont "es hora de volver"
	cont "a KANTO."
	
	para "Espero de verdad"
	line "volver a vernos."	
	done

EarnTheRightText:
	text "No mereces"
	line "toadvia desafiar"
	cont "al ONIX de"
	cont "CRISTAL."
	done

CrystalCaveB1_MapEventHeader::

.Warps: db 1
	warp_def 17, 7, 2, CRYSTAL_CAVE_1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_BROCK, 22, 19, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CrystalCaveB1BrockScript, EVENT_CRYSTAL_CAVE_B1_BROCK
	person_event SPRITE_POKE_BALL, 4, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CrystalCaveB1TMDragonTail, EVENT_CRYSTAL_CAVE_B1_TM_DRAGON_TAIL
	person_event SPRITE_ONIX, 19, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, CrystalOnixScript, EVENT_CRYSTAL_ONIX_DEFEATED
