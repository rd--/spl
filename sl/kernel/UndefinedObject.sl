UndefinedObject {

	= { :self :anObject | anObject.isNil }
	? { :self :anObject | anObject.value }
	~? { :self :anObject | nil }

	printString { :self | 'nil' }
	ifNil { :self :aProcedure | aProcedure.value }
	ifNotNil { :self :aProcedure | nil }
	isNil { :self | true }
}

+ Object {

	? { :self :anObject | self }
	~? { :self :anObject | anObject.value }

	ifNil { :self :aProcedure | nil }
	ifNotNil { :self :aProcedure | aProcedure.value }
	isNil { :self | false }
	notNil { :self | self.isNil.not }

}

+ Void {
	UndefinedObject { 'UndefinedObject(): there are no more undefined objects'.error }
}
