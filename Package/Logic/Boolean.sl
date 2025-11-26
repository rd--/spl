Boolean! : [Object, Storeable, Equatable, Json] {

	==> { :self :aBlock:/0 |
		self.if {
			aBlock()
		} {
			true
		}
	}

	[and, &] { :self :aBlock:/0 |
		<primitive: return _self && _aBlock_0();>
	}

	[evaluatingAnd, &&] { :self :anObject |
		self & {
			anObject.assertIsBoolean
		}
	}

	[evaluatingOr, ||] { :self :anObject |
		self | {
			anObject.assertIsBoolean
		}
	}

	[or, |] { :self :aBlock:/0 |
		<primitive: return _self || _aBlock_0();>
	}

	always { :self :aBlock:/0 |
		aBlock()
	}

	asBit { :self |
		self.if { 1 } { 0 }
	}

	asBoolean { :self |
		self
	}

	assertIsBoolean { :self |
		self
	}

	boole { :self |
		self.asBit
	}

	copy { :self |
		self
	}

	concisePrintString { :self |
		self.printString
	}

	equalBy { :self :anObject :aBlock:/2 |
		self == anObject
	}

	if { :self :whenTrue:/0 :whenFalse:/0 |
		<primitive: return _self ? _whenTrue_0() : _whenFalse_0();>
	}

	ifFalse { :self :whenFalse:/0 |
		self.if {
			nil
		} {
			whenFalse()
		}
	}

	ifFalseIfTrue { :self :whenFalse:/0 :whenTrue:/0 |
		self.if(whenTrue:/0, whenFalse:/0)
	}

	ifTrue { :self :whenTrue:/0 |
		self.if {
			whenTrue()
		} {
			nil
		}
	}

	isImmediate { :unused |
		true
	}

	isLiteral { :self |
		true
	}

	not { :self |
		<primitive: return _self ? false : true;>
	}

	notAnd { :self :anObject |
		(self & { anObject }).not
	}

	notOr { :self :anObject |
		self.or(anObject).not
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

+@Integer {

	&& { :self :aBoole |
		self.assertIsBoole.bitAnd(aBoole.assertIsBoole)
	}

	|| { :self :aBoole |
		self.assertIsBoole.bitOr(aBoole.assertIsBoole)
	}

	asBoolean { :self |
		(self = 0).if {
			false
		} {
			(self = 1).if {
				true
			} {
				self.error('asBoolean: not 0 or 1')
			}
		}
	}

	assertIsBoole { :self |
		(self = 0 | { self = 1 }).if {
			self
		} {
			self.error('assertIsBoole: not 0 or 1')
		}
	}

}

+String {

	isBooleanString { :self |
		self = 'true' | {
			self = 'false'
		}
	}

	parseBoolean { :self :elseClause:/0 |
		(self = 'true').if {
			true
		} {
			(self = 'false').if {
				false
			} {
				elseClause()
			}
		}
	}

	parseBoolean { :self |
		self.parseBoolean {
			self.error('parseBoolean')
		}
	}

}

+List {

	isBooleanVector { :self |
		self.allSatisfy(isBoolean:/1)
	}

}
