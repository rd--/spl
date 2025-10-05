@Time {

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

	seconds { :self |
		self.typeResponsibility('seconds')
	}

	timeString { :self |
		let seconds = self.seconds;
		(seconds >= 0 & { seconds < (24 * 60 * 60) }).if {
			let [h, m, s] = seconds.mixedRadixEncode([60 60]);
			'%:%:%.%'.format([
				h.asString.padLeft([2], '0'),
				m.asString.padLeft([2], '0'),
				s.truncate.asString.padLeft([2], '0'),
				(s.fractionalPart * 1000).round.asString.padLeft([3], '0')
			])
		} {
			self.error('timeString: invalid time')
		}
	}

	weeks { :self |
		self.days / 7
	}

}

+SmallFloat {

	Time { :self |
		Quantity(self, 'seconds')
	}

}

+String {

	isTimeString { :self |
		self.matchesRegularExpression('[0-9][0-9]:[0-9][0-9]:[0-9][0-9](.[0-9]+)?Z?$')
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
		(self * 86164.0905).seconds
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
