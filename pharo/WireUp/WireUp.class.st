Class {
	#name : #WireUp,
	#superclass : #Object,
	#instVars : [
		'registeredClasses'
	],
	#category : #WireUp
}

{ #category : #wiring }
WireUp >> get: classOrName [

	| wiring |
	
	wiring := registeredClasses at: classOrName nameForWring.

	^ wiring getWiredObject.
]

{ #category : #access }
WireUp >> hasObjectNamed: aString [ 

	^ registeredClasses includesKey: aString.
]

{ #category : #initialization }
WireUp >> initialize [ 
	
	registeredClasses := Dictionary new.
]

{ #category : #wiring }
WireUp >> newWiring [

	^ WireUpWiring newForContext: self.
]

{ #category : #registering }
WireUp >> register: aClass [ 

	^ self register: aClass named: aClass nameForWring.

]

{ #category : #registering }
WireUp >> register: aClass named: aString [ 

	^ registeredClasses at: aString 
			 			     ifPresent: [ Error signal: '"', aString, '" is already used as name of a wirable object' ] 
							  ifAbsentPut: (self newWiring class: aClass).
]
