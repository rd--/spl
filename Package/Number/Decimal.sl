Decimal : [Object, Store, Equal, Compare, Number] {

	| decimalFraction scale |

	[Decimal, rescaleDecimal] { :self :scale |
		Decimal(
			self.decimalFraction,
			scale
		)
	}

	[Float, Float, decimalToFloat] { :self |
		Float(self.decimalFraction)
	}

	[Integer, L, decimalToInteger] { :self |
		self.isIntegerValuedNumber.if {
			Integer(self.decimalFraction)
		} {
			self.error('Decimal>>Integer')
		}
	}

	[SmallInteger, decimalToSmallInteger] { :self |
		SmallInteger(Integer(self))
	}

	[absoluteValue, abs] { :self |
		uncheckedDecimal(
			self.decimalFraction.abs,
			self.scale
		)
	}

	adaptToFractionAndApply { :self :aFraction :aBlock/2 |
		aBlock(
			Decimal(aFraction, self.scale),
			self
		)
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock/2 |
		aBlock(
			Decimal(anInteger, 0L),
			self
		)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		/* Model: SmallInteger | Integer */
		aNumber.isIntegerValuedNumber.if {
			aBlock(
				Decimal(aNumber, 0L),
				self
			)
		} {
			self.error('Decimal>>adaptToNumberAndApply: not integer', [aNumber])
		}
	}

	ceiling { :self |
		Decimal(self.decimalFraction.ceiling, 0L)
	}

	denominator { :self |
		self.decimalFraction.denominator
	}

	[divide, /] { :self :operand |
		operand.isZero.if {
			self.error('Decimal>>divide: zero')
		} {
			operand.isDecimal.if {
				Decimal(
					self.decimalFraction / operand.decimalFraction,
					self.scale.max(operand.scale)
				)
			} {
				operand.adaptToDecimalAndApply(self, divide/2)
			}
		}
	}

	floor { :self |
		Decimal(self.decimalFraction.floor, 0L)
	}

	fractionalPart { :self |
		Decimal(
			self.decimalFraction.fractionalPart,
			self.scale
		)
	}

	[integerDigits, decimalExpansion] { :self |
		let [d, n] = self.realDigits;
		(n < 0L).if {
			List(n.abs, 0L) ++ d
		} {
			d
		}
	}

	integerPart { :self |
		uncheckedDecimal(
			Fraction(
				self.decimalFraction.integerPart,
				1L
			),
			self.scale
		)
	}

	isCloseBy { :self :aNumber :epsilon |
		Float(self).isCloseBy(
			Float(aNumber),
			epsilon
		)
	}

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isNumber.if {
			anObject.isDecimal.if {
				self.scale = anObject.scale & {
					self.decimalFraction = anObject.decimalFraction
				}
			} {
				anObject.adaptToDecimalAndApply(self, aBlock/2)
			}
		} {
			false
		}
	}

	isExact { :unused |
		true
	}

	isIntegerValuedNumber { :self |
		self.decimalFraction.isIntegerValuedNumber
	}

	[isLess, <] { :self :operand |
		operand.isDecimal.if {
			isLessOn(self, operand, decimalFraction/1)
		} {
			operand.adaptToDecimalAndApply(self, isLess/2)
		}
	}

	isNegative { :self |
		self.decimalFraction.isNegative
	}

	isNumber { :unused |
		true
	}

	isPowerOfTwo { :self |
		self.decimalFraction.isPowerOfTwo
	}

	isRealValuedNumber { :unused |
		true
	}

	isSmallInteger { :self |
		self.decimalFraction.isSmallInteger
	}

	[negate, -] { :self |
		uncheckedDecimal(
			self.decimalFraction.negate,
			self.scale
		)
	}

	normalInteger { :self |
		Integer(self).normalInteger
	}

	numerator { :self |
		self.decimalFraction.numerator
	}

	one { :self |
		Decimal(1/1, self.scale)
	}

	[plus, +] { :self :operand |
		operand.isDecimal.if {
			uncheckedDecimal(
				self.decimalFraction + operand.decimalFraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, plus/2)
		}
	}

	[power, ^] { :self :aNumber |
		/* Model: SmallInteger | Integer */
		aNumber.isIntegerValuedNumber.if {
			self.raisedToInteger(aNumber)
		} {
			self.unimplementedCase('power')
		}
	}

	precision { :self |
		self.truncate.integerLength(10L) + self.scale
	}

	printString { :self |
		let scale = self.scale;
		scale.isZero.if {
			Integer(self.integerPart)
			.uncheckedPrintStringWithRadix(10L) ++ 'D'
		} {
			let fraction = self.decimalFraction;
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
					.uncheckedPrintStringWithRadix(10L),
					(fraction.fractionalPart.abs * (10L ^ scale))
					.round
					.uncheckedPrintStringWithRadix(10L)
					.padLeft([scale], '0')
				]
			)
		}

	}

	raisedToInteger { :self :aNumber |
		uncheckedDecimal(
			self.decimalFraction.raisedToInteger(aNumber),
			self.isIntegerValuedNumber.if {
				self.scale
			} {
				self.scale * aNumber
			}
		)
	}

	realDigits { :self :base :size |
		self.isZero.if {
			[List(size, 0L), 1]
		} {
			let x = self.abs;
			let l = x.decimalFraction.log(base).floor;
			let a = x.floor.truncate;
			let b = a.integerDigits(base);
			let c = (x - a) * base;
			let d = { :x |
				let d = x.floor;
				(x - d) * base
			}.nestList(
				c,
				size - b.size - 1
			).floor.truncate;
			[b ++ d, l + 1]
		}
	}

	realDigits { :self |
		self.isZero.if {
			[List(self.precision, 0L), 1]
		} {
			let l = self.decimalFraction.log(10L).floor;
			let u = self.unscaledInteger.integerDigits;
			[u, l + 1]
		}
	}

	[reciprocal, /] { :self |
		self.isZero.if {
			self.error('Decimal>>reciprocal: zero divide')
		} {
			Decimal(
				self.decimalFraction.reciprocal,
				self.scale.max(1L)
			)
		}
	}

	round { :self |
		Decimal(self.decimalFraction.round, 0L)
	}

	square { :self |
		uncheckedDecimal(
			self.decimalFraction.square,
			self.scale * 2
		)
	}

	[subtract, -] { :self :operand |
		operand.isDecimal.if {
			uncheckedDecimal(
				self.decimalFraction - operand.decimalFraction,
				self.scale.max(operand.scale)
			)
		} {
			operand.adaptToDecimalAndApply(self, subtract/2)
		}
	}

	[times, *] { :self :operand |
		operand.isDecimal.if {
			uncheckedDecimal(
				self.decimalFraction * operand.decimalFraction,
				self.scale + operand.scale /* self.scale.max(operand.scale) */
			)
		} {
			operand.adaptToDecimalAndApply(self, times/2)
		}
	}

	[toFraction, decimalToFraction] { :self |
		self.decimalFraction
	}

	truncate { :self |
		self.decimalFraction.truncate
	}

	truncateScale { :self :k :mode/1 |
		let s = self.scale;
		(k < s).if {
			let f = self.decimalFraction;
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
		(self.decimalFraction * (10L ^ self.scale)).Integer
	}

	zero { :self |
		Decimal(0/1, self.scale)
	}

}

+Fraction {

	Decimal { :self :scale |
		scale.isCollection.if {
			scale.collect { :each |
				Decimal(self, each)
			}
		} {
			uncheckedDecimal(
				self.deriveDecimalFraction(scale),
				Integer(scale)
			)
		}
	}

	adaptToDecimalAndApply { :self :receiver :aBlock/2 |
		aBlock(
			receiver,
			Decimal(self, receiver.scale)
		)
	}

	uncheckedDecimal { :fraction :scale |
		newDecimal().initializeSlots(
			fraction,
			scale
		)
	}

}

+Float {

	Decimal { :self :scale |
		scale.isCollection.if {
			scale.collect { :each |
				Decimal(self, each)
			}
		} {
			/* Model: SmallInteger | Integer */
			self.isIntegerValuedNumber.if {
				uncheckedDecimal(
					Fraction(self, 1L),
					scale
				)
			} {
				Decimal(
					self.deriveDecimalFraction(
						scale
					),
					scale
				)
			}
		}
	}

	adaptToDecimalAndApply { :self :receiver :aBlock/2 |
		/* Model: SmallInteger | Integer */
		self.isIntegerValuedNumber.if {
			aBlock(
				receiver,
				Decimal(self, 0L)
			)
		} {
			aBlock(
				Float(receiver),
				self
			)
		}
	}

}

+Integer {

	[Decimal, largeIntegerToDecimal] { :self :scale |
		uncheckedDecimal(
			Fraction(self, 1L),
			scale
		)
	}

	adaptToDecimalAndApply { :self :aNumber :aBlock/2 |
		aBlock(aNumber, Decimal(self, 0L))
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

+@Sequence {

	Decimal { :self :scale |
		scale.adaptToCollectionAndApply(self, Decimal/2)
	}

}

+List {

	Decimal { :self |
		self.atVectorOrElementwise { :each |
			let [x, s] = each;
			Decimal(x, s)
		}
	}

}

+String {

	parseDecimal { :self :elseClause/0 |
		let parts = self.splitOn('D');
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
		let parts = self.splitOn('.');
		parts.size.caseOf(
			[
				1 -> {
					uncheckedDecimal(
						uncheckedFraction(
							parts[1].parseInteger(elseClause/0),
							1L
						),
						scaleOrNil.ifNil { 0 }
					)
				},
				2 -> {
					let sign = self.beginsWith('-').if { -1 } { 1 };
					let i = parts[1].parseInteger(elseClause/0);
					let f = sign.copySign(parts[2].parseInteger(elseClause/0));
					let k = parts[2].size;
					scaleOrNil.ifNotNil {
						(scaleOrNil >= k).if {
							f := f * (10L ^ (scaleOrNil - k));
							k := scaleOrNil
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
