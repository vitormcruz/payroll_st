Trait {
	#name : #TServiceLocatorAwareTestCaseTrait,
	#instVars : [
		'testServiceLocator'
	],
	#category : #'Payroll-Tests'
}

{ #category : #running }
TServiceLocatorAwareTestCaseTrait >> runCase [

	PayrollServiceLocatorVar value: self serviceLocator_for_IntegrationTest
							      during: [ super runCase ].
]

{ #category : #accessing }
TServiceLocatorAwareTestCaseTrait >> serviceLocator_for_IntegrationTest [

	^ testServiceLocator.
]

{ #category : #accessing }
TServiceLocatorAwareTestCaseTrait >> serviceLocator_for_IntegrationTest: aServiceLocator [

	testServiceLocator := aServiceLocator.
]
