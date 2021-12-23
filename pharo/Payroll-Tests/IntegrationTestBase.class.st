Class {
	#name : #IntegrationTestBase,
	#superclass : #TestCase,
	#traits : 'TServiceLocatorAwareTestCaseTrait',
	#classTraits : 'TServiceLocatorAwareTestCaseTrait classTrait',
	#category : #'Payroll-Tests'
}

{ #category : #'as yet unclassified' }
IntegrationTestBase class >> isAbstract [ 

	^ self name = #IntegrationTestBase

]

{ #category : #initialization }
IntegrationTestBase >> initialize [ 
	
	self serviceLocator_for_IntegrationTest: PayrollServiceLocatorForTest new.
]
