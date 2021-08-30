Class {
	#name : #PayrollMain,
	#superclass : #Object,
	#category : #'Payroll-Config'
}

{ #category : #'as yet unclassified' }
PayrollMain class >> start [

	WAAdmin defaultServerManager register: ZnZincServerAdaptor new.
	WAAdmin defaultServerManager startAll. 
	
]
