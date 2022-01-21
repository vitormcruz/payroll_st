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

	instantiationStrategy := [ Error signal: class nameForWring, ' don''t have a tailored constructor' ]
]

{ #category : #configuration }
WireUpWiring >> useDefaultConstructor [

	instantiationStrategy := [ class new ].
	
]
