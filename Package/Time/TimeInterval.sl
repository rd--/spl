/* Requires: TimeStamp */

TimeInterval : [Object, Store, Equal] {

	| min max | <TimeStamp>

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

	[minimumMaximum, minMax] { :self |
		[self.min, self.max]
	}

}

+TimeStamp {

	TimeInterval { :self :operand |
		operand.isTimeStamp.if {
			uncheckedTimeInterval(self, operand)
		} {
			operand.isDuration.if {
				TimeInterval(self, self + operand)
			} {
				self.error('TimeStamp>>TimeInterval: invalid operand')
			}
		}
	}

}
