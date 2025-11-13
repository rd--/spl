/* Requires: TimeStamp */

TimeInterval : [Object, Storeable, Equatable] { | min max |

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
