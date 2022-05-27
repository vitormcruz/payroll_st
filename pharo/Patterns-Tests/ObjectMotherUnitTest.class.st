Class {
	#name : #ObjectMotherUnitTest,
	#superclass : #TestCase,
	#category : #'Patterns-Tests'
}

{ #category : #'tests - birthScripts' }
ObjectMotherUnitTest >> test_birthScript_not_returning_object_created [

	| mother |
	
	mother := (ObjectMotherPattern of: BuildedClassForTest) 
					birthScript: [ :class | Object new ].
	
	self should: [ mother createNewBorn ] 
		  raise: PattObjectMotherConfigurationError  
		  withExceptionDo: [ :ex | ex messageText == 'The birth script should return an object of the class "BuildedClassForTest"' ].
	
]

{ #category : #'tests - birthScripts' }
ObjectMotherUnitTest >> test_birth_script_recieves_class [

	| mother inputBirthScript |
	
	mother := (ObjectMotherPattern of: BuildedClassForTest) 
					birthScript: [ :class | 
						inputBirthScript := class. 
						class new
					].
	
	mother createNewBorn.
	
	self assert: inputBirthScript
		  equals: BuildedClassForTest.
	


]

{ #category : #tests }
ObjectMotherUnitTest >> test_class_parameter_must_be_provided [

	self should: [ ObjectMotherPattern of: nil ] 
		  raise: PattObjectMotherConfigurationError
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'A class to build (child) must be provided' ].

]

{ #category : #'tests - config scripts' }
ObjectMotherUnitTest >> test_create_N_objs_with_N_config_scripts [

	| mother childs |
	
	mother := (((ObjectMotherPattern of: BuildedClassForTest)
		          addConfigScript: [ :b | b prop1: 'someData' ])
		          addConfigScript: [ :b | b prop2: 'someData2' ])
			 		 addConfigScript: [ :b | b prop3: 'someData3' ].
		
	childs := {mother createNewBorn.	mother createNewBorn. mother createNewBorn }.

	self assert: childs asSet size = 3 description: 'Every new born should be a different object.'.
	self assertCollection: (childs collect: #prop1) hasSameElements: #('someData' 'someData' 'someData').
	self assertCollection: (childs collect: #prop2) hasSameElements: #('someData2' 'someData2' 'someData2').
	self assertCollection: (childs collect: #prop3) hasSameElements: #('someData3' 'someData3' 'someData3').
]

{ #category : #'tests - config scripts' }
ObjectMotherUnitTest >> test_create_N_objs_with_one_config_script [

	| mother childs |
	
	mother := (ObjectMotherPattern of: BuildedClassForTest) addConfigScript: [ :b | b prop1: 'someData' ].
	childs := {mother createNewBorn.	mother createNewBorn. mother createNewBorn }.
	
	self assert: childs asSet size = 3 description: 'Every new born should be a different object.'.
	self assertCollection: (childs collect: #prop1) hasSameElements: #('someData' 'someData' 'someData').
]

{ #category : #'tests - config scripts' }
ObjectMotherUnitTest >> test_create_obj_with_N_config_scripts [

	| mother newBorn |
	
	mother := (((ObjectMotherPattern of: BuildedClassForTest)
		          addConfigScript: [ :b | b prop1: 'someData' ])
		          addConfigScript: [ :b | b prop2: 'someData2' ])
			 		 addConfigScript: [ :b | b prop3: 'someData3' ].
		
	newBorn := mother createNewBorn.

	self assert: newBorn prop1 equals: 'someData'.
	self assert: newBorn prop2 equals: 'someData2'.
	self assert: newBorn prop3 equals: 'someData3'.
]

{ #category : #'tests - birthScripts' }
ObjectMotherUnitTest >> test_create_obj_with_a_birth_script [

	| mother |
	
	mother := (ObjectMotherPattern of: BuildedClassForTest) 
					birthScript: [ :class | class newWithPropX: 'someDataThroughtConstructor' ].
	
	self assert: mother createNewBorn x
		  equals: 'someDataThroughtConstructor'.
	


]

{ #category : #tests }
ObjectMotherUnitTest >> test_create_obj_with_nothing [

	self assert: (ObjectMotherPattern of: Object) createNewBorn class 
		  equals: Object
]

{ #category : #'tests - config scripts' }
ObjectMotherUnitTest >> test_create_obj_with_one_config_script [

	| mother |
	
	mother := (ObjectMotherPattern of: BuildedClassForTest) addConfigScript: [ :b | b prop1: 'someData' ].
	
	self assert: mother createNewBorn prop1
		  equals: 'someData'.
	


]

{ #category : #'tests - config scripts' }
ObjectMotherUnitTest >> test_create_obj_with_two_config_scripts [

	| mother newBorn |
	
	mother := ((ObjectMotherPattern of: BuildedClassForTest)
		          addConfigScript: [ :b | b prop1: 'someData' ])
		          addConfigScript: [ :b | b prop2: 'someData2' ].
		
	newBorn := mother createNewBorn.

	self assert: newBorn prop1 equals: 'someData'.
	self assert: newBorn prop2 equals: 'someData2'
]

{ #category : #tests }
ObjectMotherUnitTest >> test_scripts_receives_an_instance_of_the_class_being_built [

	| result objMother |
	
	result := OrderedCollection new.
	objMother := ObjectMotherPattern of: BuildedClassForTest.
						
  objMother chain addConfigScript: [ :obj | result add: (obj isKindOf: BuildedClassForTest) ];
				      addConfigScript: [ :obj | result add: (obj isKindOf: BuildedClassForTest) ];
				      addConfigScript: [ :obj | result add: (obj isKindOf: BuildedClassForTest) ];
                  createNewBorn.

   self assertCollection: result hasSameElements: #(true true true).

]
