Class {
	#name : #EntityPatternTest,
	#superclass : #TestCase,
	#category : #'Patterns-Tests'
}

{ #category : #tests }
EntityPatternTest >> test_equality_with_different_object [

	self assert: (DummyEntity new = Object new) not
]

{ #category : #tests }
EntityPatternTest >> test_equality_with_nil [

	self assert: (DummyEntity new = nil) not.
]

{ #category : #tests }
EntityPatternTest >> test_equality_with_same_ids [

	| obj duckObject |
	
	obj := DummyEntity new.
	duckObject := DuckEntityObject new.
	duckObject id: (obj id).
	self assert: (obj = duckObject).
]

{ #category : #tests }
EntityPatternTest >> test_equality_with_same_object [

	| obj |
	
	obj := DummyEntity new.
	self assert: (obj = obj).
]

{ #category : #tests }
EntityPatternTest >> test_hashCode_same_as_id [

	| obj |
	
	obj := DummyEntity new.
	self assert: obj id hash 
		  equals: obj hash.
]
