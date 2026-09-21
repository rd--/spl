Decimal : [Object, Store, Equal, Compare, Number] { | fraction scale |

	[less, <] { :self :operand |
		operand.isDecimal.if {
			self.fraction < operand.fraction
		} {
			operand.adaptToDecimalAndApply(self, less/2)
		}
	}

	[divide, /] { :self :operand |
		operand.isZero.if {
			self.error('Decimal>>divide: zero')
		} {
			operand.isDecimal.if {
				Decimal(
					self.fraction / operand.fraction,
					self.scale.max(operand.scale)
				)
			} {
				operand.adaptToDecimalAndApply(self, divide/2)
			}
		}
	}

	[equal, =] { :self :operand |
		operand.isDecimal.if {
			equal(self.scale, operand.scale) & {
				let m = 10L ^ self.scale;
				equal(
					(self.asFloat * m).round,
					(operand.asFloat * m).round
				)
			}
		} {
			false
		}
	}

	[negate, -] { :self |
		UnsimplifiedDecimal(
			self.fraction.negate,
			self.scale
		)
	}

	[plus, +] { :self :operand |
		operand.isDecimal.if {
			UnsimplifiedDecimal(
				self.fraction + operand.fraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, plus/2)
		}
	}

	[power, ^] { :self :aNumber |
		aNumber.isInteger.if {
			self.raisedToInteger(aNumber)
		} {
			self.unimplementedCase('^')
		}
	}

	[reciprocal, /] { :self |
		self.isZero.if {
			self.error('Decimal>>reciprocal: zero divide')
		} {
			Decimal(
				self.fraction.reciprocal,
				self.scale.max(1)
			)
		}
	}

	[subtract, -] { :self :operand |
		operand.isDecimal.if {
			UnsimplifiedDecimal(
				self.fraction - operand.fraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, subtract/2)
		}
	}

	[times, *] { :self :operand |
		operand.isDecimal.if {
			UnsimplifiedDecimal(
				self.fraction * operand.fraction,
				self.scale + operand.scale /* self.scale.max(operand.scale) */
			)
		} {
			operand.adaptToDecimalAndApply(self, times/2)
		}
	}

	[absoluteValue, abs] { :self |
		UnsimplifiedDecimal(self.fraction.abs, self.scale)
	}

	adaptToFractionAndApply { :self :receiver :aBlock/2 |
		aBlock(receiver.asDecimal(self.scale), self)
	}

	adaptToIntegerAndApply { :self :receiver :aBlock/2 |
		aBlock(receiver.asDecimal(0), self)
	}

	adaptToNumberAndApply { :self :receiver :aBlock/2 |
		receiver.isInteger.if {
			aBlock(receiver.asDecimal(0), self)
		} {
			self.error('Decimal>>adaptToNumberAndApply: not integer')
		}
	}

	asDecimal { :self :scale |
		self.fraction.asDecimal(scale)
	}

	asFraction { :self |
		self.fraction
	}

	asInteger { :self |
		self.asLargeInteger.normal
	}

	asSmallInteger { :self |
		self.asLargeInteger.asSmallInteger
	}

	[asSmallFloat, asFloat] { :self |
		self.fraction.asSmallFloat
	}

	asLargeInteger { :self |
		/* 1.0D is not an integer... */
		self.isInteger.if {
			self.fraction.asLargeInteger
		} {
			self.error('Decimal>>asLargeInteger')
		}
	}

	denominator { :self |
		self.fraction.denominator
	}

	fractionalPart { :self |
		Decimal(
			self.fraction.fractionalPart,
			self.scale
		)
	}

	[integerDigits, decimalExpansion] { :self |
		let [d, n] = self.realDigits;
		(n < 0).if {
			List(n.abs, 0) ++ d
		} {
			d
		}
	}

	integerPart { :self |
		UnsimplifiedDecimal(
			self.fraction.integerPart.asFraction,
			self.scale
		)
	}

	isCloseToBy { :self :aNumber :epsilon |
		self.asFloat.isCloseToBy(aNumber.asFloat, epsilon)
	}

	isExact { :unused |
		true
	}

	isInteger { :self |
		self.scale.isZero
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

	numerator { :self |
		self.fraction.numerator
	}

	one { :self |
		1D
	}

	precision { :self |
		self.integerPart.asLargeInteger.integerLength(10) + self.scale
	}

	printString { :self |
		let scale = self.scale;
		let fraction = self.fraction;
		(scale = 0).if {
			self.integerPart.asLargeInteger.basicPrintString(10) ++ 'D'
		} {
			'%%.%D'.format(
				[
					self.isNegative.if {
						'-'
					} {
						''
					},
					fraction
					.integerPart
					.abs
					.basicPrintString(10),
					(fraction.fractionalPart.abs * (10L ^ scale))
					.round
					.basicPrintString(10)
					.padLeft([scale], '0')
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

	realDigits { :self :base :size |
		let l = self.fraction.log(base).floor;
		let a = self.floor;
		let b = a.integerDigits(base);
		let c = (self - a) * base;
		let d = { :x |
			let d = x.floor;
			(x - d) * base
		}.nestList(c, size - b.size - 1).floor;
		[b ++ d, l + 1]
	}

	realDigits { :self |
		let l = self.fraction.log(10).floor;
		let u = self.unscaledInteger.integerDigits;
		[u, l + 1]
	}

	square { :self |
		UnsimplifiedDecimal(
			self.fraction.square,
			self.scale
		)
	}

	truncate { :self |
		self.fraction.truncate
	}

	truncateScale { :self :k :mode/1 |
		let s = self.scale;
		(k < s).if {
			let f = self.fraction;
			let n = f.numerator;
			let d = f.denominator;
			let i = n * ((10L ^ s) / d);
			let j = 10L ^ (s - k);
			Decimal(
				Fraction(
					mode(i / j),
					10L ^ k
				),
				k
			)
		} {
			(k = s).if {
				self
			} {
				self.error('truncateScale')
			}
		}
	}

	truncateScale { :self :k |
		self.truncateScale(k, truncate/1)
	}

	unscaledInteger { :self |
		(self.fraction * (10L ^ self.scale)).asInteger
	}

	zero { :self |
		0D
	}

}

+Fraction {

	adaptToDecimalAndApply { :self :receiver :aBlock/2 |
		aBlock(receiver, self.asDecimal(receiver.scale))
	}

	asDecimal { :self :scale |
		Decimal(self, scale)
	}

	Decimal { :self :scale |
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

	adaptToDecimalAndApply { :self :receiver :aBlock/2 |
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

	adaptToDecimalAndApply { :self :aNumber :aBlock/2 |
		aBlock(aNumber, self.asDecimal)
	}

	asDecimal { :self :scale |
		UnsimplifiedDecimal(Fraction(self, 1L), scale)
	}

	asDecimal { :self |
		self.asDecimal(0)
	}

}

+String {

	parseDecimal { :self :elseClause/0 |
		let parts = self.splitBy('D');
		(parts.size = 2).if {
			parseDecimalWithScale(
				parts[1],
				parts[2].isEmpty.if {
					nil
				} {
					parts[2].parseDecimalInteger {
						self.error('parseDecimal: invalid scale')
					}
				},
				elseClause/0
			)
		} {
			elseClause()
		}
	}

	parseDecimal { :self |
		self.parseDecimal {
			self.error('String>>parseDecimal')
		}
	}

	parseDecimalWithScale { :self :scaleOrNil :elseClause/0 |
		let parts = self.splitBy('.');
		parts.size.caseOf(
			[
				1 -> {
					UnsimplifiedDecimal(
						parts[1].parseLargeInteger(elseClause/0).asFraction,
						scaleOrNil.ifNil { 0 }
					)
				},
				2 -> {
					let sign = self.beginsWith('-').if { -1 } { 1 };
					let i = parts[1].parseLargeInteger(elseClause/0);
					let f = sign.copySignTo(parts[2].parseLargeInteger(elseClause/0));
					let k = parts[2].size;
					scaleOrNil.ifNotNil { :x |
						(x >= k).if {
							f := f * (10L ^ (x - k));
							k := x
						} {
							self.error('parseDecimal: invalid scale')
						}
					};
					UnsimplifiedDecimal(
						i + Fraction(f, 10L ^ k),
						k
					)
				}
			]
		) {
			elseClause()
		}
	}

}
