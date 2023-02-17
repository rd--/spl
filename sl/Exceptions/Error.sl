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
		(self.typeOf ++ '>>errorEmptyCollection: ' ++ self).error
	}

	errorNotFound { :self :anObject |
		(self.typeOf ++ '>>errorNotFound: ' ++ self).error
	}

}

+ @SequenceableCollection {

	errorSubscriptBounds { :self :index |
		(self.typeOf ++ '>>errorSubscriptBounds: ' ++ index).error
	}

}

+ @Object {

	shouldNotImplement { :self |
		(self.typeOf ++ '>>shouldNotImplement: ' ++ self).error
	}

	subclassResponsibility { :self |
		(self.typeOf ++ '>>subclassResponsibility: ' ++ self).error
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
