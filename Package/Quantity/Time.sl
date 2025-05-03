Time : [Object] { | seconds |

	magnitude { :self |
		self.seconds
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	timeString { :self |
		let seconds = self.seconds;
		(seconds >= 0 & { seconds < (24 * 60 * 60) }).if {
			let [h, m, s] = seconds.mixedRadixEncode([60 60]);
			'%:%:%.%'.format([
				h.asString.padLeft([2], '0'),
				m.asString.padLeft([2], '0'),
				s.truncated.asString.padLeft([2], '0'),
				(s.fractionPart * 1000).rounded.asString.padLeft([3], '0')
			])
		} {
			self.error('timeString: invalid time')
		}
	}

	unit { :unused |
		'seconds'
	}

}

+String {

	isTimeString { :self |
		self.matchesRegExp('[0-9][0-9]:[0-9][0-9]:[0-9][0-9](.[0-9]+)?Z?$')
	}

	parseTime { :self :elseClause:/0 |
		self.isTimeString.if {
			let [h, m, s] = self.splitBy(':');
			h := h.parseDecimalInteger;
			m := m.parseDecimalInteger;
			s := s.parseNumber;
			(h < 24 | { m < 60 | { s < 60 } }).if {
				Time((h * 60 * 60) + (m * 60) + s)
			} {
				elseClause()
			}
		} {
			elseClause()
		}
	}

	parseTime { :self |
		self.parseTime {
			self.error('parseTime: invalid input')
		}
	}
}

+[Time, Quantity] {

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

	julianYears { :self |
		self.days / 365.25
	}

	milliseconds { :self |
		self.seconds * 1000
	}

	minutes { :self |
		self.seconds / 60
	}

	weeks { :self |
		self.days / 7
	}

}

+SmallFloat {

	Time { :self |
		newTime().initializeSlots(self)
	}

}

+Quantity {

	asTime { :self |
		Time(self.seconds)
	}

}

+SmallFloat {

	anomalisticMonths { :self |
		(self * 27.554551).days
	}

	anomalisticYears { :self |
		(self * 365.259636).days
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

	siderealDays { :self |
		(self * 0.99726968).days
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
