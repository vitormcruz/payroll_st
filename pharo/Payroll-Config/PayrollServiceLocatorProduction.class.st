Class {
	#name : #PayrollServiceLocatorProduction,
	#superclass : #PayrollServiceLocator,
	#category : #'Payroll-Config'
}

{ #category : #accessing }
PayrollServiceLocatorProduction >> employeeRepository [

	^ employeeRepository ifNil: [ employeeRepository := RepositoryInMemory new ].
]
