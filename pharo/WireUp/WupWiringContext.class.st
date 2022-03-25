"
I am the Context where all wiring configurations are kept. 

All basic usage of WireUp framework can be learned here.

# Usage

""Creates a context""
| context |
context := WupWiringContext new.

""Register ""

context register: 




"
Class {
	#name : #WupWiringContext,
	#superclass : #Object,
	#instVars : [
		'registeredClasses'
	],
	#category : #WireUp
}

{ #category : #wiring }
WupWiringContext >> fillExisting: anObject [

	(anObject class allInstVarNames) do: [ :instVarName | 
		[ 
			anObject instVarNamed: instVarName put: (self get: instVarName).
		] on: KeyNotFound do: [].
	].
	
	^ anObject.
]

{ #category : #wiring }
WupWiringContext >> get: classOrName [

	| wiring |
	
	wiring := registeredClasses at: classOrName nameForWring.

	^ wiring getWiredObject.
]

{ #category : #access }
WupWiringContext >> hasObjectNamed: aString [ 

	^ registeredClasses includesKey: aString.
]

{ #category : #initialization }
WupWiringContext >> initialize [ 
	
	registeredClasses := Dictionary new.
]

{ #category : #wiring }
WupWiringContext >> newWiring [

	^ WupWiring newForContext: self.
]

{ #category : #registering }
WupWiringContext >> register: aClass [ 

	^ self register: aClass named: aClass nameForWring.

]

{ #category : #registering }
WupWiringContext >> register: aClass named: aString [ 

	^ registeredClasses at: aString 
			 			     ifPresent: [ Error signal: '"', aString, '" is already used as name of a wirable object' ] 
							  ifAbsentPut: (self newWiring class: aClass).
]
