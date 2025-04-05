Length : [Object, Magnitude] { | metres |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	< { :self :aLength |
		self.metres < aLength.metres
	}

	asMetres { :self |
		self.metres
	}

	astronomicalUnits { :self |
		self.metres / (1.495978707 * (10 ^ 11))
	}

	centimetres { :self |
		self.metres * 1E2
	}

	feet { :self |
		self.metres / 0.3048
	}

	inches { :self |
		self.millimetres / 25.4
	}

	kilometres { :self |
		self.metres / 1E3
	}

	lightYears { :self |
		self.metres / (9.4607 * (10 ^ 15))
	}

	micrometres { :self |
		self.metres * 1E-6
	}

	miles { :self |
		self.metres / 1609.344
	}

	millimetres { :self |
		self.metres * 1E3
	}

	nanometres { :self |
		self.metres * 1E9
	}

	nauticalMiles { :self |
		self.metres / 1852
	}

	parsecs { :self |
		self.metres / (3.0857 * (10 ^ 16))
	}

	picas { :self |
		self.millimetres / 4.2333
	}

	picometres { :self |
		self.metres * 1E12
	}

	point { :self |
		self.millimetres / 0.3528
	}

	storeString { :self |
		self.metres.storeString ++ '.metres'
	}

	yards { :self |
		self.metres / 0.9144
	}

}

+SmallFloat {

	Length { :self |
		newLength().initializeSlots(self)
	}

}

+@Number {

	asMetres { :self |
		self
	}

	astronomicalUnits { :self |
		(self * (1.495978707 * (10 ^ 11))).metres
	}

	millimetres { :self |
		(self * 1E-3).metres
	}

	centimetres { :self |
		(self * 1E-2).metres
	}

	feet { :self |
		(self * 0.3048).metres
	}

	inches { :self |
		(self * 25.4).millimetres
	}

	kilometres { :self |
		(self * 1E3).metres
	}

	lightYears { :self |
		(self * (9.4607 * (10 ^ 15))).metres
	}

	metres { :self |
		Quantity(self, 'metres')
	}

	miles { :self |
		(self * 1609.344).metres
	}

	nanometres { :self |
		(self * 1E-9).metres
	}

	nauticalMiles { :self |
		(self * 1852).metres
	}

	parsecs { :self |
		(self * (3.0857 * (10 ^ 16))).metres
	}

	picometres { :self |
		(self * 1E-12).metres
	}

	picas { :self |
		(self * 4.2333).millimetres
	}

	point { :self |
		(self * 0.3528).millimetres
	}

	yards { :self |
		(self * 0.9144).metres
	}

}
