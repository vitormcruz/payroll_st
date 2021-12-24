Class {
	#name : #TestServiceLocationAwarenessOff,
	#superclass : #TestCase,
	#category : #'Payroll-Tests'
}

{ #category : #tests }
TestServiceLocationAwarenessOff >> test_ServiceLocator_awareness_off [ 

	self assert: PayrollServiceLocatorVar value isNil.
]
