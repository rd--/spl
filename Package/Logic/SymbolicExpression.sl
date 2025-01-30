@SymbolicBoolean {

	if { :self :whenTrue:/1 :whenFalse |
		SymbolicExpression('if', [self, whenTrue.value, whenFalse.value])
	}

	not { :self |
		SymbolicExpression('not', [self])
	}

}

@SymbolicNumber {

	adaptToNumberAndApply { :self :receiver :aBlock:/2 |
		let name = aBlock:/2.unqualifiedName;
		SymbolicExpression(
			name.operatorNameToken ? name,
			[receiver, self]
		)
	}

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

	sqrt { :self |
		SymbolicExpression('sqrt', [self])
	}

}

Symbol : [Object, Number, SymbolicNumber] { | name |

	~ { :self :aSymbol |
		self = aSymbol
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

SymbolicExpression : [Object, Number, SymbolicNumber] { | operator operands |

	~ { :self :aSymbolicExpression |
		self = aSymbolicExpression
	}

	printString { :self |
		'(% %)'.format(
			[
				self.operator,
				self.operands.collect(printString:/1).join(' ')
			]
		)
	}

}

+String {

	SymbolicExpression { :self :aList |
		newSymbolicExpression().initializeSlots(self, aList)
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
