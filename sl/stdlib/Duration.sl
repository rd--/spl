Duration { | milliseconds |

	asDuration { :self | self }
	asSeconds { :self | self.seconds }
	printString { :self | 'Duration(' ++ self.milliseconds.printString ++ ')' }
	= { :self :aDuration | aDuration.isDuration & { self.milliseconds = aDuration.milliseconds } }

	seconds {  :self | self.milliseconds / 1000 }
	minutes {  :self | self.seconds / 60 }
	hours { :self | self.minutes / 60 }
	days { :self | self.hours / 24 }
	weeks { :self | self.days / 7 }

	+ { :self :anObject |
		Duration(self.milliseconds + anObject.asDuration.milliseconds)
	}

	- { :self :anObject |
		Duration(self.milliseconds - anObject.asDuration.milliseconds)
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		apply(aProcedure, [aNumber.asDuration, self])
	}

}

+ Number {

	asDuration { :self | self.seconds }
	asSeconds { :self | self }
	milliseconds { :self | Duration(self) }
	seconds { :self | Duration(self * 1000) }
	minutes { :self | Duration(self * 60 * 1000) }
	hours { :self | Duration(self * 60 * 60 * 1000) }
	days { :self | Duration(self * 24 * 60 * 60 * 1000) }
	weeks { :self | Duration(self * 7 * 24 * 60 * 60 * 1000) }

}
