Nil! : [Object, Copy, Store, Equal, Json] {

	[equal, =] { :self :anObject |
		anObject.isNil
	}

	[evaluatingIfNil, ??] { :unused :anObject |
		anObject
	}

	[ifNil, ?] { :self :whenNil/0 |
		whenNil()
	}

	[ifNotNil, !?] { :self :whenNotNil/1 |
		nil
	}

	[similar, ~] { :self :anObject |
		self = anObject
	}

	concisePrintString { :self |
		self.printString
	}

	ifNil { :self :whenNil/0 :whenNotNil/1 |
		whenNil()
	}

	ifNotNil { :self :whenNotNil/1 :whenNil/0 |
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

	replaceNil { :unused :anObject |
		anObject
	}

	shallowCopy { :unused |
		nil
	}

	storeString { :self |
		'nil'
	}

}

+@Object {

	[evaluatingIfNil, ??] { :self :unused |
		self
	}

	[ifNil, ?] { :self :whenNil/0 |
		self
	}

	[ifNotNil, !?] { :self :whenNotNil/1 |
		whenNotNil/1.cull(self)
	}

	ifNil { :self :whenNil/0 :whenNotNil/1 |
		whenNotNil/1.cull(self)
	}

	ifNotNil { :self :whenNotNil/1 :whenNil/0 |
		whenNotNil/1.cull(self)
	}

	isNil { :self |
		false
	}

	isNotNil { :self |
		true
	}

	replaceNil { :self :unused |
		self
	}

}
