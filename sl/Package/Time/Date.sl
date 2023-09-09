Date : [Object, Magnitude] {

	= { :self :anObject |
		anObject.isDate & {
			self.unixTimeInMilliseconds = anObject.unixTimeInMilliseconds
		}
	}

	< { :self :aDate |
		self.unixTimeInMilliseconds < aDate.unixTimeInMilliseconds
	}

	dayOfWeek { :self |
		<primitive: return _self.getDay() + 1;>
	}

	dayOfMonth { :self |
		<primitive: return _self.getDate();>
	}

	hours { :self |
		<primitive: return _self.getHours();>
	}

	iso8601 { :self |
		<primitive: return _self.toISOString();>
	}

	localeTimeString { :self :localeName |
		<primitive: return _self.toLocaleTimeString(_localeName);>
	}

	milliseconds { :self |
		<primitive: return _self.getMilliseconds();>
	}

	minutes { :self |
		<primitive: return _self.getMinutes();>
	}

	month { :self |
		<primitive: return _self.getMonth() + 1;>
	}

	offsetSeconds { :self |
		<primitive: return Math.round(_self.getTimezoneOffset() * 60);>
	}

	seconds { :self |
		<primitive: return _self.getSeconds();>
	}

	unixTimeInMilliseconds { :self |
		<primitive: return _self.getTime();>
	}

	year { :self |
		<primitive: return _self.getFullYear();>
	}

}

+SmallFloat {

	Date { :self |
		<primitive: return new Date(_self);>
	}

}

+String {

	Date { :self |
		<primitive: return new Date(_self);>
	}

}

+System {

	Date { :self |
		<primitive: return new Date();>
	}

}
