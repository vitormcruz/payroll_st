Metacello new
	repository: 'tonel://pharo';
	baseline: 'Payroll';
	onConflict: [ :ex :pa :pb |
		((pb repositoryDescriptions joinUsing: ' ')
			includesSubstring: 'Seaside:v3.4.5') ifTrue: [ ex useIncoming  ] ];
	onUpgrade: [ :ex | ex useIncoming ];
	onDowngrade: [ :ex | ex useLoaded ];
	load: #(test)