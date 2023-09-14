@Exception {

	description { :self |
		self.name ++ ': ' ++ self.messageText
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

	messageText { :self |
		<primitive: return _self.message;>
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

}

+Void {

	Error {
		Error('Unknown error')
	}

}
