Class {
	#name : #PayrollMain,
	#superclass : #CommandLineHandler,
	#category : #'Payroll-Config'
}

{ #category : #accessing }
PayrollMain class >> commandName [
	^ 'startPayroll'
]

{ #category : #activation }
PayrollMain >> activate [

	| adaptor |
	

	PayrollServiceLocatorVar default: PayrollServiceLocatorProduction new.
	
	PayrollWebPage register_me_as_root_on_server.
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: 'payroll'.

	Smalltalk snapshot: false andQuit: false

]
