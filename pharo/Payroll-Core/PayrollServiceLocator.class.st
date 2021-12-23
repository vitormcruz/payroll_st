Class {
	#name : #PayrollServiceLocator,
	#superclass : #Object,
	#instVars : [
		'employeeRepository'
	],
	#category : #'Payroll-Core'
}

{ #category : #accessing }
PayrollServiceLocator >> employeeRepository [

	self subclassResponsibility.
]
