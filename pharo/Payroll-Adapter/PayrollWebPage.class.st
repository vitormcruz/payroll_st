Class {
	#name : #PayrollWebPage,
	#superclass : #Object,
	#category : #'Payroll-Adapter-Seaside'
}

{ #category : #rendering }
PayrollWebPage >> aboutInfoFor: html [

	html mdlNavigationLink id: 'aboutLink'; 
								  url: '#'; 
					  		     with: 'About'.

	html mdlDialog	
		  openButtonId: 'aboutLink';
  		  with: [ 
		  		html mdlDialogTitle: 'About Payroll'.
			 	html mdlDialogContent: [ html paragraph: 'The Payroll Use Case described in Agile Software Development PPP, by Uncle Bob, implemented with Pharo.' ] 
		  ]
]

{ #category : #initialization }
PayrollWebPage >> initialize [

	super initialize.
]

{ #category : #rendering }
PayrollWebPage >> renderContentOn: html [

	html mdlLayout fixedHeader; with: [ 
		
		html mdlLayoutHeader: [ 
			html mdlLayoutHeaderRow: [ 
				html mdlLayoutTitle: [ html mdlNavigationLink id: 'payrollLayoutTitle'; url: '/'; with: 'Payroll' ].
				html mdlLayoutSpacer.
				html mdlNavigation: [ 
					self aboutInfoFor: html.
				].
			] 
		].
	
	]
				
]

{ #category : #accessing }
PayrollWebPage >> style [
	^ '

.mdl-pagination__current{
	box-shadow: inset 0px -4px 0px 0px #69F0AE !important;
}

#payrollLayoutTitle{
	font-size: 130%;
}
	
'
]

{ #category : #updating }
PayrollWebPage >> updateRoot: anHtmlRoot [

    super updateRoot: anHtmlRoot.
    anHtmlRoot title: 'payroll'.
]
