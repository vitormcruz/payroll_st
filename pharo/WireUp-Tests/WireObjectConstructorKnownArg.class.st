Class {
	#name : #WireObjectConstructorKnownArg,
	#superclass : #Object,
	#instVars : [
		'knownArg'
	],
	#category : #'WireUp-Tests'
}

{ #category : #'instance creation' }
WireObjectConstructorKnownArg class >> tailoredConstructorKownArg: knownArg [

	^ self new knownArg: knownArg.

]

{ #category : #accessors }
WireObjectConstructorKnownArg >> knownArg [
	^ knownArg.
]

{ #category : #accessors }
WireObjectConstructorKnownArg >> knownArg: aKnownArg [
	knownArg := aKnownArg.
]
