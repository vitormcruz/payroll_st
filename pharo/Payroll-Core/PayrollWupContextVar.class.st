Class {
	#name : #PayrollWupContextVar,
	#superclass : #DynamicVariable,
	#instVars : [
		'defaultWupContext'
	],
	#category : #'Payroll-Core'
}

{ #category : #accessing }
PayrollWupContextVar class >> default: aDefaultServiceLocator [

	self soleInstance default: aDefaultServiceLocator.
]

{ #category : #accessing }
PayrollWupContextVar >> default [
	"Answer the default value for the variable. The default for the default value is nil."
	^ defaultWupContext.
]

{ #category : #accessing }
PayrollWupContextVar >> default: aDefaultWupContext [

	defaultWupContext := aDefaultWupContext.
]

{ #category : #initialization }
PayrollWupContextVar >> initialize [ 

	defaultWupContext := WupWiringContext new.
]
