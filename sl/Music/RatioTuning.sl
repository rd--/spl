(* Requires: Fraction Tuning *)

RatioTuning : [Object, Tuning] { | name description ratios octave cachedLimit |

	= { :self :anObject |
		anObject.isRatioTuning & {
			self.name = anObject.name
		} & {
			self.description = anObject.description
		} & {
			self.ratios = anObject.ratios
		}
	}

	cents { :self |
		self.ratios.collect { :each |
			each.asFloat.log2 * 1200
		}
	}

	integers { :self |
		(self.ratios / self.ratios.reduce(gcd:/2)).collect(asInteger:/1)
	}

	isRational { :self |
		self.ratios.allSatisfy(isFraction:/1)
	}

	limit { :self |
		self.cachedLimit.ifNil {
			self.cachedLimit := self.ratios.collect(primeLimit:/1).max
		} {
			self.cachedLimit
		}
	}

	limit { :self :anInteger |
		self.cachedLimit := anInteger;
		self
	}

	size { :self |
		self.ratios.size
	}

}

+String {

	IntegerTuning { :self :description :integers :octave |
		|(
			ratios = integers.collect { :each |
				Fraction(each, integers.first).normalized
			}
		)|
		RatioTuning(self, description, ratios, octave)
	}

	RatioTuning { :self :description :ratios :octave |
		newRatioTuning().initializeSlots(self, description, ratios, octave, nil)
	}

}

+@Sequenceable {

	RatioTuning { :self |
		RatioTuning('Unnamed tuning', 'Undescribed tuning', self, 2)
	}

}
