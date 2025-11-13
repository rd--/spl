SiUnit : [Object, Storeable, Equatable] { | name symbol quantity dimension |

	assertIsValid { :self |
		(
			self.isBaseUnit | {
				self.isDerivedUnit
			}
		).if {
			self
		} {
			self.error('invalid SI unit paramters')
		}
	}

	isBaseUnit { :self |
		system.siBaseUnitList.includes(self)
	}

	isDerivedUnit { :self |
		self.isBaseUnit.not
	}

	namedBy { :self :symbolOrName |
		self.name = symbolOrName | {
			self.symbol = symbolOrName
		}
	}

}

+String {

	isBaseUnit { :self |
		self.siUnit.isBaseUnit
	}

	isDerivedUnit { :self |
		self.siUnit.isDerivedUnit
	}

	isKnownUnit { :self |
		self.isBaseUnit | {
			self.isDerivedUnit
		}
	}

	SiUnit { :name :symbol :quantity :dimension |
		uncheckedSiUnit(name, symbol, quantity, dimension)
		.assertIsValid
	}

	siBaseUnitIfAbsent { :self :exceptionBlock:/0 |
		system.siBaseUnitList.detectIfNone { :each |
			each.namedBy(self)
		} {
			exceptionBlock()
		}
	}

	siUnit { :self |
		self.siBaseUnitIfAbsent {
			system.siNamedDerivedUnitList.detectIfNone { :each |
				each.namedBy(self)
			} {
				self.error('siUnit: not SI unit name')
			}
		}
	}

	uncheckedSiUnit { :name :symbol :quantity :dimension |
		newSiUnit()
		.initializeSlots(name, symbol, quantity, dimension)
	}

}

+@Cache {

	siBaseUnitList { :self |
		self.cached('siBaseUnitList') {
			[
				uncheckedSiUnit('ampere', 'A', 'electric current', 'I'),
				uncheckedSiUnit('candela', 'cd', 'luminous intensity', 'J'),
				uncheckedSiUnit('kelvin', 'K', 'thermodynamic temperature', 'Θ'),
				uncheckedSiUnit('kilogram', 'kg', 'mass', 'M'),
				uncheckedSiUnit('metre', 'm', 'length', 'L'),
				uncheckedSiUnit('mole', 'mol', 'amount of substance', 'N'),
				uncheckedSiUnit('second', 's', 'time', 'T')
			]
		}
	}

	siNamedDerivedUnitList { :self |
		self.cached('siNamedDerivedUnitList') {
			[
				uncheckedSiUnit('becquerel', 'Bq', 'activity', 'A'),
				uncheckedSiUnit('hertz', 'Hz', 'frequency', 'f'),
				uncheckedSiUnit('joule', 'J', ['energy', 'work', 'heat'], ['E', 'W', 'Q']),
				uncheckedSiUnit('lumen', 'lm', 'luminous flux', 'Φv'),
				uncheckedSiUnit('lux', 'lx', 'illuminance', 'Ev'),
				uncheckedSiUnit('newton', 'N', ['force', 'weight'], ['F', 'W']),
				uncheckedSiUnit('pascal', 'Pa', ['pressure', 'stress'], ['p', 'σ']),
				uncheckedSiUnit('radian', 'rad', 'plane angle', nil),
				uncheckedSiUnit('steradian', 'sr', 'solid angle', 'Ω'),
				uncheckedSiUnit('volt', 'V', 'electric potential difference', 'V'),
				uncheckedSiUnit('watt', 'W', ['power', 'radiant flux'], ['P', 'Φe'])
			]
		}
	}

}
