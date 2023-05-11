Date : [Object] {

	dayOfWeek { :self |
		<primitive: return _self.getDay() + 1;>
	}

	dayOfMonth { :self |
		<primitive: return _self.getDate();>
	}

	hour { :self |
		<primitive: return _self.getHours();>
	}

	iso8601 { :self |
		<primitive: return _self.toISOString();>
	}

	localeTimeString { :self :localeName |
		<primitive: return _self.toLocaleTimeString(_localeName);>
	}

	millisecond { :self |
		<primitive: return _self.getMilliseconds();>
	}

	minute { :self |
		<primitive: return _self.getMinutes();>
	}

	month { :self |
		<primitive: return _self.getMonth() + 1;>
	}

	second { :self |
		<primitive: return _self.getSeconds();>
	}

	year { :self |
		<primitive: return _self.getFullYear();>
	}

}

+String {

	Date { :self |
		<primitive: return new Date(_self);>
	}

}

+System {

	Date { :self |
		<primitive: return new Date();>
	}

}

Duration : [Object] { | milliseconds |

	= { :self :aDuration |
		aDuration.isDuration & {
			self.milliseconds = aDuration.milliseconds
		}
	}

	+ { :self :aDuration |
		(self.milliseconds + aDuration.Duration.milliseconds).milliseconds
	}

	- { :self :aDuration |
		(self.milliseconds - aDuration.Duration.milliseconds).milliseconds
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
		self.milliseconds.printString ++ '.milliseconds'
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
		newDuration().initializeSlots(self)
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
		'SmallFloat>>Duration: no units specified'.error
	}

}

+Procedure {

	evaluateAfter { :self:/0 :delay |
		self:/0.evaluateAfterMilliseconds(delay.asSeconds * 1000)
	}

	evaluateAfterWith { :self:/1 :delay :anObject |
		self:/1.evaluateAfterMillisecondsWith(delay.asSeconds * 1000, anObject)
	}

	evaluateEvery { :self:/0 :delay |
		self:/0.evaluateEveryMilliseconds(delay.asSeconds * 1000)
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

	TimeStamp { :self |
		self
	}

}

+System {

	currentTime { :self |
		newTimeStamp().initializeSlots(self)
	}

}

+SmallFloat {

	unixTimeInMilliseconds { :self |
		self
	}

}

+Procedure {

	evaluateAt { :self :time |
		| now = system.unixTimeInMilliseconds; |
		self.evaluateAfterMilliseconds(time.unixTimeInMilliseconds - now)
	}

	evaluateAtWith { :self :time :anObject |
		| now = system.unixTimeInMilliseconds; |
		self.evaluateAfterMillisecondsWith(time.unixTimeInMilliseconds - now, anObject)
	}

}
