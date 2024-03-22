{- Requires: Cache Fraction Tuning -}

RatioTuning : [Object, Cache, Tuning] { | name description asRatios octave cache |

	= { :self :anObject |
		anObject.isRatioTuning & {
			self.name = anObject.name & {
				self.description = anObject.description & {
					self.asRatios = anObject.asRatios
				}
			}
		}
	}

	asCents { :self |
		self.asRatios.collect { :each |
			each.asFloat.log2 * 1200
		}
	}

	asFractions { :self |
		self.asRatios
	}

	asIntegers { :self |
		(self.asRatios / self.asRatios.reduce(gcd:/2)).collect(asInteger:/1)
	}

	isRational { :self |
		self.asRatios.allSatisfy(isFraction:/1)
	}

	limit { :self |
		self.cached('limit') {
			self.asRatios.primeLimit.max
		}
	}

	limit { :self :anInteger |
		anInteger.isInteger.ifTrue {
			self.cache::limit := anInteger
		};
		self
	}

	size { :self |
		self.asRatios.size
	}

	storeString { :self |
		[
			'RatioTuning(',
			[self.name, self.description, self.asRatios, self.octave].collect(storeString:/1).joinSeparatedBy(', '),
			')'
		].join
	}

}

+String {

	IntegerTuning { :self :description :integers :octave |
		let ratios = integers.collect { :each |
			Fraction(each, integers.first)
		};
		RatioTuning(self, description, ratios, octave)
	}

	RatioTuning { :self :description :ratios :octave |
		newRatioTuning().initializeSlots(self, description, ratios, octave, Record())
	}

}

+@Sequence {

	asRatioTuning { :self |
		RatioTuning('Unnamed tuning', 'Undescribed tuning', self, 2)
	}

}
