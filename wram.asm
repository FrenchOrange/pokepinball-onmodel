; OAM Animations use this 3-byte struct.
animation: MACRO
\1FrameCounter:: ds 1
\1Frame:: ds 1
\1Index:: ds 1
endm

SECTION "WRAM Bank 0", WRAM0

wc000:: ; 0xc000
	ds $10

wc010:: ; 0xc010
	ds $140

wc150:: ; 0xc150
	ds $68

wc1b8:: ; 0xc1b8
	ds $c8

wc280:: ; 0xc280
	ds $9

wc289:: ; 0xc289
	ds $37

wc2c0:: ; 0xc2c0
	ds $140

wMonAnimatedCollisionMask:: ; 0xc400
	ds $80

wc480:: ; 0xc480
	ds $40

wc4c0:: ; 0xc4c0
	ds $c

wc4cc:: ; 0xc4cc
	ds $34

wBottomMessageText:: ; 0xc500 WARNING: text loading code may break if this is moved
; This must be aligned with $100, since there is some logic that depends on the lower byte of the address. (See LoadMonNameIntoEvolutionSelectionList)
	ds $100

wBottomMessageBuffer:: ; 0xc600
; This acts as a buffer to hold the scrolling text message.
; Rather than storing the raw text, it stores tile ids for the text.
; The lower-left most tile is at 0xc640, so everything before isn't visible on screen.
	ds $100

wStageCollisionMap:: ; 0xc700
	ds $300

wca00::
	ds $100

wcb00:: ; 0xcb00
	ds $500

SECTION "WRAM Bank 1", WRAMX

wOAMBuffer:: ; 0xd000
	ds $a0
wOAMBufferEnd:: ; 0xd0a0

SECTION "WRAM Bank 1.1", WRAMX
wPaletteData:: ; 0xd200
	ds $80

; This buffer holds the intermediate palette data when fading to a new palette.
; The target palette is held in wPaletteData.
wFadeBGPaletteData:: ; 0xd280
	ds $40
wFadeOBJPaletteData:: ; 0xd2c0
	ds $40

wPartyMons:: ; 0xd300
	ds $100

wAddScoreQueue:: ; 0xd400
	ds $60
wAddScoreQueueEnd:: ; 0xd460

wNumPartyMons:: ; 0xd460
; Number of pokemon caught in the current pinball game.
	ds $1

wCurSelectedPartyMon:: ; 0xd461
; The index of the selected party pokemon.
; This is mainly used during evolution mode, when the player selects which of their
; caught pokemon to evolve.
	ds $1

wCurSelectedPartyMonScrollOffset:: ; 0xd462
; Holds the scrolling offset for the pokemon list when choosing which
; pokemon to evolve.
	ds $1

wPartySelectionCursorCounter:: ; 0xd463
; Counter to animate the blinking cursor when choosing a pokemon to evolve.
	ds $1

wScoreToAdd:: ; 0xd464
; Holds a 6-byte BCD value to add to the player's score.
	ds $6

wScore:: ; 0xd46a
; 6-byte BCD value that represents the player's score.
	ds $6

wPlayerName:: ; 0xd470
; Player's 3-character name when entering High Scores.
	ds $3

wHighScoreId:: ; 0xd473
; 4 randomly-generated bytes when a high score is achieved.
; These 4 bytes are appended to the high score data structure.
; See the high_scores macro.
; These 4 bytes don't appear to be used by anything. It's possible they're used by the
; "send high scores" capability, but haven't tested it.
	ds $4

wAddScoreQueueOffset:: ; 0xd477
	ds $1

wd478:: ; 0xd478
	ds $1

wd479:: ; 0xd479
	ds $1

wd47a:: ; 0xd47a
; BCD buffer
	ds $4

wBallType:: ; 0xd47e
; See constants/ball_types.asm
	ds $1

wBallTypeCounter:: ; 0xd47f
	ds $2

wBallTypeBackup:: ; 0xd481
	ds $1

wCurBonusMultiplier:: ; 0xd482
; Current value of the bonus multplier. Incremented from achieving various events during the game, or hitting the two bonus multiplier
; railings. (left one first, then right one). See MAX_BONUS_MULTIPLIER
	ds $1

wd483:: ; 0xd483
	ds $6

wd489:: ; 0xd489
	ds $6

wd48f:: ; 0xd48f
	ds $6

wd495:: ; 0xd495
	ds $1

wd496:: ; 0xd496
	ds $1

wNextStage:: ; 0xd497
; Holds the id of the next stage to go to. Used for transitioning between bonus stage and the main red/blue field.
	ds $1

wd498:: ; 0xd498
	ds $1

wd499:: ; 0xd499
	ds $1

wCompletedBonusStage:: ; 0xd49a
; Set to 1 when a bonus stage is successfully cleared.
	ds $1

wCurBonusMultiplierFromFieldEvents:: ; 0xd49b
; Current value of the bonus multiplier received from field events, like catching a pokemon or hitting psyduck 3 times. See MAX_BONUS_MULTIPLIER_FIELD_EVENTS.
	ds $1

wd49c:: ; 0xd49c
	ds $1

wd49d:: ; 0xd49d
	ds $1

wd49e:: ; 0xd49e
	ds $1

wd49f:: ; 0xd49f
	ds $2

wBallSaverIconOn:: ; 0xd4a1
	ds $1

wBallSaverFlashRate:: ; 0xd4a2
	ds $1

wBallSaverTimerFrames:: ; 0xd4a3
	ds $1

wBallSaverTimerSeconds:: ; 0xd4a4
	ds $1

wNumTimesBallSavedTextWillDisplay:: ; 0xd4a5
	ds $1

wBallSaverTimerFramesBackup:: ; 0xd4a6
	ds $1

wBallSaverTimerSecondsBackup:: ; 0xd4a7
	ds $1

wNumTimesBallSavedTextWillDisplayBackup:: ; 0xd4a8
	ds $1

wExtraBall:: ; 0xd4a9
; Set to 1 if the player has an extra ball.
	ds $1

wDrawBottomMessageBox:: ; 0xd4aa
; Set to non-zero value if enable drawing the 1-tile high bottom message bar during V-Blank in normal pinball gameplay.
; Set to 0 to disable.
	ds $1

wd4ab:: ; 0xd4ab
	ds $1

wCurrentStage:: ; 0xd4ac see constants/stage_constants.asm for list. bit 0 is 1 if the stage has flippers
	ds $1

wd4ad:: ; 0xd4ad
	ds $1

wMoveToNextScreenState:: ; 0xd4ae
; This is set when the the screen state should advance, in the pinball game's core logic state.
	ds $1

wStageCollisionState:: ; 0xd4af
	ds $1

wd4b0:: ; 0xd4b0
	ds $3

wBallXPos:: ; 0xd4b3
	ds $2
wBallYPos:: ; 0xd4b5
	ds $2

wPreviousBallXPos:: ; 0xd4b7
	ds $2
wPreviousBallYPos:: ; 0xd4b9
	ds $2

wBallXVelocity:: ; 0xd4bb
	ds $2

wBallYVelocity:: ; 0xd4bd
	ds $2

	ds $4

wBallSpin:: ; 0xd4c3
	ds $1

wBallRotation:: ; 0xd4c4
	ds $1

wd4c5:: ; 0xd4c5
	ds $1

wd4c6:: ; 0xd4c6
	ds $1

wd4c7:: ; 0xd4c7
	ds $1

wd4c8:: ; 0xd4c8
	ds $1

wd4c9:: ; 0xd4c9
	ds $1

wShowExtraBallText:: ; 0xd4ca
; Setting this byte to 1 or 2 will cause the "Extra Ball" message to scroll across the bottom of the screen.
; 1 = "EXTRA BALL"
; 2 = "EXTRA BALL SPECIAL BONUS"
	ds $1

wWhichVoltorb:: ; 0xd4cb
wWhichShellder::
	ds $1
wWhichVoltorbId:: ; 0xd4cc
wWhichShellderId::
	ds $1

wVoltorb1Animation:: ; 0xd4cd
wShellder1Animation_Unused::
	animation wVoltorb1Animation

wVoltorb2Animation:: ; 0xd4d0
wShellder2Animation_Unused::
	animation wVoltorb2Animation

wVoltorb3Animation:: ; 0xd4d3
wShellder3Animation_Unused::
	animation wVoltorb3Animation

wVoltorbHitAnimationDuration:: ; 0xd4d6
wShellderHitAnimationDuration::
; Number of frames remaining in the light-up animation when a Shellder/Voltorb is hit.
; This single byte actually controls all three of them, since only one can be animated at a time.
	ds $1

wWhichAnimatedVoltorb:: ; 0xd4d7
wWhichAnimatedShellder::
; Hold the index (0,1,2) of the Shellder/Voltorb that is currently being animated after it was hit.
	ds $1

wWhichBumper:: ; 0xd4d8
; 0 = neither
; 1 = left bumper
; 2 = right bumper
	ds $1
wWhichBumperId:: ; 0xd4d9
	ds $1

wBumperLightUpDuration:: ; 0xd4da
; Number of frames left in the Bumper light-up animation when the pinball bounces off of it.
; This is shared by both bumpers, so only one can be lit up at a time.
	ds $1

wd4db:: ; 0xd4db
	ds $1

wPinballLaunchCollision:: ; 0xd4dc
; 0 = pinball isn't resting at the start, waiting to be launched by the player
; 1 = pinball can be launched to start the round
; second byte is unused, but it's written by HandleGameObjectCollision
	ds $2

wPinballLaunched:: ; 0xd4de
; 0 = pinball hasn't been launched, yet
; 1 = pinball was launched
	ds $1

wd4df:: ; 0xd4df
	ds $1

wChoseInitialMap:: ; 0xd4e0
; Set to 1 after the player chooses the initial map during first pinball launch.
	ds $1

wInitialMapSelectionIndex:: ; 0xd4e1
	ds $1

wNumMapMoves:: ; 0xd4e2
; Number of times the player has successfully completed a map move.
; Resets to 0 after completing 6.
	ds $1

wVisitedMaps:: ; 0xd4e3
; List of the visited maps in order.
; It is reset after moving past Indigo Plateau.
; The last byte is unused, since there are only 6 map moves.
	ds $7

wTriggeredGameObject:: ; 0xd4ea
; Game objects, such as the two bumpers, Pikachu savers, CAVE, etc. have unique ids.
; This byte saves the object which the pinball is currently colliding with.
	ds $1

wTriggeredGameObjectIndex:: ; 0xd4eb
; Many game objects come in pairs, wuch as the two bumpers, Pikachu savers, etc.
; This byte stores which of them the pinball is currently colliding with.
	ds $1

wPreviousTriggeredGameObject:: ; 0xd4ec
; Store the previous triggered game object's id, so that the pinball can't trigger
; an object two frames in a row. It has to "un-collide" before it can collide again.
	ds $1

wWhichDiglett:: ; 0xd4ed 0 = none, left = 1 right = 2
wWhichPsyduckPoliwag::
	ds $1
wWhichDiglettId:: ; 0xd4ee
wWhichPsyduckPoliwagId::
	ds $1

wLeftDiglettAnimationController:: ; 0xd4ef $50 = in and pained look. 0 = normal state
	ds $1

wLeftMapMoveCounter:: ; 0xd4f0 WARNING, diglet identifying code relies on this being 2 bytes before right map move counter
	ds $1

wRightDiglettAnimationController:: ; 0xd4f1 $50 = in and pained look. 0 = normal state
	ds $1

wRightMapMoveCounter:: ; 0xd4f2
	ds $1

wLeftMapMoveDiglettAnimationCounter:: ; 0xd4f3
wLeftMapMovePoliwagAnimationCounter::
	ds $1

wLeftMapMoveDiglettFrame:: ; 0xd4f4
wLeftMapMovePoliwagFrame::
	ds $1

wRightMapMoveDiglettAnimationCounter:: ; 0xd4f5
wRightMapMovePsyduckAnimationCounter::
	ds $1

wRightMapMoveDiglettFrame:: ; 0xd4f6
wRightMapMovePsyduckFrame::
	ds $1

wLeftMapMoveCounterFramesUntilDecrease:: ; 0xd4f7
; Holds the number of frames remaining until the wLeftMapMoveCounter
; counter will decrease by 1.
	ds $2

wRightMapMoveCounterFramesUntilDecrease:: ; 0xd4f9
; Holds the number of frames remaining until the wRightMapMoveCounter
; counter will decrease by 1.
	ds $2

wBellsproutCollision:: ; 0xd4fb
; Second byte is set by HandleGameObjectCollision, but is unused
	ds $2

wBellsproutAnimation:: ; 0xd4fd
	animation wBellsproutAnimation

wStaryuCollision:: ; 0xd500
; Second byte is set by HandleGameObjectCollision, but is unused
	ds $2

wd502:: ; 0xd502
	ds $1

wd503:: ; 0xd503
	ds $1

wd504:: ; 0xd504
	ds $1

wd505:: ; 0xd505
	ds $1

wd506:: ; 0xd506
	ds $1

wSpinnerCollision:: ; 0xd507
; Second byte is set by HandleGameObjectCollision, but is unused
	ds $2

wd509:: ; 0xd509
	ds $1

wd50a:: ; 0xd50a
	ds $1

wd50b:: ; 0xd50b
	ds $1

wd50c:: ; 0xd50c
	ds $1

wWhichCAVELight:: ; 0xd50d
	ds $1
wWhichCAVELightId:: ; 0xd50e
	ds $1

wCAVELightStates:: ; 0xd50f
; Marks each of the 4 CAVE lights as On (1) or Off (0).
; When all four are On, it will do a blinking animation, and then open the Slot bonus.
	ds $4

wCAVELightsBlinking:: ; 0xd513
; Set to 1 when the 4 CAVE lights are blinking for a couple seconds after successfully
; lighting up all 4. Set to 0, otherwise.
	ds $1

wCAVELightsBlinkingFramesRemaining:: ; 0xd514
; Holds the number of frames remaining in the 4 CAVE lights' blinking animation.
	ds $1

wWhichPikachu:: ; 0xd515
	ds $1
wWhichPikachuId:: ; 0xd516
	ds $1

wPikachuSaverCharge:: ; 0xd517
; Holds the amount of Pikachu "charge" that has been generated by spinning the spinner
; in the right alley. The charge's value ranges from 0 - 15.
	ds $1

wWhichPikachuSaverSide:: ; 0xd518
; 0 = Pikachu is on the left side
; 1 = Pikachu is on the right side
	ds $1

wPikachuSaverAnimation:: ; 0xd519
	animation wPikachuSaverAnimation

wd51c:: ; 0xd51c
	ds $1

wPikachuSaverSlotRewardActive:: ; 0xd51d
; Set to 1 if the Pikachu Saver slot reward is active. 0 otherwise.
	ds $1

wd51e:: ; 0xd51e
	ds $1

wWhichBoardTrigger:: ; 0xd51f
	ds $1
wWhichBoardTriggerId:: ; 0xd520
	ds $1

wCollidedAlleyTriggers:: ; 0xd521
; These bytes are pretty unnecessary, but the original code decided it would use a roundabout way to decide which function to call based on wWhichBoardTriggerId was collided with.
	ds $8

	ds $6 ; free space

wIndicatorStates:: ; 0xd52f 0 = evo arrows, 1 = catch arrows, 2 = left small alley, 3 = bellsprout, 4 = slot. bit 7 controls if enabled and flashing, bit 1 and 2 control is solid (set = solid)
	ds $13

wLeftAlleyTrigger:: ; 0xd542
	ds $1

wLeftAlleyCount:: ; 0xd543
	ds $1

wRightAlleyTrigger:: ; 0xd544
	ds $1

wRightAlleyCount:: ; 0xd545
	ds $1

wSecondaryLeftAlleyTrigger:: ; 0xd546
	ds $2

wPinballIsVisible:: ; 0xd548
; Set to 1 if the pinball is visible in play.
; Set to 0 when the pinball disappears in things like the Slot, Slowpoke, Cloyster, Bellsprout, etc.
; When it's set to 0, it disables tilt effects on the pinball.
	ds $1

wEnableBallGravityAndTilt:: ; 0xd549
; Set to 1 to enable the effect of gravity and tilt on the pinball.
; 0 disables these forces. Used for things likes the initial pinball launch or to hold the ball stationary.
	ds $1

wCurrentMap:: ; 0xd54a
	ds $1

wInSpecialMode:: ; 0xd54b
; Set to 1 if currently in special game mode. See wSpecialMode.
	ds $1

wd54c:: ; 0xd54c 10000 sets it to a input.  7 and 8 from the digletts
	ds $1

wd54d:: ; 0xd54d
	ds $1

wd54e:: ; 0xd54e
	ds $1

wd54f:: ; 0xd54f
	ds $1

wSpecialMode:: ; 0xd550
; Represents the current pinball mode. Example special modes would be, Catch'Em, Evolution, Map Move
; See SPECIAL_MODE constants.
	ds $1

wd551:: ; 0xd551
	ds $1

wCurrentEvolutionMon:: ; 0xd552
	ds $1

wCurrentEvolutionType:: ; 0xd553
	ds $1

wd554:: ; 0xd554
	ds $1

wd555:: ; 0xd555
	ds $1

wd556:: ; 0xd556
	ds $1

wd557:: ; 0xd557
	ds $1

wd558:: ; 0xd558
	ds $1

wd559:: ; 0xd559
	ds $1

wMapMoveDirection:: ; 0xd55a
; 0 = need to hit the ball left to open map move slot cave
; 1 = need to hit the ball right to open map move slot cave
	ds $1

wRareMonsFlag:: ; 0xd55b
	ds $1

wd55c:: ; 0xd55c
	ds $1

wd55d:: ; 0xd55d
	ds $1

wd55e:: ; 0xd55e
	ds $1

wd55f:: ; 0xd55f
	ds $1

wd560:: ; 0xd560
	ds $1

wd561:: ; 0xd561
	ds $1

wd562:: ; 0xd562
	ds $1

wd563:: ; 0xd563
	ds $1

wd564:: ; 0xd564
	ds $1

wd565:: ; 0xd565
	ds $1

wd566:: ; 0xd566
	ds $c

wd572:: ; 0xd572
	ds $6

wd578:: ; 0xd578
	ds $1

wCurrentCatchEmMon:: ; 0xd579
	ds $1

wTimerSeconds:: ; 0xd57a
	ds $1

wTimerMinutes:: ; 0xd57b
	ds $1

wTimerFrames:: ; 0xd57c
	ds $1

wTimerActive:: ; 0xd57d
; Set to 1 when the Timer is displayed and counting down.
	ds $1

wd57e:: ; 0xd57e when map mode fails by time, toggled to off from on
	ds $1

wd57f:: ; 0xd57f
	ds $1

wd580:: ; 0xd580
	ds $1

wd581:: ; 0xd581
	ds $1

wTimerDigits:: ; 0xd582
; first byte = minutes
; second byte = tens place
; third byte = ones place
; fourth byte = unused, but still written to
	ds $4

wd586:: ; 0xd586
	ds $30

wd5b6:: ; 0xd5b6 a 24 wide block starts here and is filled before catch mode
	ds $5

wWildMonIsHittable:: ; 0xd5bb
; Set to 1 when the wild pokemon is animated and hittable with the pinball.
	ds $1

wd5bc:: ; 0xd5bc
	ds $1

wd5bd:: ; 0xd5bd
	ds $1

wd5be:: ; 0xd5be
	ds $1

wBallHitWildMon:: ; 0xd5bf
	ds $1

wNumMonHits:: ; 0xd5c0
	ds $1

wd5c1:: ; 0xd5c1
	ds $1

wd5c2:: ; 0xd5c2
	ds $1

wd5c3:: ; 0xd5c3
	ds $1

wd5c4:: ; 0xd5c4
	ds $1

wNumMewHitsLow:: ; 0xd5c5
	ds $1

wd5c6:: ; 0xd5c6
	ds $1

wWildMonCollision:: ; 0xd5c7
; Set by HandleGameObjectCollision
; Second byte gets set, but is unused
	ds $2

	ds $1

wBottomTextEnabled:: ; 0xd5ca
; 1 = text messages in the bottom black bar are enabled
; 0 = disabled--the text won't appear even if LoadScrollingText is called
	ds $1

wDisableDrawScoreboardInfo:: ; 0xd5cb
; This is set when text messages are shown in the bottom black bar.
; 1 = Skip drawing the scoreboard icons in the bottom black bar. (num pokemon caught, number of balls left, score)
; 0 = Draw them.
	ds $1

scrolling_text: MACRO
\1Enabled:: ds 1              ; Toggles if enabled. 0 is off, non-0 is on
\1ScrollDelayCounter:: ds 1   ; Number of frames remaining until the next scroll step
\1ScrollDelay:: ds 1          ; Number of frames between each scroll step
\1MessageBoxOffset:: ds 1     ; Offset in wBottomMessageBuffer to place first character of text
\1StopOffset:: ds 1           ; Offset in wBottomMessageBuffer where the scrolling text will briefly stop
\1StopDuration:: ds 1         ; Number of frames the message will remained stopped, before resuming scroll
\1SourceTextOffset:: ds 1     ; Offset in wBottomMessageText for the text to be displayed
\1ScrollStepsRemaining:: ds 1 ; Number of scroll steps remaining. Isn't decremented during the stop.
ENDM

wScrollingText1:: ; 0xd5cc
	scrolling_text wScrollingText1
wScrollingText2:: ; 0xd5d4
	scrolling_text wScrollingText2
wScrollingText3:: ; 0xd5dc
	scrolling_text wScrollingText3

stationary_text: MACRO
\1Enabled::ds 1              ; Toggles if enabled. 0 is off, non-0 is on
\1MessageBoxOffset:: ds 1     ; Offset in wBottomMessageBuffer to place first character of text
\1SourceTextOffset:: ds 1     ; Offset in wBottomMessageText for the text to be displayed
\1Duration::
\1DurationLowByte:: ds 1 ;how many frames to stay on screen.
\1DurationHighByte:: ds 1 ;thiswill trigger as 0 if >= 128
ENDM

wStationaryText1:: ; 0xd5e4
	stationary_text wStationaryText1

wStationaryText2:: ; 0xd5e9
	stationary_text wStationaryText2

wStationaryText3:: ; 0xd5ee
	stationary_text wStationaryText3

wCapturingMon:: ; 0xd5f3
; Set to 1 when the capturing animation starts.
	ds $1

wBallCaptureAnimation:: ; 0xd5f4
	animation wBallCaptureAnimation

wWhichPinballUpgradeTrigger:: ; 0xd5f7
	ds $1
wWhichPinballUpgradeTriggerId:: ; 0xd5f8
	ds $1

wBallUpgradeTriggerStates:: ; 0xd5f9
; Marks each of the 3 ball upgrade triggers as On (1) or Off (0).
; When all three are On, it upgrades the pinball field multiplier. (e.g. Pokeball -> Great Ball)
	ds $3

wBallUpgradeTriggersBlinking:: ; 0xd5fc
; Set to 1 when the 3 ball upgrade triggers are blinking for a couple seconds after successfully
; lighting up all 3. Set to 0, otherwise.
	ds $1

wBallUpgradeTriggersBlinkingFramesRemaining:: ; 0xd5fd
; Holds the number of frames remaining in the ball upgrade blinking animation.
	ds $1

wDittoSlotCollision:: ; 0xd5fe
; Second byte is set by HandleGameObjectCollision, but is unused
	ds $2

wDittoEnterOrExitCounter:: ; 0xd600
; Number of frames remaining in the process when the pinball is entering or exiting the Ditto cave.
; This functions the same way as wSlotEnterOrExitCounter.
	ds $1

wSlotCollision:: ; 0xd601
; Second byte is set by HandleGameObjectCollision, but is unused
	ds $2

wSlotEnterOrExitCounter:: ; 0xd603
; Number of frames remaining in the process when the pinball is entering or exiting the slot cave.
; This functions the same way as wDittoEnterOrExitCounter.
	ds $1

wSlotIsOpen:: ; 0xd604
; Whether or not the Slot is open for the pinball to enter. 1 = open; 0 = closed
	ds $1

	ds $1 ; unused

wSlotGlowingAnimationCounter:: ; 0xd606
; When the slot is open, this counter increments once every frame, which controls the glowing
; animation around the slot cave.
	ds $1

wFramesUntilSlotCaveOpens:: ; 0xd607
; When set to non-zero value, it decrements once per frame. When it hits 0, the Slot cave will open.
	ds $1

wOpenedSlotByGetting4CAVELights:: ; 0xd608
; Set to 1 when the slot bonus was trigered by lighting up all 4 CAVE lights.
; See wCAVELightStates
	ds $1

wOpenedSlotByGetting3Pokeballs:: ; 0xd609
; Set to 1 when the slot bonus was triggered by achieving 3 Pokeballs (the pokeballs underneath the billboard).
; See wNumPokeballs.
	ds $1

wWhichBonusMultiplierRailing:: ; 0xd60a
	ds $1
wWhichBonusMultiplierRailingId:: ; 0xd60b
	ds $1

wBonusMultiplierTensDigit:: ; 0xd60c
; Holds the tens digit for the current bonus multiplier value. This number is displayed on the left-side bonus multiplier railing.
	ds $1

wBonusMultiplierOnesDigit:: ; 0xd60d
; Holds the ones digit for the current bonus multiplier value. This number is displayed on the right-side bonus multiplier railing.
	ds $1

wd60e:: ; 0xd60e
	ds $1

wd60f:: ; 0xd60f
	ds $1

wd610:: ; 0xd610
	ds $1

wd611:: ; 0xd611
	ds $1

wd612:: ; 0xd612
	ds $1

wd613:: ; 0xd613
	ds $1

wd614:: ; 0xd614
	ds $1

wd615:: ; 0xd615
	ds $1

wGameOver:: ; 0xd616
	ds $3

wd619:: ; 0xd619
	ds $1

wd61a:: ; 0xd61a
	ds $1

wd61b:: ; 0xd61b
	ds $2

wd61d:: ; 0xd61d
	ds $1

wd61e:: ; 0xd61e
	ds $1

wCurSlotBonus:: ; 0xd61f
	ds $1

wSlotAnyPokemonCaught:: ; 0xd620
; Used by the slot logic to store whether or not any pokemon are caught.
	ds $1

wd621:: ; 0xd621
	ds $1

wCatchEmOrEvolutionSlotRewardActive:: ; 0xd622
; Set to 1 if the "Start Catch 'Em Mode" Slot Reward is received.
; Set to 2 if the "Start Evolution Mode" Slot Reward is received.
	ds $1

wBonusStageSlotRewardActive:: ; 0xd623
; Set to 1 when the "Go To Bonus" Slot Reward is received.
	ds $1

wPreviousNumPokeballs:: ; 0xd624
; See wNumPokeballs. This holds the previous number of them to handle the blinking
; animation, so that it only blinks the newly-acquired pokeballs.
	ds $1

wNumPokeballs:: ; 0xd625
; The number of Pokeballs that appear directly underneath the billboard area.
; When you get 3 of these, the bonus stage opens up. This number is increased
; when doing things like catching of evolving a pokemon.
	ds $1

wPokeballBlinkingCounter:: ; 0xd626
; Counts the number of frames left in the blinking pokeballs animation.
; These Pokeballs are located underneath the billboard area, and blink after
; doing things such as catching or evolving a pokemon.
	ds $1

	ds $1 ; unused byte

wNumPokemonCaughtInBallBonus:: ; 0xd628
; Counts the number of pokemon caught in a single ball bonus.
	ds $1

wNumPokemonEvolvedInBallBonus:: ; 0xd629
; Counts the number of pokemon evolved in a single ball bonus.
	ds $1

wNumBellsproutEntries:: ; 0xd62a
; Counts the number of times Bellsprout was entered without triggering Catch'Em mode.
	ds $1

wNumDugtrioTriples:: ; 0xd62b
; Counts the number of times either of the two Dugtrio was hit 3 times on the red field.
	ds $1

wNumCAVECompletions:: ; 0xd62c
; Counts the number of times all CAVE lights were lit.
	ds $1

wNumSpinnerTurns:: ; 0xd62d
; Counts the number of spinner turns in a single ball bonus.
	ds $1

wNumPikachuSaves:: ; 0xd62e
; Counts the number of times the ball was saved by a charged Pikachu.
; This is unused, but was probably intended to be used in the Ball Bonus.
	ds $1

wNumMewtwoBonusCompletions:: ; 0xd62f
	ds $1

wSlowpokeCollision:: ; 0xd630
; Second byte is set by HandleGameObjectCollision, but is unused
	ds $2

wSlowpokeAnimation:: ; 0xd632
	animation wSlowpokeAnimation

wCloysterCollision:: ; 0xd635
; Second byte is set by HandleGameObjectCollision, but is unused
	ds $2

wCloysterAnimation:: ; 0xd637
	animation wCloysterAnimation

wNumSlowpokeEntries:: ; 0xd63a
; Counts the number of times Slowpoke was entered without triggering Evolution mode.
	ds $1

wNumCloysterEntries:: ; 0xd63b
; Counts the number of times Cloyster was entered without triggering Catch'Em mode.
	ds $1

wNumPsyduckTriples:: ; 0xd63c
; Counts the number of times Psyduck was hit 3 times.
	ds $1

wNumPoliwagTriples:: ; 0xd63d
; Counts the number of times Poliwag was hit 3 times.
	ds $1

wBlueStageForceFieldDirection:: ; 0xd63e
	ds $1

wIndicatorState2Backup:: ; 0xd63f
	ds $1

wBlueStageForceFieldGfxNeedsLoading:: ; 0xd640
; A flag to signal that the force field arrow graphics need to be updated because
; it recently changed direction.
	ds $1

wBlueStageForceFieldFlippedDown:: ; 0xd641
	ds $1

wd642:: ; 0xd642
	ds $1

wd643:: ; 0xd643
	ds $1

wd644:: ; 0xd644
	ds $1

wPsyduckState:: ; 0xd645
	ds $1

wPoliwagState:: ; 0xd646
	ds $1

wBonusMultiplierRailingEndLightDuration:: ; 0xd647
	ds $1

wd648:: ; 0xd648
	ds $1

wd649:: ; 0xd649
	ds $1

wd64a:: ; 0xd64a
	ds $1

wd64b:: ; 0xd64b
	ds $1

wBlueFieldForceFieldFrameCounter:: ; 0xd64c
; Continuosly counts up to 60--wraps around to 0.
	ds $1

wBlueFieldForceFieldSecondsCounter:: ; 0xd64d
; Increments once every second, based on wBlueFieldForceFieldFrameCounter.
; When it hits 5 seconds, it wraps back to 0.
	ds $1

wd64e:: ; 0xd64e
	ds $1

wd64f:: ; 0xd64f
	ds $1

wd650:: ; 0xd650
	ds $1

wd651:: ; 0xd651
	ds $1

wd652:: ; 0xd652
	ds $1

wd653:: ; 0xd653
	ds $1

wWhichGravestone:: ; 0xd654
; second byte is unused
	ds $2

wd656:: ; 0xd656
	ds $1

wd657:: ; 0xd657
	ds $1

wd658:: ; 0xd658
	ds $1

wd659:: ; 0xd659
	ds $2

wGastly1AnimationState:: ; 0xd65b
	ds $2

wd65d:: ; 0xd65d
	ds $1

wGastly1XPos:: ; 0xd65e
	ds $2
wGastly1YPos:: ; 0xd660
	ds $2

wd662:: ; 0xd662
	ds $2

wGastly2AnimationState:: ; 0xd664
	ds $2

wd666:: ; 0xd666
	ds $1

wGastly2XPos:: ; 0xd668
	ds $2
wGastly2YPos:: ; 0xd66a
	ds $2

wd66b:: ; 0xd66b
	ds $2

wGastly3AnimationState:: ; 0xd66d
	ds $2

wd66f:: ; 0xd66f
	ds $1

wGastly3XPos:: ; 0xd671
	ds $2
wGastly3YPos:: ; 0xd673
	ds $2

wd674:: ; 0xd674
	ds $1

wd675:: ; 0xd675
	ds $2

wd677:: ; 0xd677
	ds $2

wd679:: ; 0xd679
	ds $2

wd67b:: ; 0xd67b
	ds $1

wd67c:: ; 0xd67c
	ds $1

wd67d:: ; 0xd67d
	ds $1

wd67e:: ; 0xd67e
	ds $2

wHaunter1AnimationState:: ; 0xd680
	ds $2

wd682:: ; 0xd682
	ds $1

wHaunter1XPos:: ; 0xd683
	ds $2
wHaunter1YPos:: ; 0xd685
	ds $2

wd687:: ; 0xd687
	ds $2

wHaunter2AnimationState:: ; 0xd689
	ds $1

	ds $1

wd68b:: ; 0xd68b
	ds $1

wHaunter2XPos:: ; 0xd68c
	ds $2
wHaunter2YPos:: ; 0xd68e
	ds $2

wd690:: ; 0xd690
	ds $1

wd691:: ; 0xd691
	ds $2

wd693:: ; 0xd693
	ds $2

wd695:: ; 0xd695
	ds $1

wd696:: ; 0xd696
	ds $1

wd697:: ; 0xd697
	ds $1

wd698:: ; 0xd698
	ds $2

wGengarAnimationState:: ; 0xd69a
	ds $1

wd69b:: ; 0xd69b
	ds $1

wd69c:: ; 0xd69c
	ds $1

wGengarXPos:: ; 0xd69d
	ds $2
wGengarYPos:: ; 0xd69f
	ds 2

wd6a1:: ; 0xd6a1
	ds $1

wd6a2:: ; 0xd6a2
	ds $1

wd6a3:: ; 0xd6a3
	ds $1

wd6a4:: ; 0xd6a4
	ds $1

wd6a5:: ; 0xd6a5
	ds $1

wd6a6:: ; 0xd6a6
	ds $1

wd6a7:: ; 0xd6a7
	ds $1

wd6a8:: ; 0xd6a8
	ds $1

wd6a9:: ; 0xd6a9
	ds $1

wd6aa:: ; 0xd6aa
	ds $2

wd6ac:: ; 0xd6ac
	ds $1

wd6ad:: ; 0xd6ad
	ds $1

wd6ae:: ; 0xd6ae
	ds $1

wd6af:: ; 0xd6af
	ds $1

wd6b0:: ; 0xd6b0
	ds $1

wd6b1:: ; 0xd6b1
	ds $1

wd6b2:: ; 0xd6b2
	ds $1

wd6b3:: ; 0xd6b3
	ds $1

wd6b4:: ; 0xd6b4
	ds $1

wd6b5:: ; 0xd6b5
	ds $1

wd6b6:: ; 0xd6b6
	ds $4

wd6ba:: ; 0xd6ba
	ds $1

wd6bb:: ; 0xd6bb
	ds $2

wd6bd:: ; 0xd6bd
	ds $1

wd6be:: ; 0xd6be
	ds $7

wd6c5:: ; 0xd6c5
	ds $1

wd6c6:: ; 0xd6c6
	ds $7

wd6cd:: ; 0xd6cd
	ds $1

wd6ce:: ; 0xd6ce
	ds $7

wd6d5:: ; 0xd6d5
	ds $1

wd6d6:: ; 0xd6d6
	ds $7

wd6dd:: ; 0xd6dd
	ds $1

wd6de:: ; 0xd6de
	ds $7

wd6e5:: ; 0xd6e5
	ds $1

wd6e6:: ; 0xd6e6
	ds $1

wd6e7:: ; 0xd6e7
	ds $2

wMeowthAnimation:: ; 0xd6e9
	animation wMeowthAnimation

wd6ec:: ; 0xd6ec
	ds $1

wMeowthXPosition:: ; 0xd6ed
	ds $1

wMeowthYPosition:: ; 0xd6ee
	ds $2

wMeowthXMovement:: ; 0xd6f0
	ds $1

wMeowthYMovement:: ; 0xd6f1
	ds $2

wd6f3:: ; 0xd6f3
	ds $1

wd6f4:: ; 0xd6f4
	ds $1

wd6f5:: ; 0xd6f5
	ds $1

wd6f6:: ; 0xd6f6
	ds $1

wd6f7:: ; 0xd6f7
	ds $1

wd6f8:: ; 0xd6f8
	ds $1

wd6f9:: ; 0xd6f9
	ds $1

wd6fa:: ; 0xd6fa
	ds $1

wd6fb:: ; 0xd6fb
	ds $1

wd6fc:: ; 0xd6fc
	ds $1

wd6fd:: ; 0xd6fd
	ds $2

wd6ff:: ; 0xd6ff
	ds $1

wd700:: ; 0xd700
	ds $1

wd701:: ; 0xd701
	ds $1

wd702:: ; 0xd702
	ds $1

wd703:: ; 0xd703
	ds $1

wd704:: ; 0xd704
	ds $1

wd705:: ; 0xd705
	ds $1

wd706:: ; 0xd706
	ds $1

wd707:: ; 0xd707
	ds $4

wd70b:: ; 0xd70b
	ds $1

wd70c:: ; 0xd70c
	ds $3

wMeowthStageBonusCounter:: ; 0xd70f
	ds $1

wd710:: ; 0xd710
	ds $1

wMeowthStageScore:: ; 0xd711
	ds $1

wd712:: ; 0xd712
	ds $1

wd713:: ; 0xd713
	ds $1

wd714:: ; 0xd714
	ds $1

wd715:: ; 0xd715
	ds $1

wd716:: ; 0xd716
	ds $1

wd717:: ; 0xd717
	ds $1

wd718:: ; 0xd718
	ds $1

wd719:: ; 0xd719
	ds $1

wd71a:: ; 0xd71a
	ds $1

wd71b:: ; 0xd71b
	ds $1

wd71c:: ; 0xd71c
	ds $2

wd71e:: ; 0xd71e
	ds $1

wd71f:: ; 0xd71f
	ds $1

wd720:: ; 0xd720
	ds $1

wd721:: ; 0xd721
	ds $1

wd722:: ; 0xd722
	ds $1

wd723:: ; 0xd723
	ds $1

wd724:: ; 0xd724
	ds $1

wd725:: ; 0xd725
	ds $1

wd726:: ; 0xd726
	ds $1

wd727:: ; 0xd727
	ds $1

wd728:: ; 0xd728
	ds $1

wd729:: ; 0xd729
	ds $1

wd72a:: ; 0xd72a
	ds $1

wd72b:: ; 0xd72b
	ds $1

wd72c:: ; 0xd72c
	ds $5

wd731:: ; 0xd731
	ds $1

wd732:: ; 0xd732
	ds $1

wd733:: ; 0xd733
	ds $1

wd734:: ; 0xd734
	ds $1

wd735:: ; 0xd735
	ds $1

wd736:: ; 0xd736
	ds $3

wd739:: ; 0xd739
	ds $1

wd73a:: ; 0xd73a
	ds $1

wd73b:: ; 0xd73b
	ds $1

wd73c:: ; 0xd73c
	ds $1

wDiglettStates:: ; 0xd73d
	ds $1f

wCurrentDiglett:: ; 0xd75c
	ds $1

wDiglettsInitializedFlag:: ; 0xd75d
	ds $1

wDiglettInitDelayCounter:: ; 0xd75e
	ds $1

wd75f:: ; 0xd75f
	ds $2

wDugtrioAnimation:: ; 0xd761
	animation wDugtrioAnimation

wDugrioState:: ; 0xd764
	ds $1

wd765:: ; 0xd765
	ds $1

wd766:: ; 0xd766
	ds $1

wd767:: ; 0xd767
	ds $1

wd768:: ; 0xd768
	ds $3

wd76b:: ; 0xd76b
	ds $1

wd76c:: ; 0xd76c
	ds $1

wd76d:: ; 0xd76d
	ds $1

wd76e:: ; 0xd76e
	ds $2

wd770:: ; 0xd770
	ds $1

wd771:: ; 0xd771
	ds $1

wd772:: ; 0xd772
	ds $3

wd775:: ; 0xd775
	ds $1

wd776:: ; 0xd776
	ds $1

wd777:: ; 0xd777
	ds $1

wd778:: ; 0xd778
	ds $2

wd77a:: ; 0xd77a
	ds $1

wd77b:: ; 0xd77b
	ds $1

wd77c:: ; 0xd77c
	ds $3

wd77f:: ; 0xd77f
	ds $1

wd780:: ; 0xd780
	ds $1

wd781:: ; 0xd781
	ds $1

wd782:: ; 0xd782
	ds $2

wd784:: ; 0xd784
	ds $1

wd785:: ; 0xd785
	ds $1

wd786:: ; 0xd786
	ds $b

wd791:: ; 0xd791
	ds $1

wd792:: ; 0xd792
	ds $1

wd793:: ; 0xd793
	ds $1

wd794:: ; 0xd794
	ds $1

wd795:: ; 0xd795
	ds $1

wd796:: ; 0xd796
	ds $1

wd797:: ; 0xd797
	ds $1

wd798:: ; 0xd798
	ds $1

wd799:: ; 0xd799
	ds $1

wd79a:: ; 0xd79a
	ds $2

wd79c:: ; 0xd79c
	ds $2

wd79e:: ; 0xd79e
	ds $1

wLeftAndRightTiltPixelsOffset:: ; 0xd79f
; Horizontal offset in pixels that the left and right tilt are currently moving the screen.
	ds $1

wUpperTiltPixelsOffset:: ; 0xd7a0
; Vertical offset in pixels that the upper tilt is currently moving the screen.
	ds $1

wLeftTiltCounter:: ; 0xd7a1
	ds $1

wLeftTiltReset:: ; 0xd7a2
	ds $1

wRightTiltCounter:: ; 0xd7a3
	ds $1

wRightTiltReset:: ; 0xd7a4
	ds $1

wUpperTiltCounter:: ; 0xd7a5
	ds $1

wUpperTiltReset:: ; 0xd7a6
	ds $1

wLeftTiltPushing:: ; 0xd7a7
	ds $1

wRightTiltPushing:: ; 0xd7a8
	ds $1

wUpperTiltPushing:: ; 0xd7a9
	ds $1

wUnused_d7aa:: ; 0xd7aa
; not actually used
	ds $1

wSCX:: ; 0xd7ab
	ds $1

wDisableHorizontalScrollForBallStart:: ; 0xd7ac
; Controls whether or not the screen will scroll to accomodate the pinball when its off-screen.
; When the ball is launched on the Blue and Red Fields, the screen starts off scrolled to the right.
; However, when the balls rolls in on Bonus Stages, the screen does NOT scroll.
; 1 = Disable the scrolling
; 0 = Enable the scrolling
	ds $1

wd7ad:: ; 0xd7ad
	ds $1

wd7ae:: ; 0xd7ae
	ds $1

wd7af:: ; 0xd7af
	ds $1

wd7b0:: ; 0xd7b0
	ds $1

wd7b1:: ; 0xd7b1
	ds $1

wd7b2:: ; 0xd7b2
	ds $1

wd7b3:: ; 0xd7b3
	ds $1

wd7b4:: ; 0xd7b4
	ds $1

wd7b5:: ; 0xd7b5
	ds $1

wLeftFlipperAnimationState:: ; 0xd7b6
	ds $1

wRightFlipperAnimationState:: ; 0xd7b7
	ds $1

wFlipperXCollisionAttribute:: ; 0xd7b8
	ds $1

wFlipperCollision:: ; 0xd7b9
	ds $1

wFlipperXForce:: ; 0xd7ba
	dw

wFlipperYForce:: ; 0xd7bc
	dw

wd7be:: ; 0xd7be
	ds $1

wStageSong:: ; 0xd7bf
	ds $1

wStageSongBank:: ; 0xd7c0
	ds $1

wd7c1:: ; 0xd7c1
	ds $1

wd7c2:: ; 0xd7c2
	ds $1

wSubTileBallXPos:: ; 0xd7c3
	ds $1

wSubTileBallYPos:: ; 0xd7c4
	ds $1

wUpperLeftCollisionAttribute:: ; 0xd7c5
	ds $1

wLowerLeftCollisionAttribute:: ; 0xd7c6
	ds $1

wUpperRightCollisionAttribute:: ; 0xd7c7
	ds $1

wLowerRightCollisionAttribute:: ; 0xd7c8
	ds $1

wd7c9:: ; 0xd7c9
	ds $10

wd7d9:: ; 0xd7d9
	ds $10

wd7e9:: ; 0xd7e9
	ds $1

wCollisionForceAngle:: ; 0xd7ea
	ds $1

wd7eb:: ; 0xd7eb
	ds $1

wStageCollisionMapPointer:: ; 0xd7ec
	ds $2

wStageCollisionMapBank:: ; 0xd7ee
	ds $1

wStageCollisionMasksPointer:: ; 0xd7ef
	ds $2

wStageCollisionMasksBank:: ; 0xd7f1
	ds $1

wd7f2:: ; 0xd7f2
	ds $1

wBallPositionPointerOffsetFromStageTopLeft:: ; 0xd7f3
	dw

wCurCollisionAttribute:: ; 0xd7f5
	ds $1

wd7f6:: ; 0xd7f6
	ds $1

wd7f7:: ; 0xd7f7
	ds $1

wd7f8:: ; 0xd7f8
	ds $1

wInGameMenuIndex:: ; 0xd7f9
	ds $1

wd7fa:: ; 0xd7fa
	ds $1

wd7fb:: ; 0xd7fb
	ds $1

wd7fc:: ; 0xd7fc
	ds $1

wd7fd:: ; 0xd7fd
	ds $1

wd7fe:: ; 0xd7fe
	ds $2

wSFXTimer:: ; 0xd800
	ds $1

wd801:: ; 0xd801
	ds $1

wOAMBufferSize:: ; 0xd802
	ds $1

wRumblePattern:: ; 0xd803
; Holds the rumble pattern for the upcoming frames.
; This gets rotated to the right once per frame. If bit 0 is set, then it turns on rumble.
	ds $1

wRumbleDuration:: ; 0xd804
; Number of frames to rumble the Gameboy. See wRumblePattern.
	ds $1

wd805:: ; 0xd805 enables unused and odd PlaceString
	ds $1

wd806:: ; 0xd806
	ds $1

wd807:: ; 0xd807
	ds $1

; These three bytes track different joypad states cummulatively, until they are manually cleared.
; They inherit from their similarly-named counterparts found in hram.asm.  (See ReadJoyPad)
wJoypadStatesPersistent:: ; 0xd808
wJoypadStatePersistent::
	ds $1
wNewlyPressedButtonsPersistent:: ; 0xd809
	ds $1
wPressedButtonsPersistent:: ; 0xd80a
	ds $1

	ds $1 ; unused byte

wBGP:: ; 0xd80c
	ds $1

wOBP0:: ; 0xd80d
	ds $1

wOBP1:: ; 0xd80e
	ds $1

wd80f:: ; 0xd80f
	ds $1

wd810:: ; 0xd810
	ds $1

wd811:: ; 0xd811
	ds $1

wd812:: ; 0xd812
	ds $36

wd848:: ; 0xd848
	ds $1

wUpdateAudioEngineUsingTimerInterrupt:: ; 0xd849
; See ToggleAudioEngineUpdateMethod function for more in-depth explanation.
	ds $1

wToggleAudioEngineUpdateMethod:: ; 0xd84a
; When this byte is set to 1, it toggles between the audio engine being updated by V-Blank vs. Timer Interrupt.
; See ToggleAudioEngineUpdateMethod function for more in-depth explanation.
	ds $1

wd84b:: ; 0xd84b
	ds $4

wd84f:: ; 0xd84f
	ds $c

wCurrentSongBank:: ; 0xd85b
	ds $2

wAudioEngineEnabled:: ; 0xd85d
; 1 = normal audio (music/sfx) engine is enabled
; 0 = disabled
	ds $1

wd85e:: ; 0xd85e
	ds $1

wd85f:: ; 0xd85f
	ds $1

wd860:: ; 0xd860
	ds $1

wd861:: ; 0xd861
	ds $1

wd862:: ; 0xd862
	ds $1

wd863:: ; 0xd863
	ds $1

wd864:: ; 0xd864
	ds $1

wd865:: ; 0xd865
	ds $1

wd866:: ; 0xd866
	ds $1

wd867:: ; 0xd867
	ds $1

wd868:: ; 0xd868
	ds $1

wd869:: ; 0xd869
	ds $1

wd86a:: ; 0xd86a
	ds $1

wd86b:: ; 0xd86b
	ds $1

wd86c:: ; 0xd86c
	ds $1

wd86d:: ; 0xd86d
	ds $1

wd86e:: ; 0xd86e
	ds $1d

wd88b:: ; 0xd88b
	ds $12

wd89d:: ; 0xd89d
	ds $a

wd8a7:: ; 0xd8a7
	ds $1

wd8a8:: ; 0xd8a8
	ds $1

wd8a9:: ; 0xd8a9
	ds $1

wd8aa:: ; 0xd8aa
	ds $1

wd8ab:: ; 0xd8ab
	ds $1

wd8ac:: ; 0xd8ac
	ds $1

wd8ad:: ; 0xd8ad
	ds $1

wd8ae:: ; 0xd8ae
	ds $1

wd8af:: ; 0xd8af
	ds $1

wd8b0:: ; 0xd8b0
	ds $1

wd8b1:: ; 0xd8b1
	ds $1

wd8b2:: ; 0xd8b2
	ds $1

wd8b3:: ; 0xd8b3
	ds $1

wd8b4:: ; 0xd8b4
	ds $1

wd8b5:: ; 0xd8b5
	ds $1

wd8b6:: ; 0xd8b6
	ds $1

wd8b7:: ; 0xd8b7
	ds $1

wd8b8:: ; 0xd8b8
	ds $1

wd8b9:: ; 0xd8b9
	ds $1

wd8ba:: ; 0xd8ba
	ds $1

wd8bb:: ; 0xd8bb
	ds $1

wd8bc:: ; 0xd8bc
	ds $1

wd8bd:: ; 0xd8bd
	ds $1

wd8be:: ; 0xd8be
	ds $1

wd8bf:: ; 0xd8bf
	ds $1

wd8c0:: ; 0xd8c0
	ds $1

wd8c1:: ; 0xd8c1
	ds $1

wd8c2:: ; 0xd8c2
	ds $1

wd8c3:: ; 0xd8c3
	ds $1

wd8c4:: ; 0xd8c4
	ds $1

wd8c5:: ; 0xd8c5
	ds $1

wd8c6:: ; 0xd8c6
	ds $1

wd8c7:: ; 0xd8c7
	ds $1

wd8c8:: ; 0xd8c8
	ds $2

wd8ca:: ; 0xd8ca
	ds $1

wd8cb:: ; 0xd8cb
	ds $1

wd8cc:: ; 0xd8cc
	ds $1

wd8cd:: ; 0xd8cd
	ds $1

wd8ce:: ; 0xd8ce
	ds $1

wd8cf:: ; 0xd8cf
	ds $1

wd8d0:: ; 0xd8d0
	ds $1

wd8d1:: ; 0xd8d1
	ds $1

wd8d2:: ; 0xd8d2
	ds $1

wd8d3:: ; 0xd8d3
	ds $1

wd8d4:: ; 0xd8d4
	ds $1

wd8d5:: ; 0xd8d5
	ds $1

wd8d6:: ; 0xd8d6
	ds $1

wd8d7:: ; 0xd8d7
	ds $1

wd8d8:: ; 0xd8d8
	ds $3

wd8db:: ; 0xd8db
	ds $1

wd8dc:: ; 0xd8dc
	ds $1

wd8dd:: ; 0xd8dd
	ds $1

wd8de:: ; 0xd8de
	ds $2

wd8e0:: ; 0xd8e0
	ds $1

wd8e1:: ; 0xd8e1
	ds $1

wd8e2:: ; 0xd8e2
	ds $1

wd8e3:: ; 0xd8e3
	ds $1

wd8e4:: ; 0xd8e4
	ds $1

wd8e5:: ; 0xd8e5
	ds $1

wd8e6:: ; 0xd8e6
	ds $1

wd8e7:: ; 0xd8e7
	ds $1

wd8e8:: ; 0xd8e8
	ds $1

wd8e9:: ; 0xd8e9
	ds $1

wd8ea:: ; 0xd8ea
; IR status flags?
	ds $1

wd8eb:: ; 0xd8eb
	ds $1

wd8ec:: ; 0xd8ec
	ds $1

wd8ed:: ; 0xd8ed
	ds $1

wd8ee:: ; 0xd8ee
	ds $1

wd8ef:: ; 0xd8ef
	ds $1

wd8f0:: ; 0xd8f0
	ds $1

wCurrentScreen:: ; 0xd8f1
	ds $1

wScreenState:: ; 0xd8f2
	ds $1

	ds $3

wd8f6:: ; 0xd8f6
	ds $12

wd908:: ; 0xd908
	ds $1

wTitleScreenCursorSelection:: ; 0xd909
	ds $1

wTitleScreenGameStartCursorSelection:: ; 0xd90a
	ds $2

wTitleScreenBlinkAnimationFrame:: ; 0xd90c
	ds $1

wTitleScreenBlinkAnimationCounter:: ; 0xd90d
	ds $1

wTitleScreenBouncingBallAnimationFrame:: ; 0xd90e
	ds $1

wTitleScreenPokeballAnimationCounter:: ; 0xd90f
	ds $1

wd910:: ; 0xd910
	ds $1

wd911:: ; 0xd911
	ds $1

wFieldSelectBlinkingBorderTimer:: ; 0xd912
	ds $1

wSelectedFieldIndex:: ; 0xd913
	ds $1

wFieldSelectBlinkingBorderFrame:: ; 0xd914
	ds $1

wd915:: ; 0xd915
	ds $1

wd916:: ; 0xd916
	ds $1

wd917:: ; 0xd917
	ds $1

wd918:: ; 0xd918
	ds $1

wd919:: ; 0xd919
	ds $1

wSoundTestCurrentBackgroundMusic:: ; 0xd91a
	ds $1

wSoundTextCurrentSoundEffect:: ; 0xd91b
	ds $1

wd91c:: ; 0xd91c
	ds $1

wd91d:: ; 0xd91d
	ds $1

wd91e:: ; 0xd91e
	ds $1

wd91f:: ; 0xd91f
	ds $1

wd920:: ; 0xd920
	ds $1

wd921:: ; 0xd921
	ds $1

wd922:: ; 0xd922
	ds $14

wd936:: ; 0xd936
	ds $8

wd93e:: ; 0xd93e
	ds $1

wd93f:: ; 0xd93f
	ds $8

wd947:: ; 0xd947
	ds $1

wKeyConfigs::
wKeyConfigBallStart:: ; 0xd948
	ds $2

wKeyConfigLeftFlipper:: ; 0xd94a
	ds $2

wKeyConfigRightFlipper:: ; 0xd94c
	ds $2

wKeyConfigLeftTilt:: ; 0xd94e
	ds $2

wKeyConfigRightTilt:: ; 0xd950
	ds $2

wKeyConfigUpperTilt:: ; 0xd952
	ds $2

wKeyConfigMenu:: ; 0xd954
	ds $2

wd956:: ; 0xd956
	ds $1

wd957:: ; 0xd957
	ds $1

wd958:: ; 0xd958
	ds $1

wCurPokedexIndex:: ; 0xd959
	ds $1

wPokedexOffset:: ; 0xd95a
	ds $1

wd95b:: ; 0xd95b
	ds $1

wd95c:: ; 0xd95c
	ds $1

wd95d:: ; 0xd95d
	ds $1

wd95e:: ; 0xd95e
	ds $1

wd95f:: ; 0xd95f
	ds $1

wd960:: ; 0xd960
	ds $1

wd961:: ; 0xd961
	ds $1

wPokedexFlags:: ; 0xd962
	ds $96

wd9f8:: ; 0xd9f8
	ds $1

wNumPokemonSeen:: ; 0xd9f9
	ds $2

wNumPokemonOwned:: ; 0xd9fb
	ds $2

high_scores: MACRO
\1Points:: ds 6
\1Name:: ds 3
\1Id:: ds 4
ENDM

wRedHighScores:: ; 0xd9fd
	high_scores wRedHighScore1
	high_scores wRedHighScore2
	high_scores wRedHighScore3
	high_scores wRedHighScore4
	high_scores wRedHighScore5

wBlueHighScores:: ; 0xd9fd
	high_scores wBlueHighScore1
	high_scores wBlueHighScore2
	high_scores wBlueHighScore3
	high_scores wBlueHighScore4
	high_scores wBlueHighScore5

wda7f:: ; 0xda7f
	ds $1

wda80:: ; 0xda80
	ds $1

wda81:: ; 0xda81
	ds $1

wda82:: ; 0xda82
	ds $1

wHighScoresStage:: ; 0xda83
	ds $1

wHighScoresArrowAnimationCounter:: ; 0xda84
	ds $1

wda85:: ; 0xda85
	ds $1

wda86:: ; 0xda86
	ds $1

wSendHighScoresAnimation:: ; 0xda87
	animation wSendHighScoresAnimation

wda8a:: ; 0xda8a
	ds $2

wda8c:: ; 0xda8c
	ds $3

wda8f:: ; 0xda8f
	ds $3

wda92:: ; 0xda92
	ds $3

wda95:: ; 0xda95
	ds $3

wda98:: ; 0xda98
	ds $3

wda9b:: ; 0xda9b
	ds $3

wda9e:: ; 0xda9e
	ds $3

wdaa1:: ; 0xdaa1
	ds $1

wdaa2:: ; 0xdaa2
	ds $1

wBootCheck:: ; 0xdaa3
; Used to do a single check during first VBLANK.
	ds $1

; $25c bytes of free space

SECTION "Audio RAM", WRAMX
wdd00:: ; 0xdd00
	ds $1

wChannel0:: ; 0xdd01
	ds $32

wChannel1:: ; 0xdd33
	ds $32

wChannel2:: ; 0xdd65
	ds $32

wChannel3:: ; 0xdd97
	ds $32

wChannel4:: ; 0xddc9
	ds $32

wChannel5:: ; 0xddfb
	ds $32

wChannel6:: ; 0xde2d
	ds $32

wChannel7:: ; 0xde5f
	ds $32

wde91:: ; 0xde91
	ds $1

wde92:: ; 0xde92
	ds $1

wde93:: ; 0xde93
	ds $1

wde94:: ; 0xde94
	ds $1

wde95:: ; 0xde95
	ds $1

wde96:: ; 0xde96
	ds $1

wde97:: ; 0xde97
	ds $1

wde98:: ; 0xde98
	ds $1

wde99:: ; 0xde99
	ds $1

wde9a:: ; 0xde9a
	ds $1

wde9b:: ; 0xde9b
	ds $1

wde9c:: ; 0xde9c
	ds $1

wde9d:: ; 0xde9d
	ds $1

wde9e:: ; 0xde9e
	ds $1

wde9f:: ; 0xde9f
	ds $2

wdea1:: ; 0xdea1
	ds $1

wdea2:: ; 0xdea2
	ds $1

wdea3:: ; 0xdea3
	ds $1

wdea4:: ; 0xdea4
	ds $1

wdea5:: ; 0xdea5
	ds $3

wdea8:: ; 0xdea8
	ds $1

wdea9:: ; 0xdea9
	ds $1

wdeaa:: ; 0xdeaa
	ds $1

wdeab:: ; 0xdeab
	ds $1

wdeac:: ; 0xdeac
	ds $1

wdead:: ; 0xdead
	ds $1

wdeae:: ; 0xdeae
	ds $2

wMusicRAMEnd:: ; deb0
wdeb0:: ; 0xdeb0
	ds $50

SECTION "Stack", WRAMX
	ds $ff ;stack area

wStack:: ; 0xdfff
	ds 1
