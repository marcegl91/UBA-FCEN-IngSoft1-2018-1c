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

!BaseElement methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:08:06'!
content
	
	^self error: OOStack stackEmptyErrorDescription! !

!BaseElement methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 22:20:13'!
position
	
	^0! !

!BaseElement methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:08:00'!
previous
	
	^self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #Element category: #'Stack-Exercise'!
Object subclass: #Element
	instanceVariableNames: 'content previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:05:49'!
content

	^content! !

!Element methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:08:27'!
initalizeWith: someContent after: aPreviousElement

	content _ someContent.
	previous _ aPreviousElement! !

!Element methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 10:37:32'!
position

	^(1 + previous position)! !

!Element methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:06:34'!
previous

	^previous! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: #'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:07:00'!
with: someContent after: aPreviousElement

	^self new initalizeWith: someContent after: aPreviousElement.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:03:01'!
initialize

	top _ BaseElement new! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:03:07'!
isEmpty

	^ self size = 0! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:02:56'!
pop
	| aux |
		
	aux _ top.
	top _ top previous.
	
	^aux content! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:13:18'!
push: someContent
	| aux |
	
	aux _ Element
		with: someContent
		after: top.
		
	top _ aux! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mv martin ventura 4/25/2018 22:19:44'!
size

	^top position! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 4/26/2018 11:03:57'!
top

	^top content! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !
