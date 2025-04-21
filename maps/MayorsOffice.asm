const_value = 1
	const MAYOR_OFFICE_RECEPTIONIST

MayorsOffice_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MayorReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	iftrue .ReceptionistLeaves
	writetext MayorReceptionistNoOneCanEnterText
	waitbutton
	closetext
	end
	
.ReceptionistLeaves:
	writetext MayorReceptionistLeavingText
	waitbutton
	closetext
	disappear MAYOR_OFFICE_RECEPTIONIST
	setevent EVENT_MAYORS_RECEPTIONIST_LEAVES
	special Special_FadeInQuickly
	end
	
MayorReceptionistNoOneCanEnterText:
	text "Um<...> Lo siento."
	
	para "Nadie puede entrar"
	line "aqui por ahora."
	cont "Por favor ven"
	cont "en otra ocasion."
	done
	
MayorReceptionistLeavingText:
	text "Um<...> Lo siento."
	
	para "<...> <...> <...>"
	
	para "¿Estas aqui para"
	line "detener al"
	cont "alcalde?"
	
	para "En ese caso<...>"
	line "Por favor, entra"
	cont "rapido. Si"
	cont "alguien pregunta,"
	cont "me venciste."
	done

MayorsOffice_MapEventHeader::

.Warps: db 3
	warp_def 7, 2, 12, TROVITOPOLIS
	warp_def 7, 3, 12, TROVITOPOLIS
	warp_def 0, 2, 1, MAYORS_OFFICE_MEETING_ROOM

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 1, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MayorReceptionistScript, EVENT_MAYORS_RECEPTIONIST_LEAVES

