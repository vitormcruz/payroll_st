Class {
	#name : #WupWireObjectConstructorKnownArgIncorrectProtocol,
	#superclass : #Object,
	#category : #'WireUp-Tests'
}

{ #category : #'wrong protocol' }
WupWireObjectConstructorKnownArgIncorrectProtocol class >> tailoredConstructorKownArg: knownArg [

	^ self new knownArg: knownArg.
]
