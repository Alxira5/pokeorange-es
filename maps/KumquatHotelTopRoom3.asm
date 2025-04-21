KumquatHotelTopRoom3_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteLarsScript:
	trainer EVENT_BEAT_ATHLETE_LARS, ATHLETE, LARS, AthleteLarsSeenText, AthleteLarsBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteLarsAfterText
	waitbutton
	closetext
	end

AthleteLarsSeenText:
	text "¿Quien es nuestro"
	line "manger?"
	cont "¡Te lo dire si"
	cont "me vences."
	done

AthleteLarsBeatenText:
	text "¡Te lo contare!"
	done

AthleteLarsAfterText:
	text "Nuestro manager"
	line "es SHELDON."
	done

KumquatHotelTopRoom3_MapEventHeader::

.Warps: db 2
	warp_def  5,  1, 2, KUMQUAT_HOTEL_SUITES
	warp_def  5,  2, 2, KUMQUAT_HOTEL_SUITES

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  2,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, AthleteLarsScript, -1
