Date! : [Object, Magnitude] {

	= { :self :anObject |
		anObject.isDate & {
			self.absoluteTime = anObject.absoluteTime
		}
	}

	< { :self :aDate |
		self.absoluteTime < aDate.absoluteTime
	}

	absoluteTime { :self |
		<primitive: return _self.getTime() / 1000;>
	}

	asDate { :self |
		self
	}

	asList { :self |
		[
			self.year,
			self.month,
			self.dayOfMonth,
			self.hour,
			self.minute,
			self.second,
			self.millisecond
		]
	}

	asTime { :self |
		Time(self.absoluteTime)
	}

	asTimeStamp { :self |
		TimeStamp(self.absoluteTime)
	}

	dateString { :self |
		[
			self.year.asString,
			self.month.asString.padLeft([2], '0'),
			self.dayOfMonth.asString.padLeft([2], '0')
		].stringJoin('-')
	}

	dateTimeString { :self |
		<primitive: return _self.toISOString();>
	}

	dayOfWeek { :self |
		<primitive: return _self.getUTCDay() + 1;>
	}

	dayOfMonth { :self |
		<primitive: return _self.getUTCDate();>
	}

	dayOfYear { :self |
		let y = self.year;
		let m = self.month;
		let d = self.dayOfMonth;
		let t1 = Date(y, m, d, 0, 0, 0, 0).absoluteTime;
		let t2 = Date(y, 1, 1, 0, 0, 0, 0).absoluteTime;
		(t1 - t2) / (24 * 60 * 60) + 1
	}

	hour { :self |
		<primitive: return _self.getUTCHours();>
	}

	localeTimeString { :self :localeName |
		<primitive: return _self.toLocaleTimeString(_localeName);>
	}

	millisecond { :self |
		<primitive: return _self.getUTCMilliseconds();>
	}

	minute { :self |
		<primitive: return _self.getUTCMinutes();>
	}

	month { :self |
		<primitive: return _self.getUTCMonth() + 1;>
	}

	offsetSeconds { :self |
		<primitive: return Math.round(_self.getTimezoneOffset() * 60);>
	}

	ordinalDateString { :self |
		[
			self.year.asString,
			self.dayOfYear.asString.padLeft([3], '0')
		].stringJoin('-')
	}

	second { :self |
		<primitive: return _self.getUTCSeconds();>
	}

	storeString { :self |
		'Date(%)'.format([self.asList])
	}

	unixTimeInMilliseconds { :self |
		<primitive: return _self.getTime();>
	}

	year { :self |
		<primitive: return _self.getUTCFullYear();>
	}

}

+SmallFloat {

	asDate { :self |
		<primitive: return new Date(_self * 1000);>
	}

	Date { :year :month :dayOfMonth :hour :minute :second :millisecond |
		<primitive:
		return new Date(
			Date.UTC(
				_year,
				_month - 1,
				_dayOfMonth,
				_hour,
				_minute,
				_second,
				_millisecond
			)
		);
		>
	}

}

+List {

	Date { :self |
		let [year, month, dayOfMonth, hour, minute, second, millisecond] = self;
		Date(year, month, dayOfMonth, hour, minute, second, millisecond)
	}

}

+String {

	uncheckedParseDate { :self |
		<primitive: return new Date(_self);>
	}

	parseDate { :self |
		(self.size = 10).if {
			self.uncheckedParseDate
		} {
			self.error('parseDate: invalid size')
		}
	}

	parseDateAndTime { :self |
		[24 29].includes(self.size).if {
			self.uncheckedParseDate
		} {
			self.error('parseDateAndTime: invalid size')
		}
	}

}

+System {

	currentDate { :unused |
		<primitive: return new Date();>
	}

}
