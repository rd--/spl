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

	+ { :self :aDuration |
		(self.unixTimeInMilliseconds + aDuration.milliseconds).asTimeStamp
	}

	- { :self :aDuration |
		(self.unixTimeInMilliseconds - aDuration.milliseconds).asTimeStamp
	}

	asDate { :self |
		self.unixTimeInSeconds.asDate
	}

	asTimeStamp { :self |
		self
	}

	iso8601 { :self |
		self.asDate.iso8601
	}

	roundTo { :self :aDuration |
		self.unixTimeInMilliseconds := self.unixTimeInMilliseconds.roundTo(aDuration.milliseconds);
		self
	}

	storeString { :self |
		'TimeStamp(' ++ self.unixTimeInMilliseconds.storeString ++ ')'
	}

	unixTimeInSeconds { :self |
		self.unixTimeInMilliseconds / 1000
	}

}

+System {

	unixTime { :self |
		self.unixTimeInMilliseconds.asTimeStamp
	}

}

+SmallFloat {

	asTimeStamp { :self |
		TimeStamp(self)
	}

	TimeStamp { :self |
		newTimeStamp().initializeSlots(self)
	}

	unixTimeInMilliseconds { :self |
		self
	}

}

+Block {

	valueAt { :self :time |
		| now = system.unixTimeInMilliseconds; |
		self.valueAfterMilliseconds(time.unixTimeInMilliseconds - now)
	}

	valueAtWith { :self :time :anObject |
		| now = system.unixTimeInMilliseconds; |
		self.valueAfterMillisecondsWith(time.unixTimeInMilliseconds - now, anObject)
	}

}
