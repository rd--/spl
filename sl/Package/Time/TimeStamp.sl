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
		(self.unixTimeInMilliseconds + aDuration.milliseconds).TimeStamp
	}

	- { :self :aDuration |
		(self.unixTimeInMilliseconds - aDuration.milliseconds).TimeStamp
	}

	asTimeStamp { :self |
		self
	}

	Date { :self |
		self.unixTimeInMilliseconds.Date
	}

	iso8601 { :self |
		self.Date.iso8601
	}

	roundTo { :self :aDuration |
		self.unixTimeInMilliseconds := self.unixTimeInMilliseconds.roundTo(aDuration.milliseconds);
		self
	}

	storeString { :self |
		'TimeStamp(' ++ self.unixTimeInMilliseconds.storeString ++ ')'
	}

}

+System {

	unixTime { :self |
		self.unixTimeInMilliseconds.TimeStamp
	}

}

+SmallFloat {

	TimeStamp { :self |
		newTimeStamp().initializeSlots(self)
	}

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
