!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:26:04'!
test01NewTicTacToeIsEmpty

	|game|
	
	game := TicTacToe new.
	
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:54:57'!
test02AGameWithOneMoveOnlyListsThatMove

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: game Os isEmpty.
	
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:55:51'!
test03CanMarkTwoPositionsCorrectly

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: 1 equals: game Os size.
	self assert: (game Os includes: 2@2).
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:27:30'!
test04XCantPlayTwoTimesInARow

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: game Os isEmpty.
		].
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:30:21'!
test05OCantPlayTwoTimesInARow

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putOAt: 3@3]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:51:41'!
test06CantMarkAPositionYouAlreadyMarked

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:57:47'!
test07XCantMarkOverOsFirstMove

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:58:13'!
test08OCantMarkOverXsFirstMove

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	self
	should: [game putOAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert:  game Os isEmpty.

		].
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:53:48'!
test09CantMarkLastPositionOMarked

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 3@3.
	self
	should: [game putOAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 2 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: (game Xs includes: 3@3).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		
		].
	! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:31:44'!
test10NoPlayerCanWinWithOnlyTwoMarks

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 3@3.
	
		self deny: game OHasWon.
		self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:32:38'!
test11XWinsAfterCompletingFirstRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@3.
	game putXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:32:29'!
test12XWinsAfterCompletingSecondRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 2@1.
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 2@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:32:54'!
test13XWinsAfterCompletingThirdRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 3@2.
	game putOAt: 2@1.
	game putXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:33:10'!
test14XWinsAfterCompletingFirstColumn

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 2@1.
	game putOAt: 3@3.
	game putXAt: 3@1.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:33:30'!
test15XWinsAfterCompletingFirstDiagonal

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 2@3.
	game putXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:56:20'!
test16XWinsAfterCompletingSecondDiagonal

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:34:13'!
test17OWinsAfterCompletingFirstRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
		self assert: game OHasWon.
		self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:56:54'!
test18OCannotPlayAfterTheGameEnded

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	
	game putXAt: 1@3.

	self 
		should: [ game putOAt: 3@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game Os size.
			self assert: (game Os includes: 2@1).
			self assert: (game Os includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:57:04'!
test19XCannotPlayAfterTheGameEnded

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 1@3.

	self 
		should: [ game putXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game Xs size.
			self assert: (game Xs includes: 2@2).
			self assert: (game Xs includes: 2@1).
			self assert: (game Xs includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:35:54'!
test20ACompleteGameWithoutThreeAlignedMarksIsTied

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 1@3.
	game putOAt: 3@1.
	game putXAt: 2@1.	
	game putOAt: 2@3.
	game putXAt: 1@2.	
	game putOAt: 3@2.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self deny: game XHasWon. 
	self deny: game OHasWon. 
	self assert: game isTied
! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/29/2018 04:36:20'!
test21WonGameIsNotTied

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@2.	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	game putXAt: 3@2.	
	game putOAt: 3@1.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self assert: game XHasWon. 
	self deny: game OHasWon. 
	self deny: game isTied
! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:50:23'!
test22XIsPlayingInTheFirstTurn

	| game |
	
	game := TicTacToe new.
	
	self assert: game isPlayingX.
	self deny: game isPlayingO.

! !

!TicTacToeTest methodsFor: 'tests' stamp: 'mv 5/31/2018 04:50:11'!
test23OIsPlayingInTheSecondTurn

	| game |
	
	game := TicTacToe new.
		
	game putXAt: 2@2.

	self assert: game isPlayingO.
	self deny: game isPlayingX.
	
! !


!classDefinition: #State category: #TicTacToStep21!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!State methodsFor: 'winning' stamp: 'mv 5/28/2018 21:03:07'!
OHasWon
	
	^ self subclassResponsibility ! !

!State methodsFor: 'winning' stamp: 'mv 5/28/2018 21:03:11'!
XHasWon
	
	^ self subclassResponsibility ! !


!State methodsFor: 'marking' stamp: 'MG 5/31/2018 12:08:36'!
isPlayingO

	^ self subclassResponsibility ! !

!State methodsFor: 'marking' stamp: 'MG 5/31/2018 12:08:46'!
isPlayingX

	^ self subclassResponsibility ! !

!State methodsFor: 'marking' stamp: 'mv 5/31/2018 05:13:00'!
isTied
	
	^ self subclassResponsibility ! !

!State methodsFor: 'marking' stamp: 'mv 5/28/2018 21:48:29'!
putO: aTicTacToe
	
	^ self subclassResponsibility ! !

!State methodsFor: 'marking' stamp: 'mv 5/28/2018 21:48:44'!
putX: aTicTacToe
	
	^ self subclassResponsibility ! !


!classDefinition: #TiedState category: #TicTacToStep21!
State subclass: #TiedState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TiedState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:50:23'!
OHasWon
	
	^ false! !

!TiedState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:50:30'!
XHasWon
	
	^ false! !

!TiedState methodsFor: 'winning' stamp: 'MG 5/31/2018 12:09:04'!
isPlayingO

	^false! !

!TiedState methodsFor: 'winning' stamp: 'MG 5/31/2018 12:09:12'!
isPlayingX

	^false! !

!TiedState methodsFor: 'winning' stamp: 'mv 5/31/2018 05:12:48'!
isTied

	^true! !


!TiedState methodsFor: 'marking' stamp: 'mv 5/31/2018 04:59:16'!
putO: aTicTacToe

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !

!TiedState methodsFor: 'marking' stamp: 'mv 5/31/2018 04:59:19'!
putX: aTicTacToe

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !


!classDefinition: #TurnOState category: #TicTacToStep21!
State subclass: #TurnOState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TurnOState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:50:08'!
OHasWon
	
	^ false! !

!TurnOState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:50:10'!
XHasWon
	
	^ false! !

!TurnOState methodsFor: 'winning' stamp: 'MG 5/31/2018 12:09:46'!
isPlayingO

	^true! !

!TurnOState methodsFor: 'winning' stamp: 'MG 5/31/2018 12:09:52'!
isPlayingX

	^false! !


!TurnOState methodsFor: 'marking' stamp: 'mv 5/31/2018 05:12:40'!
isTied

	^false! !

!TurnOState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:11:05'!
putO: aTicTacToe

	aTicTacToe changeTurnToX.! !

!TurnOState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:11:08'!
putX: aTicTacToe

	self error: TicTacToe notXTurnErrorMessage.

	
! !


!classDefinition: #TurnXState category: #TicTacToStep21!
State subclass: #TurnXState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TurnXState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:49:55'!
OHasWon
	
	^ false
! !

!TurnXState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:49:58'!
XHasWon
	
	^ false
! !

!TurnXState methodsFor: 'winning' stamp: 'MG 5/31/2018 12:10:20'!
isPlayingO

	^false! !

!TurnXState methodsFor: 'winning' stamp: 'MG 5/31/2018 12:10:25'!
isPlayingX

	^true! !


!TurnXState methodsFor: 'marking' stamp: 'mv 5/31/2018 05:12:35'!
isTied

	^false
	
! !

!TurnXState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:10:49'!
putO: aTicTacToe

	self error: TicTacToe notOTurnErrorMessage.

	
! !

!TurnXState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:10:54'!
putX: aTicTacToe

	aTicTacToe changeTurnToO.! !


!classDefinition: #WonOState category: #TicTacToStep21!
State subclass: #WonOState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!WonOState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:49:23'!
OHasWon
	
	^ true! !

!WonOState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:49:28'!
XHasWon
	
	^ false! !


!WonOState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:12:04'!
isPlayingO

	^false! !

!WonOState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:12:09'!
isPlayingX

	^false! !

!WonOState methodsFor: 'marking' stamp: 'mv 5/31/2018 05:12:30'!
isTied

	^false! !

!WonOState methodsFor: 'marking' stamp: 'mv 5/28/2018 21:47:56'!
putO: aTicTacToe

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !

!WonOState methodsFor: 'marking' stamp: 'mv 5/28/2018 21:48:06'!
putX: aTicTacToe

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !


!classDefinition: #WonXState category: #TicTacToStep21!
State subclass: #WonXState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!WonXState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:12:31'!
isPlayingO

	^false! !

!WonXState methodsFor: 'marking' stamp: 'MG 5/31/2018 12:12:38'!
isPlayingX

	^false! !

!WonXState methodsFor: 'marking' stamp: 'mv 5/31/2018 05:12:23'!
isTied

	^false! !

!WonXState methodsFor: 'marking' stamp: 'mv 5/28/2018 21:47:45'!
putO: aTicTacToe

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !

!WonXState methodsFor: 'marking' stamp: 'mv 5/28/2018 21:47:36'!
putX: aTicTacToe

	self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage! !


!WonXState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:49:40'!
OHasWon
	
	^ false! !

!WonXState methodsFor: 'winning' stamp: 'mv 5/28/2018 20:49:46'!
XHasWon
	
	^ true! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'marking' stamp: 'mv 5/28/2018 21:53:25'!
put: aPosition at: positions

	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].

	positions add: aPosition.
! !

!TicTacToe methodsFor: 'marking' stamp: 'MG 5/31/2018 12:36:14'!
putOAt: aPosition

	state putO: self.
	
	self put: aPosition at: os.
	
	(self hasWin: os) ifTrue: [ state := WonOState new ].
	(self isATie) ifTrue: [ state := TiedState new ].
! !

!TicTacToe methodsFor: 'marking' stamp: 'MG 5/31/2018 12:36:19'!
putXAt: aPosition

	state putX: self.
	
	self put: aPosition at: xs.
	
	(self hasWin: xs) ifTrue: [ state := WonXState new ].
	(self isATie) ifTrue: [ state := TiedState new ].! !


!TicTacToe methodsFor: 'structure' stamp: 'mv 5/28/2018 21:04:32'!
Os

	^ os copy.! !

!TicTacToe methodsFor: 'structure' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'structure' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'structure' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'structure' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'structure' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'structure' stamp: 'jg 5/22/2018 13:01:53'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]


! !

!TicTacToe methodsFor: 'structure' stamp: 'mv 5/28/2018 21:04:45'!
initialize

	xs _ Set new.
	os _ Set new.
	state _ TurnXState new.! !


!TicTacToe methodsFor: 'state' stamp: 'mv 5/28/2018 20:53:42'!
OHasWon
	
	^ state OHasWon! !

!TicTacToe methodsFor: 'state' stamp: 'mv 5/28/2018 20:53:54'!
XHasWon
	
	^ state XHasWon! !

!TicTacToe methodsFor: 'state' stamp: 'mv 5/28/2018 21:55:22'!
changeTurnToO

	state := TurnOState new.! !

!TicTacToe methodsFor: 'state' stamp: 'MG 5/31/2018 12:13:18'!
changeTurnToX

	state := TurnXState new.! !

!TicTacToe methodsFor: 'state' stamp: 'MG 5/31/2018 12:35:56'!
isATie
	
	^xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]] " and: [ self YHasWon not ]]]"! !

!TicTacToe methodsFor: 'state' stamp: 'mv 5/28/2018 20:15:11'!
isGameOver
	
	^self XHasWon or: [ self OHasWon ]! !

!TicTacToe methodsFor: 'state' stamp: 'mv 5/28/2018 21:20:33'!
isOver
	
	^self isGameOver or: [ self isTied ]
! !

!TicTacToe methodsFor: 'state' stamp: 'mv 5/31/2018 04:45:47'!
isPlayingO

	^state isPlayingO.! !

!TicTacToe methodsFor: 'state' stamp: 'mv 5/31/2018 04:45:41'!
isPlayingX

	^state isPlayingX.! !

!TicTacToe methodsFor: 'state' stamp: 'mv 5/31/2018 05:13:44'!
isTied
	
	^state isTied! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'mv 5/28/2018 18:54:02'!
notOTurnErrorMessage

	^'Not O turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !
