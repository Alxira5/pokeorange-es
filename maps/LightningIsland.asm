const_value = 1
	const LIGHTNING_ISLAND_ELECTIRIZER
	const LIGHTNING_ISLAND_SEASHELL
	const LIGHTNING_ISLAND_THUNDERSTONE
	const LIGHTNING_ISLAND_ZAPDOS

LightningIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

LightningIslandElectirizer:
	itemball ELECTIRIZER

LightningIslandThunderstone:
	itemball THUNDERSTONE
	
LightningIslandSeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundLightningIslandSeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	waitbutton
	closetext
	giveshells 1
	setevent EVENT_LIGHTNING_ISLAND_SEASHELL
	disappear LIGHTNING_ISLAND_SEASHELL
	end
	
.NoShellBox:
	writetext LightningIslandNoShellBox
	waitbutton
	closetext
	end
	
LightningIslandShrine:
	checkevent EVENT_OBTAINED_ELECTRIC_ORB
	iftrue .LawrenceCheck
	giveitem ELECTRIC_ORB
	opentext
	writetext ObtainedElectricOrbText
	playsound SFX_GET_BADGE
	waitsfx
	waitbutton
	closetext
	setevent EVENT_OBTAINED_ELECTRIC_ORB
	end
	
.LawrenceCheck:
	checkevent EVENT_LUGIA_FOUGHT
	iftrue .ZapdosCheck
	opentext
	writetext LightningIslandShrineText
	waitbutton
	closetext
	end
	
.ZapdosCheck:
	checkevent EVENT_ZAPDOS_FOUGHT
	iftrue .ZapdosAlreadyBattled
	special Special_FadeOutMusic
	pause 15
	cry ZAPDOS
	showemote EMOTE_SHOCK, PLAYER, 15
	clearevent EVENT_ZAPDOS_APPEARS
	appear LIGHTNING_ISLAND_ZAPDOS
	applymovement LIGHTNING_ISLAND_ZAPDOS, ZapdosLightningIslandMovement
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ZAPDOS, 65
	startbattle
	disappear LIGHTNING_ISLAND_ZAPDOS
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_ZAPDOS_FOUGHT
	setevent EVENT_ZAPDOS_APPEARS
	end
	
.ZapdosAlreadyBattled:
	opentext
	writetext LightningIslandShrineText
	waitbutton
	closetext
	end
	
ZapdosLightningIslandMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

ObtainedElectricOrbText:
	text "<PLAYER> obtuvo"
	line "el ORBE ELECTRICO."
	done

LightningIslandShrineText:
	text "El Santuario"
	line "chisporrotea"
	cont "electicidad,"
	cont "sera mejor no"
	cont "tocarlo por si"
	cont "acaso."
	done
	
LightningIslandNoShellBox:
    text "Una bonita concha"
    line "marina. Parece"
    cont "muy fragil para"
    cont "ser guardada en"
	cont "mi mochila."
    done
	
FoundLightningIslandSeashell:
	text "Encontraste una"
	line "rara concha"
	cont "marina."
	done

LightningIsland_MapEventHeader::

.Warps: db 2
	warp_def $5, $1f, 1, LIGHTNING_ISLAND_CAVE
	warp_def $b, $13, 2, LIGHTNING_ISLAND_CAVE
.CoordEvents: db 0

.BGEvents: db 1
	signpost  6, 36, SIGNPOST_READ, LightningIslandShrine

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 18, 49, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, LightningIslandElectirizer, EVENT_LIGHTNING_ISLAND_ELECTIRIZER
	person_event SPRITE_SEASHELL, 30, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LightningIslandSeashellScript, EVENT_LIGHTNING_ISLAND_SEASHELL
	person_event SPRITE_POKE_BALL,  8, 52, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, LightningIslandThunderstone, EVENT_LIGHTNING_ISLAND_THUNDERSTONE
	person_event SPRITE_ZAPDOS,  2, 36, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, 0, EVENT_ZAPDOS_APPEARS

