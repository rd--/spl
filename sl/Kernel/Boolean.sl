Boolean : [Object, Json] {

	= { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	& { :self :aProcedure:/0 |
		<primitive: return _self && _aProcedure_0();>
	}

	| { :self :aProcedure:/0 |
		<primitive: return _self || _aProcedure_0();>
	}

	&& { :self :anObject |
		self & { anObject.if { true } { false } }
	}

	|| { :self :anObject |
		self | { anObject.if { true } { false } }
	}

	==> { :self :aBlock:/0 |
		self.if {
			aBlock()
		} {
			true
		}
	}

	always { :self :aProcedure:/0 |
		aProcedure()
	}

	asBit { :self |
		self.if { 1 } { 0 }
	}

	asInteger { :self |
		self.asBit
	}

	asNumber { :self |
		self.asBit
	}

	if { :self :whenTrue:/0 :whenFalse:/0 |
		<primitive: return _self ? _whenTrue_0() : _whenFalse_0();>
	}

	ifFalse { :self :whenFalse:/0 |
		self.not.ifTrue(whenFalse:/0)
	}

	ifTrue { :self :whenTrue:/0 |
		self.if(
			whenTrue:/0
		) {
			nil
		}
	}

	not { :self |
		<primitive: return _self ? false : true;>
	}

	shallowCopy { :self |
		self
	}

	storeString { :self |
		self.if {
			'true'
		} {
			'false'
		}
	}

	xor { :self :aBoolean |
		aBoolean.value.if { self = false } { self = true }
	}

}
