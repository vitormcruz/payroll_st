Class {
	#name : #PayrollWupContextDynVar,
	#superclass : #DynamicVariable,
	#instVars : [
		'defaultWupContext'
	],
	#category : #'Payroll-Config'
}

{ #category : #accessing }
PayrollWupContextDynVar class >> default: aDefaultServiceLocator [

	self soleInstance default: aDefaultServiceLocator.
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
	defaultWupContext register: RepositoryInMemory named: 'employeesRepository'.

]
