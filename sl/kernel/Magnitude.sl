@Magnitude {

	> { :self :aMagnitude |
		aMagnitude < self
	}

	>= { :self :aMagnitude |
		aMagnitude <= self
	}

	betweenAnd { :self :min :max |
		(min <= self).if { self <= max } { false }
	}

	max { :self :aMagnitude |
		if(self > aMagnitude) { self } { aMagnitude }
	}

	min { :self :aMagnitude |
		if(self < aMagnitude) { self } { aMagnitude }
	}

	minMax { :self :aMin :aMax |
		self.min(aMin).max(aMax)
	}

}

