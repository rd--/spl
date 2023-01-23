UndefinedObject : [Object] {

	= { :self :anObject |
		anObject.isNil
	}

	? { :self :anObject |
		anObject.value
	}

	~? { :self :anObject |
		nil
	}

	ifNil { :self :aProcedure:/0 |
		aProcedure()
	}

	ifNotNil { :self :aProcedure:/0 |
		 nil
	}

	isNil { :self |
		true
	}

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	printString { :self |
		'nil'
	}

}

+ @Object {

	? { :self :anObject |
		self
	}

	~? { :self :anObject |
		anObject.value
	}

	ifNil { :self :aProcedure:/0 |
		nil
	}

	ifNotNil { :self :aProcedure:/0 |
		aProcedure()
	}

	isNil { :self |
		false
	}

	notNil { :self |
		self.isNil.not
	}

}
