TimeStamp : [Object, Magnitude] { | absoluteTime |

	= { :self :aTimeStamp |
		aTimeStamp.isTimeStamp.if {
			self.absoluteTime = aTimeStamp.absoluteTime
		} {
			false
		}
	}

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

	asTimeStamp { :self |
		self
	}

	dateTimeString { :self |
		self.asDate.dateTimeString
	}

	roundTo { :self :operand |
		self.absoluteTime := self.absoluteTime.roundTo(operand.asSeconds);
		self
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
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
		[24 29].includes(self.size).if {
			self.basicParseDate.asTimeStamp
		} {
			self.error('parseTimeStamp: invalid size')
		}
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
