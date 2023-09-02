Length : [Object, Magnitude] { | metres |

	= { :self :anObject |
		anObject.isLength & {
			self.metres = anObject.metres
		}
	}

	~ { :self :anObject |
		anObject.isLength & {
			self.metres ~ anObject.metres
		}
	}

	< { :self :aLength |
		self.metres < aLength.metres
	}

	asMetres { :self |
		self.metres
	}

	astronomicalUnits { :self |
		self.metres / (1.495978707 * (10 ** 11))
	}

	millimetres { :self |
		self.metres * 1000
	}

	centimetres { :self |
		self.metres * 100
	}

	feet { :self |
		self.metres / 0.3048
	}

	inches { :self |
		self.millimetres / 25.4
	}

	kilometres { :self |
		self.metres / 1000
	}

	lightYears { :self |
		self.metres / (9.4607 * (10 ** 15))
	}

	miles { :self |
		 self.metres / 1609.344
	}

	nauticalMiles { :self |
		self.metres / 1852
	}

	parsecs { :self |
		self.metres / (3.0857 * (10 ** 16))
	}

	picas { :self |
		self.millimetres / 4.2333
	}

	picometres { :self |
		self.metres * 1000000000
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

+@Number {

	asMetres { :self |
		self
	}

	astronomicalUnits { :self |
		(self * (1.495978707 * (10 ** 11))).metres
	}

	millimetres { :self |
		(self / 1000).metres
	}

	centimetres { :self |
		(self / 100).metres
	}

	feet { :self |
		(self * 0.3048).metres
	}

	inches { :self |
		(self * 25.4).millimetres
	}

	kilometres { :self |
		(self * 1000).metres
	}

	lightYears { :self |
		(self * (9.4607 * (10 ** 15))).metres
	}

	metres { :self |
		newLength().initializeSlots(self)
	}

	miles { :self |
		 (self * 1609.344).metres
	}

	nauticalMiles { :self |
		(self * 1852).metres
	}

	parsecs { :self |
		(self * (3.0857 * (10 ** 16))).metres
	}

	picometres { :self |
		(self * 0.000000001).metres
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
