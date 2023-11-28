@Exception {

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

	shallowCopy { :self |
		self.error('copy: cannot copy')
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

	pseudoSlotNameArray { :self |
		['cause', 'messageText', 'name']
	}

	name { :self |
		<primitive: return _self.name;>
	}

	signal { :self |
		<primitive: throw(_self);>
	}

}

Error! : [Object, Exception, PrimitiveError] {

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
