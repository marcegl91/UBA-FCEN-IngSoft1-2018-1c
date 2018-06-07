!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: 'cart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'testing' stamp: 'MG 6/7/2018 15:33:12'!
test01CartShouldBeEmptyWhenCreated

	|aCatalog|
	
	aCatalog := Set new.
	
	self assert: (Cart withCatalog: aCatalog) isEmpty.! !

!CartTest methodsFor: 'testing' stamp: 'MG 6/7/2018 15:46:49'!
test02AfterAddingOneProductIsNotEmpty

	|aProduct aCatalog|

	aCatalog := Set new.
	aProduct := Product named: 'productName' priced: 0.
	aCatalog add: aProduct.
	
	cart := Cart withCatalog: aCatalog.
	cart add: aProduct.
	
	self deny: cart isEmpty.
	self assert: (cart occurrencesOf: aProduct) equals: 1.
	! !

!CartTest methodsFor: 'testing' stamp: 'MG 6/7/2018 15:45:28'!
test03TotalIsTheSumOfPricesOfAllAddedProducts

	|aProduct anotherProduct aCatalog|

	aProduct := Product named: 'milk' priced: 12.
	anotherProduct := Product named: 'bread' priced: 24.
	
	aCatalog := Set new.
	aCatalog add: aProduct.
	aCatalog add: anotherProduct.

	cart := Cart withCatalog: aCatalog.
	cart add: aProduct.
	cart add: aProduct.
	cart add: anotherProduct.
	
	self assert: cart total equals: 48.! !

!CartTest methodsFor: 'testing' stamp: 'MG 6/7/2018 15:45:34'!
test04CanNotAddAProductThatIsNotInTheCatalog

	|aProduct anotherProduct aCatalog|

	aProduct := Product named: 'milk' priced: 12.
	anotherProduct := Product named: 'bread' priced: 10.
	
	aCatalog := Set new.
	aCatalog add: aProduct.

	cart := Cart withCatalog: aCatalog.
	
	self 
		should: [ cart add: anotherProduct ] 
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart productNotInCatalogErrorMessage ]! !

!CartTest methodsFor: 'testing' stamp: 'MG 6/7/2018 15:55:29'!
test05AfterAddingMultipleTimesTheSameProductItAppearsThatManyTimes

	|aProduct aCatalog|

	aProduct := Product named: 'milk' priced: 12.
	
	aCatalog := Set new.
	aCatalog add: aProduct.

	cart := Cart withCatalog: aCatalog.
	cart add: aProduct withOccurrences: 5.
	
	self assert: (cart occurrencesOf: aProduct) equals: 5.! !


!classDefinition: #Cart category: #'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'products catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'modify' stamp: 'MG 6/7/2018 15:44:34'!
add: aProduct

	self assertIsInCatalog: aProduct.
	
	products add: aProduct.

! !

!Cart methodsFor: 'modify' stamp: 'MG 6/7/2018 15:48:16'!
add: aProduct withOccurrences: aNumber

	aNumber timesRepeat: [ self add: aProduct ]

! !


!Cart methodsFor: 'accessing' stamp: 'MG 6/7/2018 13:31:21'!
isEmpty

	^products isEmpty! !

!Cart methodsFor: 'accessing' stamp: 'MG 6/7/2018 15:42:39'!
occurrencesOf: aProduct

	^products occurrencesOf: aProduct! !

!Cart methodsFor: 'accessing' stamp: 'MG 6/7/2018 13:27:33'!
products

	^products! !

!Cart methodsFor: 'accessing' stamp: 'MG 6/7/2018 13:11:01'!
total
	
	^ products sum: [ :product | product price ]! !


!Cart methodsFor: 'initialization' stamp: 'MG 6/7/2018 13:05:14'!
initializeWith: aCatalog

	products := Bag new.
	catalog := aCatalog! !


!Cart methodsFor: 'modify - private' stamp: 'MG 6/7/2018 15:10:20'!
assertIsInCatalog: aProduct

	(catalog includes: aProduct ) ifFalse: [ self error: self class productNotInCatalogErrorMessage ].


! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'MG 6/7/2018 13:19:37'!
withCatalog: aCatalog

	^self new initializeWith: aCatalog.! !


!Cart class methodsFor: 'error messages' stamp: 'MG 6/7/2018 15:10:28'!
productNotInCatalogErrorMessage

	^ 'Product not in catalog'! !


!classDefinition: #Product category: #'TusLibros.com'!
Object subclass: #Product
	instanceVariableNames: 'price name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Product methodsFor: 'initialization' stamp: 'MG 6/7/2018 13:22:18'!
initializeWith: aName priced: aPrice
	
	name := aName.
	price := aPrice.! !


!Product methodsFor: 'accessing' stamp: 'MG 6/7/2018 13:22:32'!
name

	^name! !

!Product methodsFor: 'accessing' stamp: 'MG 6/7/2018 13:22:35'!
price

	^price! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Product class' category: #'TusLibros.com'!
Product class
	instanceVariableNames: ''!

!Product class methodsFor: 'instance creation' stamp: 'MG 6/7/2018 13:20:36'!
named: aName priced: aPrice

	^self new initializeWith: aName priced: aPrice.! !
