!classDefinition: #ConsoleTest category: #TicTacToe!
TestCase subclass: #ConsoleTest
	instanceVariableNames: 'console ticTacToe'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!ConsoleTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:59:27'!
test01AfterMarkingWithXConsoleLogsMarkAndNextPlayer

	ticTacToe _ TicTacToe new.
	console _ Console for: ticTacToe.
	ticTacToe addListener: console.
	
	ticTacToe markWithXAt: 2@2.
		
	self assert: 2 equals: console show size.
	
	self assert: 'X marcó en 2@2' equals: (console show at: 1).
	self assert: 'Estado: Jugando O' equals: (console show at: 2).
	
	! !

!ConsoleTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:59:40'!
test02AfterMarkingWithOConsoleLogsMarkAndNextPlayer

	ticTacToe _ TicTacToe new.
	console _ Console for: ticTacToe.
	ticTacToe addListener: console.
	
	ticTacToe markWithXAt: 2@2.
	ticTacToe markWithOAt: 1@1.
		
	self assert: 4 equals: console show size.
	
	self assert: 'X marcó en 2@2' equals: (console show at: 1).
	self assert: 'Estado: Jugando O' equals: (console show at: 2).
	self assert: 'O marcó en 1@1' equals: (console show at: 3).
	self assert: 'Estado: Jugando X' equals: (console show at: 4).
	

! !

!ConsoleTest methodsFor: 'testing' stamp: 'MG 6/4/2018 15:00:00'!
test03AfterThreeMarksConsoleLogsEveryMarkAndEveryNextPlayer

	ticTacToe _ TicTacToe new.
	console _ Console for: ticTacToe.
	ticTacToe addListener: console.
	
	ticTacToe markWithXAt: 2@2.
	ticTacToe markWithOAt: 1@1.
	ticTacToe markWithXAt: 1@3.
		
	self assert: 6 equals: console show size.
	
	self assert: 'X marcó en 2@2' equals: (console show at: 1).
	self assert: 'Estado: Jugando O' equals: (console show at: 2).
	self assert: 'O marcó en 1@1' equals: (console show at: 3).
	self assert: 'Estado: Jugando X' equals: (console show at: 4).
	self assert: 'X marcó en 1@3' equals: (console show at: 5).
	self assert: 'Estado: Jugando O' equals: (console show at: 6).! !

!ConsoleTest methodsFor: 'testing' stamp: 'MG 6/4/2018 15:00:19'!
test04AfterWinningWithXConsoleLogsMarkAndWinnerPlayer

	ticTacToe _ TicTacToe new.
	console _ Console for: ticTacToe.
	ticTacToe addListener: console.
	
	ticTacToe markWithXAt: 2@2.
	ticTacToe markWithOAt: 1@1.
	ticTacToe markWithXAt: 1@3.
	ticTacToe markWithOAt: 1@2.
	ticTacToe markWithXAt: 3@1.

	self assert: 10 equals: console show size.
	
	self assert: 'X marcó en 2@2' equals: (console show at: 1).
	self assert: 'Estado: Jugando O' equals: (console show at: 2).
	self assert: 'O marcó en 1@1' equals: (console show at: 3).
	self assert: 'Estado: Jugando X' equals: (console show at: 4).
	self assert: 'X marcó en 1@3' equals: (console show at: 5).
	self assert: 'Estado: Jugando O' equals: (console show at: 6).
	self assert: 'O marcó en 1@2' equals: (console show at: 7).
	self assert: 'Estado: Jugando X' equals: (console show at: 8).
	self assert: 'X marcó en 3@1' equals: (console show at: 9).
	self assert: 'Estado: Juego terminado - Ganó X!!' equals: (console show at: 10).! !

!ConsoleTest methodsFor: 'testing' stamp: 'MG 6/4/2018 15:00:42'!
test05AfterWinningWithOConsoleLogsMarkAndWinnerPlayer

	ticTacToe _ TicTacToe new.
	console _ Console for: ticTacToe.
	ticTacToe addListener: console.
	
	ticTacToe markWithXAt: 2@2.
	ticTacToe markWithOAt: 1@1.
	ticTacToe markWithXAt: 2@3.
	ticTacToe markWithOAt: 1@2.
	ticTacToe markWithXAt: 3@2.
	ticTacToe markWithOAt: 1@3.

	self assert: 12 equals: console show size.
	
	self assert: 'X marcó en 2@2' equals: (console show at: 1).
	self assert: 'Estado: Jugando O' equals: (console show at: 2).
	self assert: 'O marcó en 1@1' equals: (console show at: 3).
	self assert: 'Estado: Jugando X' equals: (console show at: 4).
	self assert: 'X marcó en 2@3' equals: (console show at: 5).
	self assert: 'Estado: Jugando O' equals: (console show at: 6).
	self assert: 'O marcó en 1@2' equals: (console show at: 7).
	self assert: 'Estado: Jugando X' equals: (console show at: 8).
	self assert: 'X marcó en 3@2' equals: (console show at: 9).
	self assert: 'Estado: Jugando O' equals: (console show at: 10).
	self assert: 'O marcó en 1@3' equals: (console show at: 11).
	self assert: 'Estado: Juego terminado - Ganó O!!' equals: (console show at: 12).! !

!ConsoleTest methodsFor: 'testing' stamp: 'MG 6/4/2018 15:01:11'!
test06AfterTieWithXConsoleLogsMarkAndGameTied

	ticTacToe _ TicTacToe new.
	console _ Console for: ticTacToe.
	ticTacToe addListener: console.
	
	ticTacToe markWithXAt: 2@2.
	ticTacToe markWithOAt: 1@1.
	ticTacToe markWithXAt: 1@3.
	ticTacToe markWithOAt: 3@1.
	ticTacToe markWithXAt: 2@1.
	ticTacToe markWithOAt: 2@3.
	ticTacToe markWithXAt: 1@2.
	ticTacToe markWithOAt: 3@2.
	ticTacToe markWithXAt: 3@3.

	self assert: 18 equals: console show size.
	
	self assert: 'X marcó en 2@2' equals: (console show at: 1).
	self assert: 'Estado: Jugando O' equals: (console show at: 2).
	self assert: 'O marcó en 1@1' equals: (console show at: 3).
	self assert: 'Estado: Jugando X' equals: (console show at: 4).
	self assert: 'X marcó en 1@3' equals: (console show at: 5).
	self assert: 'Estado: Jugando O' equals: (console show at: 6).
	self assert: 'O marcó en 3@1' equals: (console show at: 7).
	self assert: 'Estado: Jugando X' equals: (console show at: 8).
	self assert: 'X marcó en 2@1' equals: (console show at: 9).
	self assert: 'Estado: Jugando O' equals: (console show at: 10).
	self assert: 'O marcó en 2@3' equals: (console show at: 11).
	self assert: 'Estado: Jugando X' equals: (console show at: 12).
	self assert: 'X marcó en 1@2' equals: (console show at: 13).
	self assert: 'Estado: Jugando O' equals: (console show at: 14).
	self assert: 'O marcó en 3@2' equals: (console show at: 15).
	self assert: 'Estado: Jugando X' equals: (console show at: 16).
	self assert: 'X marcó en 3@3' equals: (console show at: 17).
	self assert: 'Estado: Juego terminado - Empate!!' equals: (console show at: 18).! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #ViewTest category: #TicTacToe!
TestCase subclass: #ViewTest
	instanceVariableNames: 'view ticTacToe'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!ViewTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:49:29'!
test01ViewStartsWithAnEmptyBoardAndShowsNextPlayer

	ticTacToe _ TicTacToe new.	
	view _ View for: ticTacToe.
	ticTacToe addListener: view.
			
	self assert: 6 equals: view show size.

	self assert: ' | | ' equals: (view show at: 1).
	self assert: '-----' equals: (view show at: 2).
	self assert: ' | | ' equals: (view show at: 3).
	self assert: '-----' equals: (view show at: 4).
	self assert: ' | | ' equals: (view show at: 5).
	self assert: 'Playing X' equals: (view show at: 6).
	! !

!ViewTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:50:30'!
test02AfterMarkingWithXViewShowsMarkAndNextPlayer

	ticTacToe _ TicTacToe new.	
	view _ View for: ticTacToe.
	ticTacToe addListener: view.
			
	self assert: 6 equals: view show size.
	
	ticTacToe markWithXAt: 1@1.

	self assert: 'X| | ' equals: (view show at: 1).
	self assert: '-----' equals: (view show at: 2).
	self assert: ' | | ' equals: (view show at: 3).
	self assert: '-----' equals: (view show at: 4).
	self assert: ' | | ' equals: (view show at: 5).
	self assert: 'Playing O' equals: (view show at: 6).! !

!ViewTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:50:45'!
test03AfterMarkingWithOViewShowsMarkAndNextPlayer

	ticTacToe _ TicTacToe new.	
	view _ View for: ticTacToe.
	ticTacToe addListener: view.
			
	self assert: 6 equals: view show size.
	
	ticTacToe markWithXAt: 1@1.
	ticTacToe markWithOAt: 1@2.


	self assert: 'X|O| ' equals: (view show at: 1).
	self assert: '-----' equals: (view show at: 2).
	self assert: ' | | ' equals: (view show at: 3).
	self assert: '-----' equals: (view show at: 4).
	self assert: ' | | ' equals: (view show at: 5).
	self assert: 'Playing X' equals: (view show at: 6).! !

!ViewTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:51:26'!
test04AfterThreeMarksViewShowsEveryMarkAndNextPlayer

	ticTacToe _ TicTacToe new.	
	view _ View for: ticTacToe.
	ticTacToe addListener: view.
			
	self assert: 6 equals: view show size.
	
	ticTacToe markWithXAt: 1@1.
	ticTacToe markWithOAt: 1@2.
	ticTacToe markWithXAt: 2@1.
	ticTacToe markWithOAt: 3@2.


	self assert: 'X|O| ' equals: (view show at: 1).
	self assert: '-----' equals: (view show at: 2).
	self assert: 'X| | ' equals: (view show at: 3).
	self assert: '-----' equals: (view show at: 4).
	self assert: ' |O| ' equals: (view show at: 5).
	self assert: 'Playing X' equals: (view show at: 6).! !

!ViewTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:53:47'!
test05AfterWinningWithXViewShowsMarkAndWinnerPlayer

	ticTacToe _ TicTacToe new.	
	view _ View for: ticTacToe.
	ticTacToe addListener: view.
			
	self assert: 6 equals: view show size.
	
	ticTacToe markWithXAt: 1@1.
	ticTacToe markWithOAt: 1@2.
	ticTacToe markWithXAt: 1@3.
	ticTacToe markWithOAt: 2@1.
	ticTacToe markWithXAt: 2@2.
	ticTacToe markWithOAt: 2@3.
	ticTacToe markWithXAt: 3@1.


	self assert: 'X|O|X' equals: (view show at: 1).
	self assert: '-----' equals: (view show at: 2).
	self assert: 'O|X|O' equals: (view show at: 3).
	self assert: '-----' equals: (view show at: 4).
	self assert: 'X| | ' equals: (view show at: 5).
	self assert: 'X Won!!' equals: (view show at: 6).! !

!ViewTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:54:10'!
test06AfterWinningWithOViewShowsMarkAndWinnerPlayer

	ticTacToe _ TicTacToe new.	
	view _ View for: ticTacToe.
	ticTacToe addListener: view.
			
	self assert: 6 equals: view show size.
	
	ticTacToe markWithXAt: 1@1.
	ticTacToe markWithOAt: 2@1.
	
	ticTacToe markWithXAt: 1@2.
	ticTacToe markWithOAt: 2@2.
	
	ticTacToe markWithXAt: 3@1.
	ticTacToe markWithOAt: 2@3.
	
	self assert: 'X|X| ' equals: (view show at: 1).
	self assert: '-----' equals: (view show at: 2).
	self assert: 'O|O|O' equals: (view show at: 3).
	self assert: '-----' equals: (view show at: 4).
	self assert: 'X| | ' equals: (view show at: 5).
	self assert: 'O Won!!' equals: (view show at: 6).! !

!ViewTest methodsFor: 'testing' stamp: 'MG 6/4/2018 14:54:31'!
test07AfterTieWithXViewShowsMarkAndGameTied

	ticTacToe _ TicTacToe new.	
	view _ View for: ticTacToe.
	ticTacToe addListener: view.
			
	self assert: 6 equals: view show size.
	
	ticTacToe markWithXAt: 1@1.
	ticTacToe markWithOAt: 2@1.
	
	ticTacToe markWithXAt: 1@2.
	ticTacToe markWithOAt: 2@2.
	
	ticTacToe markWithXAt: 3@1.
	ticTacToe markWithOAt: 1@3.
	
	ticTacToe markWithXAt: 3@3.
	ticTacToe markWithOAt: 3@2.
	
	ticTacToe markWithXAt: 2@3.
	
	self assert: 'X|X|O' equals: (view show at: 1).
	self assert: '-----' equals: (view show at: 2).
	self assert: 'O|O|X' equals: (view show at: 3).
	self assert: '-----' equals: (view show at: 4).
	self assert: 'X|O|X' equals: (view show at: 5).
	self assert: 'Tied' equals: (view show at: 6).! !


!classDefinition: #Listener category: #TicTacToe!
Object subclass: #Listener
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!Listener methodsFor: 'logging' stamp: 'MG 6/4/2018 14:34:26'!
notify

	self subclassResponsibility! !


!Listener methodsFor: 'output' stamp: 'MG 6/4/2018 14:34:54'!
show

	self subclassResponsibility! !

!Listener methodsFor: 'output' stamp: 'MG 6/4/2018 16:41:57'!
visitGameTied

	self subclassResponsibility! !

!Listener methodsFor: 'output' stamp: 'MG 6/4/2018 16:42:02'!
visitPlayerOWon

	self subclassResponsibility! !

!Listener methodsFor: 'output' stamp: 'MG 6/4/2018 16:42:05'!
visitPlayerXWon

	self subclassResponsibility! !

!Listener methodsFor: 'output' stamp: 'MG 6/4/2018 16:42:09'!
visitPlayingO

	self subclassResponsibility! !

!Listener methodsFor: 'output' stamp: 'MG 6/4/2018 16:42:11'!
visitPlayingX

	self subclassResponsibility! !


!classDefinition: #Console category: #TicTacToe!
Listener subclass: #Console
	instanceVariableNames: 'ticTacToe log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!Console methodsFor: 'initialization' stamp: 'MG 5/31/2018 19:50:25'!
initializeFor: aTicTacToe

	ticTacToe _ aTicTacToe.
	log _ OrderedCollection new.
! !


!Console methodsFor: 'logging' stamp: 'MG 6/4/2018 16:40:02'!
notify

	log add: ticTacToe lastUsedSymbol , ' marcó en ' , ticTacToe lastMove printString.
	ticTacToe state accept: self.! !

!Console methodsFor: 'logging' stamp: 'MG 6/4/2018 16:38:29'!
visitGameTied

	log add: 'Estado: Juego terminado - Empate!!' ! !

!Console methodsFor: 'logging' stamp: 'MG 6/4/2018 16:36:01'!
visitPlayerOWon

	log add: 'Estado: Juego terminado - Ganó O!!' ! !

!Console methodsFor: 'logging' stamp: 'MG 6/4/2018 16:35:53'!
visitPlayerXWon

	log add: 'Estado: Juego terminado - Ganó X!!' ! !

!Console methodsFor: 'logging' stamp: 'MG 6/4/2018 16:37:57'!
visitPlayingO

	log add: 'Estado: Jugando O'.! !

!Console methodsFor: 'logging' stamp: 'MG 6/4/2018 16:38:02'!
visitPlayingX

	log add: 'Estado: Jugando X'.! !


!Console methodsFor: 'output' stamp: 'MG 6/4/2018 14:29:10'!
show

	^log copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Console class' category: #TicTacToe!
Console class
	instanceVariableNames: ''!

!Console class methodsFor: 'instance creation' stamp: 'MG 5/31/2018 19:35:07'!
for: aTicTacToe

	^ self new initializeFor: aTicTacToe.
! !


!classDefinition: #View category: #TicTacToe!
Listener subclass: #View
	instanceVariableNames: 'ticTacToe board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!View methodsFor: 'initialization' stamp: 'MG 6/4/2018 15:08:56'!
initializeFor: aTicTacToe

	ticTacToe := aTicTacToe.
	
	board := Array2D newSize: 3@3.
	board i:1 j:1 put:' '.
	board i:1 j:2 put:' '.
	board i:1 j:3 put:' '.
	board i:2 j:1 put:' '.
	board i:2 j:2 put:' '.
	board i:2 j:3 put:' '.
	board i:3 j:1 put:' '.
	board i:3 j:2 put:' '.
	board i:3 j:3 put:' '.! !


!View methodsFor: 'logging' stamp: 'mv 6/4/2018 07:40:35'!
buildRow: aRow
	
	^(board i: aRow j: 1) , '|' , (board i: aRow j: 2) , '|' , (board i: aRow j: 3)! !

!View methodsFor: 'logging' stamp: 'MG 6/4/2018 14:56:55'!
notify
	
	board
		i: ticTacToe lastMove x
		j: ticTacToe lastMove y
		put: ticTacToe lastUsedSymbol.
	! !


!View methodsFor: 'output' stamp: 'MG 6/4/2018 16:49:45'!
show

	|boardView|
	
	boardView _ OrderedCollection new.	
	
	boardView add: (self buildRow: 1).
	boardView add: '-----'.
	boardView add: (self buildRow: 2).
	boardView add: '-----'.
	boardView add: (self buildRow: 3).
		
	boardView add: (ticTacToe state accept: self).
		
	^boardView
! !

!View methodsFor: 'output' stamp: 'MG 6/4/2018 16:48:56'!
visitGameTied

	^'Tied'! !

!View methodsFor: 'output' stamp: 'MG 6/4/2018 16:48:49'!
visitPlayerOWon

	^'O Won!!'! !

!View methodsFor: 'output' stamp: 'MG 6/4/2018 16:48:40'!
visitPlayerXWon

	^'X Won!!'! !

!View methodsFor: 'output' stamp: 'MG 6/4/2018 16:48:21'!
visitPlayingO

	^'Playing O'! !

!View methodsFor: 'output' stamp: 'MG 6/4/2018 16:48:07'!
visitPlayingX

	^'Playing X'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'View class' category: #TicTacToe!
View class
	instanceVariableNames: ''!

!View class methodsFor: 'instance creation' stamp: 'mv 6/2/2018 19:27:51'!
for: aTicTacToe

	^ self new initializeFor: aTicTacToe.
! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions listeners lastMove'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'MG 6/4/2018 16:53:59'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.
	listeners _ OrderedCollection new.
	lastMove := ' '.! !


!TicTacToe methodsFor: 'marking board' stamp: 'mv 6/4/2018 07:15:12'!
lastMove
	^lastMove copy.! !

!TicTacToe methodsFor: 'marking board' stamp: 'mv 6/4/2018 08:02:13'!
lastUsedSymbol
	^ state lastUsedSymbol.! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'mv 6/4/2018 06:58:32'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.
	
	lastMove := aPosition.

	self notify.! !

!TicTacToe methodsFor: 'marking board' stamp: 'mv 6/4/2018 06:58:16'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.
	
	lastMove := aPosition.
	
	self notify.! !

!TicTacToe methodsFor: 'marking board' stamp: 'mv 6/4/2018 07:47:08'!
won
	^self hasPlayerXWon or: [self hasPlayerOWon].! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'JG 5/12/2018 12:34:04'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'MG 5/31/2018 20:28:25'!
notify
	
	listeners do: [ :aListener | aListener notify ].! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'MG 5/31/2018 20:26:01'!
addListener: aListener

	listeners add: aListener.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'MG 6/4/2018 16:39:11'!
state
	^state! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'MG 6/4/2018 16:26:16'!
accept: aListener

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'MG 6/4/2018 16:34:31'!
accept: aListener

	^ aListener visitGameTied! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !

!GameTied methodsFor: 'testing game result' stamp: 'mv 6/4/2018 08:01:20'!
lastUsedSymbol

	^'X'! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'MG 6/4/2018 16:34:37'!
accept: aListener

	^ aListener visitPlayerOWon! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'mv 6/4/2018 08:01:15'!
lastUsedSymbol

	^'O'! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'MG 6/4/2018 16:34:44'!
accept: aListener

	^ aListener visitPlayerXWon! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'mv 6/4/2018 08:01:10'!
lastUsedSymbol

	^'X'! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'MG 6/4/2018 16:34:52'!
accept: aListener

	^ aListener visitPlayingO! !

!PlayingO methodsFor: 'marking board' stamp: 'mv 6/4/2018 08:00:54'!
lastUsedSymbol

	^'X'! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'MG 6/4/2018 16:34:59'!
accept: aListener

	^ aListener visitPlayingX! !

!PlayingX methodsFor: 'marking board' stamp: 'mv 6/4/2018 08:01:01'!
lastUsedSymbol

	^'O'! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !
