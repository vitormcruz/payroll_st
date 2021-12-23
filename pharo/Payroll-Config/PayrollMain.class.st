Class {
	#name : #PayrollMain,
	#superclass : #CommandLineHandler,
	#category : #'Payroll-Config'
}

{ #category : #accessing }
PayrollMain class >> commandName [
	^ 'startPayroll'
]

{ #category : #initialization }
PayrollMain class >> initialize [ 

	 PayrollServiceLocator default: PayrollServiceLocatorProduction new.
]

{ #category : #activation }
PayrollMain >> activate [

	| adaptor |
	

	 PayrollServiceLocatorVar default: PayrollServiceLocatorProduction new.
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: 'payroll'.

	Smalltalk snapshot: false andQuit: false

]
