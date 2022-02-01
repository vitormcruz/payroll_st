Extension { #name : #Metaclass }

{ #category : #'*WireUp' }
Metaclass >> findConstructorForWiring [

	<todo: 'Implement unit tests if this code survives the end of acceptance tests.'>

	^ self chain 
			 methods; 
			 select: [ :method | method protocol = 'instance creation' ];
			 ifNotEmpty: [ :constructors | constructors at: 1 ] ifEmpty: [ Error signal: thisClass nameForWring, ' don''t have a tailored constructor' ].
]
