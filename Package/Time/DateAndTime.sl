DateAndTime : [Object, Equatable, Comparable, Magnitude] { | primitive |

	< { :self :aDate |
		self.absoluteTime < aDate.absoluteTime
	}

	absoluteTime { :self |
		<primitive: return _self.primitive.getTime() / 1000;>
	}

	asDate { :self |
		Date(
			[
				self.year,
				self.month,
				self.dayOfMonth
			]
		)
	}

	asDateAndTime { :self |
		self
	}

	asTime { :self |
		Time(self.absoluteTime)
	}

	asTimeStamp { :self |
		TimeStamp(self.absoluteTime)
	}

	components { :self |
		[
			self.year,
			self.month,
			self.dayOfMonth,
			self.hour,
			self.minute,
			self.second
		]
	}

	dateAndTimeString { :self |
		<primitive: return _self.primitive.toISOString();>
	}

	dayOfWeek { :self |
		<primitive: return _self.primitive.getUTCDay() + 1;>
	}

	dayOfMonth { :self |
		<primitive: return _self.primitive.getUTCDate();>
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isDateAndTime & {
			aBlock(self.absoluteTime, anObject.absoluteTime)
		}
	}

	hour { :self |
		<primitive: return _self.primitive.getUTCHours();>
	}

	localeTimeString { :self :localeName |
		<primitive: return _self.primitive.toLocaleTimeString(_localeName);>
	}

	millisecond { :self |
		<primitive: return _self.primitive.getUTCMilliseconds();>
	}

	minute { :self |
		<primitive: return _self.primitive.getUTCMinutes();>
	}

	month { :self |
		<primitive: return _self.primitive.getUTCMonth() + 1;>
	}

	offsetSeconds { :self |
		<primitive: return Math.round(_self.primitive.getTimezoneOffset() * 60);>
	}

	second { :self |
		self.wholeSecond + (self.millisecond / 1000)
	}

	storeString { :self |
		'DateAndTime(%)'.format(
			[
				self.components
			]
		)
	}

	unixTimeInMilliseconds { :self |
		<primitive: return _self.primitive.getTime();>
	}

	wholeSecond { :self |
		<primitive: return _self.primitive.getUTCSeconds();>
	}

	year { :self |
		<primitive: return _self.primitive.getUTCFullYear();>
	}

}

+SmallFloat {

	asDateAndTime { :self |
		newDateAndTime().initializeSlots(
			self.asPrimitiveDateAndTime
		)
	}

	asPrimitiveDateAndTime { :self |
		<primitive: return new Date(_self * 1000);>
	}

	DateAndTime { :year :month :dayOfMonth :hour :minute :second |
		newDateAndTime().initializeSlots(
			primitiveDateAndTime(year, month, dayOfMonth, hour, minute, second)
		)
	}

	primitiveDateAndTime { :year :month :dayOfMonth :hour :minute :second |
		<primitive:
		const wholeSecond = Math.trunc(_second);
		const millisecond = (_second - wholeSecond) * 1000;
		return new Date(
			Date.UTC(
				_year,
				_month - 1,
				_dayOfMonth,
				_hour,
				_minute,
				wholeSecond,
				millisecond
			)
		);
		>
	}

}

+List {

	DateAndTime { :self |
		let [year, month, dayOfMonth, hour, minute, second] = self;
		DateAndTime(year, month, dayOfMonth, hour, minute, second)
	}

}

+String {

	isDateAndTimeString { :self |
		[24 29].includes(self.size) & {
			self.matchesRegularExpression('^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]T[0-9][0-9]:[0-9][0-9]:[0-9][0-9](.[0-9]+)?([-+][0-9][0-9]:[0-9][0-9]|Z)?$')
		}
	}

	parseDateAndTime { :self :elseClause:/0 |
		self.isDateAndTimeString.if {
			newDateAndTime().initializeSlots(
				self.uncheckedParsePrimitiveDateAndTime
			)
		} {
			elseClause()
		}
	}

	parseDateAndTime { :self |
		self.parseDateAndTime {
			self.error('parseDateAndTime: invalid input')
		}
	}

	uncheckedParsePrimitiveDateAndTime { :self |
		<primitive: return new Date(_self);>
	}

}

+System {

	currentDateAndTime { :self |
		newDateAndTime().initializeSlots(
			self.currentPrimitiveDateAndTime
		)
	}

	currentPrimitiveDateAndTime { :unused |
		<primitive: return new Date();>
	}

}
