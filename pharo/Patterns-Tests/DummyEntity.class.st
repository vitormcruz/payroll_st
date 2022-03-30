Class {
	#name : #DummyEntity,
	#superclass : #Object,
	#traits : 'EntityPattern',
	#classTraits : 'EntityPattern classTrait',
	#category : #'Patterns-Tests'
}

{ #category : #initialization }
DummyEntity >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]
