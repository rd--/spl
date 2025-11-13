Duration : [Object, Storeable, Equatable, Comparable, Magnitude] { | seconds |

	< { :self :aDuration |
		self.seconds < aDuration.asDuration.seconds
	}

	* { :self :aNumber |
		Duration(self.seconds * aNumber)
	}

	/ { :self :aNumber |
		Duration(self.seconds / aNumber)
	}

	+ { :self :aDuration |
		Duration(self.seconds + aDuration.asDuration.seconds)
	}

	- { :self :aDuration |
		Duration(self.seconds - aDuration.asDuration.seconds)
	}

	abs { :self |
		Duration(self.seconds.abs)
	}

	asDuration { :self |
		self
	}

	asFrequency { :self |
		Frequency(self.seconds.reciprocal)
	}

	asSeconds { :self |
		self.seconds
	}

	components { :self |
		let b = [24 60 60];
		self.seconds.mixedRadixEncode(b).padLeft([4], 0)
	}

	durationString { :self |
		let [d, h, m, s] = self.components;
		'P%DT%H%M%S'.format([d, h, m, s])
	}

	isZero { :self |
		self.seconds = 0
	}

}

+SmallFloat {

	Duration { :self |
		newDuration().initializeSlots(self)
	}

}

+List {

	Duration { :self |
		let [d, h, m, s] = self;
		let b = [24 60 60];
		Duration(self.mixedRadixDecode(b))
	}

}

+@Number {

	asDuration { :self |
		self.error('Duration: no units specified')
	}

	asSeconds { :self |
		self
	}

}

+Block {

	valueAfter { :self:/0 :delay |
		self:/0.basicValueAfter(delay.asSeconds)
	}

	valueAfterWith { :self:/1 :delay :anObject |
		self:/1.basicValueAfterWith(delay.asSeconds, anObject)
	}

	valueEvery { :self:/0 :delay |
		self:/0.basicValueEvery(delay.asSeconds)
	}

}

+String {

	parseDuration { :self :elseClause:/0 |
		self.isIso8601DurationString.if {
			let [
				years,
				months,
				days,
				hours,
				minutes,
				seconds
			] = self.parseCalendarDuration.components;
			(years + months > 0).if {
				elseClause()
			} {
				Duration(
					[days, hours, minutes, seconds].mixedRadixDecode([24 60 60])
				)
			}
		} {
			elseClause()
		}
	}

	parseDuration { :self |
		self.parseDuration {
			self.error('String>>parseDuration: invalid input')
		}
	}

}

+System {

	localTimeZoneOffset { :self |
		self
		.localTimeZoneOffsetInMinutes
		.minutes
	}

}
