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
		<primitive: const date = new Date(_self.unixTimeInMilliseconds); return date.toISOString();>
	}

	roundTo { :self :aDuration |
		self.unixTimeInMilliseconds := self.unixTimeInMilliseconds.roundTo(aDuration.milliseconds)
	}

	unixTimeInSeconds { :self |
		self.unixTimeInMilliseconds / 1000
	}

}

+ Number {

	TimeStamp { :self |
		newTimeStamp().initializeSlots(self)
	}

}

+ System {

	currentTime { :self |
		TimeStamp(self.unixTimeInMilliseconds)
	}

}
