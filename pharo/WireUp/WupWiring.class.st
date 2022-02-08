Class {
	#name : #WupWiring,
	#superclass : #Object,
	#instVars : [
		'registeredClasses',
		'instantiationStrategy',
		'class',
		'wiringContext'
	],
	#category : #WireUp
}

{ #category : #'instance creation' }
WupWiring class >> newForContext: anWireUpObject [

	^ self new context: anWireUpObject.
]

{ #category : #configuration }
WupWiring >> class: aClass [ 
	class := aClass.
]

{ #category : #'instance creation' }
WupWiring >> context: anWireUpObject [

	wiringContext := anWireUpObject.

]

{ #category : #wiring }
WupWiring >> getWiredObject [

	^ instantiationStrategy value.
]

{ #category : #initialization }
WupWiring >> initialize [ 

	instantiationStrategy := [ self wireUpObjectInstance ]
]

{ #category : #configuration }
WupWiring >> useDefaultConstructor [

	instantiationStrategy := [ class new ].
	
]

{ #category : #wiring }
WupWiring >> wireUpObjectInstance [

	| selectedContructor constructorArgs |

	constructorArgs := OrderedCollection new.	
	selectedContructor := class class findConstructorForWiring.
	
	selectedContructor argumentNames ifNotEmpty: [ :args | 
		[ constructorArgs addAll: (args collect: [ :arg | wiringContext get: arg ]) ]
			on: KeyNotFound
			do: [ Error signal: 'No constructor, clasified as "instance creation", matches wire up settings.' ] 
	].
		
	^ selectedContructor valueWithReceiver: class arguments: constructorArgs asArray
]
