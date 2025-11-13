TimeStamp : [Object, Storeable, Equatable, Comparable, Magnitude] { | absoluteTime |

	< { :self :aTimeStamp |
		self.absoluteTime < aTimeStamp.absoluteTime
	}

	+ { :self :operand |
		TimeStamp(self.absoluteTime + operand.asSeconds)
	}

	- { :self :operand |
		TimeStamp(self.absoluteTime - operand.asSeconds)
	}

	asDate { :self |
		self.absoluteTime.asDate
	}

	asDateAndTime { :self |
		self.absoluteTime.asDateAndTime
	}

	asTimeStamp { :self |
		self
	}

	dateAndTimeString { :self |
		self.asDateAndTime.dateAndTimeString
	}

	equalBy { :self :aTimeStamp :aBlock:/2 |
		aTimeStamp.isTimeStamp & {
			aBlock(self.absoluteTime, aTimeStamp.absoluteTime)
		}
	}

	round { :self :operand |
		self.absoluteTime := self.absoluteTime.round(operand.asSeconds);
		self
	}

}

+System {

	now { :self |
		TimeStamp(self.absoluteTime)
	}

}

+SmallFloat {

	asTimeStamp { :self |
		TimeStamp(self)
	}

	TimeStamp { :self |
		newTimeStamp().initializeSlots(self)
	}

	absoluteTime { :self |
		self
	}

}

+String {

	parseTimeStamp { :self |
		self.parseDateAndTime.asTimeStamp
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
