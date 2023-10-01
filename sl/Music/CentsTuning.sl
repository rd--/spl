(* Requires: Tuning *)

CentsTuning : [Object, Tuning] { | name description cents |

	degree { :self |
		self.cents.size
	}

	isRational { :self |
		false
	}

}

+String {

	CentsTuning { :self :description :cents |
		newRatioTuning().initializeSlots(self, description, cents)
	}

}
