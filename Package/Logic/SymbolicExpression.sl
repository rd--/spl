+@Number {

	isNumericConstant { :self :operand |
		self = operand
	}

}

+@Collection {

	isNumericConstant { :unused :unusedOperand |
		false
	}

}

@SymbolicObject {

	[equal, =] { :self :anObject |
		'equal'.symbolicPrimitive([self, anObject])
	}

	[similar, ~] { :self :anObject |
		'similar'.symbolicPrimitive([self, anObject])
	}

}

@SymbolicBoolean {

	& { :self :aBlock/0 |
		'and'.symbolicPrimitive([self, aBlock()])
	}

	| { :self :aBlock/0 |
		'or'.symbolicPrimitive([self, aBlock()])
	}

	if { :self :whenTrue/0 :whenFalse/0 |
		'if'.symbolicPrimitive([self, whenTrue(), whenFalse()])
	}

	not { :self |
		'not'.symbolicPrimitive([self])
	}

}

@SymbolicCompare {

	[less, <] { :self :operand |
		'less'.symbolicPrimitive([self, operand])
	}

	[lessEqual, <=] { :self :operand |
		'lessEqual'.symbolicPrimitive([self, operand])
	}

	[greater, >] { :self :operand |
		'greater'.symbolicPrimitive([self, operand])
	}

	[greaterEqual, >=] { :self :operand |
		'greaterEqual'.symbolicPrimitive([self, operand])
	}

	max { :self :operand |
		'max'.symbolicPrimitive([self, operand])
	}

	min { :self :operand |
		'min'.symbolicPrimitive([self, operand])
	}

}

@SymbolicNumber {

	[conjugate, +] { :self |
		'conjugate'.symbolicPrimitive([self])
	}

	[divide, /] { :self :operand |
		operand.isNumericConstant(1).if {
			self
		} {
			'divide'.symbolicPrimitive([self, operand])
		}
	}

	[exp, ^] { :self |
		'exp'.symbolicPrimitive([self])
	}

	[mod, %] { :self :operand |
		'mod'.symbolicPrimitive([self, operand])
	}

	[plus, +] { :self :operand |
		operand.isNumericConstant(0).if {
			self
		} {
			'plus'.symbolicPrimitive([self, operand])
		}
	}

	[power, ^] { :self :operand |
		'power'.symbolicPrimitive([self, operand])
	}

	[quotient, //] { :self :operand |
		'quotient'.symbolicPrimitive([self, operand])
	}

	[remainder, \\] { :self :operand |
		'remainder'.symbolicPrimitive([self, operand])
	}

	[subtract, -] { :self :operand |
		operand.isNumericConstant(0).if {
			self
		} {
			'subtract'.symbolicPrimitive([self, operand])
		}
	}

	[times, *] { :self :operand |
		operand.isNumericConstant(1).if {
			self
		} {
			'times'.symbolicPrimitive([self, operand])
		}
	}

	[absoluteValue, abs] { :self |
		'abs'.symbolicPrimitive([self])
	}

	adaptToNumberAndApply { :self :receiver :aBlock/2 |
		SymbolicExpression(
			aBlock/2.unqualifiedName,
			[receiver, self]
		).simplifyConstantMath
	}

	cos { :self |
		'cos'.symbolicPrimitive([self])
	}

	cot { :self |
		'cot'.symbolicPrimitive([self])
	}

	[csc, cosecant] { :self |
		'csc'.symbolicPrimitive([self])
	}

	gamma { :self |
		'gamma'.symbolicPrimitive([self])
	}

	isInteger { :unused |
		false
	}

	isNumericConstant { :unused :unusedOperand |
		false
	}

	log { :self |
		'log'.symbolicPrimitive([self])
	}

	log2 { :self |
		'log'.symbolicPrimitive([self, 2])
	}

	log10 { :self |
		'log'.symbolicPrimitive([self, 10])
	}

	one { :unused |
		1
	}

	[sec, secant] { :self |
		'sec'.symbolicPrimitive([self])
	}

	sech { :self |
		'sech'.symbolicPrimitive([self])
	}

	sin { :self |
		'sin'.symbolicPrimitive([self])
	}

	[sqrt, squareRoot] { :self |
		'sqrt'.symbolicPrimitive([self])
	}

	tan { :self |
		'tan'.symbolicPrimitive([self])
	}

	truncate { :self |
		'truncate'.symbolicPrimitive([self])
	}

}

Symbol : [Object, Store, Number, Integer, SymbolicObject, SymbolicBoolean, SymbolicCompare, SymbolicNumber] { | name |

	isEqualSymbolicExpression { :self :anObject |
		self == anObject
	}

	operatorName { :self |
		let name = self.name;
		name.splOperatorSymbolToken.ifNil {
			name
		}
	}

	printString { :self |
		self.operatorName
	}

}

+System {

	symbolDictionary { :self |
		self.cached('symbolDictionary') {
			Record()
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

SymbolicExpression : [Object, Store, Number, SymbolicObject, SymbolicBoolean, SymbolicCompare, SymbolicNumber, Iterable] { | operator operands |

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

	commonSubexpressions { :self :aBlock/2 |
		let all = UnsortedSet();
		let common = UnsortedSet();
		all.comparator := aBlock/2;
		common.comparator := aBlock/2;
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

	do { :self :aBlock/1 |
		aBlock(self);
		self.operator.isSymbolicExpression.if {
			self.operator.do(aBlock/1)
		} {
			aBlock(self.operator)
		};
		self.operands.do { :each |
			each.isSymbolicExpression.if {
				each.do(aBlock/1)
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
		let operator = self.operator;
		let lhs = operator.isSymbol.if {
			operator.operatorName
		} {
			operator.printString
		};
		self.operands.isEmpty.if {
			'(%)'.format([lhs])
		} {
			'(% %)'.format(
				[
					lhs,
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

	simplifyConstantMath { :self |
		(self.operands.size = 2).if {
			let [p, q] = self.operands;
			let simplify = { :k |
				p.isNumericConstant(k).if {
					q
				} {
					q.isNumericConstant(k).if {
						p
					} {
						self
					}
				}
			};
			self.operator.name.caseOf(
				[
					'plus' -> { simplify(0) },
					'times' -> { simplify(1) }
				]
			) {
				self
			}
		} {
			self
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
		operands.anySatisfy(isList/1).if {
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
			self.apply(parameterNames.collect(Symbol/1))
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
		self.caseOf(
			[
				1.pi -> { Symbol('π') },
				2.pi -> { 2 * Symbol('π') }
			]
		) {
			self
		}
	}

}
