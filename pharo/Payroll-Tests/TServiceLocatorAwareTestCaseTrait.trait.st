Trait {
	#name : #TServiceLocatorAwareTestCaseTrait,
	#instVars : [
		'testServiceLocator'
	],
	#category : #'Payroll-Tests-Util'
}

{ #category : #'as yet unclassified' }
TServiceLocatorAwareTestCaseTrait >> populateServiceByNames: anArrayOfServiceNames [

	"Populate variables with services having the same name"
	
	((self class instanceVariables collect: #name) 
		intersection: anArrayOfServiceNames) do: [ :serviceName | self instVarNamed: serviceName put: (self service: serviceName) ].
]

{ #category : #running }
TServiceLocatorAwareTestCaseTrait >> runCase [

	PayrollServiceLocatorVar value: self serviceLocator_for_IntegrationTest
							      during: [ super runCase ].
]

{ #category : #accessing }
TServiceLocatorAwareTestCaseTrait >> service: aServiceSymbolName [

	^ PayrollServiceLocatorVar value perform: aServiceSymbolName.

]

{ #category : #accessing }
TServiceLocatorAwareTestCaseTrait >> serviceLocator_for_IntegrationTest [

	^ testServiceLocator.
]

{ #category : #accessing }
TServiceLocatorAwareTestCaseTrait >> serviceLocator_for_IntegrationTest: aServiceLocator [

	testServiceLocator := aServiceLocator.
]
