Class {
	#name : #PayrollMain,
	#superclass : #Object,
	#category : #'Payroll-Config'
}

{ #category : #'as yet unclassified' }
PayrollMain class >> start [

	ZnZincServerAdaptor new. "Self registered..."
	
	WAAdmin defaultServerManager startAll.
	
]
