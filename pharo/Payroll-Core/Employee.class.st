Class {
	#name : #Employee,
	#superclass : #Object,
	#traits : 'EntityPattern',
	#classTraits : 'EntityPattern classTrait',
	#instVars : [
		'#ssn',
		'#name',
		'#address',
		'#email',
		'#paymentMethod',
		'#paymentDeliveryType'
	],
	#category : #'Payroll-Core'
}

{ #category : #'instance creation' }
Employee class >> newNamed: aString havingSSN: anInteger livingAt: aString3 withEmail: aString4 payed: aFullBlockClosure andWithDeliveryType: aPaymasterDelivery [ 

	^ self new newNamed: aString havingSSN: anInteger livingAt: aString3 withEmail: aString4 payed: aFullBlockClosure andWithDeliveryType: aPaymasterDelivery.
]

{ #category : #accessing }
Employee >> address [

	^ address
]

{ #category : #accessing }
Employee >> email [

	^ email
]

{ #category : #initialization }
Employee >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
Employee >> name [

	^ name
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

{ #category : #accessing }
Employee >> paymentDeliveryType [

	^ paymentDeliveryType
]

{ #category : #accessing }
Employee >> paymentMethod [

	^ paymentMethod
]

{ #category : #accessing }
Employee >> ssn [

	^ ssn
]
