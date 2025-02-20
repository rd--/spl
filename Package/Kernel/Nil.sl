Nil! : [Object, Json] {

	? { :self :aBlock:/0 |
		aBlock()
	}

	?? { :self :anObject |
		anObject.value
	}

	~? { :self :aBlock:/0 |
		nil
	}

	= { :self :anObject |
		anObject.isNil
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

	isImmediate { :self |
		true
	}

	isLiteral { :self |
		true
	}

	isNil { :self |
		true
	}

	notNil { :self |
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

	notNil { :self |
		true
	}

}
