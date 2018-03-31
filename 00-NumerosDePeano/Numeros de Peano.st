!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 12:26:03'!
* unNumeroDePeano

	^ unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:50:58'!
+ unNumeroDePeano

	^ unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:02'!
- unNumeroDePeano

	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:08'!
/ unNumeroDePeano

	unNumeroDePeano = I
	ifTrue:[
		^I
		]
	ifFalse: [
		self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor 
		]! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:14'!
< unNumeroDePeano

	unNumeroDePeano = I
	ifTrue:[
		^false
	]
	ifFalse:[
		^true
	]! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:19'!
<= unNumeroDePeano

	^ self < unNumeroDePeano or: self = unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:25'!
> unNumeroDePeano

	^ ( self <= unNumeroDePeano ) not! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:30'!
>= unNumeroDePeano

	^ ( self > unNumeroDePeano ) or: ( self = unNumeroDePeano )! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'Divisores mayores que dividendos no son soportados'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:51:40'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'Numeros negativos ni cero son soportados'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 10:30:41'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 10:30:50'!
previous

	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 17:11:53'!
swappedSubtraction: unNumeroDePeano

	^ unNumeroDePeano  previous! !


!classDefinition: #II category: #'Numeros de Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: 'previous next'!

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 12:25:05'!
* unNumeroDePeano

	^ (self previous * unNumeroDePeano) + unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 10:30:13'!
+ unNumeroDePeano

	^ (self previous) + (unNumeroDePeano next)! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 16:55:21'!
- unNumeroDePeano

	 "(unNumeroDePeano = I) ifTrue: [^ self previous]
								 ifFalse: [^ self previous - unNumeroDePeano previous]"
								
	^ unNumeroDePeano swappedSubtraction: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:52:00'!
/ unNumeroDePeano

	|diferencia|
	unNumeroDePeano = I
	ifTrue: [
		^self
		] 
	ifFalse: [
	self > unNumeroDePeano 
		ifTrue: [
			diferencia := self - unNumeroDePeano.
			(diferencia < unNumeroDePeano)
			ifTrue: [
				^I
				] 
			ifFalse: [
				^ (diferencia / unNumeroDePeano) next.
				]
			]	
		ifFalse:[
			unNumeroDePeano = self
				ifTrue: [
					^I
					]
				ifFalse: [
					self error:self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
					]
			] 	
		] ! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:52:08'!
< unNumeroDePeano

	unNumeroDePeano = I
	ifTrue:[
		^false
	]
	 ifFalse:[
			^self previous < unNumeroDePeano previous
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:52:12'!
<= unNumeroDePeano

	^ self < unNumeroDePeano or: self = unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:52:19'!
> unNumeroDePeano

	^ ( self <= unNumeroDePeano ) not! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:52:24'!
>= unNumeroDePeano

	^ ( self > unNumeroDePeano ) or: ( self = unNumeroDePeano )! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:52:29'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'Divisores mayores que dividendos no son soportados'.! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 10:31:28'!
next

	next ifNil: [
		next := self cloneNamed: (self name, 'I').
		next previous: self ].

	^ next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/29/2018 14:37:39'!
previous

	^ previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/29/2018 14:49:11'!
previous: unNumeroDePeano

	previous := unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/29/2018 14:54:25'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'MG 3/30/2018 17:32:18'!
swappedSubtraction: unNumeroDePeano

	^ (unNumeroDePeano previous) - (self previous)! !

II instVarNamed: 'previous' put: I!
II instVarNamed: 'next' put: III!

!classDefinition: #III category: #'Numeros de Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros de Peano'!
III class
	instanceVariableNames: 'previous next'!

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
* unNumeroDePeano

	^ (self previous * unNumeroDePeano) + unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
+ unNumeroDePeano

	^ (self previous) + (unNumeroDePeano next)! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
- unNumeroDePeano

	 "(unNumeroDePeano = I) ifTrue: [^ self previous]
								 ifFalse: [^ self previous - unNumeroDePeano previous]"
								
	^ unNumeroDePeano swappedSubtraction: self! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
/ unNumeroDePeano

	|diferencia|
	unNumeroDePeano = I
	ifTrue: [
		^self
		] 
	ifFalse: [
	self > unNumeroDePeano 
		ifTrue: [
			diferencia := self - unNumeroDePeano.
			(diferencia < unNumeroDePeano)
			ifTrue: [
				^I
				] 
			ifFalse: [
				^ (diferencia / unNumeroDePeano) next.
				]
			]	
		ifFalse:[
			unNumeroDePeano = self
				ifTrue: [
					^I
					]
				ifFalse: [
					self error:self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
					]
			] 	
		] ! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
< unNumeroDePeano

	unNumeroDePeano = I
	ifTrue:[
		^false
	]
	 ifFalse:[
			^self previous < unNumeroDePeano previous
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
<= unNumeroDePeano

	^ self < unNumeroDePeano or: self = unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
> unNumeroDePeano

	^ ( self <= unNumeroDePeano ) not! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
>= unNumeroDePeano

	^ ( self > unNumeroDePeano ) or: ( self = unNumeroDePeano )! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'Divisores mayores que dividendos no son soportados'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
next

	next ifNil: [
		next := self cloneNamed: (self name, 'I').
		next previous: self ].

	^ next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
previous

	^ previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
previous: unNumeroDePeano

	previous := unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:06'!
swappedSubtraction: unNumeroDePeano

	^ (unNumeroDePeano previous) - (self previous)! !

III instVarNamed: 'previous' put: II!
III instVarNamed: 'next' put: IIII!

!classDefinition: #IIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros de Peano'!
IIII class
	instanceVariableNames: 'previous next'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
* unNumeroDePeano

	^ (self previous * unNumeroDePeano) + unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
+ unNumeroDePeano

	^ (self previous) + (unNumeroDePeano next)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
- unNumeroDePeano

	 "(unNumeroDePeano = I) ifTrue: [^ self previous]
								 ifFalse: [^ self previous - unNumeroDePeano previous]"
								
	^ unNumeroDePeano swappedSubtraction: self! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
/ unNumeroDePeano

	|diferencia|
	unNumeroDePeano = I
	ifTrue: [
		^self
		] 
	ifFalse: [
	self > unNumeroDePeano 
		ifTrue: [
			diferencia := self - unNumeroDePeano.
			(diferencia < unNumeroDePeano)
			ifTrue: [
				^I
				] 
			ifFalse: [
				^ (diferencia / unNumeroDePeano) next.
				]
			]	
		ifFalse:[
			unNumeroDePeano = self
				ifTrue: [
					^I
					]
				ifFalse: [
					self error:self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
					]
			] 	
		] ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
< unNumeroDePeano

	unNumeroDePeano = I
	ifTrue:[
		^false
	]
	 ifFalse:[
			^self previous < unNumeroDePeano previous
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
<= unNumeroDePeano

	^ self < unNumeroDePeano or: self = unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
> unNumeroDePeano

	^ ( self <= unNumeroDePeano ) not! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
>= unNumeroDePeano

	^ ( self > unNumeroDePeano ) or: ( self = unNumeroDePeano )! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'Divisores mayores que dividendos no son soportados'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
next

	next ifNil: [
		next := self cloneNamed: (self name, 'I').
		next previous: self ].

	^ next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
previous

	^ previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
previous: unNumeroDePeano

	previous := unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'MG 3/31/2018 15:53:11'!
swappedSubtraction: unNumeroDePeano

	^ (unNumeroDePeano previous) - (self previous)! !

IIII instVarNamed: 'previous' put: III!
IIII instVarNamed: 'next' put: nil!