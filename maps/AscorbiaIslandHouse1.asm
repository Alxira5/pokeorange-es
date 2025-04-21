const_value = 1
	const ASCORBIA_DITTO_GUY

AscorbiaIslandHouse1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AscorbiaDittoGuyScript:
	faceplayer
	opentext
	checkevent EVENT_ASCORBIA_GOT_METAL_POWDER
	iftrue .AlreadyGotMetalPowder	
	writetext AscorbiaDittoGuyText
	yesorno
	iffalse .SaidNo
	special Special_BillsGrandfather
	iffalse .SaidNo
	if_not_equal DITTO, .SaidNo
	writetext AscorbiaDittoGuyText4
	waitbutton
	verbosegiveitem METAL_POWDER
	iffalse AscorbiaDittoGuyDoneScript
	closetext
	setevent EVENT_ASCORBIA_GOT_METAL_POWDER
	end
	
.AlreadyGotMetalPowder
	writetext AscorbiaDittoGuyText2
	waitbutton
	closetext
	end
	
.SaidNo
	writetext AscorbiaDittoGuyText3
	waitbutton
	closetext
	end
	
AscorbiaDittoGuyDoneScript:
	closetext
	end

AscorbiaDittoGuyText:
	text "¡Me encanta "
	line "Ditto¡ ¡pero no"
	cont "tengo uno!"
	
	para "¿Podrias mostrarme"
	line "un DITTO?"
	done

AscorbiaDittoGuyText2:
	text "POLVO METALICO"
	line "dobla la "
	cont "DEFENSA de DITTO!"
	done

AscorbiaDittoGuyText3:
	text "¡Ah!¿No tienes"
	line "uno?"
	done
	
AscorbiaDittoGuyText4:
	text "¡Ese es!"
	line "¡Es tan bonito!"
	
	para "Muchas gracias por"
	line "enseñarme a DITTO"
	cont "Aqui tienes un"
	cont "Token en"
	cont "agradecimiento."
	done

AscorbiaIslandHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 5, ASCORBIA_ISLAND
	warp_def 7, 3, 5, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SUPER_NERD, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, AscorbiaDittoGuyScript, -1