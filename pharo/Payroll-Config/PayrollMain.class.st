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
	

	self configureServices: PayrollWupContextVar value.
	
	PayrollWebPage register_me_as_root_on_server.
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: 'payroll'.

	Smalltalk snapshot: false andQuit: false

]

{ #category : #'as yet unclassified' }
PayrollMain >> configureServices: aWupContext [
	
	aWupContext register: RepositoryInMemory named: 'employees'.

	
]
