Date : [Object] {

	hours { :self |
		<primitive: return _self.getHours();>
	}

	iso8601 { :self |
		<primitive: return _self.toISOString();>
	}

	minutes { :self |
		<primitive: return _self.getMinutes();>
	}

	seconds { :self |
		<primitive: return _self.getSeconds();>
	}

}

+SmallFloat {

	Date { :self |
		<primitive: return new Date(_self);>
	}

}

+System {

	Date { :self |
		self.unixTimeInMilliseconds.Date
	}

}

Duration : [Object] { | milliseconds |

	= { :self :aDuration |
		aDuration.isDuration & {
			self.milliseconds = aDuration.milliseconds
		}
	}

	+ { :self :aDuration |
		Duration(self.milliseconds + aDuration.Duration.milliseconds)
	}

	- { :self :aDuration |
		Duration(self.milliseconds - aDuration.Duration.milliseconds)
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.Duration, self)
	}

	asSeconds { :self |
		self.seconds
	}

	days { :self |
		self.hours / 24
	}

	hours { :self |
		self.minutes / 60
	}

	minutes {  :self |
		self.seconds / 60
	}

	printString { :self |
		'Duration(' ++ self.milliseconds.printString ++ ')'
	}

	seconds {  :self |
		self.milliseconds / 1000
	}

	weeks { :self |
		self.days / 7
	}

	Duration { :self |
		self
	}

}

+SmallFloat {

	asSeconds { :self |
		self
	}

	days { :self |
		(self * 24 * 60 * 60 * 1000).milliseconds
	}

	hours { :self |
		(self * 60 * 60 * 1000).milliseconds
	}

	milliseconds { :self |
		self.Duration
	}

	minutes { :self |
		(self * 60 * 1000).milliseconds
	}

	seconds { :self |
		(self * 1000).milliseconds
	}

	weeks { :self |
		(self * 7 * 24 * 60 * 60 * 1000).milliseconds
	}

	Duration { :self |
		newDuration().initializeSlots(self)
	}

}

+Procedure {

	evaluateAfter { :self :delay |
		self.evaluateAfterMilliseconds(delay.Duration.milliseconds)
	}

	evaluateAfterWith { :self :delay :anObject |
		self.evaluateAfterMillisecondsWith(delay.Duration.milliseconds, anObject)
	}

	evaluateEvery { :self :delay |
		self.evaluateEveryMilliseconds(delay.Duration.milliseconds)
	}

}

TimeStamp : [Object] { | unixTimeInMilliseconds |

	= { :self :aTimeStamp |
		aTimeStamp.isTimeStamp.if {
			self.unixTimeInMilliseconds = aTimeStamp.unixTimeInMilliseconds
		} {
			false
		}
	}

	< { :self :aTimeStamp |
		self.unixTimeInMilliseconds < aTimeStamp.unixTimeInMilliseconds
	}

	iso8601 { :self |
		self.unixTimeInMilliseconds.Date.iso8601
	}

	roundTo { :self :aDuration |
		self.unixTimeInMilliseconds := self.unixTimeInMilliseconds.roundTo(aDuration.milliseconds)
	}

	unixTimeInSeconds { :self |
		self.unixTimeInMilliseconds / 1000
	}

	TimeStamp { :self |
		self
	}

}

+SmallFloat {

	TimeStamp { :self |
		newTimeStamp().initializeSlots(self)
	}

}

+Procedure {

	evaluateAt { :self :time |
		| now = system.unixTimeInMilliseconds; |
		self.evaluateAfter(time.TimeStamp.unixTimeInMilliseconds - now)
	}

	evaluateAt { :self :time :anObject |
		| now = system.unixTimeInMilliseconds; |
		self.evaluateAfterWith(time.TimeStamp.unixTimeInMilliseconds - now, anObject)
	}

}

+System {

	currentTime { :self |
		TimeStamp(self.unixTimeInMilliseconds)
	}

}
