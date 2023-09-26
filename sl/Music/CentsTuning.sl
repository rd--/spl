(* Requires: Fraction Tuning *)

CentsTuning : [Object, Tuning] { | name description cents |

	degree { :self |
		self.cents.size
	}

}

+String {

	CentsTuning { :self :description :cents |
		newRatioTuning().initializeSlots(self, description, cents)
	}

}
