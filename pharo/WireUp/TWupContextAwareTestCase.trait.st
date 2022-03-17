Trait {
	#name : #TWupContextAwareTestCase,
	#instVars : [
		'wupTestContext'
	],
	#category : #WireUp
}

{ #category : #initialization }
TWupContextAwareTestCase >> initializeIntTrait [
	
	wupTestContext := self new_wup_test_context_based_on: (self wupProdContextDynVar value).
]

{ #category : #private }
TWupContextAwareTestCase >> instanceVariablesToKeep [


	^ super instanceVariablesToKeep, #( 'wupTestContext' ).
]

{ #category : #tests }
TWupContextAwareTestCase >> new_wup_test_context_based_on: wireContext [

	^ wireContext clone.
]

{ #category : #running }
TWupContextAwareTestCase >> runCase [

	self wupTestContext fillExisting: self.
	self wupProdContextDynVar value: self wupTestContext
					              during: [ super runCase ].
]

{ #category : #accessing }
TWupContextAwareTestCase >> wupProdContextDynVar [

	self subclassResponsibility.
]

{ #category : #accessing }
TWupContextAwareTestCase >> wupTestContext [

	^ wupTestContext.
]
