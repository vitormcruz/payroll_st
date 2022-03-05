Trait {
	#name : #TPayrollIntegrationTestBase,
	#instVars : [
		'testWupContext',
		'wupContextVar'
	],
	#traits : 'TWupContextAwareTestCase',
	#classTraits : 'TWupContextAwareTestCase classTrait',
	#category : #'Payroll-Tests-Util'
}

{ #category : #initialization }
TPayrollIntegrationTestBase >> initialize [

	super initialize.
	wupContextVar := PayrollWupContextVar.
	testWupContext := self testContextBasedOn: PayrollWupContextVar value. 

]

{ #category : #tests }
TPayrollIntegrationTestBase >> testContextBasedOn: aWupContext [

	^ aWupContext deepCopy.
]
