Boolean! : [Object, Json] {

	= { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	& { :self :aBlock:/0 |
		<primitive: return _self && _aBlock_0();>
	}

	| { :self :aBlock:/0 |
		<primitive: return _self || _aBlock_0();>
	}

	&& { :self :anObject |
		self & {
			anObject.assertIsBoolean
		}
	}

	|| { :self :anObject |
		self | {
			anObject.assertIsBoolean
		}
	}

	==> { :self :aBlock:/0 |
		self.if {
			aBlock()
		} {
			true
		}
	}

	always { :self :aBlock:/0 |
		aBlock()
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

	assertIsBoolean { :self |
		self
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

+@Object {

	assertIsBoolean { :self |
		self.error('assertIsBoolean')
	}

}
