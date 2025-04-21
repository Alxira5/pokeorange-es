const_value = 1
	const KUMQUAT_LOBBY_RECEPTIONIST
	const KUMQUAT_LOBBY_GYM_GUY
	const KUMQUAT_LOBBY_LUANA

KumquatHotelLobby_MapScriptHeader::

.MapTriggers: db 2
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks: db 0

.Trigger0:
	priorityjump .KumquatHotelLobbyLuanaScript
	end

.Trigger1:
	end
	
.KumquatHotelLobbyLuanaScript:
	applymovement PLAYER, KumquatHotelPlayerLuanaMovement1
	spriteface KUMQUAT_LOBBY_LUANA, DOWN
	showemote EMOTE_SHOCK, KUMQUAT_LOBBY_LUANA, 15
	pause 10
	opentext
	writetext KumquatHotelLobbyLuanaText1
	waitbutton
	closetext
	showemote EMOTE_QUESTION, PLAYER, 15
	opentext
	writetext KumquatHotelLobbyLuanaText2
	waitbutton
	closetext
	applymovement KUMQUAT_LOBBY_LUANA, KumquatHotelLobbyLuanaMovement2
	playsound SFX_EXIT_BUILDING
	disappear KUMQUAT_LOBBY_LUANA
	dotrigger $1
	waitsfx
	end

KumquatHotelLobbyLuanaText1:
	text "¡Mi bebe!"
	done

KumquatHotelLobbyLuanaText2:
	text "Oh, finalmente"
	line "estas en casa"
	cont "Mami te ha"
	cont "echado tanto"
	cont "de menos..."
	
	para "¡Ay,Dios!"
	line "Lo siento,"
	cont "Pensaba que eras"
	cont "mi niño."
	
	para "Soy LUANA de la"
	line "ORANGE CREW, y"
	cont "este es mi GIM."
	
	para "Si has venido a"
	line "a retarme antes"
	cont "desbes vencer a"
	cont "mis entrenadores"
	
	para "para alcanzar la"
	line "ultima planta."
	cont "¡Buena suerte!"
	cont "JAJAJAJA"
	done
	
	
KumquatHotelReceptionistScript:
	jumptextfaceplayer KumquatHotelReceptionistText
	
KumquatHotelReceptionistText:
	text "Bienvenido al"
	line "GIM DE KUMQUAT."
	
	para "Combates dobles"
	line "en un hotel de"
	cont "lujo, asi que"
	cont "disfrute de su"
	cont "estancia."
	done

KumquatGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUANA
	iftrue .KumquatGymGuyWinScript
	writetext KumquatGymGuyText
	waitbutton
	closetext
	end

.KumquatGymGuyWinScript:
	writetext KumquatGymGuyWinText
	waitbutton
	closetext
	end
	
KumquatGymGuyText:
	text "Hola,Campeon del"
	line "futuro."
	
	para "LUANA no usa"
	line "un tipo unico"
	cont "asi que"
	cont "deberias de"
    cont "llevar varios"
	cont "tipos."
	
	para "Sus ALAKAZAM y"
	line "MAROWAK son una"
	cont "combinacion"
	cont "poderosa."
	done
	
KumquatGymGuyWinText:
	text "Hola,Campeon del"
	line "futuro."
	
	para "Eres un grande,"
	line "buena suerte con"
	cont "con los combates"
	cont "en ISLA POMELO."
	done
	
KumquatHotelPlayerLuanaMovement1:
	step UP
	step UP
	step UP
	step_end
	
KumquatHotelLobbyLuanaMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

KumquatHotelLobby_MapEventHeader::

.Warps: db 4
	warp_def 9, 5, 1, KUMQUAT_ISLAND_EAST
	warp_def 9, 6, 1, KUMQUAT_ISLAND_EAST
	warp_def 0, 1, 1, KUMQUAT_HOTEL_POOL
	warp_def 0, 11, 1, KUMQUAT_HOTEL_ELEVATOR

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_RECEPTIONIST,  3,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatHotelReceptionistScript, -1
	person_event SPRITE_GYM_GUY,  1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatGymGuyScript, -1
	person_event SPRITE_LUANA,  5,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LUANA_HOTEL_LOBBY
