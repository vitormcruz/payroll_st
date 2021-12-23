Class {
	#name : #PayrollServiceLocatorForTest,
	#superclass : #PayrollServiceLocatorProduction,
	#category : #'Payroll-Tests'
}

{ #category : #accessing }
PayrollServiceLocatorForTest >> employeeRepository [

	^ employeeRepository ifNil: [ employeeRepository := RepositoryInMemory new ].
]
