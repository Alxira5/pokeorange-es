const_value = 1
	const CRYSTAL_CAVE_1F_BROCK
	const CRYSTAL_CAVE_1F_ITEM1
	const CRYSTAL_CAVE_1F_ITEM2

CrystalCave1F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

CrystalCave1FBrockScript:
	faceplayer
	opentext
	writetext Brock1FText
	yesorno
	iftrue .Yes
	writetext BrockNoText
	waitbutton
	closetext
	end
.Yes:
	writetext BrockOkText
	waitbutton
	closetext
	applymovement CRYSTAL_CAVE_1F_BROCK, Brock_Movement
	disappear CRYSTAL_CAVE_1F_BROCK
	end

CrystalCave1FCarbos:
	itemball CARBOS

CrystalCave1FMysticWater:
	itemball MYSTIC_WATER

Brock1FText:
	text "Hola, por aqui"

	para "Soy BROCK,"
	line "de CIUDAD"
	cont "PLATEADA y"
	cont "lider del GIM #MON."

	para "Estoy buscando "
	line "al legendario"
	cont "ONIX DE CRISTAL."

	para "Puedes venir,"
	line "pero si lo haces"
	cont "probare tu valia"
	cont "en un combate."
	done

BrockNoText:
	text "¡Sin problema!"
    line "Hazme saber si"
    cont "cambias de"
	cont "opinion."
	done

BrockOkText:
	text "De acuerdo,"
	line "deberia estar"
	cont "mas profundo"
	cont "en la cueva."

	para "Aguanta el ritmo"
	line "si puedes."
	done

Brock_Movement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

CrystalCave1F_MapEventHeader::

.Warps: db 3
	warp_def 23, 13, 1, SUNBURST_ISLAND
	warp_def 3, 11, 1, CRYSTAL_CAVE_B1
	warp_def 29, 29, 1, ROUTE_55

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_BROCK, 20, 23, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CrystalCave1FBrockScript, EVENT_CRYSTAL_CAVE_1F_BROCK
	person_event SPRITE_POKE_BALL, 25, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CrystalCave1FCarbos, EVENT_CRYSTAL_CAVE_1F_CARBOS
	person_event SPRITE_POKE_BALL, 14, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CrystalCave1FMysticWater, EVENT_CRYSTAL_CAVE_1F_MYSTIC_WATER

