Duration { | milliseconds |

	= { :self :aDuration |
		aDuration.isDuration &
		{ self.milliseconds = aDuration.milliseconds }
	}

	+ { :self :anObject |
		Duration(self.milliseconds + anObject.asDuration.milliseconds)
	}

	- { :self :anObject |
		Duration(self.milliseconds - anObject.asDuration.milliseconds)
	}

	asDuration { :self |
		self
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

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		apply(aProcedure, [aNumber.asDuration, self])
	}

}

+ Number {

	Duration { :self |
		newDuration(self)
	}

	asDuration { :self |
		self.seconds
	}

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

}
