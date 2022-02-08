Class {
	#name : #WupWireObjectConstructor2KnownArg,
	#superclass : #Object,
	#instVars : [
		'knownArg1',
		'knownArg2'
	],
	#category : #'WireUp-Tests'
}

{ #category : #'instance creation' }
WupWireObjectConstructor2KnownArg class >> tailoredConstructorKownArg: knownArg1 kownArg2: knownArg2 [

	^ self new knownArg1: knownArg1 knownArg2: knownArg2.
]

{ #category : #accessing }
WupWireObjectConstructor2KnownArg >> knownArg1 [

	^ knownArg1
]

{ #category : #'as yet unclassified' }
WupWireObjectConstructor2KnownArg >> knownArg1: aKnownArg1 knownArg2: aKnownArg2 [

	knownArg1 := aKnownArg1.
	knownArg2 := aKnownArg2.
]

{ #category : #accessing }
WupWireObjectConstructor2KnownArg >> knownArg2 [

	^ knownArg2
]
