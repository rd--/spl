@Exception {

	copy { :self |
		self.shouldNotImplement('copy')
	}

	hasCause { :self |
		self.cause.isNotNil
	}

	description { :self |
		self.hasCause.if {
			self.name ++ ': ' ++ self.messageText ++ ': ' ++ self.causeText
		} {
			self.name ++ ': ' ++ self.messageText
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
			self.cause.asString
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

Error! : [Object, Storeable, Equatable, Exception, PrimitiveError] {

	printString { :self |
		'*ERROR* ' ++ self.description
	}

	storeString { :self |
		self.hasCause.if {
			'Error(%, %)'.format(
				[
					self.messageText.storeString,
					self.cause.storeString
				]
			)
		} {
			'Error(%)'.format([self.messageText.storeString])
		}
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
