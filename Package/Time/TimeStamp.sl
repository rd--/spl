TimeStamp : [Object, Copy, Store, Equal, Compare] {

	| absoluteTime |

	[Date, timeStampToDate] { :self |
		Date(self.absoluteTime)
	}

	DateAndTime { :self |
		DateAndTime(self.absoluteTime)
	}

	TimeStamp { :self |
		self
	}

	dateAndTimeString { :self |
		DateAndTime(self).dateAndTimeString
	}

	isEqualBy { :self :aTimeStamp :aBlock/2 |
		aTimeStamp.isTimeStamp & {
			aBlock(self.absoluteTime, aTimeStamp.absoluteTime)
		}
	}

	[isLess, <] { :self :aTimeStamp |
		isLessOn(self, aTimeStamp, absoluteTime/1)
	}

	[plus, +] { :self :operand |
		TimeStamp(self.absoluteTime + operand.inSeconds)
	}

	round { :self :operand |
		self.absoluteTime := self.absoluteTime.round(operand.inSeconds);
		self
	}

	[subtract, -] { :self :operand |
		TimeStamp(self.absoluteTime - operand.inSeconds)
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

}

+@Collection {

	TimeStamp { :self |
		self.collect(TimeStamp/1)
	}

	absoluteTime { :self |
		self.collect(absoluteTime/1)
	}

}

+String {

	parseTimeStamp { :self |
		self.parseDateAndTime.TimeStamp
	}

}
