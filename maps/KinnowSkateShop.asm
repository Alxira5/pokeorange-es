KinnowSkateShop_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

SkateShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SKATEBOARD
	iftrue SkateboardObtainedAlready
	writetext DoYouWantOneText
	yesorno
	iffalse DontWantOne
	writetext HereYouGoText
	buttonsound
	waitsfx
	giveitem SKATEBOARD
	writetext PlayerGotSkateboardText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SKATEBOARD
SkateboardObtainedAlready:
	writetext AlreadyHaveASkateboardText
	waitbutton
	closetext
	end

DontWantOne:
	writetext NoThankYouText
	waitbutton
	closetext
	end

DoYouWantOneText:
	text "Chico, ¡Aqui!"

	para "¿Buscando"
	line "nuevas piezas?"
	cont "¿Nuevas ruedas?"

	para "<...><...>"

	para "¿No tienes un"
	line "SKATE? Bueno,"
	cont "¿Por que no me"
	cont "lo dijiste?."

	para "¿Quieres uno?"
	line "Yeah"
	done

HereYouGoText:
	text "¡Oh yeah!"

	para "Aqui tienes,chico"
	done

PlayerGotSkateboardText:
	text "<PLAYER> obtuvo"
	line "SKATE."
	done

AlreadyHaveASkateboardText:
	text "Luce genial,chico."

	para "Ya puedes lucirte"
	line "con el SKATE."
	done

NoThankYouText:
	text "No pasa nada."

	para "Vuelve si cambias"
	line "de opinion."
	done

KinnowSkateShop_MapEventHeader::

.Warps: db 2
	warp_def 7, 6, 7, KINNOW_ISLAND
	warp_def 7, 7, 7, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 2, 9, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SkateShopClerkScript, -1
