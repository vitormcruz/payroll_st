Class {
	#name : #WupWiringContextUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'wireUp'
	],
	#category : #'WireUp-Tests'
}

{ #category : #running }
WupWiringContextUnitTest >> setUp [
	super setUp.
	wireUp	 := WupWiringContext new.

]

{ #category : #'test simple registering' }
WupWiringContextUnitTest >> test_default_name_for_registered_object [

   wireUp register: WupWireTestObjectA.
   self assert: (wireUp hasObjectNamed: 'wupWireTestObjectA')
]

{ #category : #'test simple registering' }
WupWiringContextUnitTest >> test_name_specified_for_registered_object [

   wireUp register: WupWireTestObjectA named: 'someOtherName'.
   self assert: (wireUp hasObjectNamed: 'someOtherName')
]

{ #category : #'test simple registering' }
WupWiringContextUnitTest >> test_register_same_class_twice_using_default_and_custom_name [

   wireUp register: WupWireTestObjectA.
   wireUp register: WupWireTestObjectA named: 'someOtherName'.
	self assert: (wireUp hasObjectNamed: 'wupWireTestObjectA').
	self assert: (wireUp hasObjectNamed: 'someOtherName')

]

{ #category : #'test coliding name' }
WupWiringContextUnitTest >> test_register_same_class_twice_using_default_name [

   wireUp register: WupWireTestObjectA.
	self should: [ wireUp register: WupWireTestObjectA ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText equals: '"wupWireTestObjectA" is already used as name of a wirable object' ].

]

{ #category : #'test coliding name' }
WupWiringContextUnitTest >> test_register_same_name_twice_with_two_different_classes [

   wireUp register: WupWireTestObjectA named: 'Name'.

	self should: [ wireUp register: WupWireTestObjectB named: 'Name' ]
	     raise: Error
	     whoseDescriptionIncludes: '"Name" is already used as name of a wirable object'
		  description: 'Wrong message error'.

]

{ #category : #'test wire default constructor' }
WupWiringContextUnitTest >> test_wiring_configured_to_use_object_default_constructor [

	(wireUp register: WupWireTestObjectA) useDefaultConstructor.
	self assert: (wireUp get: WupWireTestObjectA) class equals: WupWireTestObjectA
]

{ #category : #'test wire default constructor' }
WupWiringContextUnitTest >> test_wiring_object_with_default_constructor_only [

	wireUp register: WupWireTestObjectA.
	self should: [ wireUp get: WupWireTestObjectA ] 
		  raise: Error 
		  whoseDescriptionIncludes: 'wupWireTestObjectA don''t have a tailored constructor'
		  description: 'Error didin''t happend as expected'.
	
]

{ #category : #'test wire tailored constructor' }
WupWiringContextUnitTest >> test_wiring_object_with_one_tailored_constructor_N_arg_matching [

	| wiredObject |
	
	(wireUp register: WupWireTestObjectA named: 'knownArg1') useDefaultConstructor.
	wireUp register: WupWireTestObjectB named: 'knownArg2'.
	wireUp register: WupWireTestObjectC named: 'knownArg3'.
	wireUp register: WupWireObjectConstructor3KnownArg.
	
	wiredObject := wireUp get: WupWireObjectConstructor3KnownArg.
	self assert: wiredObject knownArg1 class equals: WupWireTestObjectA.
	self assert: wiredObject knownArg2 class equals: WupWireTestObjectB.
	self assert: wiredObject knownArg3 class equals: WupWireTestObjectC.
]

{ #category : #'test wire tailored constructor' }
WupWiringContextUnitTest >> test_wiring_object_with_one_tailored_constructor_no_arg [

	wireUp register: WupWireTestObjectB.
	self assert: (wireUp get: WupWireTestObjectB) class equals: WupWireTestObjectB
	
]

{ #category : #'test wire tailored constructor' }
WupWiringContextUnitTest >> test_wiring_object_with_one_tailored_constructor_one_arg_matching [

	wireUp register: WupWireTestObjectB named: 'knownArg'.
	wireUp register: WupWireObjectConstructorKnownArg.
	self assert: ((wireUp get: WupWireObjectConstructorKnownArg) knownArg) class equals: WupWireTestObjectB
		
]

{ #category : #'test wire tailored constructor' }
WupWiringContextUnitTest >> test_wiring_object_with_one_tailored_constructor_one_arg_matching_but_incorrect_method_protocol [

	wireUp register: WupWireTestObjectB named: 'knownArg'.
	wireUp register: WupWireObjectConstructorKnownArgIncorrectProtocol.
	self should: [ wireUp get: WupWireObjectConstructorKnownArgIncorrectProtocol ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'wupWireObjectConstructorKnownArgIncorrectProtocol don''t have a tailored constructor' ].
		
]

{ #category : #'test wire tailored constructor' }
WupWiringContextUnitTest >> test_wiring_object_with_one_tailored_constructor_one_arg_not_matching [

	wireUp register: WupWireTestObjectB.
	wireUp register: WupWireObjectConstructorUnknownArg.
	self should: [ wireUp get: WupWireObjectConstructorUnknownArg ] 
		  raise: Error 
		  whoseDescriptionIncludes: 'No constructor, clasified as "instance creation", matches wire up settings.'
		  description: 'Should throw an error, but didin''t'.
		
]

{ #category : #'test wire tailored constructor' }
WupWiringContextUnitTest >> test_wiring_object_with_one_tailored_constructor_two_arg_matching [

	| wiredObject |
	
	(wireUp register: WupWireTestObjectA named: 'knownArg1') useDefaultConstructor.
	wireUp register: WupWireTestObjectB named: 'knownArg2'.
	wireUp register: WupWireObjectConstructor2KnownArg.
	
	wiredObject := wireUp get: WupWireObjectConstructor2KnownArg.
	self assert: wiredObject knownArg1 class equals: WupWireTestObjectA.
	self assert: wiredObject knownArg2 class equals: WupWireTestObjectB.
]
