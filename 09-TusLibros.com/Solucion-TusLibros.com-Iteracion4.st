!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #InterfaceTest category: #TusLibros!
TestCase subclass: #InterfaceTest
	instanceVariableNames: 'interface loginBehaviour testObjectsFactory checkOutBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'mv 6/18/2018 08:32:36'!
debit: anAmount from: aCreditCard ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'mv 6/18/2018 07:39:13'!
setUp

	testObjectsFactory := StoreTestObjectsFactory new.
	
	interface := Interface with: testObjectsFactory defaultUserList and: testObjectsFactory defaultCatalog.
! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 15:44:57'!
test01CreateCartReturnsCartId
	
	
	self assert: (interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: Time now) equals: 0.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 15:45:18'!
test02CanNotCreateACartWhenUserDoesntExist
		
	self 
		should: [ interface createCartOf: testObjectsFactory nonExistentUser key with: testObjectsFactory nonExistentUser value on: Time now ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface canNotCreateACartWhenUserDoesntExistErrorMessage]! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 15:45:29'!
test03CanNotCreateACartWhenPasswordIsIncorrect
	
	self 
		should: [ interface createCartOf: testObjectsFactory validUserWithIncorrectPassword key with: testObjectsFactory validUserWithIncorrectPassword value on: Time now ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface canNotCreateACartWhenPasswordIsIncorrectErrorMessage]! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:12:28'!
test04NewCartIsEmpty
	
	|id|
		
	id := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.
	
	self assert: (interface listCart: id) isEmpty. ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:12:32'!
test05AddingAProductToACartAppearsWhenListingThatCart
	
	|cart|
		
	cart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.
	
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cart.
	
	self assert: ((interface listCart: cart) at: testObjectsFactory itemSellByTheStore) equals: 1. ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:12:37'!
test06AddingTwoProductsToACartAppearWhenListingThatCart
	
	|cart|
			
	cart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.
	
	interface add: 2 of: testObjectsFactory itemSellByTheStore to: cart.
	
	self assert: ((interface listCart: cart) at: testObjectsFactory itemSellByTheStore) equals: 2. ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:12:43'!
test07CheckOutAnswersTransactionId
	
	|cart|
	
	 cart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.
	
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cart.
	
	self assert: (interface checkOutCart: cart charging: testObjectsFactory notExpiredCreditCard throught: self on: testObjectsFactory today) equals: cart.
	! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:12:47'!
test08CanNotCheckoutMoreThanOnce
	
	|cart|
	
	 cart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.
	
	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cart.
	
	interface checkOutCart: cart charging: testObjectsFactory notExpiredCreditCard throught: self on: testObjectsFactory today.
	
	self 
		should: [ interface checkOutCart: cart charging: testObjectsFactory notExpiredCreditCard throught: self on: testObjectsFactory today ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Interface canNotCheckoutACartMoreThanOnce ]	! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:12:52'!
test09ListPurchasesRegistersSales
	
	|cart purchasesList|
	
	 cart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.

	interface add: 2 of: testObjectsFactory itemSellByTheStore to: cart.
	
	interface checkOutCart: cart charging: testObjectsFactory notExpiredCreditCard throught: self on:  testObjectsFactory today.
	
	purchasesList := interface listPurchasesOf: testObjectsFactory validUser key with: testObjectsFactory validUser value.
	
	self assert: purchasesList size equals: 2.
	self assert: (purchasesList at: testObjectsFactory itemSellByTheStore) equals: 2.
	self assert: (purchasesList at: 'total') equals: 20.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:12:59'!
test10MultiplePurchasesFromTheSameCustomerAreCorrectlyRegistered
	
	|cart otherCart purchasesList|
	
	 cart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.

	interface add: 2 of: testObjectsFactory itemSellByTheStore to: cart.
	
	interface checkOutCart: cart charging: testObjectsFactory notExpiredCreditCard throught: self on:  testObjectsFactory today.
	
	otherCart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: DateAndTime now.
	
	interface add: 5 of: testObjectsFactory itemSellByTheStore to: otherCart.
	
	interface checkOutCart: otherCart charging: testObjectsFactory notExpiredCreditCard throught: self on:  testObjectsFactory today.
	
	purchasesList := interface listPurchasesOf: testObjectsFactory validUser key with: testObjectsFactory validUser value.
	
	self assert: purchasesList size equals: 2.
	self assert: (purchasesList at: testObjectsFactory itemSellByTheStore) equals: 7.
	self assert: (purchasesList at: 'total') equals: 70.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:11:45'!
test11CheckoutAfter30MinutesShouldRaiseAnErrorByInactivity
	
	|cart|
	
	 cart := interface createCartOf: testObjectsFactory validUser key with: testObjectsFactory validUser value on: ((DateAndTime now) - 31 minutes).
	
	self 
		should: [ interface add: 2 of: testObjectsFactory itemSellByTheStore to: cart. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = CartOfInterface cantBeUsedWhenHasExpired ]! !


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


!Cart methodsFor: 'assertions' stamp: 'MG 6/18/2018 12:59:17'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

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


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


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


!classDefinition: #CartOfInterface category: #TusLibros!
Object subclass: #CartOfInterface
	instanceVariableNames: 'cart lastUpdated user sale'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartOfInterface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:11:14'!
assertHasNotExpired

	((DateAndTime now) > (lastUpdated + (30 minutes))) ifTrue: [ self error: self class cantBeUsedWhenHasExpired ]! !

!CartOfInterface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 17:01:44'!
doesNotUnderstand: aMessage

	self assertHasNotExpired.

	lastUpdated := DateAndTime now.

	^aMessage sendTo: cart.! !

!CartOfInterface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 16:43:03'!
initializeWith: aCart createdAt: aTime by: anUser

	cart := aCart.
	lastUpdated := aTime.
	user := anUser.
	sale := Sale of: 0.! !

!CartOfInterface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 16:43:20'!
registerSale: aSale

	sale := aSale.! !

!CartOfInterface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 16:42:50'!
sale

	self assertHasNotExpired.

	^sale! !

!CartOfInterface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 15:58:21'!
user

	self assertHasNotExpired.

	^user! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartOfInterface class' category: #TusLibros!
CartOfInterface class
	instanceVariableNames: ''!

!CartOfInterface class methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 15:53:14'!
cantBeUsedWhenHasExpired

	^'Cart cant be used when has expired'! !

!CartOfInterface class methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 15:31:44'!
with: aCart createdAt: aTime by: anUser

	^self new initializeWith: aCart createdAt: aTime by: anUser.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Interface category: #TusLibros!
Object subclass: #Interface
	instanceVariableNames: 'userList carts catalog lastIdGiven checkoutCarts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 13:28:03'!
add: aQuantity of: anItem to: aCart

	(carts at: aCart) add: aQuantity of: anItem.! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 16:09:13'!
assertCartHasNotAlreadyBeenInACheckout: aCart

	(checkoutCarts includes: aCart) ifTrue: [self error: self class canNotCheckoutACartMoreThanOnce ].! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 12:47:32'!
assertUser: aClientId canBeIdentifiedWith: aPassword

	(userList at: aClientId) = aPassword ifFalse: [self error: self class canNotCreateACartWhenPasswordIsIncorrectErrorMessage].! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 12:46:39'!
assertUserExists: aClientId

	(userList includesKey: aClientId) ifFalse: [self error: self class canNotCreateACartWhenUserDoesntExistErrorMessage]! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 16:39:53'!
checkOutCart: cartId charging: aCreditCard throught: aMerchantProcessor on: aDate

	|cashier cart transaction|
	
	cart := carts at: cartId.
	
	self assertCartHasNotAlreadyBeenInACheckout: cart.
	
	transaction := OrderedCollection new.
	
	cashier := Cashier toCheckout: cart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: transaction.

	cashier checkOut.
	checkoutCarts add: cart.
	cart registerSale: transaction first.

	^cartId





! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 15:35:41'!
createCartOf: aClientId with: aPassword on: aTime

	|cartOfInterface|

	self assertUserExists: aClientId.
	self assertUser: aClientId canBeIdentifiedWith: aPassword.
	
	cartOfInterface := CartOfInterface with: (Cart acceptingItemsOf: catalog) createdAt: aTime by: aClientId.
	
	carts add: lastIdGiven -> cartOfInterface.
	
	lastIdGiven := lastIdGiven + 1.
	
	^ (lastIdGiven - 1).! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 16:49:14'!
initializeWith: aUserList and: aCatalog.

	userList := aUserList.
	catalog := aCatalog.
	carts := Dictionary new.
	lastIdGiven  := 0.
	checkoutCarts := OrderedCollection new.! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 14:12:00'!
listCart: cartId

	|res cart|

	cart := carts at: cartId.
	res :=	Dictionary new.
	
	catalog keysDo: [ :item | 
		(cart includes: item) ifTrue: 
			[res at: item put: (cart occurrencesOf: item)]
		].
	
	^res.! !

!Interface methodsFor: 'as yet unclassified' stamp: 'MG 6/18/2018 16:43:34'!
listPurchasesOf: aClientId with: aPassword

	|res userCarts|

	self assertUserExists: aClientId.
	self assertUser: aClientId canBeIdentifiedWith: aPassword.
	
	res := Dictionary new.

	userCarts := checkoutCarts select: [:cart | cart user = aClientId ].
	
	catalog keysDo: [:item | res add: item -> (userCarts sum: [:cart | cart occurrencesOf: item ])].
	
	res := res reject: [:item | item value = 0].
	
	res add: ('total' -> (checkoutCarts sum: [:cart | cart sale total])).
	
	^res! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Interface class' category: #TusLibros!
Interface class
	instanceVariableNames: ''!

!Interface class methodsFor: 'error messages' stamp: 'MG 6/18/2018 16:10:39'!
canNotCheckoutACartMoreThanOnce

	^'Can not checkout a cart more than once'! !

!Interface class methodsFor: 'error messages' stamp: 'MG 6/14/2018 20:16:27'!
canNotCreateACartWhenLoginIsInvalidErrorMessage

	^'Can not create a cart when login is invalid'! !

!Interface class methodsFor: 'error messages' stamp: 'MG 6/14/2018 21:33:57'!
canNotCreateACartWhenPasswordIsIncorrectErrorMessage

	^'Can not create a cart when password is incorrect'! !

!Interface class methodsFor: 'error messages' stamp: 'MG 6/14/2018 21:33:35'!
canNotCreateACartWhenUserDoesntExistErrorMessage

	^'Can not create a cart when user doesnt exist'! !

!Interface class methodsFor: 'error messages' stamp: 'MG 6/14/2018 21:03:46'!
with: userList

	^self new initializeWith: userList.! !

!Interface class methodsFor: 'error messages' stamp: 'MG 6/14/2018 21:53:39'!
with: userList and: aCatalog

	^self new initializeWith: userList and: aCatalog.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'MG 6/14/2018 21:36:37'!
nonExistentUser
	
	^ 'nonExistentUser' -> 'aPassword'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'MG 6/14/2018 21:07:26'!
validUser
	
	^ 'validUser' -> 'validPassword'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'MG 6/14/2018 21:37:52'!
validUserWithIncorrectPassword
	
	^ 'validUser' -> 'incorrectPassword'! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'MG 6/14/2018 21:09:12'!
defaultUserList
	
	^ Dictionary new
		at: self validUser key put: self validUser value;
		yourself! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !
