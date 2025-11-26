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

	max { :self :aMagnitude |
		'max'.symbolicPrimitive([self, aMagnitude])
	}

	min { :self :aMagnitude |
		'min'.symbolicPrimitive([self, aMagnitude])
	}

}

@SymbolicNumber {

	[divide, /] { :self :operand |
		'/'.symbolicPrimitive([self, operand])
	}

	[mod, %] { :self :operand |
		'%'.symbolicPrimitive([self, operand])
	}

	[plus, +] { :self :operand |
		'+'.symbolicPrimitive([self, operand])
	}

	[power, ^] { :self :operand |
		'^'.symbolicPrimitive([self, operand])
	}

	[quotient, //] { :self :operand |
		'quotient'.symbolicPrimitive([self, operand])
	}

	[remainder, \\] { :self :operand |
		'remainder'.symbolicPrimitive([self, operand])
	}

	[subtract, -] { :self :operand |
		'-'.symbolicPrimitive([self, operand])
	}

	[times, *] { :self :operand |
		'*'.symbolicPrimitive([self, operand])
	}

	abs { :self |
		'abs'.symbolicPrimitive([self])
	}

	adaptToNumberAndApply { :self :receiver :aBlock:/2 |
		let name = aBlock:/2.unqualifiedName;
		SymbolicExpression(
			name.splOperatorNameToken ? { name },
			[receiver, self]
		)
	}

	conjugate { :self |
		'conjugate'.symbolicPrimitive([self])
	}

	cos { :self |
		'cos'.symbolicPrimitive([self])
	}

	cot { :self |
		'cot'.symbolicPrimitive([self])
	}

	csc { :self |
		'csc'.symbolicPrimitive([self])
	}

	exp { :self |
		'exp'.symbolicPrimitive([self])
	}

	gamma { :self |
		'gamma'.symbolicPrimitive([self])
	}

	isInteger { :unused |
		false
	}

	log { :self |
		'log'.symbolicPrimitive([self])
	}

	log2 { :self |
		'log2'.symbolicPrimitive([self])
	}

	log10 { :self |
		'log10'.symbolicPrimitive([self])
	}

	one { :unused |
		1
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

	truncate { :self |
		'truncate'.symbolicPrimitive([self])
	}

}

Symbol : [Object, Storeable, Number, Integer, SymbolicObject, SymbolicBoolean, SymbolicMagnitude, SymbolicNumber] { | name |

	isEqualSymbolicExpression { :self :anObject |
		self == anObject
	}

	printString { :self |
		self.name
	}

}

+System {

	symbolDictionary { :self |
		self.cached('symbolDictionary') {
			(:)
		}
	}

}

+String {

	Symbol { :self |
		system.symbolDictionary.atIfAbsentPut(self) {
			newSymbol().initializeSlots(self)
		}
	}

}

SymbolicExpression : [Object, Storeable, Number, SymbolicObject, SymbolicBoolean, SymbolicMagnitude, SymbolicNumber, Iterable] { | operator operands |

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

	commonSubexpressions { :self :aBlock:/2 |
		let all = UnsortedSet();
		let common = UnsortedSet();
		all.comparator := aBlock:/2;
		common.comparator := aBlock:/2;
		self.do { :each |
			each.isSymbolicExpression.ifTrue {
				all.includes(each).if {
					common.uncheckedInclude(each)
				} {
					all.uncheckedInclude(each)
				}
			}
		};
		common.asList
	}

	do { :self :aBlock:/1 |
		aBlock(self);
		self.operator.isSymbolicExpression.if {
			self.operator.do(aBlock:/1)
		} {
			aBlock(self.operator)
		};
		self.operands.do { :each |
			each.isSymbolicExpression.if {
				each.do(aBlock:/1)
			} {
				aBlock(each)
			}
		}
	}

	isEqualSymbolicExpression { :self :anObject |
		anObject.isSymbolicExpression & {
			self.operator.isEqualSymbolicExpression(anObject.operator) & {
				let m = self.operands.size;
				let n = anObject.operands.size;
				m = n & {
					1.to(m).allSatisfy { :i |
						let p = self.operands[i];
						let q = anObject.operands[i];
						p.isEqualSymbolicExpression(q)
					}
				}
			}
		}
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
					}.unwords
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
			'greek'.namedAlphabet.take(self.numArgs)
		)
	}

}

+[SmallFloat] {

	isEqualSymbolicExpression { :self :anObject |
		self == anObject
	}

}

+SmallFloat {

	recogniseSymbolicExpression { :self |
		self.caseOf([
			1.pi -> { Symbol('π') },
			2.pi -> { 2 * Symbol('π') }
		]) {
			self
		}
	}

}
