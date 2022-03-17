Trait {
	#name : #TPayrollIntegrationTestBase,
	#traits : 'TWupContextAwareTestCase',
	#classTraits : 'TWupContextAwareTestCase classTrait',
	#category : #'Payroll-Tests-Util'
}

{ #category : #accessing }
TPayrollIntegrationTestBase >> wupProdContextDynVar [

	^ PayrollWupContextDynVar.
]
