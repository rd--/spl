+@Number {

	centi { :self |
		self * 1E-2
	}

	deca { :self |
		self * 1E1
	}

	deci { :self |
		self * 1E-1
	}

	hecto { :self |
		self * 1E2
	}

	giga { :self |
		self * 1E9
	}

	mega { :self |
		self * 1E6
	}

	kilo { :self |
		self * 1E3
	}

	micro { :self |
		self * 1E-6
	}

	milli { :self |
		self * 1E-3
	}

	nano { :self |
		self * 1E-9
	}

	pico { :self |
		self * 1E-12
	}

	terra { :self |
		self * 1E12
	}

}

SiUnit : [Object] { | symbol name dimension quantity |

	= { :self :anSiUnit |
		self == anSiUnit
	}

	isBaseUnit { :self |
		system.siBaseUnitList.includes(self)
	}

	isDerivedUnit { :self |
		self.isBaseUnit.not
	}

	namedBy { :self :symbolOrName |
		self.symbol = symbolOrName | {
			self.name = symbolOrName
		}
	}

}

+String {

	SiUnit { :self :name :dimension :quantity |
		newSiUnit().initializeSlots(self, name, dimension, quantity)
	}

	siBaseUnit { :self :exceptionBlock:/0 |
		system.siBaseUnitList.detectIfNone { :each |
			each.namedBy(self)
		} {
			exceptionBlock()
		}
	}

	siUnit { :self |
		self.siBaseUnit {
			system.siDerivedUnitList.detectIfNone { :each |
				each.namedBy(self)
			} {
				self.error('siUnit')
			}
		}
	}

}

+@Cache {

	siBaseUnitList { :self |
		self.cache.atIfAbsentPut('siBaseUnitList') {
			[
				'm'.SiUnit('meter', 'L', 'length'),
				's'.SiUnit('second', 'T', 'time'),
				'mole'.SiUnit('mole', 'N', 'amount of substance'),
				'A'.SiUnit('ampere', 'I', 'electric current'),
				'K'.SiUnit('kelvin', 'Θ', 'thermodynamic temperature'),
				'cd'.SiUnit('candela', 'J', 'luminous intensity'),
				'kg'.SiUnit('kilogram', 'M', 'mass')
			]
		}
	}

	siDerivedUnitList { :self |
		self.cache.atIfAbsentPut('siDerivedUnitList') {
			[
				'Hz'.SiUnit('hertz', 'f', 'frequency'),
				'rad'.SiUnit('radian', nil, 'angle'),
				'sr'.SiUnit('steradian', 'Ω', 'solid angle'),
				'N'.SiUnit('newton', ['F', 'W'], ['force', 'weight']),
				'Pa'.SiUnit('pascal', ['p', 'σ'], ['pressure', 'stress']),
				'J'.SiUnit('joule', ['E', 'W', 'Q'], ['energy', 'work', 'heat']),
				'W'.SiUnit('watt', ['P', 'Φe'], ['power', 'radiant flux']),
				'lm'.SiUnit('lumen', 'Φv', 'luminous flux'),
				'lx'.SiUnit('lux', 'Ev', 'illuminance'),
				'Bq'.SiUnit('becquerel', nil, 'radioactivity')
			]
		}
	}

}
