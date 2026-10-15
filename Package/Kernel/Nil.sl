Nil! : [Object, Copy, Store, Equal, Compare, Json] {

	compare { :unused :operand |
		operand.ifNil {
			0
		} {
			-1
		}
	}

	concisePrintString { :self |
		self.printString
	}

	[encodeJson, nilToJson] { :self |
		self.uncheckedEncodeJson
	}

	[equal, =] { :self :anObject |
		anObject.isNil
	}

	[evaluatingIfNil, ??] { :unused :anObject |
		anObject
	}

	ifNil { :self :whenNil/0 :whenNotNil/1 |
		whenNil()
	}

	[ifNil, ?] { :self :whenNil/0 |
		whenNil()
	}

	ifNotNil { :self :whenNotNil/1 :whenNil/0 |
		whenNil()
	}

	[ifNotNil, !?] { :self :whenNotNil/1 |
		nil
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

	[similar, ~] { :self :anObject |
		self = anObject
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
