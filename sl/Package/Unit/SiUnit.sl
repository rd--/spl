SiUnit : [Object] { | symbol name dimension quantity |

	= { :self :anSiUnit |
		self == anSiUnit
	}

	isBaseUnit { :self |
		system.siBaseUnitArray.includes(self)
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
		system.siBaseUnitArray.detectIfNone { :each |
			each.namedBy(self)
		} {
			exceptionBlock()
		}
	}

	siUnit { :self |
		self.siBaseUnit {
			system.siDerivedUnitArray.detectIfNone { :each |
				each.namedBy(self)
			} {
				self.error('siUnit')
			}
		}
	}

}

+System {

	siBaseUnitArray { :self |
		self.cache.atIfAbsentPut('siBaseUnitArray') {
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

	siDerivedUnitArray { :self |
		self.cache.atIfAbsentPut('siDerivedUnitArray') {
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
