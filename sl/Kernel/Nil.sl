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

	ifNil { :self :whenNil:/0 |
		whenNil()
	}

	ifNil { :self :whenNil:/0 :whenNotNil |
		whenNil()
	}

	ifNotNil { :self :whenNotNil |
		nil
	}

	ifNotNil { :self :whenNotNil :whenNil:/0 |
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

	ifNil { :self :whenNil:/0 |
		self
	}

	ifNil { :self :whenNil:/0 :whenNotNil |
		whenNotNil.cull(self)
	}

	ifNotNil { :self :whenNotNil |
		whenNotNil.cull(self)
	}

	ifNotNil { :self :whenNotNil :whenNil:/0 |
		whenNotNil.cull(self)
	}

	isNil { :self |
		false
	}

	notNil { :self |
		self.isNil.not
	}

}
