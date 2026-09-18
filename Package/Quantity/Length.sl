@Length {

	inAngstroms { :self |
		self.inMetres * 1E10
	}

	inAstronomicalUnits { :self |
		self.inMetres / (1.495978707 * (10 ^ 11))
	}

	inCentimetres { :self |
		self.inMetres * 1E2
	}

	inFeet { :self |
		self.inMetres / 0.3048
	}

	inInches { :self |
		self.inMillimetres / 25.4
	}

	inKilometres { :self |
		self.inMetres / 1E3
	}

	inLightYears { :self |
		self.inMetres / (9.4607 * (10 ^ 15))
	}

	inMetres { :self |
		self.typeResponsibility('inMetres')
	}

	inMicrometres { :self |
		self.inMetres * 1E-6
	}

	inMiles { :self |
		self.inMetres / 1609.344
	}

	inMillimetres { :self |
		self.inMetres * 1E3
	}

	inNanometres { :self |
		self.inMetres * 1E9
	}

	inNauticalMiles { :self |
		self.inMetres / 1852
	}

	inParsecs { :self |
		self.inMetres / (3.0857 * (10 ^ 16))
	}

	inPicas { :self |
		self.inMillimetres / 4.2333
	}

	inPicometres { :self |
		self.inMetres * 1E12
	}

	inPoint { :self |
		self.inMillimetres / 0.3528
	}

	inYards { :self |
		self.inMetres / 0.9144
	}

}

+SmallFloat {

	Length { :self |
		Quantity(self, 'metres')
	}

}

+@Number {

	angstroms { :self |
		(self * 1E-10).metres
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
