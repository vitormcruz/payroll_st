Trait {
	#name : #TPayrollIntegrationTestBase,
	#traits : 'TServiceLocatorAwareTestCaseTrait',
	#classTraits : 'TServiceLocatorAwareTestCaseTrait classTrait',
	#category : #'Payroll-Tests-Util'
}

{ #category : #initialization }
TPayrollIntegrationTestBase >> initialize [ 

	super initialize.
	self serviceLocator_for_IntegrationTest: PayrollServiceLocatorForTest new.
]
