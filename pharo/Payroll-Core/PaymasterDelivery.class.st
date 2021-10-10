Class {
	#name : #PaymasterDelivery,
	#superclass : #Object,
	#instVars : [
		'employee'
	],
	#category : #'Payroll-Core'
}

{ #category : #'instance creation' }
PaymasterDelivery class >> new [ 

	^ [ :emp | super new employee: emp ].
]

{ #category : #accesso }
PaymasterDelivery >> employee: anEmployee [ 

	employee := anEmployee.
]
