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

	% { :self :operand |
		'%'.symbolicPrimitive([self, operand])
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
			name.operatorNameToken ? { name },
			[receiver, self]
		)
	}

	cos { :self |
		'cos'.symbolicPrimitive([self])
	}

	cosecant { :self |
		'cosecant'.symbolicPrimitive([self])
	}

	cotangent { :self |
		'cotangent'.symbolicPrimitive([self])
	}

	exp { :self |
		'exp'.symbolicPrimitive([self])
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

	truncated { :self |
		'truncated'.symbolicPrimitive([self])
	}

}

Symbol : [Object, Number, Integer, SymbolicObject, SymbolicBoolean, SymbolicMagnitude, SymbolicNumber] { | name |

	isEqualSymbolicExpression { :self :anObject |
		self == anObject
	}

	printString { :self |
		self.name
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+System {

	symbolDictionary { :self |
		self.cached('symbolDictionary') {
			()
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

SymbolicExpression : [Object, Number, SymbolicObject, SymbolicBoolean, SymbolicMagnitude, SymbolicNumber, Iterable] { | operator operands |

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
		let all = Set(aBlock:/2);
		let common = Set(aBlock:/2);
		self.do { :each |
			each.isSymbolicExpression.ifTrue {
				all.includes(each).if {
					common.basicInclude(each)
				} {
					all.basicInclude(each)
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
					(1 .. m).allSatisfy { :i |
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

	storeString { :self |
		self.storeStringAsInitializeSlots
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

+[SmallFloat] {

	isEqualSymbolicExpression { :self :anObject |
		self == anObject
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
