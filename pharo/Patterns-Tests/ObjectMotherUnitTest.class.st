Class {
	#name : #ObjectMotherUnitTest,
	#superclass : #TestCase,
	#category : #'Patterns-Tests'
}

{ #category : #utils }
ObjectMotherUnitTest >> getObjectMotherFor: aClass withPostScript: aBlock [

	^ (ObjectMotherPattern of: aClass 
			 		    usingBirthScripts:  nil
					    andWithPostBirthScript: aBlock).
]

{ #category : #tests }
ObjectMotherUnitTest >> test_class_parameter_must_be_provided [

	self should: [ self getObjectMotherFor: nil withPostScript: [] ] 
		  raise: PattObjectMotherConfigurationError
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'A class to build (child) must be provided' ].

]

{ #category : #tests }
ObjectMotherUnitTest >> test_create_N_objs_with_N_birth_scripts [

	| mother childs |
	
	mother := (((ObjectMotherPattern of: BuildedClassForTest)
		          addBirthScript: [ :b | b prop1: 'someData' ])
		          addBirthScript: [ :b | b prop2: 'someData2' ])
			 		 addBirthScript: [ :b | b prop3: 'someData3' ].
		
	childs := {mother createNewBorn.	mother createNewBorn. mother createNewBorn }.

	self assert: childs asSet size = 3 description: 'Every new born should be a different object.'.
	self assertCollection: (childs collect: #prop1) hasSameElements: #('someData' 'someData' 'someData').
	self assertCollection: (childs collect: #prop2) hasSameElements: #('someData2' 'someData2' 'someData2').
	self assertCollection: (childs collect: #prop3) hasSameElements: #('someData3' 'someData3' 'someData3').
]

{ #category : #tests }
ObjectMotherUnitTest >> test_create_N_objs_with_one_birth_script [

	| mother childs |
	
	mother := (ObjectMotherPattern of: BuildedClassForTest) addBirthScript: [ :b | b prop1: 'someData' ].
	childs := {mother createNewBorn.	mother createNewBorn. mother createNewBorn }.
	
	self assert: childs asSet size = 3 description: 'Every new born should be a different object.'.
	self assertCollection: (childs collect: #prop1) hasSameElements: #('someData' 'someData' 'someData').
]

{ #category : #tests }
ObjectMotherUnitTest >> test_create_obj_with_N_birth_scripts [

	| mother newBorn |
	
	mother := (((ObjectMotherPattern of: BuildedClassForTest)
		          addBirthScript: [ :b | b prop1: 'someData' ])
		          addBirthScript: [ :b | b prop2: 'someData2' ])
			 		 addBirthScript: [ :b | b prop3: 'someData3' ].
		
	newBorn := mother createNewBorn.

	self assert: newBorn prop1 equals: 'someData'.
	self assert: newBorn prop2 equals: 'someData2'.
	self assert: newBorn prop3 equals: 'someData3'.
]

{ #category : #tests }
ObjectMotherUnitTest >> test_create_obj_with_nothing [

	self assert: (ObjectMotherPattern of: Object) createNewBorn class 
		  equals: Object
]

{ #category : #tests }
ObjectMotherUnitTest >> test_create_obj_with_one_birth_script [

	| mother |
	
	mother := (ObjectMotherPattern of: BuildedClassForTest) addBirthScript: [ :b | b prop1: 'someData' ].
	
	self assert: mother createNewBorn prop1
		  equals: 'someData'.
	


]

{ #category : #tests }
ObjectMotherUnitTest >> test_create_obj_with_two_birth_scripts [

	| mother newBorn |
	
	mother := ((ObjectMotherPattern of: BuildedClassForTest)
		          addBirthScript: [ :b | b prop1: 'someData' ])
		          addBirthScript: [ :b | b prop2: 'someData2' ].
		
	newBorn := mother createNewBorn.

	self assert: newBorn prop1 equals: 'someData'.
	self assert: newBorn prop2 equals: 'someData2'
]

{ #category : #tests }
ObjectMotherUnitTest >> test_scripts_receives_an_instance_of_the_class_being_built [

	| result objMother |
	
	result := OrderedCollection new.
	objMother := self getObjectMotherFor: BuildedClassForTest 
		   				   withPostScript: [ :obj | result add: (obj isKindOf: BuildedClassForTest) ].
						
  objMother chain addBirthScript: [ :obj | result add: (obj isKindOf: BuildedClassForTest) ];
				      addBirthScript: [ :obj | result add: (obj isKindOf: BuildedClassForTest) ];
				      addBirthScript: [ :obj | result add: (obj isKindOf: BuildedClassForTest) ];
                  createNewBorn.

   self assertCollection: result hasSameElements: #(true true true true).

]
