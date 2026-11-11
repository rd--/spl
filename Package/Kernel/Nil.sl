Nil! : [Object, Copy, Store, Equal, Compare, Json] {

	compare { :unused :operand |
		operand.ifNil {
			0
		} {
			-1
		}
	}

	[encodeJson, nilToJson] { :self |
		self.uncheckedEncodeJson
	}

	[evaluatingIfNil, ??] { :unused :anObject |
		anObject
	}

	ifNil { :self :whenNil/0 :whenNotNil/0 |
		whenNil()
	}

	[ifNil, ?] { :self :whenNil/0 |
		whenNil()
	}

	ifNotNil { :self :whenNotNil/0 :whenNil/0 |
		whenNil()
	}

	[ifNotNil, !?] { :self :whenNotNil/0 |
		nil
	}

	[isEqual, =] { :self :anObject |
		anObject.isNil
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

	[isSimilar, ~] { :self :anObject |
		self = anObject
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

	ifNil { :self :whenNil/0 :whenNotNil/0 |
		whenNotNil()
	}

	[ifNotNil, !?] { :self :whenNotNil/0 |
		whenNotNil()
	}

	ifNotNil { :self :whenNotNil/0 :whenNil/0 |
		whenNotNil()
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
