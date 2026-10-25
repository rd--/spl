@Exception {

	description { :self |
		self.hasCause.if {
			[self.name, self.messageText, self.causeText]
		} {
			[self.name, self.messageText]
		}.stringIntercalate(': ')
	}

	hasCause { :self |
		self.cause.isNotNil
	}

	isError { :self |
		true
	}

	isException { :self |
		true
	}

	shallowCopy { :self |
		self.shouldNotImplement('shallowCopy')
	}

}

+@Object {

	isException { :self |
		false
	}

}

Error! : [Object, Equal, Exception] {

}

ReferenceError! : [Object, Exception] {

}

TypeError! : [Object, Exception] {

}

+[Error, ReferenceError, TypeError] {

	cause { :self |
		<primitive: return _self.cause;>
	}

	causeText { :self |
		self.cause.isError.if {
			self.cause.description
		} {
			self.cause.printString
		}
	}

	messageText { :self |
		<primitive: return _self.message;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	printString { :self |
		'*Error* ' ++ self.description
	}

	pseudoSlotNameList { :self |
		['cause', 'messageText', 'name']
	}

	signal { :self |
		<primitive: throw(_self);>
	}

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

	Error { :self :cause |
		<primitive: return Error(_self, {cause: _cause});>
	}

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
