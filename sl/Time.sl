Date : [Object, Magnitude] {

	= { :self :anObject |
		anObject.isDate & {
			self.unixTimeInMilliseconds = anObject.unixTimeInMilliseconds
		}
	}

	< { :self :aDate |
		self.unixTimeInMilliseconds < aDate.unixTimeInMilliseconds
	}

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

	offsetSeconds { :self |
		<primitive: return Math.round(_self.getTimezoneOffset() * 60);>
	}

	second { :self |
		<primitive: return _self.getSeconds();>
	}

	unixTimeInMilliseconds { :self |
		<primitive: return _self.getTime();>
	}

	year { :self |
		<primitive: return _self.getFullYear();>
	}

}

+SmallFloat {

	Date { :self |
		<primitive: return new Date(_self);>
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

Duration : [Object, Magnitude] { | milliseconds |

	= { :self :anObject |
		anObject.isDuration & {
			self.milliseconds = anObject.milliseconds
		}
	}

	< { :self :other |
		self.milliseconds < other.asDuration.milliseconds
	}

	+ { :self :other |
		(self.milliseconds + other.asDuration.milliseconds).milliseconds
	}

	- { :self :other |
		(self.milliseconds - other.asDuration.milliseconds).milliseconds
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

	isZero { :self |
		self.milliseconds = 0
	}

	minutes { :self |
		self.seconds / 60
	}

	seconds { :self |
		self.milliseconds / 1000
	}

	storeString { :self |
		self.milliseconds.storeString ++ '.milliseconds'
	}

	weeks { :self |
		self.days / 7
	}

}

+SmallFloat {

	asDuration { :self |
		'SmallFloat>>asDuration: no units specified'.error
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

+String {

	parseIso8601DurationAsArray { :self |
		<primitive:
		const regex = /P(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)W)?(?:(\d+)D)?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?)?$/;
		const [unused, years, months, weeks, days, hours, minutes, seconds] = _self.match(regex);
		return [years, months, weeks, days, hours, minutes, seconds].map(function(x) {
			return x ? Number(x) : 0;
		});
		>
	}

	Duration { :self |
		| [years, months, weeks, days, hours, minutes, seconds] = self.parseIso8601DurationAsArray; |
		(years + months > 0).if {
			'String>>Duration: includes non-zero year or month fields'.error
		} {
			weeks.weeks + days.days + hours.hours + minutes.minutes + seconds.seconds
		}
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
