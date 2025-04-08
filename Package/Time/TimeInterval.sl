/* Requires: TimeStamp */

TimeInterval : [Object] { | min max |

	= { :self :operand |
		self.hasEqualSlots(operand)
	}

	absoluteTime { :self |
		Interval(
			self.min.absoluteTime,
			self.max.absoluteTime
		)
	}

	duration { :self |
		Duration(
			self.max.absoluteTime - self.min.absoluteTime
		)
	}

	includes { :self :aTimeStamp |
		aTimeStamp >= self.min & {
			aTimeStamp < self.max
		}
	}

	minMax { :self |
		[self.min, self.max]
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+TimeStamp {

	TimeInterval { :self :operand |
		operand.isTimeStamp.if {
			newTimeInterval().initializeSlots(self, operand)
		} {
			operand.isDuration.if {
				TimeInterval(self, self + operand)
			} {
				self.error('TimeStamp>>TimeInterval: invalid operand')
			}
		}
	}

}
