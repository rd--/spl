Decimal : [Object] { | fraction scale |

	* { :self :operand |
		operand.isDecimal.if {
			Decimal(
				self.fraction * operand.fraction,
				self.scale + operand.scale
			)
		} {
			operand.adaptToDecimalAndApply(self, *)
		}
	}

	+ { :self :operand |
		operand.isDecimal.if {
			Decimal(
				self.fraction + operand.fraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, +)
		}
	}

	- { :self :operand |
		operand.isDecimal.if {
			Decimal(
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
				Decimal(
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
			operand.adaptToDecimalAndApply(self, =)
		}
	}

	= { :self :operand |
		operand.isNumber.if {
			operand.isDecimal.if {
				self.fraction = operand.fraction
			} {
				operand.adaptToDecimalAndApply(self, =)
			}
		} {
			false
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

	adaptToFractionAndApply { :self :receiver :aBlock:/2 |
		aBlock(receiver.asDecimal(self.scale), self)
	}

	adaptToIntegerAndApply { :self :receiver :aBlock:/2 |
		aBlock(receiver.asDecimal(0), self)
	}

	asFloat { :self |
		self.fraction.asFloat
	}

	asFraction { :self |
		self.fraction
	}

	asDecimal { :self :scale |
		Decimal(self.fraction, self.scale)
	}

	denominator { :self |
		self.fraction.denominator
	}

	fractionPart { :self |
		Decimal(self.fraction.fractionPart, self.scale)
	}

	integerPart { :self |
		Decimal(self.fraction.integerPart, self.scale)
	}

	isPowerOfTwo { :self |
		self.fraction.isPowerOfTwo
	}

	isZero { :self |
		self.fraction.numerator = 0
	}

	negated { :self |
		Decimal(self.fraction.negated, self.scale)
	}

	isNegative { :self |
		self.fraction.isNegative
	}

	isNumber { :self |
		true
	}

	numerator { :self |
		self.fraction.numerator
	}

	printString { :self |
		self.fraction.printStringShowingDecimalPlaces(self.scale) ++ 'D'
	}

	raisedToInteger { :self :aNumber |
		Decimal(self.fraction.raisedToInteger(aNumber), self.scale)
	}

	reciprocal { :self |
		self.isZero.if {
			self.error('Decimal>>reciprocal: zero divide')
		} {
			Decimal(self.fraction.reciprocal, self.scale)
		}
	}

	squared { :self |
		Decimal(self.fraction.squared, self.scale)
	}

	storeString { :self |
		'Decimal(' ++ self.fraction ++ ', ' ++ self.scale ++ ')'
	}

	truncated { :self |
		self.fraction.truncated
	}

	zero { :self |
		Decimal(0, 0)
	}

}

+Fraction {

	Decimal { :fraction :scale |
		newDecimal().initializeSlots(fraction, scale)
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
			Decimal(Fraction(self, 1), scale)
		} {
			self.error('SmallFloat>>asDecimal')
		}
	}

	asDecimal { :self |
		self.isInteger.if {
			self.asDecimal(0)
		} {
			self.error('SmallFloat>>asDecimal')
		}
	}

}

+Fraction {

	adaptToDecimalAndApply { :self :receiver :aBlock:/2 |
		aBlock(receiver, self.asDecimal(receiver.scale))
	}

	asDecimal { :self :scale |
		Decimal(self, scale)
	}

}

+String {

	parseDecimal { :self |
		let p = self.splitBy('.');
		p.size.caseOfOtherwise([
			{ 1 } -> {
				Decimal(p.first.parseInteger(10).asFraction, 0)
			},
			{ 2 } -> {
				let i = p.first.parseInteger(10);
				let f = i.copySignTo(p.second.parseInteger(10));
				let k = p.second.size;
				Decimal(i + Fraction(f, 10 ^ k), k)
			}
		]) {
			self.error('String>>asDecimal')
		}
	}

}

