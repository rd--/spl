@Mass {

	asKilograms { :self |
		self.kilograms
	}

	grams { :self |
		self.kilograms * 1E3
	}

	kilograms { :self |
		self.typeResponsibility('kilograms')
	}

	ounces { :self |
		self.grams * 28.349523125
	}

	pounds { :self |
		self.kilograms * 0.45359237
	}

}

+SmallFloat {

	Mass { :self |
		Quantity(self, 'kilograms')
	}

}

+@Number {

	asKilograms { :self |
		self
	}

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
