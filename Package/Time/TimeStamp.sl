TimeStamp : [Object, Copy, Store, Equal, Compare] {

	| absoluteTime |

	[less, <] { :self :aTimeStamp |
		self.absoluteTime < aTimeStamp.absoluteTime
	}

	[plus, +] { :self :operand |
		TimeStamp(self.absoluteTime + operand.inSeconds)
	}

	[subtract, -] { :self :operand |
		TimeStamp(self.absoluteTime - operand.inSeconds)
	}

	Date { :self |
		Date(self.absoluteTime)
	}

	DateAndTime { :self |
		DateAndTime(self.absoluteTime)
	}

	dateAndTimeString { :self |
		DateAndTime(self).dateAndTimeString
	}

	equalBy { :self :aTimeStamp :aBlock/2 |
		aTimeStamp.isTimeStamp & {
			aBlock(self.absoluteTime, aTimeStamp.absoluteTime)
		}
	}

	round { :self :operand |
		self.absoluteTime := self.absoluteTime.round(operand.inSeconds);
		self
	}

	TimeStamp { :self |
		self
	}

}

+System {

	now { :self |
		TimeStamp(self.absoluteTime)
	}

}

+SmallFloat {

	TimeStamp { :self |
		newTimeStamp().initializeSlots(self)
	}

	absoluteTime { :self |
		self
	}

}

+String {

	parseTimeStamp { :self |
		self.parseDateAndTime.TimeStamp
	}

}

+Block {

	valueAt { :self :time |
		let now = system.absoluteTime;
		self.valueAfter(time.absoluteTime - now)
	}

	valueAtWith { :self :time :anObject |
		let now = system.absoluteTime;
		self.valueAfterWith(time.absoluteTime - now, anObject)
	}

}
