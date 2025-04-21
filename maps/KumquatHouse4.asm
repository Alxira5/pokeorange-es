const_value = 1
	const KUMQUAT_HOUSE_4_POKEFAN_F

KumquatHouse4_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KumquatPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_KUMQUAT_STARTER
	iftrue .AlreadyReceivedKumquatPokefanFGift
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftrue .ObtainKumquatCharmanderScript
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .ObtainKumquatBulbasaurScript	
	writetext KumquatSquirtleText
	yesorno
	iffalse .DeclinedFreeKumquatPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedKumquatSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 15, BLACKGLASSES
	special SpecialSquirtle
	setevent EVENT_RECEIVED_KUMQUAT_STARTER
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.ObtainKumquatBulbasaurScript:
	writetext KumquatBulbasaurText
	yesorno
	iffalse .DeclinedFreeKumquatPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedKumquatBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 15
	special SpecialBulbasaur
	setevent EVENT_RECEIVED_KUMQUAT_STARTER
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.ObtainKumquatCharmanderScript:
	writetext KumquatCharmanderText
	yesorno
	iffalse .DeclinedFreeKumquatPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedKumquatCharmanderText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 15
	special SpecialCharmander
	setevent EVENT_RECEIVED_KUMQUAT_STARTER
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.AlreadyReceivedKumquatPokefanFGift:
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.DeclinedFreeKumquatPokemon:
	writetext DeclinedFreeKumquatPokemonText
	waitbutton
	closetext
	end
	
.PartyFull:
	writetext KumquatPartyFullText
	waitbutton
	closetext
	end
	
KumquatPartyFullText:
	text "Tu equipo"
	line "#MON esta lleno."
	done
	
KumquatBulbasaurText:
	text "Por tu ropa"
	line "diria<...>"
	cont "¡Que eres de"
	cont "ISLA VALENCIA!."
	
	para "Vienes de muy"
	line "lejos."
	
	para "Veamos<...>"
	
	para "Empezo tu viaje"
	line "con el #MON"
	cont "SQUIRTLE!"
	
	para "¿Querrias un"
	line "BULBASAUR?"
	done
	
KumquatSquirtleText:
	text "Por tu ropa"
	line "diria<...>"
	cont "¡Que eres de"
	cont "ISLA VALENCIA!."
	
	para "Vienes de muy"
	line "lejos."
	
	para "Veamos<...>"
	
	para "Empezo tu viaje"
	line "con el #MON"
	cont "CHARMANDER."
	
	para "¿Querrias un"
	line " SQUIRTLE?"
	done
	
KumquatCharmanderText:
    text "Por tu ropa"
	line "diria<...>"
	cont "¡Que eres de"
	cont "ISLA VALENCIA!."
	
	para "Vienes de muy"
	line "lejos."
	
	para "Veamos<...>"
	
	para "Empezo tu viaje"
	line "con el #MON"
	cont "BULBASAUR."
	
	para "¿Querrias un"
	line " CHARMANDER?"
	done
	
DeclinedFreeKumquatPokemonText:
	text "Oh<...>Ok<...>"
	done

AlreadyReceivedKumquatPokefanFGiftText:
	text "¡Buena suerte!"
	done
	
PlayerReceivedKumquatBulbasaurText:
	text "<PLAYER> recibio"
	line "BULBASAUR!"
	done
	
PlayerReceivedKumquatCharmanderText:
	text "<PLAYER> recibio"
	line "CHARMANDER!"
	done

PlayerReceivedKumquatSquirtleText:
	text "<PLAYER> recibio"
	line "SQUIRTLE!"
	done

KumquatHouse4_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 3, KUMQUAT_ISLAND_WEST
	warp_def 7, 3, 3, KUMQUAT_ISLAND_WEST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatPokefanFScript, -1