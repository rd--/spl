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

	asList { :self |
		let b = [24 60 60];
		self.seconds.mixedRadixEncode(b).padLeft([4], 0)
	}

	asSeconds { :self |
		self.seconds
	}

	durationString { :self |
		let [d, h, m, s] = self.asList;
		'P%DT%H%M%S'.format([d, h, m, s])
	}

	isZero { :self |
		self.seconds = 0
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
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

	isDurationString { :self |
		self.matchesRegExp('^P([0-9]+Y)?([0-9]+M)?([0-9]+W)?([0-9]+D)?(T([0-9]+H)?([0-9]+M)?([0-9]+(.[0-9]+)S)?)?$')
	}

	parseIso8601DurationAsList { :self |
		<primitive:
		const regex = /P(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)W)?(?:(\d+)D)?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+(\.\d+)?)S)?)?$/;
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
	}

}
