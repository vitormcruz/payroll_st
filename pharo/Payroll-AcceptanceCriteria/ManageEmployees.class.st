"
As an Admin of the Payroll System
I want to manage employed people
So that they I can pay them properly for their work, nothing more, nothing less.
"
Class {
	#name : #ManageEmployees,
	#superclass : #TomeFeature,
	#traits : 'TPayrollIntegrationTestBase',
	#classTraits : 'TPayrollIntegrationTestBase classTrait',
	#instVars : [
		'employeeRepository'
	],
	#category : #'Payroll-AcceptanceCriteria'
}

{ #category : #scenario }
ManageEmployees >> Add_a_new_employee [

	<scenario>

	^ self scenario: 'Add a new Employee'
		  def: 'Given that "John" is a new employee with a "999-888-777" SSN number
				  When I add John into the Payroll System
				  Then Jhon becomes part of it
				  And when I look for "999-888-777" the Payroll System finds "John"'
		  run: [ :newEmpName :newEmpSSN :expectedSSN :expectedEmpName  |
		      employeeRepository add: (Employee newNamed: newEmpName
		                                        havingSSN: newEmpSSN
						                            livingAt: 'Street1'
                 						             withEmail: 'john2121@email.com.br'
						                      		 payed: (MonthlyPayment aValueOf: 2000)
      							                      andWithDeliveryType: PaymasterDelivery new).
			
		  ].
]

{ #category : #'as yet unclassified' }
ManageEmployees >> initialize [

	super initialize.
	self initializeIntTrait.
]
