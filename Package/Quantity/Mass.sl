Mass : [Object, Magnitude] { | kilograms |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	< { :self :aMass |
		self.kilograms < aMass.kilograms
	}

	asKilograms { :self |
		self.kilograms
	}

	grams { :self |
		self.kilograms * 1E3
	}

	magnitude { :self |
		self.kilograms
	}

	ounces { :self |
		self.grams * 28.349523125
	}

	pounds { :self |
		self.kilograms * 0.45359237
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

+Quantity {

	asMass { :self |
		(self.unit = 'kilograms').if {
			Mass(self.magnitude)
		} {
			self.error('asMass: not mass')
		}
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
