Trait {
	#name : #TWupContextAwareTestCase,
	#instVars : [
		'testWupContext',
		'wupContextDynVar'
	],
	#category : #WireUp
}

{ #category : #running }
TWupContextAwareTestCase >> runCase [

	self wupProdContextDynVar value: self wupTestContext
					              during: [ super runCase ].
]

{ #category : #initialization }
TWupContextAwareTestCase >> setUp [

	self wupTestContext fillExisting: self.
]

{ #category : #accessing }
TWupContextAwareTestCase >> wupProdContextDynVar [

	self subclassResponsibility.
]

{ #category : #accessing }
TWupContextAwareTestCase >> wupTestContext [

	self subclassResponsibility.
]
