Class {
	#name : #ServiceLocatorConextVar,
	#superclass : #DynamicVariable,
	#instVars : [
		'defaultserviceLocator'
	],
	#category : #'Payroll-Core'
}

{ #category : #accessing }
ServiceLocatorConextVar class >> default: aDefautServiceLocator [

	self soleInstance default: aDefautServiceLocator.
]

{ #category : #accessing }
ServiceLocatorConextVar >> default [

	^ defaultserviceLocator.
]

{ #category : #accessing }
ServiceLocatorConextVar >> default: aDefautServiceLocator [

	defaultserviceLocator := aDefautServiceLocator.
]
