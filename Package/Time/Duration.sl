Duration : [Object, Store, Equal, Compare] {

	| magnitude |

	[less, <] { :self :aDuration |
		self.magnitude < aDuration.inSeconds
	}

	[divide, /] { :self :aNumber |
		Duration(self.magnitude / aNumber)
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

	[absoluteValue, abs] { :self |
		Duration(self.magnitude.abs)
	}

	components { :self |
		let b = [24 60 60];
		self.magnitude.mixedRadixEncode(b).padLeft([4], 0)
	}

	Duration { :self |
		self
	}

	durationString { :self |
		let [d, h, m, s] = self.components;
		'P%DT%H%M%S'.format([d, h, m, s])
	}

	Frequency { :self |
		Frequency(self.magnitude.reciprocal)
	}

	inSeconds { :self |
		self.magnitude
	}

	isZero { :self |
		self.magnitude = 0
	}

	Quantity { :self |
		Quantity(self.magnitude, 'second')
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

+Block {

	valueAfter { :self/0 :delay |
		self/0.basicValueAfter(delay)
	}

	valueAfterWith { :self/1 :delay :anObject |
		self/1.basicValueAfterWith(delay, anObject)
	}

	valueEvery { :self/0 :delay |
		self/0.basicValueEvery(delay)
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
