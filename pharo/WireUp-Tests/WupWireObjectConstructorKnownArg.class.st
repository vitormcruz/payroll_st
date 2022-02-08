Class {
	#name : #WupWireObjectConstructorKnownArg,
	#superclass : #Object,
	#instVars : [
		'knownArg'
	],
	#category : #'WireUp-Tests'
}

{ #category : #'instance creation' }
WupWireObjectConstructorKnownArg class >> tailoredConstructorKownArg: knownArg [

	^ self new knownArg: knownArg.

]

{ #category : #accessors }
WupWireObjectConstructorKnownArg >> knownArg [
	^ knownArg.
]

{ #category : #accessors }
WupWireObjectConstructorKnownArg >> knownArg: aKnownArg [
	knownArg := aKnownArg.
]
