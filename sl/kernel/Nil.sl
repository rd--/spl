Nil {

	= { :self :anObject | anObject.isNil }
	? { :self :anObject | anObject.value }
	~? { :self :anObject | nil }

	printString { :self | 'nil' }
	ifNil { :self :aProcedure | aProcedure.value }
	ifNotNil { :self :aProcedure | nil }
}

+ Object {

	? { :self :anObject | self }
	~? { :self :anObject | anObject.value }

	ifNil { :self :aProcedure | nil }
	ifNotNil { :self :aProcedure | aProcedure.value }
	notNil { :self | self.isNil.not }

}

+ Void {

	Nil { nil }

}
