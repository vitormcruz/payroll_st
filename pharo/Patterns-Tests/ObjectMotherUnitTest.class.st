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
