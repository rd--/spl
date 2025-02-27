@SymbolicObject {

	= { :self :anObject |
		'='.symbolicPrimitive([self, anObject])
	}

	~ { :self :anObject |
		'~'.symbolicPrimitive([self, anObject])
	}

}

@SymbolicBoolean {

	& { :self :aBlock:/0 |
		'and'.symbolicPrimitive([self, aBlock()])
	}

	| { :self :aBlock:/0 |
		'or'.symbolicPrimitive([self, aBlock()])
	}

	if { :self :whenTrue:/0 :whenFalse:/0 |
		'if'.symbolicPrimitive([self, whenTrue(), whenFalse()])
	}

	not { :self |
		'not'.symbolicPrimitive([self])
	}

}

@SymbolicMagnitude {

	< { :self :aMagnitude |
		'<'.symbolicPrimitive([self, aMagnitude])
	}

	<= { :self :aMagnitude |
		'<='.symbolicPrimitive([self, aMagnitude])
	}

	> { :self :aMagnitude |
		'>'.symbolicPrimitive([self, aMagnitude])
	}

	>= { :self :aMagnitude |
		'>='.symbolicPrimitive([self, aMagnitude])
	}

}

@SymbolicNumber {

	+ { :self :operand |
		'+'.symbolicPrimitive([self, operand])
	}

	- { :self :operand |
		'-'.symbolicPrimitive([self, operand])
	}

	* { :self :operand |
		'*'.symbolicPrimitive([self, operand])
	}

	/ { :self :operand |
		'/'.symbolicPrimitive([self, operand])
	}

	^ { :self :operand |
		'^'.symbolicPrimitive([self, operand])
	}

	abs { :self |
		'abs'.symbolicPrimitive([self])
	}

	adaptToNumberAndApply { :self :receiver :aBlock:/2 |
		let name = aBlock:/2.unqualifiedName;
		SymbolicExpression(
			name.operatorNameToken ? name,
			[receiver, self]
		)
	}

	cos { :self |
		'cos'.symbolicPrimitive([self])
	}

	sin { :self |
		'sin'.symbolicPrimitive([self])
	}

	sqrt { :self |
		'sqrt'.symbolicPrimitive([self])
	}

	tan { :self |
		'tan'.symbolicPrimitive([self])
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

	symbolicBinaryPrimitive { :self |
		{ :i :j |
			self.symbolicPrimitive([i, j])
		}
	}

	symbolicPrimitive { :self :operands |
		operands.anySatisfy(isList:/1).if {
			operands.multiChannelExpand.collect { :each |
				SymbolicExpression(self, each)
			}
		} {
			SymbolicExpression(self, operands)
		}
	}

	symbolicUnaryPrimitive { :self |
		{ :i |
			self.symbolicPrimitive([i])
		}
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
			{ 1.pi } -> { Symbol('π') },
			{ 2.pi } -> { 2 * Symbol('π') }
		]) {
			self
		}
	}

}
