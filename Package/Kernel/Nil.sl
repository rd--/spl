Nil! : [Object, Storeable, Equatable, Json] {

	[equal, =] { :self :anObject |
		anObject.isNil
	}

	[evaluatingIfNil, ??] { :unused :anObject |
		anObject.value
	}

	[ifNil, ?] { :self :whenNil:/0 |
		whenNil()
	}

	[ifNotNil, !?] { :self :whenNotNil:/1 |
		nil
	}

	[similar, ~] { :self :anObject |
		self = anObject
	}

	concisePrintString { :self |
		self.printString
	}

	copy { :self |
		nil
	}

	ifNil { :self :whenNil:/0 :whenNotNil:/1 |
		whenNil()
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

	[evaluatingIfNil, ??] { :self :anObject |
		self
	}

	[ifNil, ?] { :self :whenNil:/0 |
		self
	}

	[ifNotNil, !?] { :self :whenNotNil:/1 |
		whenNotNil:/1.cull(self)
	}

	ifNil { :self :whenNil:/0 :whenNotNil:/1 |
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
