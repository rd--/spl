Nil : [Object, Json] {

	= { :self :anObject |
		anObject.isNil
	}

	ifNil { :self :aProcedure:/0 |
		aProcedure()
	}

	ifNil { :self :whenNil:/0 :whenNotNil |
		whenNil()
	}

	ifNotNil { :self :aProcedure:/0 |
		nil
	}

	ifNotNil { :self :whenNotNil:/0 :whenNil:/0 |
		whenNil()
	}

	isNil { :self |
		true
	}

	storeString { :self |
		'nil'
	}

}

+@Object {

	ifNil { :self :aProcedure:/0 |
		self
	}

	ifNil { :self :whenNil:/0 :whenNotNil |
		whenNotNil.cull(self)
	}

	ifNotNil { :self :aProcedure:/0 |
		aProcedure()
	}

	ifNotNil { :self :whenNotNil:/0 :whenNil:/0 |
		whenNotNil()
	}

	isNil { :self |
		false
	}

	notNil { :self |
		self.isNil.not
	}

}
