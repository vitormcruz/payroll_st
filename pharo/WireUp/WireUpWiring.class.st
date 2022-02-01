Class {
	#name : #WireUpWiring,
	#superclass : #Object,
	#instVars : [
		'registeredClasses',
		'instantiationStrategy',
		'wireUpObject',
		'class'
	],
	#category : #WireUp
}

{ #category : #'instance creation' }
WireUpWiring class >> newForContext: anWireUpObject [

	^ self new context: anWireUpObject.
]

{ #category : #configuration }
WireUpWiring >> class: aClass [ 
	class := aClass.
]

{ #category : #'as yet unclassified' }
WireUpWiring >> constructorCaller [

	| selectedContructor constructorArgs |

	constructorArgs := OrderedCollection new.	
	selectedContructor := class class findConstructorForWiring.
	
	selectedContructor argumentNames ifNotEmpty: [ :args | 
		[ constructorArgs addAll: (args collect: [ :arg | wireUpObject get: arg ]) ]
			on: KeyNotFound
			do: [ Error signal: 'No constructor, clasified as "instance creation", matches wire up settings.' ] 
	].
		
	^ selectedContructor valueWithReceiver: class arguments: constructorArgs asArray
]

{ #category : #'instance creation' }
WireUpWiring >> context: anWireUpObject [

	wireUpObject := anWireUpObject.

]

{ #category : #wiring }
WireUpWiring >> getWiredObject [

	^ instantiationStrategy value.
]

{ #category : #initialization }
WireUpWiring >> initialize [ 

	instantiationStrategy := [ self constructorCaller ]
]

{ #category : #configuration }
WireUpWiring >> useDefaultConstructor [

	instantiationStrategy := [ class new ].
	
]
