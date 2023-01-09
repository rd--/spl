Boolean : [Object] {

	= { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	& { :self :aProcedure |
		<primitive: return _self && _aProcedure();>
	}

	| { :self :aProcedure |
		<primitive: return _self || _aProcedure();>
	}

	&& { :self :anObject |
		self & { anObject.value }
	}

	|| { :self :anObject |
		self | { anObject.value }
	}

	asBit { :self |
		self.if { 1 } { 0 }
	}

	asFloat { :self |
		self.if { 1 } { 0 }
	}

	asInteger { :self |
		self.if { 1 } { 0 }
	}

	if { :self :whenTrue :whenFalse |
		<primitive: return _self ? _whenTrue() : _whenFalse();>
	}

	ifFalse { :self :whenFalse |
		self.if({ nil }, whenFalse)
	}

	ifTrue { :self :whenTrue |
		self.if(whenTrue, { nil })
	}

	not { :self |
		<primitive: return _self ? false : true;>
	}

	printString { :self |
		self.if { 'true' } { 'false' }
	}

}
