Class {
	#name : #TestServiceLocationAwarenessOn,
	#superclass : #TestCase,
	#traits : 'TPayrollIntegrationTestBase',
	#classTraits : 'TPayrollIntegrationTestBase classTrait',
	#instVars : [
		'employeeRepository'
	],
	#category : #'Payroll-Tests'
}

{ #category : #'as yet unclassified' }
TestServiceLocationAwarenessOn >> runCase [

	((self class >> testSelector) 
		pragmas anySatisfy: [  ]) ifTrue: [ ^ super runCase ].

	PayrollServiceLocatorVar value: self serviceLocator_for_IntegrationTest
							      during: [ super runCase ].
]

{ #category : #tests }
TestServiceLocationAwarenessOn >> test_ServiceLocator_awareness_on [ 

	self assert: PayrollServiceLocatorVar value class equals: PayrollServiceLocatorForTest.
]

{ #category : #tests }
TestServiceLocationAwarenessOn >> test_get_a_service [

	self assert: (self service: #employeeRepository) class equals: RepositoryInMemory.
]

{ #category : #tests }
TestServiceLocationAwarenessOn >> test_populate_service_variable_by_name [

	
	self populateServiceByNames: #(#employeeRepository).
	self assert: employeeRepository class equals: RepositoryInMemory.
]
