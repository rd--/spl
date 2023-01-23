Error : [Object] {

	log { :self |
		<primitive: console.error(_self.message);>
		nil
	}

	message { :self |
		<primitive: return _self.message;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	signal { :self |
		<primitive: throw(_self);>
	}

}

+ @Collection {

	errorEmptyCollection { :self |
		error('errorEmptyCollection: ' ++ self)
	}

	errorNotFound { :self :anObject |
		error('errorNotFound: ' ++ self)
	}

}

+ @SequenceableCollection {

	errorSubscriptBounds { :self :index |
		error('errorSubscriptBounds: ' ++ index)
	}

}

+ @Object {

	shouldNotImplement { :self |
		error('shouldNotImplement: ' ++ self)
	}

	subclassResponsibility { :self |
		error('subclassResponsibility: ' ++ self)
	}

}

+ String {

	Error { :self |
		<primitive: return Error(_self);>
	}

	error { :self |
		| err = Error(self); |
		err.log;
		err.signal
	}

}

+ Void {

	Error {
		Error('Unknown error')
	}

}
