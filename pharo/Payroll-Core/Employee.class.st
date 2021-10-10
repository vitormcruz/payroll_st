Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'ssn',
		'name',
		'address',
		'email',
		'paymentMethod',
		'paymentDeliveryType'
	],
	#category : #'Payroll-Core'
}

{ #category : #'instance creation' }
Employee class >> newNamed: aString havingSSN: anInteger livingAt: aString3 withEmail: aString4 payed: aFullBlockClosure andWithDeliveryType: aPaymasterDelivery [ 

	^ self new newNamed: aString havingSSN: anInteger livingAt: aString3 withEmail: aString4 payed: aFullBlockClosure andWithDeliveryType: aPaymasterDelivery.
]

{ #category : #'instance initialization' }
Employee >> newNamed: empName havingSSN: empSSN livingAt: empAddress withEmail: empEmail payed: aPaymentMethodBuilderClosure andWithDeliveryType: aPaymentDeliveryTypeBuilderClosure [ 

	 ssn := empSSN.
	 name := empName.
	 address := empAddress.
	 email := empEmail.
	 paymentMethod := aPaymentMethodBuilderClosure value: self.
	 paymentDeliveryType := aPaymentDeliveryTypeBuilderClosure value: self.
	
]
