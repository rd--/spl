TimeStamp : [Object] { | unixTimeInMilliseconds |

	iso8601 { :self |
		<primitive: const date = new Date(_self.unixTimeInMilliseconds); return date.toISOString();>
	}

}

+ Number {

	TimeStamp { :self |
		newTimeStamp().initializeSlots(self)
	}

}
