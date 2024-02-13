@Magnitude {

	< { :self :aMagnitude |
		self.typeResponsibility('@Magnitude>><')
	}

	<= { :self :aMagnitude |
		self < aMagnitude | {
			self = aMagnitude
		}
	}

	> { :self :aMagnitude |
		aMagnitude < self
	}

	>= { :self :aMagnitude |
		aMagnitude <= self
	}

	<=> { :self :aMagnitude |
		(self = aMagnitude).if {
			0
		} {
			(self < aMagnitude).if {
				-1
			} {
				1
			}
		}
	}

	betweenAnd { :self :min :max |
		min <= self & {
			self <= max
		}
	}

	clamp { :self :lowMagnitude :highMagnitude |
		self.min(highMagnitude).max(lowMagnitude)
	}

	clampLow { :self :lowMagnitude |
		self.max(lowMagnitude)
	}

	clampHigh { :self :highMagnitude |
		self.min(highMagnitude)
	}

	clip { :self :min :max :vMin :vMax |
		(self < min).if {
			vMin
		} {
			(self > max).if {
				vMax
			} {
				self
			}
		}
	}

	clip { :self :min :max |
		self.clip(min, max, min, max)
	}

	clip { :self |
		self.clip(-1, 1, -1, 1)
	}

	inRangeOfAnd { :self :first :second |
		(first < second).if {
			self.betweenAnd(first, second)
		} {
			self.betweenAnd(second, first)
		}
	}

	maxBy { :self :aMagnitude :aBlock:/1 |
		(self.aBlock > aMagnitude.aBlock).if {
			self
		} {
			aMagnitude
		}
	}

	max { :self :aMagnitude |
		(self > aMagnitude).if {
			self
		} {
			aMagnitude
		}
	}

	minBy { :self :aMagnitude :aBlock:/1 |
		(self.aBlock < aMagnitude.aBlock).if {
			self
		} {
			aMagnitude
		}
	}

	min { :self :aMagnitude |
		(self < aMagnitude).if {
			self
		} {
			aMagnitude
		}
	}

	minMax { :self :aMin :aMax |
		self.min(aMin).max(aMax)
	}

}
