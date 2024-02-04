{- Requires: Fraction RatioTuning Tuning -}

+String {

	JiTuning { :self :description :ratiosOrIntegers :octave :limit |
		ratiosOrIntegers.allSatisfy(isSmallInteger:/1).if {
			IntegerTuning(self, description, ratiosOrIntegers, octave).limit(limit)
		} {
			ratiosOrIntegers.allSatisfy(isFraction:/1).if {
				RatioTuning(self, description, ratiosOrIntegers, octave).limit(limit)
			} {
				self.error('not ratios or integers')
			}
		}
	}

}

+Record {

	JiTuning { :self |
		JiTuning(
			self::name,
			self::description,
			self::tuning,
			self.atIfAbsent('octave') {
				2/1
			},
			self::limit
		)
	}

}

+List {

	JiTuning { :self |
		JiTuning(
			'',
			'',
			self,
			2/1,
			nil
		)
	}

}
