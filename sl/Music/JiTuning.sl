(* Requires: Fraction RatioTuning Tuning TuningLattice *)

JiTuning : [Object, Tuning] { | tuning limit degree |

	cents { :self |
		self.tuning.cents
	}

	description { :self |
		self.tuning.description
	}

	integers { :self |
		self.tuning.integers
	}

	name { :self |
		self.tuning.name
	}

	ratios { :self |
		self.tuning.ratios
	}

}

+RatioTuning {

	JiTuning { :self |
		JiTuning(self, self.limit, self.degree)
	}

	JiTuning { :self :limit :degree |
		newJiTuning().initializeSlots(self, limit, degree)
	}

}

+String {

	JiTuning { :self :description :ratiosOrIntegers :limit :degree |
		|(
			tuning = ratiosOrIntegers.allSatisfy(isSmallInteger:/1).if {
				IntegerTuning(self, description, ratiosOrIntegers)
			} {
				ratiosOrIntegers.allSatisfy(isFraction:/1).if {
					RatioTuning(self, description, ratiosOrIntegers)
				} {
					self.error('not ratios or integers')
				}
			}
		)|
		JiTuning(tuning,
			limit,
			degree
		)
	}

}

+Record {

	JiTuning { :self |
		JiTuning(
			self::name,
			self::description,
			self::tuning,
			self::limit,
			self::degree
		)
	}

}

+Array {

	JiTuning { :self |
		JiTuning(
			'',
			'',
			self
		)
	}

}
