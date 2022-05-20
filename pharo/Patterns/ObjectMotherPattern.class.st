Class {
	#name : #ObjectMotherPattern,
	#superclass : #Object,
	#instVars : [
		'#childClass => WriteOnceSlot',
		'#birthScripts => WriteOnceSlot',
		'#postBirthScript => WriteOnceSlot'
	],
	#category : #'Patterns-tst'
}

{ #category : #'instance creation' }
ObjectMotherPattern class >> of: aClass [


	^ super new of: aClass usingBirthScripts: #() andWithPostBirthScript: []
]

{ #category : #'instance creation' }
ObjectMotherPattern class >> of: aClass usingBirthScripts: birthScripts andWithPostBirthScript: postBirthScript [

	^ super new of: aClass usingBirthScripts: birthScripts andWithPostBirthScript: postBirthScript


	
]

{ #category : #adding }
ObjectMotherPattern >> addBirthScript: aBlock [
	
	^ self class of: childClass 
			       usingBirthScripts: (birthScripts copyWith: aBlock)
			       andWithPostBirthScript: postBirthScript.
]

{ #category : #accessing }
ObjectMotherPattern >> childClass [

	^ childClass
]

{ #category : #configuring }
ObjectMotherPattern >> childClass: aClass [

	childClass := aClass
]

{ #category : #configuring }
ObjectMotherPattern >> configurePostBirthScript: aBlock [

	" Return a clone of this ObjectMother changing the birth script to the one represented by the aPostBirthScript closure parameter. 
	  This script will be executed right after a new born object is created."
	
	
]

{ #category : #'as yet unclassified' }
ObjectMotherPattern >> createNewBorn [

    ^ childClass new in: [ :newBornChild |
    	birthScripts do: [ :birthScript | newBornChild in: birthScript ].
		newBornChild.	
	 ]

]

{ #category : #initialization }
ObjectMotherPattern >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #initialization }
ObjectMotherPattern >> of: aClass usingBirthScripts: aBirthScripts andWithPostBirthScript: aPostBirthScript [

	aClass ifNil: [ PattObjectMotherConfigurationError signal: 'A class to build (child) must be provided'.  ].

	childClass := aClass.
	birthScripts := aBirthScripts ifNil: [ OrderedCollection new ].
	postBirthScript := aPostBirthScript.
]
