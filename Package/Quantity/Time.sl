Time : [Object] { | seconds |

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

	magnitude { :self |
		self.seconds
	}

	milliseconds { :self |
		self.seconds * 1000
	}

	minutes { :self |
		self.seconds / 60
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	unit { :unused |
		'seconds'
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
		(self.unit = 'seconds').if {
			Time(self.magnitude)
		} {
			self.error('asTime: not time')
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
