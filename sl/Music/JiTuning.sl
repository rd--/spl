(* Requires: Fraction Tuning TuningLattice *)

JiTuning : [Object, Tuning] { | name description integerPitches limit degree |

	cents { :self |
		self.ratios.collect { :each |
			each.SmallFloat.log2 * 1200
		}
	}

	calculateDegree { :self |
		self.integerPitches.size
	}

	calculateLimit { :self |
		self.integerPitches.collect { :each |
			(each = 1).if {
				each
			} {
				each.primeFactors.max
			}
		}.max
	}

	degreeError { :self |
		self.error('degreeError')
	}

	initialize { :self :name :description :tuning |
		|(
			integerPitches = tuning.allSatisfy(isSmallInteger:/1).if {
				tuning
			} {
				tuning.allSatisfy(isFraction:/1).if {
					(tuning / tuning.reduce(gcd:/2)).collect(asInteger:/1)
				} {
					self.error('initialize: unknown tuning')
				}
			}
		)|
		self.initializeSlots(
			name,
			description,
			integerPitches,
			nil,
			integerPitches.size
		);
		self.limit := self.calculateLimit;
		self
	}

	initializeFromDictionary { :self :aDictionary |
		self.initializeSlots(
			aDictionary::name,
			aDictionary::description,
			aDictionary::tuning,
			aDictionary::limit,
			aDictionary::degree
		)
	}

	isValid { :self |
		self.degree = self.calculateDegree & {
			self.limit = self.calculateLimit
		}
	}

	limitError { :self |
		self.error('limitError')
	}

	ratios { :self |
		| i1 = self.integerPitches.first; |
		self.integerPitches.collect { :each |
			Fraction(each, i1).normalized
		}
	}

}

+Record {

	JiTuning { :self |
		newJiTuning().initializeFromDictionary(self)
	}

}

+Array {

	JiTuning { :self |
		newJiTuning().initialize(
			'',
			'',
			self
		)
	}

}
