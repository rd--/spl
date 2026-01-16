Date! : [Object, Storeable, Equatable, Comparable, Magnitude] {

	[less, <] { :self :aDate |
		self.absoluteTime < aDate.absoluteTime
	}

	absoluteTime { :self |
		<primitive: return _self.getTime() / 1000;>
	}

	asDate { :self |
		self
	}

	asDateAndTime { :self |
		DateAndTime(self.absoluteTime)
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
			self.dayOfMonth
		]
	}

	dateString { :self |
		[
			self.year.asString,
			self.month.asString.padLeft([2], '0'),
			self.dayOfMonth.asString.padLeft([2], '0')
		].stringJoin('-')
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
		let t1 = Date(y, m, d).absoluteTime;
		let t2 = Date(y, 1, 1).absoluteTime;
		(t1 - t2) / (24 * 60 * 60) + 1
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isDate & {
			aBlock(self.absoluteTime, anObject.absoluteTime)
		}
	}

	month { :self |
		<primitive: return _self.getUTCMonth() + 1;>
	}

	ordinalDateString { :self |
		[
			self.year.asString,
			self.dayOfYear.asString.padLeft([3], '0')
		].stringJoin('-')
	}

	storeString { :self |
		'Date(%)'.format([self.components])
	}

	year { :self |
		<primitive: return _self.getUTCFullYear();>
	}

}

+SmallFloat {

	asDate { :self |
		<primitive: return new Date(_self * 1000);>
	}

	Date { :year :month :dayOfMonth |
		<primitive:
		return new Date(
			Date.UTC(
				_year,
				_month - 1,
				_dayOfMonth,
				0,
				0,
				0,
				0
			)
		);
		>
	}

}

+List {

	Date { :self |
		let [year, month, dayOfMonth] = self;
		Date(year, month, dayOfMonth)
	}

}

+String {

	isDateString { :self |
		self.matchesRegularExpression('^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$')
	}

	parseDate { :self :elseClause:/0 |
		(self.size = 10 & { self.isDateString }).if {
			self.uncheckedParseDate
		} {
			elseClause()
		}
	}

	parseDate { :self |
		self.parseDate {
			self.error('parseDate: invalid size')
		}
	}

	uncheckedParseDate { :self |
		<primitive: return new Date(_self);>
	}

}

+System {

	currentDate { :unused |
		<primitive: return new Date();>
	}

}
