Class {
	#name : #BuildedClassForTest,
	#superclass : #Object,
	#instVars : [
		'prop1',
		'prop2',
		'prop3',
		'x'
	],
	#category : #'Patterns-Tests'
}

{ #category : #'instance creation' }
BuildedClassForTest class >> newWithPropX: anObject [

	^ self new x: anObject.
]

{ #category : #accessing }
BuildedClassForTest >> prop1 [

	^ prop1.
]

{ #category : #accessing }
BuildedClassForTest >> prop1: anObject [

	prop1 := anObject.
]

{ #category : #accessing }
BuildedClassForTest >> prop2 [

	^ prop2.
]

{ #category : #accessing }
BuildedClassForTest >> prop2: anObject [

	prop2 := anObject.
]

{ #category : #accessing }
BuildedClassForTest >> prop3 [

	^ prop3.
]

{ #category : #accessing }
BuildedClassForTest >> prop3: anObject [

	prop3 := anObject.
]

{ #category : #accessing }
BuildedClassForTest >> x [

	^ x
]

{ #category : #accessing }
BuildedClassForTest >> x: anObject [

	x := anObject.
]
