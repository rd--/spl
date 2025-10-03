@Exception {

	copy { :self |
		self.shouldNotImplement('copy')
	}

	description { :self |
		self.cause.ifNil {
			self.name ++ ': ' ++ self.messageText
		} {
			self.name ++ ': ' ++ self.messageText ++ ': ' ++ self.causeText
		}
	}

	isError { :self |
		true
	}

	isException { :self |
		true
	}

}

+@Object {

	isException { :self |
		false
	}

}

@PrimitiveError {

	cause { :self |
		<primitive: return _self.cause;>
	}

	causeText { :self |
		self.cause.isError.if {
			self.cause.description
		} {
			self.asString
		}
	}

	messageText { :self |
		<primitive: return _self.message;>
	}

	pseudoSlotNameList { :self |
		['cause', 'messageText', 'name']
	}

	name { :self |
		<primitive: return _self.name;>
	}

	signal { :self |
		<primitive: throw(_self);>
	}

}

Error! : [Object, Equatable, Exception, PrimitiveError] {

	printString { :self |
		'*ERROR* ' ++ self.description
	}

	storeString { :self |
		'Error(\'' ++ self.messageText ++ '\')'
	}

}

ReferenceError! : [Object, Exception, PrimitiveError] {

}

TypeError! : [Object, Exception, PrimitiveError] {

}

+@Object {

	shouldNotImplement { :self :signature |
		self.error(signature ++ ': should not implement')
	}

	typeResponsibility { :self :signature |
		self.error(signature ++ ': type responsibility')
	}

	unimplementedCase { :self :signature |
		self.error(signature ++ ': unimplemented case')
	}

}

+String {

	Error { :self |
		<primitive: return Error(_self);>
	}

	error { :self |
		Error(self).signal
	}

}

+Void {

	Error {
		Error('Unknown error')
	}

}
