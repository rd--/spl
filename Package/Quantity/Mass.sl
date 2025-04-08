Mass : [Object, Magnitude] { | kilograms |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	< { :self :aMass |
		self.kilograms < aMass.kilograms
	}

	magnitude { :self |
		self.kilograms
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	unit { :unused |
		'kilograms'
	}

}

+SmallFloat {

	Mass { :self |
		newMass().initializeSlots(self)
	}

}

+[Mass, Quantity] {

	asKilograms { :self |
		self.kilograms
	}

	grams { :self |
		self.kilograms * 1E3
	}

	ounces { :self |
		self.grams * 28.349523125
	}

	pounds { :self |
		self.kilograms * 0.45359237
	}

}

+Quantity {

	asMass { :self |
		Mass(self.kilograms)
	}

}

+@Number {

	asKilograms { :self |
		self
	}

	grams { :self |
		(self * 1E-3).kilograms
	}

	ounces { :self |
		(self * 28.349523125).grams
	}

	pounds { :self |
		(self * 0.45359237).kilograms
	}

}
