Class {
	#name : #PayrollServiceLocatorVar,
	#superclass : #DynamicVariable,
	#instVars : [
		'defaultserviceLocator'
	],
	#category : #'Payroll-Core'
}

{ #category : #accessing }
PayrollServiceLocatorVar class >> default: aDefaultServiceLocator [

	self soleInstance default: aDefaultServiceLocator.
]

{ #category : #accessing }
PayrollServiceLocatorVar >> default [
	"Answer the default value for the variable. The default for the default value is nil."
	^ defaultserviceLocator.
]

{ #category : #accessing }
PayrollServiceLocatorVar >> default: aDefaultServiceLocator [

	defaultserviceLocator := aDefaultServiceLocator.
]
