Duration : [Object, Magnitude] { | seconds |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

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

	centiseconds { :self |
		self.seconds * 10
	}

	days { :self |
		self.hours / 24
	}

	hours { :self |
		self.minutes / 60
	}

	isZero { :self |
		self.seconds = 0
	}

	milliseconds { :self |
		self.seconds * 1000
	}

	minutes { :self |
		self.seconds / 60
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	weeks { :self |
		self.days / 7
	}

}

+SmallFloat {

	Duration { :self |
		newDuration().initializeSlots(self)
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

	parseIso8601DurationAsList { :self |
		<primitive:
		const regex = /P(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)W)?(?:(\d+)D)?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?)?$/;
		const [_unused, years, months, weeks, days, hours, minutes, seconds] = _self.match(regex);
		return [years, months, weeks, days, hours, minutes, seconds].map(function(x) {
			return x ? Number(x) : 0;
		});
		>
	}

	parseDuration { :self |
		let [
			years, months, weeks, days,
			hours, minutes, seconds
		] = self.parseIso8601DurationAsList;
		(years + months > 0).if {
			self.error('String>>asDuration: includes non-zero year or month fields')
		} {
			weeks.weeks.asDuration + days.days + hours.hours + minutes.minutes + seconds.seconds
		}
	}

}

+Quantity {

	asDuration { :self |
		(self.unit = 'seconds').if {
			Duration(self.magnitude)
		} {
			self.error('asDuration: not time')
		}
	}

}

+System {

	localTimeZoneOffset { :self |
		self
		.localTimeZoneOffsetInMinutes
		.minutes
		.asDuration
	}

}
