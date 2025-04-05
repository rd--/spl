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
		self.kilograms * 1000
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

}

+SmallFloat {

	Mass { :self |
		newMass().initializeSlots(self)
	}

}

+@Number {

	asKilograms { :self |
		self
	}

	grams { :self |
		(self * 1000).kilograms
	}

	kilograms { :self |
		Quantity(self, 'kilograms')
	}

	ounces { :self |
		(self * 28.349523125).grams
	}

	pounds { :self |
		(self * 0.45359237).kilograms
	}

}
