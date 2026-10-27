Boolean! : [Object, Copy, Store, Equal, Compare, Json] {

	==> { :self :aBlock/0 |
		self.if {
			aBlock()
		} {
			true
		}
	}

	Boolean { :self |
		self
	}

	always { :self :aBlock/0 |
		aBlock()
	}

	[and, &] { :self :aBlock/0 |
		<primitive: return _self && _aBlock_0();>
	}

	assertIsBoolean { :self |
		self
	}

	boole { :self |
		self.if { 1 } { 0 }
	}

	compare { :self :operand |
		compareOn(self, operand, boole/1)
	}

	concisePrintString { :self |
		self.printString
	}

	[encodeJson, booleanToJson] { :self |
		self.uncheckedEncodeJson
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

	if { :self :whenTrue/0 :whenFalse/0 |
		<primitive: return _self ? _whenTrue_0() : _whenFalse_0();>
	}

	ifFalse { :self :whenFalse/0 |
		self.if {
			nil
		} {
			whenFalse()
		}
	}

	ifFalseIfTrue { :self :whenFalse/0 :whenTrue/0 |
		self.if(whenTrue/0, whenFalse/0)
	}

	ifTrue { :self :whenTrue/0 |
		self.if {
			whenTrue()
		} {
			nil
		}
	}

	implies { :p :q/0 |
		p.not | { q() }
	}

	isEqualBy { :self :anObject :aBlock/2 |
		self == anObject
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

	[notAnd, nand] { :self :aBlock/0 |
		/* (self & { aBlock() } ).not */
		self.not | {
			aBlock().not
		}
	}

	[notOr, nor] { :self :aBlock/0 |
		self.not & {
			aBlock().not
		}
	}

	[or, |] { :self :aBlock/0 |
		<primitive: return _self || _aBlock_0();>
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
		aBoolean.if { self = false } { self = true }
	}

}

+@Object {

	assertIsBoolean { :self |
		self.error('assertIsBoolean')
	}

}

+@Integer {

	Boolean { :self |
		(self = 0).if {
			false
		} {
			(self = 1).if {
				true
			} {
				self.error('Boolean: not 0 or 1')
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

	[evaluatingAnd, &&] { :self :aBoole |
		self.assertIsBoole.bitAnd(aBoole.assertIsBoole)
	}

	[evaluatingOr, ||] { :self :aBoole |
		self.assertIsBoole.bitOr(aBoole.assertIsBoole)
	}

}

+String {

	isBooleanString { :self |
		self = 'true' | {
			self = 'false'
		}
	}

	parseBoolean { :self :elseClause/0 |
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
		self.allSatisfy(isBoolean/1)
	}

}
