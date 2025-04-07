TimeStamp : [Object] { | absoluteTime |

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

	+ { :self :aDuration |
		TimeStamp(self.absoluteTime + aDuration.seconds)
	}

	- { :self :aDuration |
		TimeStamp(self.absoluteTime - aDuration.seconds)
	}

	asDate { :self |
		self.absoluteTime.asDate
	}

	asTimeStamp { :self |
		self
	}

	iso8601 { :self |
		self.asDate.iso8601
	}

	roundTo { :self :aDuration |
		self.absoluteTime := self.absoluteTime.roundTo(aDuration.seconds);
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
