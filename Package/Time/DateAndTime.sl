/* Requires: Date */

DateAndTime : [Object, Store, Equal, Compare] {

	| hiddenRepresentation | <Date>

	[Date, dateAndTimeToDate] { :self |
		Date(
			[
				self.year,
				self.month,
				self.dayOfMonth
			]
		)
	}

	DateAndTime { :self |
		self
	}

	Time { :self |
		Time(self.absoluteTime)
	}

	TimeStamp { :self |
		TimeStamp(self.absoluteTime)
	}

	absoluteTime { :self |
		<primitive:
		return _self.hiddenRepresentation.getTime() / 1000.0;
		>
	}

	absoluteTimeInMilliseconds { :self |
		<primitive:
		return _self.hiddenRepresentation.getTime();
		>
	}

	components { :self |
		[
			self.year,
			self.month,
			self.dayOfMonth,
			self.hour,
			self.minute,
			self.fractionalSecond
		]
	}

	dateAndTimeString { :self |
		<primitive:
		return _self.hiddenRepresentation.toISOString();
		>
	}

	dayOfMonth { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCDate();
		>
	}

	dayOfWeek { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCDay() + 1;
		>
	}

	fractionalSecond { :self |
		self.wholeSecond + (self.millisecond / 1000)
	}

	hour { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCHours();
		>
	}

	isEqualBy { :self :anObject :aFunction/2 |
		anObject.isDateAndTime & {
			aFunction(self.absoluteTime, anObject.absoluteTime)
		}
	}

	[isLess, <] { :self :aDate |
		self.absoluteTime < aDate.absoluteTime
	}

	localeTimeString { :self :localeName |
		<primitive:
		return _self.hiddenRepresentation.toLocaleTimeString(_localeName);
		>
	}

	millisecond { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCMilliseconds();
		>
	}

	minute { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCMinutes();
		>
	}

	month { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCMonth() + 1;
		>
	}

	offsetWholeSeconds { :self |
		<primitive:
		return Math.round(_self.hiddenRepresentation.getTimezoneOffset() * 60);
		>
	}

	storeString { :self |
		'DateAndTime(%)'.format(
			[
				self.components
			]
		)
	}

	wholeSecond { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCSeconds();
		>
	}

	year { :self |
		<primitive:
		return _self.hiddenRepresentation.getUTCFullYear();
		>
	}

}

+[Integer, @SmallInteger] {

	DateAndTime { :year :month :dayOfMonth :hour :minute :second |
		DateAndTime(
			[year, month, dayOfMonth, hour, minute, second]
		)
	}

}

+[Float, @ImplicitFloat] {

	DateAndTime { :self Float |
		uncheckedDateAndTime(
			self.primitiveDateAndTime
		)
	}

}

+Float {

	primitiveDateAndTime { :self |
		<primitive:
		return new Date(_self * 1000);
		>
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

	[DateAndTime, listToDateAndTime] { :self |
		self.atVectorOrElementwise { :each FloatVector |
			let [year, month, dayOfMonth, hour, minute, second] = each;
			newDateAndTime().initializeSlots(
				primitiveDateAndTime(
					year,
					month,
					dayOfMonth,
					hour,
					minute,
					second
				)
			)
		}
	}

}

+String {

	isDateAndTimeString { :self |
		[24 29].includes(self.size) & {
			self.matchesRegularExpression(
				'^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]T[0-9][0-9]:[0-9][0-9]:[0-9][0-9](.[0-9]+)?([-+][0-9][0-9]:[0-9][0-9]|Z)?$'
			)
		}
	}

	parseDateAndTime { :self :elseClause/0 |
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
		<primitive:
		return new Date(_self);
		>
	}

}

+System {

	currentDateAndTime { :self |
		newDateAndTime().initializeSlots(
			self.uncheckedCurrentDateAndTime
		)
	}

	uncheckedCurrentDateAndTime { :unused |
		<primitive:
		return new Date();
		>
	}

}
