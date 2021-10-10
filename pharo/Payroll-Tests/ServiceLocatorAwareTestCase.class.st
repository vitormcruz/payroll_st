Class {
	#name : #ServiceLocatorAwareTestCase,
	#superclass : #Trait,
	#instVars : [
		'testServiceLocator'
	],
	#category : #'Payroll-Tests'
}

{ #category : #running }
ServiceLocatorAwareTestCase >> runCase [

	ServiceLocatorConextVar value: 'dummy' 
							      during: [ super runCase ].

]

{ #category : #'as yet unclassified' }
ServiceLocatorAwareTestCase >> serviceLocator: aServiceLocator [

	testServiceLocator := aServiceLocator.
]
