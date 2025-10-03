Nil! : [Object, Equatable, Json] {

	? { :unused :aBlock:/0 |
		aBlock()
	}

	?? { :unused :anObject |
		anObject.value
	}

	~? { :unused :aBlock:/0 |
		nil
	}

	= { :self :anObject |
		anObject.isNil
	}

	~ { :self :anObject |
		self = anObject
	}

	concisePrintString { :self |
		self.printString
	}

	copy { :self |
		nil
	}

	ifNil { :self :whenNil:/0 |
		whenNil()
	}

	ifNil { :self :whenNil:/0 :whenNotNil:/1 |
		whenNil()
	}

	ifNotNil { :self :whenNotNil:/1 |
		nil
	}

	ifNotNil { :self :whenNotNil:/1 :whenNil:/0 |
		whenNil()
	}

	isImmediate { :unused |
		true
	}

	isLiteral { :self |
		true
	}

	isNil { :self |
		true
	}

	isNotNil { :self |
		false
	}

	storeString { :self |
		'nil'
	}

}

+@Object {

	ifNil { :self :whenNil:/0 |
		self
	}

	ifNil { :self :whenNil:/0 :whenNotNil:/1 |
		whenNotNil:/1.cull(self)
	}

	ifNotNil { :self :whenNotNil:/1 |
		whenNotNil:/1.cull(self)
	}

	ifNotNil { :self :whenNotNil:/1 :whenNil:/0 |
		whenNotNil:/1.cull(self)
	}

	isNil { :self |
		false
	}

	isNotNil { :self |
		true
	}

}
