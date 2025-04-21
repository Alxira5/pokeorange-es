BattleText_PlayerPickedUpPayDayMoney: ; 0x80730
	text "<PLAYER> recogió"
	line "¥@"
	deciram wPayDayMoney, 3, 6
	text "!"
	prompt
; 0x80746

WildPokemonAppearedText: ; 0x80746
	text "¡Un @"
	text_from_ram EnemyMonNick
	text ""
	line "salvaje!"
	prompt
; 0x8075c

HookedPokemonAttackedText: ; 0x8075c
	text "¡El"
	line "@"
	text_from_ram EnemyMonNick
	text ""
	cont "encaramado ataco!"
	prompt
; 0x80778

PokemonFellFromTreeText: ; 0x80778
	text_from_ram EnemyMonNick
	text " ¡cayo"
	line "del arbol!"
	prompt
; 0x80793

WantsToBattleText:: ; 0x807a9
	text "<ENEMY>"
	line "quiere luchar.!"
	prompt
; 0x807bd

PluralWantToBattleText::
	text "<ENEMY>"
	line "quieren luchar!"
	prompt

BattleText_WildFled: ; 0x807bd
	text "Wild @"
	text_from_ram EnemyMonNick
	text ""
	line "fled!"
	prompt
; 0x807cf

BattleText_EnemyFled: ; 0x807cf
	text "Enemy @"
	text_from_ram EnemyMonNick
	text ""
	line "salvaje ha huido!"
	prompt
; 0x807e2

HurtByPoisonText: ; 0x807e2
	text "¡<USER>"
	line "es envenenado!"
	prompt
; 0x807f8

HurtByBurnText: ; 0x807f8
	text "¡<USER>'s"
	line "quemado!"
	prompt
; 0x8080e

LeechSeedSapsText: ; 0x8080e
	text "Las DRENADORAS "
	line "agotan a <USER>!"
	prompt
; 0x80822

HurtByCurseText: ; 0x80836
	text "¡<USER>'s"
	line "herido por"
	cont "MALDICIÓN!"
	prompt
; 0x8084d

SandstormHitsText: ; 0x8084d
	text "Tor. Arena hiere a"
	line "<USER>!"
	prompt
; 0x80864

HailHitsText:
	text "Granizo golpea a"
	line "<USER>!"
	prompt

PerishCountText: ; 0x80864
	text "<USER>'s"
	line "EL Contador de"
	cont "MUERTE es @"
	deciram wd265, 1, 1
	text "!"
	prompt
; 0x80880

BattleText_TargetRecoveredWithItem: ; 0x80880
	text "<TARGET>"
	line "se recupero con"
	cont "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x80899

BattleText_UserRecoveredPPUsing: ; 0x80899
	text "<USER>"
	line "recupero PP usando"
	cont "@"
	text_from_ram StringBuffer1
	text "."
	prompt
; 0x808b6

BattleText_TargetWasHitByFutureSight: ; 0x808b6
	text "¡<TARGET>"
	line "herido por"
	cont "premonición!"
	prompt
; 0x808d2

BattleText_SafeguardFaded: ; 0x808d2
	text "<USER>'s"
	line "VELO SAGRADO se"
	cont "desvanecio!"
	
	prompt
; 0x808e7

BattleText_PkmnLightScreenFell: ; 0x808e7
	text_from_ram StringBuffer1
	text " #MON's"
	line "Pantalla de luz"
	cont " ha caido!"
	prompt
; 0x80905

BattleText_PkmnReflectFaded: ; 0x80905
	text_from_ram StringBuffer1
	text " #MON's"
	line "REFLEJO ha caido!"
	prompt
; 0x8091f

BattleText_RainContinuesToFall: ; 0x8091f
	text "La lluvia continua"
	line "cayendo."
	prompt
; 0x80938

BattleText_TheSunlightIsStrong: ; 0x80938
	text "Hace mucho"
	line "sol."
	prompt
; 0x80951

BattleText_TheSandstormRages: ; 0x80951
	text "La TORMENTA de"
	line "ARENA arrecia."
	prompt
; 0x80967

BattleText_TheHailContinuesToFall:
	text "¡El granizo continua"
	line "cayendo!."
	prompt

BattleText_TheRainStopped: ; 0x80967
	text "Dejo de llover."
	prompt
; 0x8097a

BattleText_TheSunlightFaded: ; 0x8097a
	text "Se ha ido"
	line "el sol."
	prompt
; 0x8098f

BattleText_TheSandstormSubsided: ; 0x8098f
	text "La TORMENTA"
	line "de ARENA amaino."
	prompt
; 0x809a8

BattleText_TheHailStopped:
	text "El GRANIZO paro."
	prompt
; 0x809a8

BattleText_EnemyPkmnFainted: ; 0x809a8
	text "¡Enemy @"
	text_from_ram EnemyMonNick
	text ""
	line "debilitado!"
	prompt
; 0x809be

GotMoneyForWinningText:
	text "¡<PLAYER> gano ¥@"
	deciram wBattleReward, 3, 6
	text ""
	line "for winning!"
	prompt

BattleText_EnemyWasDefeated: ; 0x809da
	text "¡<ENEMY>"
	line "ha perdido!"
	prompt
; 0x809eb

BattleText_PluralEnemyWereDefeated:
	text "<ENEMY>"
	line "han perdido!"
	prompt

TiedAgainstText: ; 0x809eb
	text "Has empatado con"
	line "<ENEMY>!"
	prompt
; 0x809fc

BattleText_PkmnFainted: ; 0x80a75
	text_from_ram BattleMonNick
	text ""
	line "debilitado!"
	prompt
; 0x80a83

BattleText_UseNextMon: ; 0x80a83
	text "¿Usar siguiente #MON?"
	done
; 0x80a93

LostAgainstText: ; 0x80ab9
	text "¡Perdiste contra"
	line "<ENEMY>!"
	prompt
; 0x80aca

BattleText_EnemyIsAboutToUseWillPlayerChangePkmn: ; 0x80aca
	text "<ENEMY>"
	line "va a utilizar a"
	cont "@"
	text_from_ram EnemyMonNick
	text "."

	para "¿Quieres <PLAYER>"
	line "cambiar de #MON?"
	done
; 0x80af8

BattleText_PluralEnemyAreAboutToUseWillPlayerChangePkmn:
	text "<ENEMY>"
	line "van a utilizar a"
	cont "@"
	text_from_ram EnemyMonNick
	text "."

	para "¿Quieres <PLAYER>"
	line "cambiar de #MON?"
	done

BattleText_EnemySentOut: ; 0x80af8
	text "<ENEMY>"
	line "¡Envió a"
	cont "@"
	text_from_ram EnemyMonNick
	text "!"
	done
; 0x80b0b

BattleText_TheresNoWillToBattle: ; 0x80b0b
	text "¡No quiere"
	line "luchar!"
	prompt
; 0x80b26

BattleText_AnEGGCantBattle: ; 0x80b26
	text "¡Los huevos no"
	line "pueden luchar!"
	prompt
; 0x80b3b

BattleText_CantEscape2: ; 0x80b3b
	text "¡No puedes huir!"
	prompt
; 0x80b49

BattleText_TheresNoEscapeFromTrainerBattle: ; 0x80b49
	text "¡No puedes huir"
	line "de un combate"
	cont "con un entrenador!"
	prompt

BattleText_GotAwaySafely: ; 0x80b77
	text "¡Escapaste sin"
	line "problemas!"
	prompt

BattleText_UserFledUsingAStringBuffer1: ; 0x80b89
	text "¡<USER>"
	line "escapo usando "
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80ba0

BattleText_CantEscape: ; 0x80ba0
	text "¡No puedes huir!"
	prompt
; 0x80bae

BattleText_UserHurtBySpikes: ; 0x80bae
	text "¡<USER>'s"
	line "Herido por PÚAS!"
	prompt
; 0x80bc2

RecoveredUsingText: ; 0x80bc2
	text "¡<TARGET>"
	line "se recupero usando"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80bde

BattleText_UsersStringBuffer1Activated: ; 0x80bde
	text "<USER>'s"
	line "@"
	text_from_ram StringBuffer1
	text ""
	cont "activado!"
	prompt
; 0x80bf3

BattleText_ItemsCantBeUsedHere: ; 0x80bf3
	text "Los objetos "
	line "no pueden "
	cont "ser usados aqui."
	prompt
; 0x80c0d

BattleText_PkmnIsAlreadyOut: ; 0x80c0d
	text_from_ram BattleMonNick
	text ""
	line "ya esta luchando."
	prompt
; 0x80c22

BattleText_PkmnCantBeRecalled: ; 0x80c22
	text_from_ram BattleMonNick
	text "¡"
	line "No puede ser"
	cont "retirado"
	prompt
; 0x80c39

BattleText_TheresNoPPLeftForThisMove: ; 0x80c39
	text "¡No quedan PP"
	line "para este "
	cont "movimiento"
	prompt
; 0x80c5b

BattleText_TheMoveIsDisabled: ; 0x80c5b
	text "¡El MOVIMIENTO"
	line "esta DESACTIVADO!"
	prompt
; 0x80c72

BattleText_PkmnHasNoMovesLeft: ; 0x80c72
	text_from_ram BattleMonNick
	text ""
	line "¡No le quedan mas "
	cont "movimientos"
	done
; 0x80c8a

BattleText_TargetsEncoreEnded: ; 0x80c8a
	text "<TARGET>'s"
	line "OTRA VEZ se acabo!"
	prompt
; 0x80c9c

BattleText_StringBuffer1GrewToLevel: ; 0x80c9c
	text_from_ram StringBuffer1
	text " subio al"
	line "nivel @"
	deciram CurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	db "@@"
; 0x80cb9

FastAsleepText: ; 0x80ce7
	text "¡<USER>"
	line "esta dormido!"
	prompt
; 0x80cfa

WokeUpText: ; 0x80cfa
	text "¡<USER>"
	line "se desperto!"
	prompt
; 0x80d06

FrozenSolidText: ; 0x80d06
	text "¡<USER>"
	line "Esta congelado!"
	prompt
; 0x80d1a

FlinchedText: ; 0x80d1a
	text "¡<USER>"
	line "Retrocedio!"
	prompt
; 0x80d27

MustRechargeText: ; 0x80d27
	text "¡<USER>"
	line "debe recargarse!"
	prompt
; 0x80d39

DisabledNoMoreText: ; 0x80d39
	text "<USER>'s"
	line "activado de nuevo!"
	prompt
; 0x80d4f

IsConfusedText: ; 0x80d4f
	text "¡<USER>"
	line "esta confuso!"
	prompt
; 0x80d5f

HurtItselfText: ; 0x80d5f
	text "¡Tan confuso está"
	line "que se hiere a"
	cont "sí mismo!"
; 0x80d81

ConfusedNoMoreText: ; 0x80d81
	text "¡<USER>'s"
	line "no esta confuso!"
	prompt
; 0x80d97

BecameConfusedText: ; 0x80d97
	text "¡<TARGET>"
	line "Esta confuso!"
	prompt
; ItemHealedConfusion

BattleText_ItemHealedConfusion: ; ItemHealedConfusion
	text "A @"
	text_from_ram StringBuffer1
	text " curo a "
	line "<TARGET>"
	cont "de su confusión."
	prompt
; 0x80dcc

AlreadyConfusedText: ; 0x80dcc
	text "¡<TARGET>'s"
	line "ya esta confuso!"
	prompt
; 0x80de2

BattleText_UsersHurtByStringBuffer1: ; 0x80de2
	text "<USER>'s"
	line "herido por"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80df5

BattleText_UserWasReleasedFromStringBuffer1: ; 0x80df5
	text "<USER>"
	line "fue liberado de"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80e11

WhirlpoolTrapText: ; 0x80e24
	text "¡<TARGET>"
	line "fue atrapado!"
	prompt
; 0x80e34

FireSpinTrapText: ; 0x80e34
	text "¡<TARGET>"
	line "fue atrapado!"
	prompt
; 0x80e44

WrappedByText: ; 0x80e44
	text "<TARGET>"
	line "fue atrapado por"
	cont "<USER>!"
	prompt
; 0x80e59

ClampedByText: ; 0x80e59
	text "¡<TARGET>"
	line "fue ATENAZADO por"
	cont "<USER>!"
	prompt
; 0x80e6e

HungOnText: ; 0x80e99
	text "¡<TARGET>"
	line "resistio con"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x80eb0

EnduredText: ; 0x80eb0
	text "¡<TARGET>"
	line "aguanto el golpe!"
	prompt
; 0x80ec4

InLoveWithText: ; 0x80ec4
	text "¡<USER>"
	line "esta enamorado de"
	cont "<TARGET>!"
	prompt
; 0x80eda

InfatuationText: ; 0x80eda
	text "¡<USER>'s"
	line "enamoramiento de"
	cont "le impidió atacar!"
	prompt
; 0x80f02

DisabledMoveText: ; 0x80f02
	text "¡<USER>'s"
	line "@"
	text_from_ram StringBuffer1
	text " esta"
	cont "DESACTIVADO!"
	prompt
; 0x80f19

LoafingAroundText: ; 0x80f19
	text_from_ram BattleMonNick
	text " esta"
	line "ocioso."
	prompt
; 0x80f31

BeganToNapText: ; 0x80f31
	text_from_ram BattleMonNick
	text " ¡Se echo a"
	line "dormir!"
	prompt
; 0x80f44

WontObeyText: ; 0x80f44
	text_from_ram BattleMonNick
	text "¡No te "
	line "obedeció!"
	prompt
; 0x80f54

TurnedAwayText: ; 0x80f54
	text_from_ram BattleMonNick
	text " ¡ya no "
	line "te obedece!"
	prompt
; 0x80f66

IgnoredOrdersText: ; 0x80f66
	text_from_ram BattleMonNick
	text " ¡Desobedecio"
	line "ordenes!"
	prompt
; 0x80f7b

IgnoredSleepingText: ; 0x80f7b
	text "¡@"
	text_from_ram BattleMonNick
	line "desobedeció…!"
	cont "¡Está durmiendo!"
	prompt
; 0x80f99

NoPPLeftText: ; 0x80f99
	text "¡Pero no quedan PP"
	line "para el movim.!"
	prompt
; 0x80fba

HasNoPPLeftText: ; 0x80fba
	text "¡<USER>"
	line "carece de PP"
	cont "para @"
	text_from_ram StringBuffer2
	text "!"
	prompt
; 0x80fd7

WentToSleepText: ; 0x80fd7
	text "¡<USER>"
	line "se fue a dormir!"
	done
; 0x80fe9

RestedText: ; 0x80fe9
	text "¡<USER>"
	line "se quedó dormido y"
	cont "recuperó la salud!"
	done
; 0x8100c

RegainedHealthText: ; 0x8100c
	text "¡<USER>"
	line "recuperó la salud!"
	prompt
; 0x81020

AttackMissedText: ; 0x81020
	text "¡Falló ataque de"
	line "<USER>!"
	prompt
; 0x81033

AttackMissed2Text: ; 0x81033
	text "¡Falló ataque de"
	line "<USER>!"
	prompt
; 0x81046

CrashedText: ; 0x81046
	text "¡<USER>"
	line "continuó y se"
	cont "estrelló!"
	prompt
; 0x81061

UnaffectedText: ; 0x81061
	text "¡No afectó a"
	line "<TARGET>!"
	prompt
; 0x81071

DoesntAffectText: ; 0x81071
	text "¡No afecta a"
	line "<TARGET>!"
	prompt
; 0x81086

CriticalHitText: ; 0x81086
	text "¡Un golpe crítico!"
	prompt
; 0x81097

OneHitKOText: ; 0x81097
	text "¡K.O. en 1 golpe!"
	prompt
; 0x810aa

SuperEffectiveText: ; 0x810aa
	text "¡Es muy efectivo!"
	prompt
; 0x810c1

NotVeryEffectiveText: ; 0x810c1
	text "No es muy"
	line "efectivo…"
	prompt
; 0x810da

TookDownWithItText: ; 0x810da
	text "¡<TARGET>"
	line "acabó con"
	cont "<USER>!"
	prompt
; 0x810f3

RageBuildingText: ; 0x810f3
	text "¡La FURIA de"
	line "<USER>"
	cont "está creciendo!"
	prompt
; 0x81109

GotAnEncoreText: ; 0x81109
	text "¡<TARGET>"
	line "sufrió los efectos"
	cont "de OTRA VEZ!"
; 0x8111b

TookAimText: ; 0x81136
	text "¡<USER>"
	line "apunto!"
	prompt
; 0x81143

SketchedText: ; 0x81143
	text "¡<USER>"
	line "usó ESQUEMA en"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x81156

DestinyBondEffectText: ; 0x81156
	text "¡<USER>"
	line "intenta llevarse"
	cont "a su rival!"
	prompt
; 0x8117f

BellChimedText: ; 0x811a0
	text "¡Ha repicado"
	line "una campana!"
	prompt
; 0x811b1

FellAsleepText: ; 0x811b1
	text "¡<TARGET>"
	line "se durmió!"
	prompt
; 0x811c1

AlreadyAsleepText: ; 0x811c1
	text "¡<TARGET>"
	line "ya está dormido!"
	prompt
; 0x811d5

WasPoisonedText: ; 0x811d5
	text "¡<TARGET>"
	line "fue envenenado!"
	prompt
; 0x811e6

BadlyPoisonedText: ; 0x811e6
	text "¡<TARGET>"
	line "fue gravemente"
	cont "envenenado!"
	prompt
; 0x811fa

AlreadyPoisonedText: ; 0x811fa
	text "¡<TARGET>"
	line "está envenenado!"
	prompt
; 0x81210

SuckedHealthText: ; 0x81210
	text "¡Absorbió salud de"
	line "<TARGET>!"
	prompt
; 0x81227

DreamEatenText: ; 0x81227
	text "¡Se comió el"
	line "sueño de"
	cont "<TARGET>!"
	prompt
; 0x8123c

WasBurnedText: ; 0x8123c
	text "¡<TARGET>"
	line "se quemó!"
	prompt
; 0x8124b

DefrostedOpponentText: ; 0x8124b
	text "¡<TARGET>"
	line "fue descongelado!"
	prompt
; 0x8125d

WasFrozenText: ; 0x8125d
	text "¡<TARGET>"
	line "fue congelado!"
	prompt
; 0x81272

WontRiseAnymoreText: ; 0x81272
	text "¡@"
	text_from_ram StringBuffer2
	text " de"
	line "<USER>"
	cont "no subirá más!"
	prompt
; 0x8128f

WontDropAnymoreText: ; 0x8128f
	text "¡@"
	text_from_ram StringBuffer2
	text " de"
	line "<TARGET>"
	cont "no bajará más!"
	prompt
; 0x812ac

FledFromBattleText:: ; 0x812ac
	text "¡<USER>"
	line "huyó del combate!"
	prompt
; 0x812c1

FledInFearText: ; 0x812c1
	text "¡<TARGET>"
	line "huyó aterrorizado!"
	prompt
; 0x812d2

BlownAwayText: ; 0x812d2
	text "¡<TARGET>"
	line "fue arrastrado!"
	prompt
; 0x812e5

PlayerHitTimesText: ; 0x812e5
	text "Dañado @"
	deciram PlayerDamageTaken, 1, 1
	text " veces."
	prompt
; 0x812f8

EnemyHitTimesText: ; 0x812f8
	text "Dañado @"
	deciram PlayerDamageTaken, 1, 1
	text " veces."
	prompt
; 0x8130b

MistText: ; 0x8130b
	text "¡<USER>"
	line "está cubierto"
	cont "por una NEBLINA!"
	prompt
; 0x81321

ProtectedByMistText: ; 0x81321
	text "<TARGET>"
	line "está protegido"
	cont "por la NEBLINA."
	prompt
; 0x81338

GettingPumpedText: ; 0x81338
	interpret_data
	text "¡<USER>"
	line "se está inflando!"
	prompt
; 0x8134d

RecoilText: ; 0x8134d
	text "¡<USER>"
	line "es re-golpeado!"
	prompt
; 0x81362

MadeSubstituteText: ; 0x81362
	text "¡<USER>"
	line "creó un SUSTITUTO!"
	prompt
; 0x81378

HasSubstituteText: ; 0x81378
	text "¡<USER>"
	line "tiene SUSTITUTO!"
	prompt
; 0x8138d

TooWeakSubText: ; 0x8138d
	text "¡Demasiado débil"
	line "para crear un"
	cont "SUSTITUTO!"
	prompt
; 0x813ad

SubTookDamageText: ; 0x813ad
	text "The SUBSTITUTE"
	line "took damage for"
	cont "<TARGET>!"
	prompt
; 0x813d0

SubFadedText: ; 0x813d0
	text "¡Cayó el"
	line "SUSTITUTO de"
	cont "<TARGET>!"
	prompt
; 0x813e6

LearnedMoveText: ; 0x813e6
	text "¡<USER>"
	line "ha aprendido!"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x813f8

WasSeededText: ; 0x813f8
	text "¡<TARGET>"
	line "fue infectado!"
	prompt
; 0x81407

EvadedText: ; 0x81407
	text "¡<TARGET>"
	line "esquivó el ataque!"
	prompt
; 0x8141d

WasDisabledText: ; 0x8141d
	text "¡@"
	text_from_ram StringBuffer1
	text " de"
	line "<TARGET>"
	cont "fue desactivado!"
	prompt
; 0x81435

CoinsScatteredText: ; 0x81435
	text "¡Hay monedas por"
	line "todas partes!"
	prompt
; 0x81452

TransformedTypeText: ; 0x81452
	text "¡<USER>"
	line "se convirtió en el"
	cont "tipo @"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x81476

EliminatedStatsText: ; 0x81476
	text "¡Cambios en las"
	line "carac. eliminados!"
	prompt
; 0x81499

TransformedText: ; 0x81499
	text "¡<USER>"
	line "se TRANSFORMÓ en"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x814b4

LightScreenEffectText: ; 0x814b4
	text "¡Subió DEFENSA"
	line "ESPECIAL de"
	cont "<USER>!"
	prompt
; 0x814c7

ReflectEffectText: ; 0x814c7
	text "¡Subió DEFENSA de"
	line "<USER>!"
	prompt
; 0x814d9

NothingHappenedText: ; 0x814d9
	text "Pero no ha"
	line "pasado nada."
	prompt
; 0x814f0

ButItFailedText: ; 0x814f0
	text "¡Pero falló!"
	prompt
; 0x81500

ItFailedText: ; 0x81500
	text "¡Falló!"
	prompt
; 0x8150c

DidntAffect1Text: ; 0x8150c
	text "¡No afectó a"
	line "<TARGET>!"
	prompt
; 0x81520

DidntAffect2Text: ; 0x81520
	text "¡No afectó a"
	line "<TARGET>!"
	prompt
; 0x81534

HPIsFullText: ; 0x81534
	text "¡Los PS de"
	line "<USER>"
	cont "están al máximo!"
	prompt
; 0x81544

DraggedOutText: ; 0x81544
	text "¡<USER>"
	line "fue arrastrado!"
	prompt
; 0x81558

ParalyzedText: ; 0x81558
	text "¡<TARGET>"
	line "está paralizado!"
	cont "¡Quizá no ataque!"
	prompt
; 0x8157d

FullyParalyzedText: ; 0x8157d
	text "¡<USER>"
	line "está totalmente"
	cont "paralizado!"
	prompt
; 0x81592

AlreadyParalyzedText: ; 0x81592
	text "¡<TARGET>"
	line "ya está"
	cont "paralizado!"
	prompt
; 0x815a9

ProtectedByText: ; 0x815a9
	text "¡<TARGET>"
	line "está protegido por"
	cont "@"
	text_from_ram StringBuffer1
	text "!"
	prompt
; 0x815c1

MirrorMoveFailedText: ; 0x815c1
	text "¡El MOV. ESPEJO"
	next "ha fallado!"
	prompt
; 0x815da

StoleText: ; 0x815da
	text "¡<USER>"
	line "robó @"
	text_from_ram StringBuffer1
	text ""
	cont "a su rival!"
	prompt
; 0x815f7

EatBerryText:
	text "<USER>"
	line "comio @"
	text_from_ram StringBuffer1
	text ""
	cont "de su objetivo"
	prompt

CantEscapeNowText: ; 0x815f7
	text "¡<TARGET>"
	line "no puede escapar!"
	prompt
; 0x8160b

WasDefrostedText: ; 0x8162b
	text "¡<USER>"
	line "fue descongelado!"
	prompt
; 0x8163d

PutACurseText: ; 0x8163d
	text "¡<USER>"
	line "reduce sus PS y"

	para "MALDICE a"
	line "<TARGET>!"
	prompt
; 0x81665

ProtectedItselfText: ; 0x81665
	text "¡<USER>"
	line "se ha PROTEGIDO!"
	prompt
; 0x8167a

ProtectingItselfText: ; 0x8167a
	text "¡<TARGET>"
	line "se está"
	cont "PROTEGIENDO!"
	done
; 0x81691

SpikesText: ; 0x81691
	text "¡<TARGET>"
	line "está rodeado"
	cont "de PÚAS!"
	prompt
; 0x816b1

IdentifiedText: ; 0x816b1
	text "¡<USER>"
	line "identificó a"
	cont "<TARGET>!"
	prompt
; 0x816c2

StartPerishText: ; 0x816c2
	text "¡Ambos #MON se"
	line "debilitarán en"
	cont "3 turnos!"
	prompt
; 0x816e4

SandstormBrewedText: ; 0x816e4
	text "¡Se acerca una"
	line "TORMENTA de ARENA!"
	prompt
; 0x816f9

ItStartedToHailText:
	text "Ha comenzado a"
	line "GRANIZAR!"
	prompt

BracedItselfText: ; 0x816f9
	text "¡<USER>"
	line "se ha fortalecido!"
	prompt
; 0x8170b

FellInLoveText: ; 0x8170b
	text "¡<TARGET>"
	line "se ha enamorado!"
	prompt
; 0x8171c

CoveredByVeilText: ; 0x8171c
	text "¡<USER>"
	line "se cubrió con"
	cont "un velo!"
	prompt
; 0x81733

SafeguardProtectText: ; 0x81733
	text "¡<TARGET>"
	line "está protegido por"
	cont "el VELO SAGRADO!"
	prompt
; 0x81751

MagnitudeText: ; 0x81751
	text "¡Magnitud @"
	deciram wd265, 1, 1
	text "!"
	prompt
; 0x81764

ReleasedByText: ; 0x81764
	text "¡<USER>"
	line "fue liberado por"
	cont "<TARGET>!"
	prompt
; 0x8177a

ShedLeechSeedText: ; 0x8177a
	text "¡<USER>"
	line "rompió DRENADORAS!"
	prompt
; 0x8178e

BlewSpikesText: ; 0x8178e
	text "¡<USER>"
	line "rompió PÚAS!"
	prompt
; 0x817a3

DownpourText: ; 0x817a3
	text "¡Ha empezado a"
	line "caer un chaparrón!"
	prompt
; 0x817b8

SunGotBrightText: ; 0x817b8
	text "¡El sol está"
	line "brillando!"
	prompt
; 0x817d2

BellyDrumText: ; 0x817d2
	text "¡<USER>"
	line "redujo sus PS"
	cont "y mejoro su"
    cont "ataque!"
	prompt
; 0x817f6

ForesawAttackText: ; 0x81817
	text "¡<USER>"
	line "previó un ataque!"
	prompt
; 0x8182d

IgnoredOrders2Text: ; 0x81850
	text "¡<USER>"
	line "desobedeció!"
	prompt
; 0x81863

UsedMoveText:
	text "¡<USER>"
	line "uso @"
	text_from_ram StringBuffer2
	text "!"
	done

UsedMoveInsteadText:
	text "¡<USER>"
	line "uso @"
	text_from_ram StringBuffer2
	text ""
	cont "en su lugar!"
	done

PkmnSetAShellTrapText:
	text_from_ram BattleMonNick
	text ""
	line "Puso coraza trampa!"
	prompt

EnemySetAShellTrapText:
	text "Enemy @"
	text_from_ram EnemyMonNick
	text ""
	line "Puso coraza trampa!"
	prompt

StoleBoostedStatsText:
	text "¡<USER> robo"
	line "<TARGET>'s"
	cont "aumento de"
    cont "estadísticas!"
	prompt
