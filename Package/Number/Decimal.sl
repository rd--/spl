Decimal : [Object] { | fraction scale |

	* { :self :operand |
		operand.isDecimal.if {
			UnsimplifiedDecimal(
				self.fraction * operand.fraction,
				self.scale + operand.scale
			)
		} {
			operand.adaptToDecimalAndApply(self, *)
		}
	}

	+ { :self :operand |
		operand.isDecimal.if {
			UnsimplifiedDecimal(
				self.fraction + operand.fraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, +)
		}
	}

	- { :self :operand |
		operand.isDecimal.if {
			UnsimplifiedDecimal(
				self.fraction - operand.fraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, -)
		}
	}

	/ { :self :operand |
		operand.isZero.if {
			self.error('Decimal>>/: zero divide')
		} {
			operand.isDecimal.if {
				UnsimplifiedDecimal(
					self.fraction / operand.fraction,
					self.scale.max(operand.scale)
				)
			} {
				operand.adaptToDecimalAndApply(self, /)
			}
		}
	}

	< { :self :operand |
		operand.isDecimal.if {
			self.fraction < operand.fraction
		} {
			operand.adaptToDecimalAndApply(self, <)
		}
	}

	<= { :self :operand |
		operand.isDecimal.if {
			self.fraction <= operand.fraction
		} {
			operand.adaptToDecimalAndApply(self, <=)
		}
	}

	= { :self :operand |
		operand.isDecimal.if {
			(self.scale = operand.scale) & {
				let m = 10 ^ self.scale;
				(self.asFloat * m).round = (operand.asFloat * m).round
			}
		} {
			false
		}
	}

	~ { :self :operand |
		self = operand | {
			operand.isNumber.if {
				self.asFloat ~ operand.asFloat
			} {
				false
			}
		}
	}

	> { :self :operand |
		operand.isDecimal.if {
			self.fraction > operand.fraction
		} {
			operand.adaptToDecimalAndApply(self, >)
		}
	}

	>= { :self :operand |
		operand.isDecimal.if {
			self.fraction >= operand.fraction
		} {
			operand.adaptToDecimalAndApply(self, >=)
		}
	}

	^ { :self :aNumber |
		aNumber.isInteger.if {
			self.raisedToInteger(aNumber)
		} {
			self.error('^: not implemented for non-integer exponents')
		}
	}

	abs { :self |
		UnsimplifiedDecimal(self.fraction.abs, self.scale)
	}

	adaptToFractionAndApply { :self :receiver :aBlock:/2 |
		aBlock(receiver.asDecimal(self.scale), self)
	}

	adaptToIntegerAndApply { :self :receiver :aBlock:/2 |
		aBlock(receiver.asDecimal(0), self)
	}

	adaptToNumberAndApply { :self :receiver :aBlock:/2 |
		receiver.isInteger.if {
			aBlock(receiver.asDecimal(0), self)
		} {
			self.error('Decimal>>adaptToNumberAndApply: not integer')
		}
	}

	asDecimal { :self :scale |
		self.fraction.asDecimal(scale)
	}

	asFloat { :self |
		self.fraction.asFloat
	}

	asFraction { :self |
		self.fraction
	}

	asInteger { :self |
		self.fraction.asInteger
	}

	asSmallInteger { :self |
		self.fraction.asSmallInteger
	}

	asLargeInteger { :self |
		self.fraction.asLargeInteger
	}

	denominator { :self |
		self.fraction.denominator
	}

	fractionalPart { :self |
		UnsimplifiedDecimal(
			self.fraction.fractionalPart,
			self.scale
		)
	}

	integerPart { :self |
		UnsimplifiedDecimal(
			self.fraction.integerPart.asFraction,
			self.scale
		)
	}

	isExact { :unused |
		true
	}

	isInteger { :self |
		self.fraction.isInteger
	}

	isNegative { :self |
		self.fraction.isNegative
	}

	isNumber { :unused |
		true
	}

	isPowerOfTwo { :self |
		self.fraction.isPowerOfTwo
	}

	isZero { :self |
		self.fraction.numerator = 0
	}

	negate { :self |
		UnsimplifiedDecimal(self.fraction.negate, self.scale)
	}

	numerator { :self |
		self.fraction.numerator
	}

	printString { :self |
		(self.scale = 0).if {
			self.integerPart.asLargeInteger.basicPrintString(10) ++ 'D'
		} {
			'%%.%D'.format(
				[
					self.fraction.isNegative.if { '-' } { '' },
					self.integerPart.asLargeInteger.abs.basicPrintString(10),
					(self.fractionalPart.fraction.abs * (10 ^ self.scale)).round.basicPrintString(10)
				]
			)
		}

	}

	raisedToInteger { :self :aNumber |
		UnsimplifiedDecimal(
			self.fraction.raisedToInteger(aNumber),
			self.scale
		)
	}

	reciprocal { :self |
		self.isZero.if {
			self.error('Decimal>>reciprocal: zero divide')
		} {
			UnsimplifiedDecimal(
				self.fraction.reciprocal,
				self.scale
			)
		}
	}

	square { :self |
		UnsimplifiedDecimal(
			self.fraction.square,
			self.scale
		)
	}

	storeString { :self |
		'%.asDecimal(%)'.format(
			[self.fraction.storeString, self.scale]
		)

	}

	truncate { :self |
		self.fraction.truncate
	}

	zero { :self |
		UnsimplifiedDecimal(0/1, 0)
	}

}

+Fraction {

	adaptToDecimalAndApply { :self :receiver :aBlock:/2 |
		aBlock(receiver, self.asDecimal(receiver.scale))
	}

	asDecimal { :self :scale |
		UnsimplifiedDecimal(
			self.asDecimalFraction(scale),
			scale
		)
	}

	UnsimplifiedDecimal { :fraction :scale |
		newDecimal().initializeSlots(
			fraction,
			scale
		)
	}

}

+SmallFloat {

	adaptToDecimalAndApply { :self :receiver :aBlock:/2 |
		self.isInteger.if {
			aBlock(receiver, self.asDecimal(0))

		} {
			aBlock(receiver.asFloat, self)
		}
	}

	asDecimal { :self :scale |
		self.isInteger.if {
			UnsimplifiedDecimal(Fraction(self, 1), scale)
		} {
			self.asDecimalFraction(scale).asDecimal(scale)
		}
	}

	asDecimal { :self |
		self.asDecimal(0)
	}

}

+LargeInteger {

	asDecimal { :self :scale |
		UnsimplifiedDecimal(Fraction(self, 1L), scale)
	}

	asDecimal { :self |
		self.asDecimal(0)
	}

}

+String {

	basicParseDecimal { :self :elseClause:/0 |
		let parts = self.splitBy('.');
		parts.size.caseOf([
			1 -> {
				UnsimplifiedDecimal(
					parts[1].parseLargeInteger(elseClause:/0).asFraction,
					0
				)
			},
			2 -> {
				let sign = self.beginsWith('-').if { -1 } { 1 };
				let i = parts[1].parseLargeInteger(elseClause:/0);
				let f = sign.copySignTo(parts[2].parseLargeInteger(elseClause:/0));
				let k = parts[2].size;
				UnsimplifiedDecimal(
					i + Fraction(f, 10 ^ k),
					k
				)
			}
		]) {
			elseClause()
		}
	}

	parseDecimal { :self :elseClause:/0 |
		self.endsWith('D').if {
			self.allButLast.basicParseDecimal(elseClause:/0)
		} {
			elseClause()
		}
	}

	parseDecimal { :self |
		self.endsWith('D').if {
			self.allButLast.basicParseDecimal {
				self.error('String>>parseDecimal: no D suffix')
			}
		} {
			self.error('String>>parseDecimal')
		}
	}

}

