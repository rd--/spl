(* Requires: Fraction RatioTuning Tuning *)

JiTuning : [Object, Tuning] { | tuning limit |

	cents { :self |
		self.tuning.cents
	}

	description { :self |
		self.tuning.description
	}

	integers { :self |
		self.tuning.integers
	}

	isRational { :self |
		true
	}

	name { :self |
		self.tuning.name
	}

	octave { :self |
		self.tuning.octave
	}

	ratios { :self |
		self.tuning.ratios
	}

	size { :self |
		self.tuning.size
	}

}

+RatioTuning {

	JiTuning { :self |
		JiTuning(self, self.limit)
	}

	JiTuning { :self :limit |
		newJiTuning().initializeSlots(self, limit)
	}

}

+String {

	JiTuning { :self :description :ratiosOrIntegers :octave |
		JiTuning(self, description, ratiosOrIntegers, octave, nil)
	}

	JiTuning { :self :description :ratiosOrIntegers :octave :limit |
		|(
			tuning = ratiosOrIntegers.allSatisfy(isSmallInteger:/1).if {
				IntegerTuning(self, description, ratiosOrIntegers, octave)
			} {
				ratiosOrIntegers.allSatisfy(isFraction:/1).if {
					RatioTuning(self, description, ratiosOrIntegers, octave)
				} {
					self.error('not ratios or integers')
				}
			}
		)|
		JiTuning(
			tuning,
			limit ? { tuning.limit }
		)
	}

}

+Record {

	JiTuning { :self |
		JiTuning(
			self::name,
			self::description,
			self::tuning,
			self::octave :? { 2:1 },
			self::limit
		)
	}

}

+Array {

	JiTuning { :self |
		JiTuning(
			'',
			'',
			self,
			2:1
		)
	}

}
