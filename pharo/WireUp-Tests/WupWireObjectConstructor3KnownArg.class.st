Class {
	#name : #WupWireObjectConstructor3KnownArg,
	#superclass : #Object,
	#instVars : [
		'knownArg1',
		'knownArg2',
		'knownArg3'
	],
	#category : #'WireUp-Tests'
}

{ #category : #'instance creation' }
WupWireObjectConstructor3KnownArg class >> tailoredConstructorKownArg: knownArg1 kownArg2: knownArg2 knownArg3: knownArg3 [

	^ self new knownArg1: knownArg1 knownArg2: knownArg2 knownArg3: knownArg3.
]

{ #category : #accessing }
WupWireObjectConstructor3KnownArg >> knownArg1 [

	^ knownArg1
]

{ #category : #'as yet unclassified' }
WupWireObjectConstructor3KnownArg >> knownArg1: aKnownArg1 knownArg2: aKnownArg2 knownArg3: aKnownArg3 [

	knownArg1 := aKnownArg1.
	knownArg2 := aKnownArg2.
	knownArg3 := aKnownArg3.

]

{ #category : #accessing }
WupWireObjectConstructor3KnownArg >> knownArg2 [

	^ knownArg2
]

{ #category : #accessing }
WupWireObjectConstructor3KnownArg >> knownArg3 [

	^ knownArg3
]
