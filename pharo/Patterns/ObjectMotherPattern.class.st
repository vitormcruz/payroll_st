Class {
	#name : #ObjectMotherPattern,
	#superclass : #Object,
	#instVars : [
		'#childClass => WriteOnceSlot',
		'#postBirthScript => WriteOnceSlot',
		'#configScripts => WriteOnceSlot',
		'#birthScript => WriteOnceSlot'
	],
	#category : #'Patterns-tst'
}

{ #category : #'instance creation' }
ObjectMotherPattern class >> of: aClass [


	^ super new of: aClass 
				   withBirthScript: [:class | class new ] 
					usingConfigScripts: #() 
					andWithPostBirthScript: []
]

{ #category : #'instance creation' }
ObjectMotherPattern class >> of: aClass withBirthScript: aBirthClosure usingConfigScripts: listConfigScripts andWithPostBirthScript: postBirthClosure [

	^ super new of: aClass withBirthScript: aBirthClosure usingConfigScripts: listConfigScripts andWithPostBirthScript: postBirthClosure


	
]

{ #category : #configuring }
ObjectMotherPattern >> addConfigScript: aBlock [

	"Returns a copy of this object that uses the block closure parameter as a script to configure created objects"
	
	^ self class of: childClass 
					 withBirthScript: birthScript 
			       usingConfigScripts: (configScripts copyWith: aBlock)
			       andWithPostBirthScript: postBirthScript.
]

{ #category : #configuring }
ObjectMotherPattern >> birthScript: aBlock [ 

	"Returns a copy of this object that uses the block closure parameter as a script to create objects. 
	
	 The birth script *must* return a valid object of the type of 'childClass'
	
	 If not specified, class new is used."

	^ self class of: childClass 
					 withBirthScript: aBlock 
			       usingConfigScripts: configScripts clone
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

{ #category : #running }
ObjectMotherPattern >> createNewBorn [

	| newBornChild |
	
	newBornChild := birthScript value: childClass.
	
	(newBornChild isKindOf: childClass) 
		ifFalse: [ PattObjectMotherConfigurationError signal: 'The birth script should return an object of the class "', childClass name, '"' ].
		
	configScripts do: [ :configScript | newBornChild in: configScript ].
	^ newBornChild.
]

{ #category : #initialization }
ObjectMotherPattern >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #initialization }
ObjectMotherPattern >> of: aClass withBirthScript: aBirthClosure usingConfigScripts: listConfigScripts andWithPostBirthScript: aPostBirthClosure [

	aClass ifNil: [ PattObjectMotherConfigurationError signal: 'A class to build (child) must be provided'.  ].

	childClass := aClass.
	birthScript := aBirthClosure.
	configScripts := listConfigScripts ifNil: [ OrderedCollection new ].
	postBirthScript := aPostBirthClosure.
]

{ #category : #configuring }
ObjectMotherPattern >> withPostBirthScript: aBlock [

	" Return a clone of this ObjectMother changing the birth script to the one represented by the aPostBirthScript closure parameter. 
	  This script will be executed right after a new born object is created."
	
	
]
