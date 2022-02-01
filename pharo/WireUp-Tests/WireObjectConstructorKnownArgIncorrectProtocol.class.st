Class {
	#name : #WireObjectConstructorKnownArgIncorrectProtocol,
	#superclass : #Object,
	#category : #'WireUp-Tests'
}

{ #category : #'wrong protocol' }
WireObjectConstructorKnownArgIncorrectProtocol class >> tailoredConstructorKownArg: knownArg [

	^ self new knownArg: knownArg.
]
