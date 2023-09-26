(* Requires: Fraction Tuning TuningLattice *)

RatioTuning : [Object, Tuning] { | name description ratios |

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

	degree { :self |
		self.ratios.size
	}

	integers { :self |
		(self.ratios / self.ratios.reduce(gcd:/2)).collect(asInteger:/1)
	}

	limit { :self |
		self.ratios.collect(primeLimit:/1).max
	}

}

+String {

	IntegerTuning { :self :description :integers |
		|(
			ratios = integers.collect { :each |
				Fraction(each, integers.first).normalized
			}
		)|
		RatioTuning(self, description, ratios)
	}

	RatioTuning { :self :description :ratios |
		newRatioTuning().initializeSlots(self, description, ratios)
	}

}
