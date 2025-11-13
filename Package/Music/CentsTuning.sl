/* Requires: ScalaTuning, Tuning */

CentsTuning : [Object, Storeable, Equatable, Tuning] { | name description asCents octave |

	asFractions { :self :epsilon |
		self.asRatios.collect { :each |
			each.asFraction(epsilon)
		}
	}

	asFractions { :self |
		self.asRatios.collect(asFraction:/1)
	}

	asRatios { :self |
		self.asCents.collect(centsToRatio:/1)
	}

	isRational { :self |
		false
	}

	size { :self |
		self.cents.size
	}

}

+String {

	CentsTuning { :name :description :cents :octave |
		newCentsTuning().initializeSlots(name, description, cents, octave)
	}

}

+@Integer {

	equalTemperamentTuning { :self |
		let step = 1200 / self;
		CentsTuning(
			'ET-' ++ self,
			self.asWords.capitalize ++ ' tone equal-temperament',
			[0, step .. 1200 - step],
			2
		)
	}

}

+List {

	asCentsTuning { :self |
		CentsTuning('Unnamed tuning', 'Undescribed tuning', self, 2)
	}

}

+ScalaTuning {

	asCentsTuning { :self |
		CentsTuning(
			self.name,
			self.description,
			self.asCents,
			self.octave
		)
	}

}
