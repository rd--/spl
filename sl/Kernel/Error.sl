Error : [Object] {

	description { :self |
		self.name ++ ': ' ++ self.messageText
	}

	log { :self |
		system.transcript.addError(self.messageText)
	}

	messageText { :self |
		<primitive: return _self.message;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	shallowCopy { :self |
		self.error('copy: cannot copy')
	}

	signal { :self |
		<primitive: throw(_self);>
	}

	storeString { :self |
		'Error(\'' ++ self.messageText ++ '\')'
	}

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
		| err = Error(self); |
		err.log;
		err.signal
	}

}

+Void {

	Error {
		Error('Unknown error')
	}

}
