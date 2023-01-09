Error : [Object] {
	message { :self | <primitive: return _self.message;> }
	name { :self | <primitive: return _self.name;> }
}

+ @Object {
	errorEmptyCollection { :self | error('errorEmptyCollection: ' ++ self) }
	errorNotFound { :self :anObject | error('errorNotFound: ' ++ self) }
	errorSubscriptBounds { :self :index | error('errorSubscriptBounds: ' ++ index) }
	shouldNotImplement { :self | error('shouldNotImplement: ' ++ self) }
	subclassResponsibility { :self | error('subclassResponsibility: ' ++ self) }
}

+ String {
	Error { :self | <primitive: return Error(_self);> }
	error { :self | <primitive: console.error("error: " + _self); throw(Error(_self));> }
}

+ Void {
	Error { Error('Unknown error') }
}
