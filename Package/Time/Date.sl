Date! : [Object, Magnitude] {

	= { :self :anObject |
		anObject.isDate & {
			self.unixTimeInMilliseconds = anObject.unixTimeInMilliseconds
		}
	}

	< { :self :aDate |
		self.unixTimeInMilliseconds < aDate.unixTimeInMilliseconds
	}

	asDate { :self |
		self
	}

	asList { :self |
		[
			self.year,
			self.month,
			self.dayOfWeek,
			self.hour,
			self.minute,
			self.second
		]
	}

	asTimeStamp { :self |
		self.unixTimeInMilliseconds.asTimeStamp
	}

	dayOfWeek { :self |
		<primitive: return _self.getDay() + 1;>
	}

	dayOfMonth { :self |
		<primitive: return _self.getDate();>
	}

	hour { :self |
		<primitive: return _self.getHours();>
	}

	iso8601 { :self |
		<primitive: return _self.toISOString();>
	}

	localeTimeString { :self :localeName |
		<primitive: return _self.toLocaleTimeString(_localeName);>
	}

	millisecond { :self |
		<primitive: return _self.getMilliseconds();>
	}

	minute { :self |
		<primitive: return _self.getMinutes();>
	}

	month { :self |
		<primitive: return _self.getMonth() + 1;>
	}

	offsetSeconds { :self |
		<primitive: return Math.round(_self.getTimezoneOffset() * 60);>
	}

	second { :self |
		<primitive: return _self.getSeconds();>
	}

	unixTimeInMilliseconds { :self |
		<primitive: return _self.getTime();>
	}

	unixTimeInSeconds { :self |
		self.unixTimeInMilliseconds / 1000
	}

	year { :self |
		<primitive: return _self.getFullYear();>
	}

}

+SmallFloat {

	asDate { :self |
		<primitive: return new Date(_self * 1000);>
	}

}

+String {

	parseDate { :self |
		<primitive: return new Date(_self);>
	}

}

+System {

	currentDate { :unused |
		<primitive: return new Date();>
	}

}
