Trait {
	#name : #TPayrollIntegrationTestBase,
	#instVars : [
		'wupContextDynVar',
		'wupTestContext'
	],
	#traits : 'TWupContextAwareTestCase',
	#classTraits : 'TWupContextAwareTestCase classTrait',
	#category : #'Payroll-Tests-Util'
}

{ #category : #initialization }
TPayrollIntegrationTestBase >> initializeIntTrait [
	
	wupTestContext := self new_wup_test_context_based_on: (self wupProdContextDynVar value).
]

{ #category : #private }
TPayrollIntegrationTestBase >> instanceVariablesToKeep [


	^ super instanceVariablesToKeep, #( 'wupTestContext' 'wupContextDynVar' ).
]

{ #category : #tests }
TPayrollIntegrationTestBase >> new_wup_test_context_based_on: wireContext [

	^ wireContext clone.
]

{ #category : #accessing }
TPayrollIntegrationTestBase >> wupProdContextDynVar [

	^ PayrollWupContextDynVar.
]

{ #category : #accessing }
TPayrollIntegrationTestBase >> wupTestContext [

	^ wupTestContext.
]
