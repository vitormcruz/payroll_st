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

	ZnZincServerAdaptor new. "Self registered..."
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: 'payroll'.
	
	Smalltalk snapshot: false andQuit: false.

]
