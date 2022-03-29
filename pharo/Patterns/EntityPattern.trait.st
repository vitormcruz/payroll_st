Trait {
	#name : #EntityPattern,
	#instVars : [
		'#id => InitializedSlot default: [ UUIDGenerator next ]'
	],
	#category : #Patterns
}

{ #category : #accessing }
EntityPattern >> id [

	^ id.
]

{ #category : #initialization }
EntityPattern >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #'as yet unclassified' }
EntityPattern >> teste [

	^ self class.
]
