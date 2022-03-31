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
	^ self
		  scenario: 'Add a new Employee'
		  def:
			  'Given that "John" is a new employee with a "999-888-777" SSN number
				  When I add John into the Payroll System
				  Then Jhon becomes part of it
				  And when I look for "999-888-777" the Payroll System finds "John"'
		  run: [ :newEmpName :newEmpSSN :expectedSSN :expectedEmpName | 
			  | newEmployee employeeAdded |
			
			  newEmployee := Employee newNamed: newEmpName
				                       havingSSN: newEmpSSN
				                       livingAt: 'Street1'
				                       withEmail: 'john2121@email.com.br'
				                       payed: (MonthlyPayment aValueOf: 2000)
				                       andWithDeliveryType: PaymasterDelivery new.
				
			  employeeRepository add: newEmployee.
			  employeeAdded := employeeRepository detect: [ :emp | emp id = newEmployee id ].
			
			  self assert: employeeAdded id equals: newEmployee id.
			  self assert: employeeAdded ssn equals: expectedSSN.
			  self assert: employeeAdded name equals: expectedEmpName.
		  ]
]

{ #category : #initialization }
ManageEmployees >> initialize [

	super initialize.
	self initializeIntTrait.
]
