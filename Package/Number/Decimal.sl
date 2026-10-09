Decimal : [Object, Store, Equal, Compare, Number] {

	| fraction scale |

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
					(SmallFloat(self) * m).round,
					(SmallFloat(operand) * m).round
				)
			}
		} {
			false
		}
	}

	[negate, -] { :self |
		uncheckedDecimal(
			self.fraction.negate,
			self.scale
		)
	}

	[plus, +] { :self :operand |
		operand.isDecimal.if {
			uncheckedDecimal(
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
			uncheckedDecimal(
				self.fraction - operand.fraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, subtract/2)
		}
	}

	[times, *] { :self :operand |
		operand.isDecimal.if {
			uncheckedDecimal(
				self.fraction * operand.fraction,
				self.scale + operand.scale /* self.scale.max(operand.scale) */
			)
		} {
			operand.adaptToDecimalAndApply(self, times/2)
		}
	}

	[absoluteValue, abs] { :self |
		uncheckedDecimal(self.fraction.abs, self.scale)
	}

	adaptToFractionAndApply { :self :aFraction :aBlock/2 |
		aBlock(
			Decimal(aFraction, self.scale),
			self
		)
	}

	adaptToIntegerAndApply { :self :receiver :aBlock/2 |
		aBlock(
			Decimal(receiver, 0),
			self
		)
	}

	adaptToNumberAndApply { :self :receiver :aBlock/2 |
		receiver.isInteger.if {
			aBlock(
				Decimal(receiver, 0),
				self
			)
		} {
			self.error('Decimal>>adaptToNumberAndApply: not integer')
		}
	}

	ceiling { :self |
		Decimal(self.fraction.ceiling, self.scale)
	}

	Decimal { :self :scale |
		Decimal(
			self.fraction,
			scale
		)
	}

	denominator { :self |
		self.fraction.denominator
	}

	floor { :self |
		Decimal(self.fraction.floor, self.scale)
	}


	[Fraction, decimalToFraction] { :self |
		self.fraction
	}

	fractionalPart { :self |
		Decimal(
			self.fraction.fractionalPart,
			self.scale
		)
	}

	Integer { :self |
		LargeInteger(self).normal
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
		uncheckedDecimal(
			Fraction(self.fraction.integerPart, 1),
			self.scale
		)
	}

	isCloseToBy { :self :aNumber :epsilon |
		SmallFloat(self).isCloseToBy(aNumber.SmallFloat, epsilon)
	}

	isExact { :unused |
		true
	}

	isInteger { :self |
		self.scale.isZero | {
			self.fraction.isInteger
		}
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

	[LargeInteger, decimalToLargeInteger] { :self |
		self.isInteger.if {
			LargeInteger(self.fraction)
		} {
			self.error('Decimal>>LargeInteger')
		}
	}

	numerator { :self |
		self.fraction.numerator
	}

	one { :self |
		1D
	}

	precision { :self |
		self.truncate.integerLength(10) + self.scale
	}

	printString { :self |
		let scale = self.scale;
		let fraction = self.fraction;
		(scale = 0).if {
			LargeInteger(self.integerPart).uncheckedPrintString(10) ++ 'D'
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
					.uncheckedPrintString(10),
					(fraction.fractionalPart.abs * (10L ^ scale))
					.round
					.uncheckedPrintString(10)
					.padLeft([scale], '0')
				]
			)
		}

	}

	raisedToInteger { :self :aNumber |
		uncheckedDecimal(
			self.fraction.raisedToInteger(aNumber),
			self.scale
		)
	}

	realDigits { :self :base :size |
		self.isZero.if {
			[size # [0], 1]
		} {
			let x = self.abs;
			let l = x.fraction.log(base).floor;
			let a = x.floor.truncate;
			let b = a.integerDigits(base);
			let c = (x - a) * base;
			let d = { :x |
				let d = x.floor;
				(x - d) * base
			}.nestList(
				c, size - b.size - 1
			).floor.truncate;
			[b ++ d, l + 1]
		}
	}

	realDigits { :self |
		self.isZero.if {
			[self.precision # [0], 1]
		} {
			let l = self.fraction.log(10).floor;
			let u = self.unscaledInteger.integerDigits;
			[u, l + 1]
		}
	}

	round { :self |
		Decimal(self.fraction.round, self.scale)
	}

	SmallInteger { :self |
		LargeInteger(self).SmallInteger
	}

	[SmallFloat, Float, decimalToSmallFloat] { :self |
		self.fraction.SmallFloat
	}

	square { :self |
		uncheckedDecimal(
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
		(self.fraction * (10L ^ self.scale)).Integer
	}

	zero { :self |
		0D
	}

}

+Fraction {

	adaptToDecimalAndApply { :self :receiver :aBlock/2 |
		aBlock(
			receiver,
			Decimal(self, receiver.scale)
		)
	}

	Decimal { :self :scale |
		uncheckedDecimal(
			self.decimalFraction(scale),
			scale
		)
	}

	uncheckedDecimal { :fraction :scale |
		newDecimal().initializeSlots(
			fraction,
			scale
		)
	}

}

+SmallFloat {

	adaptToDecimalAndApply { :self :receiver :aBlock/2 |
		self.isInteger.if {
			aBlock(
				receiver,
				Decimal(self, 0)
			)

		} {
			aBlock(
				SmallFloat(receiver),
				self
			)
		}
	}

	Decimal { :self :scale |
		self.isInteger.if {
			uncheckedDecimal(Fraction(self, 1), scale)
		} {
			Decimal(
				self.decimalFraction(scale),
				scale
			)
		}
	}

	Decimal { :self |
		Decimal(self, 0)
	}

}

+LargeInteger {

	adaptToDecimalAndApply { :self :aNumber :aBlock/2 |
		aBlock(aNumber, Decimal(self, 0))
	}

	[Decimal, largeIntegerToDecimal] { :self :scale |
		uncheckedDecimal(Fraction(self, 1L), scale)
	}

	[Decimal, largeIntegerToDecimal] { :self |
		Decimal(self, 0)
	}

}

+@Collection {

	adaptToDecimalAndApply { :self :operand :aBlock/2 |
		self.collect { :each |
			aBlock(operand, each)
		}
	}

	truncateScale { :self :k |
		self.collect { :each |
			each.truncateScale(k)
		}
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
					uncheckedDecimal(
						Fraction(
							parts[1].parseLargeInteger(elseClause/0),
							1
						),
						scaleOrNil.ifNil { 0 }
					)
				},
				2 -> {
					let sign = self.beginsWith('-').if { -1 } { 1 };
					let i = parts[1].parseLargeInteger(elseClause/0);
					let f = sign.copySign(parts[2].parseLargeInteger(elseClause/0));
					let k = parts[2].size;
					scaleOrNil.ifNotNil { :x |
						(x >= k).if {
							f := f * (10L ^ (x - k));
							k := x
						} {
							self.error('parseDecimal: invalid scale')
						}
					};
					uncheckedDecimal(
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
