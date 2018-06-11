!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'mv 6/7/2018 19:33:17'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'MG 6/11/2018 15:40:16'!
test09CartTotalComputesSumOfPricesOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: cart total equals: 10! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'MG 6/11/2018 15:11:56'!
defaultCatalog
	
	^ Dictionary with: self itemSellByTheStore -> 5! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'MG 6/11/2018 14:58:36'!
test01CanNotCheckoutEmptyCart

	| cashier cart |
	
	cart := self createCart.
	
	cashier := Cashier new.
		
	self 
		should: [ cashier checkout: cart withCreditCard: FixedGregorianDate tomorrow. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cannotCheckoutEmptyCartErrorMessage]! !

!CashierTest methodsFor: 'tests' stamp: 'MG 6/11/2018 15:00:53'!
test02CanCheckoutACartWithOneProductAndANotExpiredCreditCard

	| cashier cart |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.

	cashier := Cashier new.

	self assert: (cashier checkout: cart withCreditCard: FixedGregorianDate tomorrow).! !

!CashierTest methodsFor: 'tests' stamp: 'MG 6/11/2018 15:00:18'!
test03CanNotCheckoutWithExpiredCard

	| cashier cart |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	
	cashier := Cashier new.
		
	self 
		should: [ cashier checkout: cart withCreditCard: FixedGregorianDate yesterday. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cannotCheckoutWithExpiredCardErrorMessage]! !


!CashierTest methodsFor: 'support' stamp: 'mv 6/7/2018 19:15:46'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CashierTest methodsFor: 'support' stamp: 'MG 6/11/2018 14:55:06'!
defaultCatalog
	
	^ Dictionary with: self itemSellByTheStore -> 5! !

!CashierTest methodsFor: 'support' stamp: 'mv 6/7/2018 19:16:01'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'MG 6/11/2018 15:13:12'!
assertIsValidItem: anItem

	(catalog keys includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'MG 6/11/2018 14:53:58'!
total

	^items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!Cashier methodsFor: 'assertions' stamp: 'MG 6/11/2018 14:19:01'!
assertCartIsNotEmpty: aCart
	
	aCart isEmpty ifTrue: [ self error: self class cannotCheckoutEmptyCartErrorMessage ]! !

!Cashier methodsFor: 'assertions' stamp: 'MG 6/11/2018 14:27:30'!
assertCreditCardHasNotExpired: aCreditCard
	
	aCreditCard < FixedGregorianDate today ifTrue: [ self error: self class cannotCheckoutWithExpiredCardErrorMessage ]! !


!Cashier methodsFor: 'accessing' stamp: 'MG 6/11/2018 14:54:16'!
checkout: aCart withCreditCard: aCreditCard

	self assertCartIsNotEmpty: aCart.
	self assertCreditCardHasNotExpired: aCreditCard.
	self debit: (aCart total) from: aCreditCard.
	
	^ true! !

!Cashier methodsFor: 'accessing' stamp: 'MG 6/11/2018 14:20:50'!
debit: anAmount from: aCreditCard
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'mv 6/7/2018 19:37:13'!
cannotCheckoutEmptyCartErrorMessage
	^'Cannot checkout an empty cart.'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'mv 6/11/2018 06:46:49'!
cannotCheckoutWithExpiredCardErrorMessage
	^'Cannot checkout with an expired card.'! !
