!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'mv 4/13/2018 22:24:15'!
on: aBlock shouldNotTakeMoreThan: millisecondLimit

	|millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < millisecondLimit 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'mv 4/13/2018 22:24:22'!
on: aBlock shouldRaise: anExceptionType asserting: someAssertions

	[ aBlock value . self fail ]
		on: anExceptionType 
		do: someAssertions! !

!IdiomTest methodsFor: 'testing' stamp: 'MG 4/12/2018 21:44:12'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	| customerBook |
	customerBook := CustomerBook  new.
	
	self on: [customerBook addCustomerNamed: 'John Lennon'] shouldNotTakeMoreThan: 50.
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'MG 4/12/2018 21:44:25'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook  paulMcCartney |
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self on: [customerBook removeCustomerNamed: paulMcCartney.]  shouldNotTakeMoreThan: 100.
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'MG 4/12/2018 22:06:07'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self on: [ customerBook addCustomerNamed: '' ]
	       shouldRaise: Error
	       asserting: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!IdiomTest methodsFor: 'testing' stamp: 'MG 4/12/2018 22:06:57'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self on: [ customerBook removeCustomerNamed: 'Paul McCartney' ]
		  shouldRaise: NotFound
		  asserting:  [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ] .
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
