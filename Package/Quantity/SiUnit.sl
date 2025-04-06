SiUnit : [Object] { | symbol name dimension quantity |

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
		self.symbol = symbolOrName | {
			self.name = symbolOrName
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
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
				SiUnit('m', 'metre', 'L', 'length'),
				SiUnit('s', 'second', 'T', 'time'),
				SiUnit('mole', 'mole', 'N', 'amount of substance'),
				SiUnit('A', 'ampere', 'I', 'electric current'),
				SiUnit('K', 'kelvin', 'Θ', 'thermodynamic temperature'),
				SiUnit('cd', 'candela', 'J', 'luminous intensity'),
				SiUnit('kg', 'kilogram', 'M', 'mass')
			]
		}
	}

	siDerivedUnitList { :self |
		self.cache.atIfAbsentPut('siDerivedUnitList') {
			[
				SiUnit('Hz', 'hertz', 'f', 'frequency'),
				SiUnit('rad', 'radian', nil, 'plane angle'),
				SiUnit('sr', 'steradian', 'Ω', 'solid angle'),
				SiUnit('N', 'newton', ['F', 'W'], ['force', 'weight']),
				SiUnit('Pa', 'pascal', ['p', 'σ'], ['pressure', 'stress']),
				SiUnit('J', 'joule', ['E', 'W', 'Q'], ['energy', 'work', 'heat']),
				SiUnit('W', 'watt', ['P', 'Φe'], ['power', 'radiant flux']),
				SiUnit('lm', 'lumen', 'Φv', 'luminous flux'),
				SiUnit('lx', 'lux', 'Ev', 'illuminance'),
				SiUnit('Bq', 'becquerel', 'A', 'activity')
			]
		}
	}

}
