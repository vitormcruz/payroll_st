Class {
	#name : #WupWiring,
	#superclass : #Object,
	#instVars : [
		'class',
		'wiringContext',
		'singletonObject',
		'retationCmd',
		'instantiationCmd'
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

	^ retationCmd value.
]

{ #category : #initialization }
WupWiring >> initialize [ 

	retationCmd := [ singletonObject ifNil: [ singletonObject := instantiationCmd value ] ].
	instantiationCmd := [ self wireNewInstance ].

]

{ #category : #configuration }
WupWiring >> useDefaultConstructor [

	instantiationCmd := [ class new ].
	
]

{ #category : #wiring }
WupWiring >> wireNewInstance [

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
