@Magnitude {

	> { :self :aMagnitude |
		aMagnitude < self
	}

	>= { :self :aMagnitude |
		aMagnitude <= self
	}

	betweenAnd { :self :min :max |
		(min <= self).if {
			self <= max
		} {
			false
		}
	}

	inRangeOfAnd { :self :first :second |
		(first < second).if {
			self.betweenAnd(first, second)
		} {
			self.betweenAnd(second, first)
		}
	}

	max { :self :aMagnitude |
		if(self > aMagnitude) {
			self
		} {
			aMagnitude
		}
	}

	min { :self :aMagnitude |
		if(self < aMagnitude) {
			self
		} {
			aMagnitude
		}
	}

	minMax { :self :aMin :aMax |
		self.min(aMin).max(aMax)
	}

}
