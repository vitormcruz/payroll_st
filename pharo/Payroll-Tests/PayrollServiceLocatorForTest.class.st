Class {
	#name : #PayrollServiceLocatorForTest,
	#superclass : #PayrollServiceLocatorProduction,
	#category : #'Payroll-Tests-Util'
}

{ #category : #accessing }
PayrollServiceLocatorForTest >> employeeRepository [

	^ employeeRepository ifNil: [ employeeRepository := RepositoryInMemory new ].
]
