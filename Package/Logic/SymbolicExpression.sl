@SymbolicObject {

	= { :self :anObject |
		SymbolicExpression('=', [self, anObject])
	}

	~ { :self :anObject |
		SymbolicExpression('~', [self, anObject])
	}

}

@SymbolicBoolean {

	& { :self :aBlock:/0 |
		SymbolicExpression('and', [self, aBlock()])
	}

	| { :self :aBlock:/0 |
		SymbolicExpression('or', [self, aBlock()])
	}

	if { :self :whenTrue:/0 :whenFalse:/0 |
		SymbolicExpression('if', [self, whenTrue(), whenFalse()])
	}

	not { :self |
		SymbolicExpression('not', [self])
	}

}

@SymbolicMagnitude {

	< { :self :aMagnitude |
		SymbolicExpression('<', [self, aMagnitude])
	}

	<= { :self :aMagnitude |
		SymbolicExpression('<=', [self, aMagnitude])
	}

	> { :self :aMagnitude |
		SymbolicExpression('>', [self, aMagnitude])
	}

	>= { :self :aMagnitude |
		SymbolicExpression('>=', [self, aMagnitude])
	}

}

@SymbolicNumber {

	+ { :self :operand |
		SymbolicExpression('+', [self, operand])
	}

	- { :self :operand |
		SymbolicExpression('-', [self, operand])
	}

	* { :self :operand |
		SymbolicExpression('*', [self, operand])
	}

	/ { :self :operand |
		SymbolicExpression('/', [self, operand])
	}

	^ { :self :operand |
		SymbolicExpression('^', [self, operand])
	}

	abs { :self |
		SymbolicExpression('abs', [self])
	}

	adaptToNumberAndApply { :self :receiver :aBlock:/2 |
		let name = aBlock:/2.unqualifiedName;
		SymbolicExpression(
			name.operatorNameToken ? name,
			[receiver, self]
		)
	}

	cos { :self |
		SymbolicExpression('cos', [self])
	}

	sin { :self |
		SymbolicExpression('sin', [self])
	}

	sqrt { :self |
		SymbolicExpression('sqrt', [self])
	}

	tan { :self |
		SymbolicExpression('tan', [self])
	}

}

Symbol : [Object, Number, SymbolicObject, SymbolicBoolean, SymbolicMagnitude, SymbolicNumber] { | name |

	isEqualSymbolicExpression { :self :anObject |
		self == anObject
	}

	printString { :self |
		self.name
	}

}

+String {

	Symbol { :self |
		system.cache.atIfAbsentPut('symbolDictionary') {
			()
		}.atIfAbsentPut(self) {
			newSymbol().initializeSlots(self)
		}
	}

}

SymbolicExpression : [Object, Number, SymbolicObject, SymbolicBoolean, SymbolicMagnitude, SymbolicNumber] { | operator operands |

	asTree { :self |
		Tree(
			self.operator,
			self.operands.collect { :each |
				each.isSymbolicExpression.if {
					each.asTree
				} {
					Tree(each, [])
				}
			}
		)
	}

	isEqualSymbolicExpression { :self :anObject |
		self.hasEqualSlotsBy(anObject, isEqualSymbolicExpression:/2)
	}

	printString { :self |
		self.operands.isEmpty.if {
			'(%)'.format([self.operator.printString])
		} {
			'(% %)'.format(
				[
					self.operator.printString,
					self.operands.collect { :each |
						each.isSmallFloat.if {
							each.recogniseSymbolicExpression
						} {
							each
						}.printString
					}.join(' ')
				]
			)
		}
	}

}

+[SymbolicExpression, Symbol] {

	SymbolicExpression { :self :aList |
		newSymbolicExpression().initializeSlots(self, aList)
	}

}

+String {

	SymbolicExpression { :self :aList |
		SymbolicExpression(self.Symbol, aList)
	}

}

+Block {

	asSymbolicExpression { :self :parameterNames |
		(self.numArgs = parameterNames.size).if {
			self.apply(parameterNames.collect(Symbol:/1))
		} {
			self.error('asSymbolicExpression: arity error')
		}
	}

	asSymbolicExpression { :self |
		self.asSymbolicExpression(
			'greek'.alphabet.take(self.numArgs)
		)
	}

}

+@Object {

	isEqualSymbolicExpression { :self :anObject |
		anObject.isSymbolicExpression.if {
			false
		} {
			self = anObject
		}
	}

}

+SmallFloat {

	recogniseSymbolicExpression { :self |
		self.caseOfOtherwise([
			1.pi -> { Symbol('π') },
			2.pi -> { 2 * Symbol('π') }
		]) {
			self
		}
	}

}
