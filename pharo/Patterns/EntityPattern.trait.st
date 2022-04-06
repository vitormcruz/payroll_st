Trait {
	#name : #EntityPattern,
	#instVars : [
		'#id => InitializedSlot default: [ UUIDGenerator next ]'
	],
	#category : #'Patterns-prd'
}

{ #category : #comparing }
EntityPattern >> = that [

	that ifNil: [ ^ false ].
   that == self ifTrue: [ ^ true ].
	(that class slotNames includes: #id) ifFalse: [ ^ false ].
   ^ self id = that id.
]

{ #category : #comparing }
EntityPattern >> hash [ 

	^ id hash.
]

{ #category : #accessing }
EntityPattern >> id [

	^ id.
]

{ #category : #initialization }
EntityPattern >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]
