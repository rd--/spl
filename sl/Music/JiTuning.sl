/* Requires: Fraction RatioTuning Tuning */

+String {

	JiTuning { :name :description :ratiosOrIntegers :octave :limit |
		ratiosOrIntegers.allSatisfy(isSmallInteger:/1).if {
			IntegerTuning(name, description, ratiosOrIntegers, octave).limit(limit)
		} {
			ratiosOrIntegers.allSatisfy(isFraction:/1).if {
				RatioTuning(name, description, ratiosOrIntegers, octave).limit(limit)
			} {
				name.error('JiTuning: not ratios or integers')
			}
		}
	}

}

+Record {

	asJiTuning { :self |
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

	asJiTuning { :self |
		JiTuning(
			'',
			'',
			self,
			2/1,
			nil
		)
	}

}
