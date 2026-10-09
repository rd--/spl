Date! : [Object, Store, Equal, Compare] {

	[less, <] { :self :aDate |
		self.absoluteTime < aDate.absoluteTime
	}

	absoluteTime { :self |
		<primitive: return _self.getTime() / 1000;>
	}

	components { :self |
		[
			self.year,
			self.month,
			self.dayOfMonth
		]
	}

	Date { :self |
		self
	}

	DateAndTime { :self |
		DateAndTime(self.absoluteTime)
	}

	dateString { :self |
		[
			self.year.printString,
			self.month.printString.padLeft([2], '0'),
			self.dayOfMonth.printString.padLeft([2], '0')
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

	equalBy { :self :anObject :aBlock/2 |
		anObject.isDate & {
			aBlock(self.absoluteTime, anObject.absoluteTime)
		}
	}

	julianDate { :self |
		self.julianDay.julianDayToJulian
	}

	julianDay { :self |
		gregorianToJulianDay(
			self.year,
			self.month,
			self.dayOfMonth
		)
	}

	month { :self |
		<primitive: return _self.getUTCMonth() + 1;>
	}

	ordinalDateString { :self |
		[
			self.year.printString,
			self.dayOfYear.printString.padLeft([3], '0')
		].stringJoin('-')
	}

	storeString { :self |
		'Date(%, %, %)'.format(
			[
				self.year,
				self.month,
				self.dayOfMonth
			]
		)
	}

	Time { :self |
		Time(self.absoluteTime)
	}

	TimeStamp { :self |
		TimeStamp(self.absoluteTime)
	}

	year { :self |
		<primitive: return _self.getUTCFullYear();>
	}

}

+SmallFloat {

	[Date, absoluteTimeToDate] { :self |
		<primitive: return new Date(_self * 1000);>
	}

	Date { :year :month :dayOfMonth |
		<primitive:
		const d = new Date(
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
		d.setFullYear(_year);
		return d;
		>
	}

	fromJulianDay { :self |
		let [year, month, day] = self.julianDayToGregorian;
		Date(year, month, day.ceiling)
	}

	JulianDate { :year :month :day |
		julianToJulianDay(
			year,
			month,
			day
		).fromJulianDay
	}

}

+List {

	[Date, listToDate] { :self |
		self.atVectorOrElementwise { :each |
			let [year, month, dayOfMonth] = each;
			Date(year, month, dayOfMonth)
		}
	}

}

+String {

	isDateString { :self |
		self.matchesRegularExpression('^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$')
	}

	parseDate { :self :elseClause/0 |
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

+SmallFloat {

	isGregorianLeapYear { :year |
		/* https://www.fourmilab.ch/documents/calendar/calendar.js */
		(year % 4 = 0) & {
			(
				(year % 100 = 0) & {
					year % 400 != 0
				}
			).not
		}
	}

	julianDayToJulian { :self |
		/* https://www.fourmilab.ch/documents/calendar/calendar.js */
		<primitive:
		let td = _self + 0.5;
		let z = Math.floor(td);
		let a = z;
		let b = a + 1524;
		let c = Math.floor((b - 122.1) / 365.25);
		let d = Math.floor(365.25 * c);
		let e = Math.floor((b - d) / 30.6001);
		let month = Math.floor((e < 14) ? (e - 1) : (e - 13));
		let year = Math.floor((month > 2) ? (c - 4716) : (c - 4715));
		let day = b - d - Math.floor(30.6001 * e);
		return [year, month, day];
		>
	}

	julianDayToGregorian { :self |
		/* https://www.fourmilab.ch/documents/calendar/calendar.js */
		<primitive:
		let jd = _self;
		function mod(a, b) { return a - (b * Math.floor(a / b)); }
		let wjd = Math.floor(jd - 0.5) + 0.5;
		let gregorianEpoch = 1721425.5;
		let depoch = wjd - gregorianEpoch;
		let quadricent = Math.floor(depoch / 146097);
		let dqc = mod(depoch, 146097);
		let cent = Math.floor(dqc / 36524);
		let dcent = mod(dqc, 36524);
		let quad = Math.floor(dcent / 1461);
		let dquad = mod(dcent, 1461);
		let yindex = Math.floor(dquad / 365);
		let year = (quadricent * 400) + (cent * 100) + (quad * 4) + yindex;
		if (!((cent == 4) || (yindex == 4))) {
			year++;
		}
		let yearday = wjd - _gregorianToJulianDay_3(year, 1, 1);
		let leapadj = (
			(wjd < _gregorianToJulianDay_3(year, 3, 1))
			? 0
			: (_isGregorianLeapYear_1(year) ? 1 : 2)
		);
		let month = Math.floor((((yearday + leapadj) * 12) + 373) / 367);
		let day = (wjd - _gregorianToJulianDay_3(year, month, 1)) + 1;
		return [year, month, day];
		>
	}

	gregorianToJulianDay { :year :month :day |
		/* https://www.fourmilab.ch/documents/calendar/calendar.js */
		let gregorianEpoch = 1_721_425.5;
		(
			(gregorianEpoch - 1)
			+
			(365 * (year - 1))
			+
			floor((year - 1) / 4)
			+
			(0 - floor((year - 1) / 100))
			+
			floor((year - 1) / 400)
			+
			floor(
				(((367 * month) - 362) / 12)
				+
				(month <= 2).if {
					0
				} {
					year.isGregorianLeapYear.if { -1 } { -2 }
				}
				+
				day
			)
		).ceiling
	}

	julianToJulianDay { :year :month :day |
		/* https://www.fourmilab.ch/documents/calendar/calendar.js */
		(month <= 2).ifTrue {
			year := year - 1;
			month := month + 12
		};
		(
			(
				floor((365.25 * (year + 4716)))
				+
				floor((30.6001 * (month + 1)))
				+
				day
			)
			-
			1524.5
		).ceiling
	}

}
