Class {
	#name : #WireUpUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'wireUp'
	],
	#category : #'WireUp-Tests'
}

{ #category : #running }
WireUpUnitTest >> setUp [
	super setUp.
	wireUp	 := WireUp new.

]

{ #category : #'test simple registering' }
WireUpUnitTest >> test_default_name_for_registered_object [

   wireUp register: WireTestObjectA.
   self assert: (wireUp hasObjectNamed: 'wireTestObjectA')
]

{ #category : #'test simple registering' }
WireUpUnitTest >> test_name_specified_for_registered_object [

   wireUp register: WireTestObjectA named: 'someOtherName'.
   self assert: (wireUp hasObjectNamed: 'someOtherName')
]

{ #category : #'test simple registering' }
WireUpUnitTest >> test_register_same_class_twice_using_default_and_custom_name [

   wireUp register: WireTestObjectA.
   wireUp register: WireTestObjectA named: 'someOtherName'.
	self assert: (wireUp hasObjectNamed: 'wireTestObjectA').
	self assert: (wireUp hasObjectNamed: 'someOtherName')

]

{ #category : #'test coliding name' }
WireUpUnitTest >> test_register_same_class_twice_using_default_name [

   wireUp register: WireTestObjectA.
	self should: [ wireUp register: WireTestObjectA ] 
		  raise: Error 
		  withExceptionDo: [ :ex | ex messageText =  'wireTestObjectA is already used as name of a wirable object'].

]

{ #category : #'test coliding name' }
WireUpUnitTest >> test_register_same_name_twice_with_two_different_classes [

   wireUp register: WireTestObjectA named: 'Name'.

	self should: [ wireUp register: WireTestObjectB named: 'Name']
	     raise: Error
	     whoseDescriptionIncludes: '"Name" is already used as name of a wirable object'
		  description: 'Wrong message error'.

]

{ #category : #'test wire default constructor' }
WireUpUnitTest >> test_wiring_configured_to_use_object_default_constructor [

	(wireUp register: WireTestObjectA) useDefaultConstructor.
	self assert: (wireUp get: WireTestObjectA) class equals: WireTestObjectA
]

{ #category : #'test wire default constructor' }
WireUpUnitTest >> test_wiring_object_with_default_constructor_only [

	wireUp register: WireTestObjectA.
	self should: [ wireUp get: WireTestObjectA ] 
		  raise: Error 
		  whoseDescriptionIncludes: 'wireTestObjectA don''t have a tailored constructor'
		  description: 'Error didin''t happend as expected'.
	
]

{ #category : #'test wire tailored constructor' }
WireUpUnitTest >> test_wiring_object_with_one_tailored_constructor_no_arg [

	wireUp register: WireTestObjectB.
	self assert: (wireUp get: WireTestObjectB) class equals: WireTestObjectB
	
]

{ #category : #'test wire tailored constructor' }
WireUpUnitTest >> test_wiring_object_with_one_tailored_constructor_one_arg_matching [

	wireUp register: WireTestObjectB named: 'knownArg'.
	wireUp register: WireObjectConstructorKnownArg.
	self assert: ((wireUp get: WireObjectConstructorKnownArg) knownArg) class equals: WireTestObjectB
		
]

{ #category : #'test wire tailored constructor' }
WireUpUnitTest >> test_wiring_object_with_one_tailored_constructor_one_arg_not_matching [

	wireUp register: WireTestObjectB.
	wireUp register: WireObjectConstructorUnknownArg.
	self should: [ wireUp get: WireObjectConstructorUnknownArg ] 
		  raise: Error 
		  whoseDescriptionIncludes: 'No constructor matches wire up settings.'
		  description: 'Should throw an error, but didin''t'.
		
]
