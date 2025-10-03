CalendarDuration : [Object, Equatable, Comparable] { | components |

	asCalendarDuration { :self |
		self
	}

	asList { :self |
		self.components
	}

	compare { :self :operand |
		self.components.compare(operand.components)
	}

	years  { :self |
		self.components.at(1)
	}

	months  { :self |
		self.components.at(2)
	}

	days  { :self |
		self.components.at(3)
	}

	hours  { :self |
		self.components.at(4)
	}

	minutes  { :self |
		self.components.at(5)
	}

	seconds  { :self |
		self.components.at(6)
	}

	durationString { :self |
		'P%Y%M%DT%H%M%S'.format(
			self.components
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	CalendarDuration { :self |
		(self.size = 6).if {
			newCalendarDuration()
			.initializeSlots(self)
		} {
			self.error('CalendarDuration: invalid list')
		}
	}

}

+String {

	isIso8601DurationString { :self |
		self.matchesRegularExpression('^P([0-9]+Y)?([0-9]+M)?([0-9]+W)?([0-9]+D)?(T([0-9]+H)?([0-9]+M)?([0-9]+(.[0-9]+)S)?)?$')
	}

	parseCalendarDuration { :self :elseClause:/0 |
		self.isIso8601DurationString.if {
			let [
				years, months, weeks, days,
				hours, minutes, seconds
			] = self.uncheckedParseIso8601DurationAsList;
			days := days + (weeks * 7);
			CalendarDuration(
				[
					years, months, days,
					hours, minutes, seconds
				]
			)
		} {
			elseClause()
		}
	}

	parseCalendarDuration { :self |
		self.parseCalendarDuration {
			self.error('String>>parseCalendarDuration: invalid input')
		}
	}

	uncheckedParseIso8601DurationAsList { :self |
		<primitive:
		const regex = /P(?:(\d+)Y)?(?:(\d+)M)?(?:(\d+)W)?(?:(\d+)D)?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+(\.\d+)?)S)?)?$/;
		const [_unused, years, months, weeks, days, hours, minutes, seconds] = _self.match(regex);
		return [years, months, weeks, days, hours, minutes, seconds].map(function(x) {
			return x ? Number(x) : 0;
		});
		>
	}

}
