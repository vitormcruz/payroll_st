Class {
	#name : #PayrollWupContextDynVar,
	#superclass : #DynamicVariable,
	#instVars : [
		'defaultWupContext'
	],
	#category : #'Payroll-Config'
}

{ #category : #accessing }
PayrollWupContextDynVar class >> default: aWupContext [

	self soleInstance default: aWupContext.
]

{ #category : #accessing }
PayrollWupContextDynVar >> default [
	"Answer the default value for the variable. The default for the default value is nil."
	^ defaultWupContext.
]

{ #category : #accessing }
PayrollWupContextDynVar >> default: aDefaultWupContext [

	defaultWupContext := aDefaultWupContext.
]

{ #category : #initialization }
PayrollWupContextDynVar >> initialize [ 

	defaultWupContext := WupWiringContext new.
	(defaultWupContext register: RepositoryInMemory named: 'employeeRepository') useDefaultConstructor.

]
