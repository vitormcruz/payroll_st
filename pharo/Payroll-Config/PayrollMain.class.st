Class {
	#name : #PayrollMain,
	#superclass : #CommandLineHandler,
	#instVars : [
		'wirebleObjectsConfigured'
	],
	#category : #'Payroll-Config'
}

{ #category : #accessing }
PayrollMain class >> commandName [
	^ 'startPayroll'
]

{ #category : #activation }
PayrollMain >> activate [

	| adaptor |
	
	PayrollWebPage register_me_as_root_on_server.
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: 'payroll'.

	Smalltalk snapshot: false andQuit: false

]

{ #category : #configuration }
PayrollMain >> configureWirebleObjects: aWupContext [
	
	wirebleObjectsConfigured ifTrue: [ ^ self ]. 
	aWupContext register: RepositoryInMemory named: 'employeesRepository'.
	wirebleObjectsConfigured := true.

	
]

{ #category : #initialization }
PayrollMain >> initialize [

	wirebleObjectsConfigured := false.
]
