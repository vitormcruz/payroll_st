Trait {
	#name : #TWupContextAwareTestCase,
	#instVars : [
		'testWupContext',
		'wupContextVar'
	],
	#category : #WireUp
}

{ #category : #running }
TWupContextAwareTestCase >> runCase [

	wupContextVar value: testWupContext
					  during: [ super runCase ].
]
