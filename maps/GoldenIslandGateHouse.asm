const_value = 1
	const CAT_GUARD_GATEHOUSE1
	const CAT_GUARD_GATEHOUSE2

GoldenIslandGateHouse_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

CatManGatehouseScript1:
	jumptextfaceplayer CatGateHouseGuardText1

CatManGatehouseScript2:
	jumptextfaceplayer CatGateHouseGuardText2

CatGateHouseGuardText1:
	text "Esta es la ISLA"
	line "GOLDEN.Por favor"
	cont "disfruta de "
	cont "nuestra unica"
	cont "ciudad."
	done

CatGateHouseGuardText2:
	text "¡Nyaa! Este paso"
	line "lleva a RUTA 61."

	para "Ve al oeste para"
	line "Mandarina al sur"
	cont "este hacia"
	cont "ISLA MURCOTT."
	done

GoldenIslandGateHouse_MapEventHeader::

.Warps: db 8
	warp_def 4, 0, 5, GOLDEN_ISLAND
	warp_def 5, 0, 6, GOLDEN_ISLAND
	warp_def 4, 7, 3, ROUTE_60
	warp_def 5, 7, 4, ROUTE_60
	warp_def 12, 2, 7, GOLDEN_ISLAND
	warp_def 12, 3, 8, GOLDEN_ISLAND
	warp_def 19, 2, 1, ROUTE_61
	warp_def 19, 3, 1, ROUTE_61

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_CAT_MAN, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGatehouseScript1, -1
	person_event SPRITE_CAT_MAN, 14, 5, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGatehouseScript2, -1

