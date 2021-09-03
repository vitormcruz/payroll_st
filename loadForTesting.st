Metacello new
	repository: 'tonel://E:\Projetos\payroll_st\pharo';
	baseline: 'Payroll';
	onConflict: [ :ex :pa :pb |
		((pb repositoryDescriptions joinUsing: ' ')
			includesSubstring: 'Seaside:v3.4.5') ifTrue: [ ex useIncoming  ] ];
	onUpgrade: [ :ex | ex useIncoming ];
	onDowngrade: [ :ex | ex useLoaded ];
	load: #(core)