SiUnit : [Object] { | name symbol quantity dimension |

	= { :self :anObject |
		self.hasEqualSlotsBy(anObject, =)
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

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+String {

	isBaseUnit { :self |
		self.siUnit.isBaseUnit
	}

	isDerivedUnit { :self |
		self.siUnit.isDerivedUnit
	}

	SiUnit { :name :symbol :quantity :dimension |
		newSiUnit().initializeSlots(name, symbol, quantity, dimension)
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
				self.error('siUnit')
			}
		}
	}

}

+@Cache {

	siBaseUnitList { :self |
		self.cached('siBaseUnitList') {
			[
				SiUnit('ampere', 'A', 'electric current', 'I'),
				SiUnit('candela', 'cd', 'luminous intensity', 'J'),
				SiUnit('kelvin', 'K', 'thermodynamic temperature', 'Θ'),
				SiUnit('kilogram', 'kg', 'mass', 'M'),
				SiUnit('metre', 'm', 'length', 'L'),
				SiUnit('mole', 'mol', 'amount of substance', 'N'),
				SiUnit('second', 's', 'time', 'T')
			]
		}
	}

	siNamedDerivedUnitList { :self |
		self.cached('siNamedDerivedUnitList') {
			[
				SiUnit('becquerel', 'Bq', 'activity', 'A'),
				SiUnit('hertz', 'Hz', 'frequency', 'f'),
				SiUnit('joule', 'J', ['energy', 'work', 'heat'], ['E', 'W', 'Q']),
				SiUnit('lumen', 'lm', 'luminous flux', 'Φv'),
				SiUnit('lux', 'lx', 'illuminance', 'Ev'),
				SiUnit('newton', 'N', ['force', 'weight'], ['F', 'W']),
				SiUnit('pascal', 'Pa', ['pressure', 'stress'], ['p', 'σ']),
				SiUnit('radian', 'rad', 'plane angle', nil),
				SiUnit('steradian', 'sr', 'solid angle', 'Ω'),
				SiUnit('volt', 'V', 'electric potential difference', 'V'),
				SiUnit('watt', 'W', ['power', 'radiant flux'], ['P', 'Φe'])
			]
		}
	}

}
