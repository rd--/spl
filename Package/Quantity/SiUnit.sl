SiUnit : [Object, Store, Equal] { | name symbol quantity dimension |

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

	isNamedBy { :self :symbolOrName |
		self.name = symbolOrName | {
			self.symbol = symbolOrName
		}
	}

}

+String {

	isSiBaseUnit { :self |
		self.siUnitIfPresentIfAbsent { :u |
			u.isBaseUnit
		} {
			false
		}
	}

	isSiDerivedUnit { :self |
		self.siUnitIfPresentIfAbsent { :u |
			u.isDerivedUnit
		} {
			false
		}
	}

	isSiUnit { :self |
		self.isSiBaseUnit | {
			self.isSiDerivedUnit
		}
	}

	SiUnit { :name :symbol :quantity :dimension |
		uncheckedSiUnit(name, symbol, quantity, dimension)
		.assertIsValid
	}

	siBaseUnitIfPresentIfAbsent { :self :whenPresent/1 :whenAbsent/0 |
		system.siBaseUnitList.detectIfFoundIfNone { :each |
			each.isNamedBy(self)
		} { :u |
			whenPresent(u)
		} {
			whenAbsent()
		}
	}

	siUnitIfPresentIfAbsent { :self :whenPresent/1 :whenAbsent/0 |
		self.siBaseUnitIfPresentIfAbsent { :u |
			whenPresent(u)
		} {
			system.siNamedDerivedUnitList.detectIfFoundIfNone { :each |
				each.isNamedBy(self)
			} { :u |
				whenPresent(u)
			} {
				whenAbsent()
			}
		}
	}

	siUnit { :self |
		self.siUnitIfPresentIfAbsent(identity/1) {
			self.error('siUnit: not SI unit name')
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
