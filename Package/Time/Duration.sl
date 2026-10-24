Duration : [Object, Store, Equal, Compare] {

	| magnitude |

	Duration { :self |
		self
	}

	Frequency { :self |
		Frequency(self.magnitude.reciprocal)
	}

	Quantity { :self |
		Quantity(self.magnitude, 'second')
	}

	[absoluteValue, abs] { :self |
		Duration(self.magnitude.abs)
	}

	components { :self |
		let b = [24 60 60];
		self.magnitude.mixedRadixEncode(b).padLeft([4], 0)
	}

	[divide, /] { :self :aNumber |
		Duration(self.magnitude / aNumber)
	}

	durationString { :self |
		let [d, h, m, s] = self.components;
		'P%DT%H%M%S'.format([d, h, m, s])
	}

	[inSeconds, durationInSeconds] { :self |
		self.magnitude
	}

	[isLess, <] { :self :aDuration |
		self.magnitude < aDuration.inSeconds
	}

	isZero { :self |
		self.magnitude = 0
	}

	[plus, +] { :self :aDuration |
		Duration(self.magnitude + aDuration.inSeconds)
	}

	[subtract, -] { :self :aDuration |
		Duration(self.magnitude - aDuration.inSeconds)
	}

	[times, *] { :self :aNumber |
		Duration(self.magnitude * aNumber)
	}

	unit { :unused |
		'second'
	}

}

+SmallFloat {

	Duration { :self |
		newDuration().initializeSlots(self)
	}

	Duration { :d :h :m :s |
		Duration(
			[d, h, m, s].mixedRadixDecode(
				[24 60 60]
			)
		)
	}

}

+String {

	parseDuration { :self :elseClause/0 |
		self.isIso8601DurationString.if {
			let [
				years,
				months,
				days,
				hours,
				minutes,
				seconds
			] = self.parseCalendarDuration.components;
			(years + months > 0).if {
				elseClause()
			} {
				Duration(
					[days, hours, minutes, seconds].mixedRadixDecode([24 60 60])
				)
			}
		} {
			elseClause()
		}
	}

	parseDuration { :self |
		self.parseDuration {
			self.error('String>>parseDuration: invalid input')
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
