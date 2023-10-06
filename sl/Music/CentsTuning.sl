(* Requires: Tuning *)

CentsTuning : [Object, Tuning] { | name description cents octave |

	degree { :self |
		self.cents.size
	}

	isRational { :self |
		false
	}

}

+String {

	CentsTuning { :self :description :cents :octave |
		newRatioTuning().initializeSlots(self, description, cents, octave)
	}

}
