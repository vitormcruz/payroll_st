Trait {
	#name : #TPayrollIntegrationTestBase,
	#instVars : [
		'testWupContext',
		'wupContextDynVar',
		'wupTestContext'
	],
	#traits : 'TWupContextAwareTestCase',
	#classTraits : 'TWupContextAwareTestCase classTrait',
	#category : #'Payroll-Tests-Util'
}

{ #category : #initialization }
TPayrollIntegrationTestBase >> initialize [

	super initialize.
	
	wupTestContext := self testContextBasedOn: self wupContextDynVar value.
]

{ #category : #tests }
TPayrollIntegrationTestBase >> testContextBasedOn: aWupContext [

	^ aWupContext deepCopy.
]

{ #category : #accessing }
TPayrollIntegrationTestBase >> wupProdContextDynVar [

	^ PayrollWupContextDynVar.
]

{ #category : #accessing }
TPayrollIntegrationTestBase >> wupTestContext [

	^ wupContextDynVar.
]
