Duration : [Object, Magnitude] { | seconds |

	= { :self :anObject |
		anObject.isDuration & {
			self.seconds = anObject.seconds
		}
	}

	~ { :self :anObject |
		anObject.isDuration & {
			self.seconds ~ anObject.seconds
		}
	}

	< { :self :aDuration |
		self.seconds < aDuration.asDuration.seconds
	}

	* { :self :aNumber |
		(self.seconds * aNumber).seconds
	}

	/ { :self :aNumber |
		(self.seconds / aNumber).seconds
	}

	+ { :self :aDuration |
		(self.seconds + aDuration.asDuration.seconds).seconds
	}

	- { :self :aDuration |
		(self.seconds - aDuration.asDuration.seconds).seconds
	}

	abs { :self |
		self.seconds.abs.seconds
	}

	asDuration { :self |
		self
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
		self.seconds.storeString ++ '.seconds'
	}

	weeks { :self |
		self.days / 7
	}

}

+@Number {

	anomalisticMonths { :self |
		(self * 27.554551).days
	}

	anomalisticYears { :self |
		(self * 365.259636).days
	}

	asDuration { :self |
		self.error('Duration: no units specified')
	}

	asSeconds { :self |
		self
	}

	centiseconds { :self |
		(self * 10).milliseconds
	}

	days { :self |
		(self * 24).hours
	}

	hours { :self |
		(self * 60).minutes
	}

	julianYears { :self |
		(self * 365.25).days
	}

	milliseconds { :self |
		(self / 1000).seconds
	}

	minutes { :self |
		(self * 60).seconds
	}

	seconds { :self |
		newDuration().initializeSlots(self)
	}

	siderealMonths { :self |
		(self * 27.321661).days
	}

	siderealYears { :self |
		(self * 365.256363004).days
	}

	solarMonths { :self |
		(self * 27.321582).days
	}

	solarYears { :self |
		(self * 365.24219).days
	}

	synodicMonths { :self |
		(self * 29.53059).days
	}

	weeks { :self |
		(self * 7).days
	}

}

+Block {

	valueAfter { :self:/0 :delay |
		self:/0.valueAfterMilliseconds(delay.asSeconds * 1000)
	}

	valueAfterWith { :self:/1 :delay :anObject |
		self:/1.valueAfterMillisecondsWith(delay.asSeconds * 1000, anObject)
	}

	valueEvery { :self:/0 :delay |
		self:/0.valueEveryMilliseconds(delay.asSeconds * 1000)
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
			weeks.weeks + days.days + hours.hours + minutes.minutes + seconds.seconds
		}
	}

}

+System {

	localTimeZoneOffset { :self |
		self.localTimeZoneOffsetInMinutes.minutes
	}

}
