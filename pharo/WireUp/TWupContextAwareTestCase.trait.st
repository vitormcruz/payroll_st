Trait {
	#name : #TWupContextAwareTestCase,
	#category : #WireUp
}

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

	self subclassResponsibility.
]
