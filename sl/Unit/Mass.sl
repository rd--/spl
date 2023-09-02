Mass : [Object, Magnitude] { | grams |

	= { :self :anObject |
		anObject.isMass & {
			self.grams = anObject.grams
		}
	}

	~ { :self :anObject |
		anObject.isMass & {
			self.grams ~ anObject.grams
		}
	}

	< { :self :aMass |
		self.grams < aMass.grams
	}

	asGrams { :self |
		self.grams
	}

	kilograms { :self |
		self.grams / 1000
	}

	ounces { :self |
		self.grams * 28.349523125
	}

	pounds { :self |
		self.kilograms * 0.45359237
	}

	storeString { :self |
		self.grams.storeString ++ '.grams'
	}

}

+@Number {

	asGrams { :self |
		self
	}

	grams { :self |
		newMass().initializeSlots(self)
	}

	kilograms { :self |
		(self * 1000).grams
	}

	ounces { :self |
		(self * 28.349523125).grams
	}

	pounds { :self |
		(self * 0.45359237).kilograms
	}

}
