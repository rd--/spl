@Mass {

	inGrams { :self |
		self.inKilograms * 1E3
	}

	inKilograms { :self |
		self.typeResponsibility('inKilograms')
	}

	inOunces { :self |
		self.inGrams * 28.349523125
	}

	inPounds { :self |
		self.inKilograms * 0.45359237
	}

}

+SmallFloat {

	Mass { :self |
		Quantity(self, 'kilograms')
	}

}

+@Number {

	grams { :self |
		(self * 1E-3).kilograms
	}

	milligrams { :self |
		(self * 1E-6).kilograms
	}

	ounces { :self |
		(self * 28.349523125).grams
	}

	pounds { :self |
		(self * 0.45359237).kilograms
	}

}
