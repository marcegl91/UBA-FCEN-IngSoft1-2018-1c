!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #BaseElement category: #'Stack-Exercise'!
Object subclass: #BaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseElement methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 21:56:38'!
data
	
	^self error: OOStack stackEmptyErrorDescription.! !

!BaseElement methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 22:20:13'!
position
	
	^0! !

!BaseElement methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 21:57:29'!
previous
	
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #Element category: #'Stack-Exercise'!
Object subclass: #Element
	instanceVariableNames: 'data previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 21:30:47'!
data

	^data.! !

!Element methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 21:30:50'!
initalizeWith: anElement previous: aNode

	data _ anElement.
	previous _ aNode.! !

!Element methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 22:20:05'!
position

	^(1+ previous position)! !

!Element methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 21:30:53'!
previous

	^previous.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: #'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 20:11:26'!
with: anElement previous: aNode

	^self new initalizeWith: anElement previous: aNode! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 23:07:26'!
initialize
	size _ 0.
	top _ BaseElement new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 23:07:27'!
isEmpty
	^ top isKindOf: BaseElement.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 22:02:48'!
pop
	| aux |
	
	"(size = 0) ifTrue: [^self error: self class stackEmptyErrorDescription]."
	
	aux _ top.
	top _ top previous.
	size _ size - 1.
	
	" devuelver el booleano de la colaboracion en 0"
	"calcular el size"
	
	^aux data! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 23:07:08'!
push: anElement
	| aux |
	aux _ Element
		with: anElement
		previous: top.
	top _ aux.
	size _ size + 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 22:19:44'!
size

	^top position! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mv 4/23/2018 21:55:38'!
top

"	(size = 0) ifTrue: [^self error: self class stackEmptyErrorDescription]."
	^top data.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !
