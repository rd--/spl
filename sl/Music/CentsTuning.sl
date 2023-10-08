(* Requires: Tuning *)

CentsTuning : [Object, Tuning] { | name description cents octave |

	isRational { :self |
		false
	}

	ratios { :self |
		self.cents.collect(centsToRatio:/1)
	}

	size { :self |
		self.cents.size
	}

}

+String {

	CentsTuning { :self :description :cents :octave |
		newCentsTuning().initializeSlots(self, description, cents, octave)
	}

}

+@Integer {

	equalTemperamentTuning { :self |
		| step = 1200 / self; |
		CentsTuning(
			'ET-' ++ self,
			self.asWords.capitalized ++ ' tone equal-temperament',
			[0, step .. 1200 - step],
			2
		)
	}

}
