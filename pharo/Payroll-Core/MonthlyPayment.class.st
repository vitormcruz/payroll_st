Class {
	#name : #MonthlyPayment,
	#superclass : #Object,
	#instVars : [
		'employee'
	],
	#category : #'Payroll-Core'
}

{ #category : #'instance creation' }
MonthlyPayment class >> aValueOf: anInteger [ 

	^ [ :emp | self new employee: emp ]
]

{ #category : #accessors }
MonthlyPayment >> employee: anEmployee [ 

	employee := anEmployee.
]
