Decimal : [Object, Store, Equal, Compare, Number] {

	| decimalFraction scale |

	[Decimal, rescaleDecimal] { :self :scale |
		Decimal(
			self.decimalFraction,
			scale
		)
	}

	[Float, F, decimalToFloat] { :self |
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
		aNumber.isInteger.if {
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

	continuedFraction { :self |
		self.decimalFraction.continuedFraction
	}

	denominator { :self |
		self.decimalFraction.denominator
	}

	[divide, /] { :self :operand |
		operand.isZero.if {
			Infinity
		} {
			operand.isDecimal.if {
				divideDecimal(self, operand, max/2)
			} {
				operand.adaptToDecimalAndApply(self, divide/2)
			}
		}
	}

	divideDecimal { :self :operand :aBlock/2 |
		Decimal(
			self.decimalFraction / operand.decimalFraction,
			aBlock(self.scale, operand.scale)
		)
	}

	floor { :self |
		self.decimalFraction.floor
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

	[integerPart, truncate] { :self |
		self.decimalFraction.integerPart
	}

	isCloseBy { :self :aNumber :epsilon |
		Float(self).isCloseBy(
			Float(aNumber),
			epsilon
		)
	}

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isDecimal.if {
			self.decimalFraction = anObject.decimalFraction
		} {
			anObject.isNumber.if {
				anObject.adaptToDecimalAndApply(self, aBlock/2)
			} {
				false
			}
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

	isSmallIntegerValuedNumber { :self |
		self.decimalFraction.isSmallIntegerValuedNumber
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
		aNumber.isInteger.if {
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
			.integerString(10L) ++ 'D'
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
					.integerString(10L),
					(fraction.fractionalPart.abs * (10L ^ scale))
					.L
					.integerString(10L)
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
		self.decimalFraction.realDigits(base, size)
	}

	realDigits { :self |
		self.isZero.if {
			[List(self.scale + 1, 0L), 1L]
		} {
			let u = self.unscaledInteger.abs;
			[
				u.integerDigits(10L),
				u.integerLength(10L) - self.scale
			]
		}
	}

	[reciprocal, /] { :self |
		self.isZero.if {
			self.error('Decimal>>reciprocal: zero divide')
		} {
			Decimal(
				self.decimalFraction.reciprocal,
				self.scale.isZero.if {
					system.defaultDecimalScale
				} {
					self.scale
				}
			)
		}
	}

	round { :self |
		self.decimalFraction.round
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
			timesDecimal(self, operand, max/2) /* plus/2 */
		} {
			operand.adaptToDecimalAndApply(self, times/2)
		}
	}

	timesDecimal { :self :operand :aBlock/2 |
		Decimal(
			self.decimalFraction * operand.decimalFraction,
			aBlock(self.scale, operand.scale)
		)
	}

	[toFraction, decimalToFraction] { :self |
		self.decimalFraction
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
				self.error('truncateScale: k > s')
			}
		}
	}

	truncateScale { :self :k |
		self.truncateScale(k, truncate/1)
	}

	unscaledInteger { :self |
		(self.decimalFraction * (10L ^ self.scale)).L
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

	fractionToDecimal { :self :defaultScale |
		let d = self.denominator;
		let k = (
			d != 1L& {
				powerMod(10L, d, d).isZero
			}
		).if {
			d.primeSignature.first
		} {
			Integer(defaultScale)
		};
		uncheckedDecimal(self, k)
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
			self.isInteger.if {
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
		aBlock(
			Float(receiver),
			self
		)
	}

}

+Integer {

	[Decimal, integerToDecimal] { :self :scale |
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
		(parts.size = 2L).if {
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
				1L -> {
					uncheckedDecimal(
						uncheckedFraction(
							parts[1].parseInteger(elseClause/0),
							1L
						),
						scaleOrNil.ifNil { 0L }
					)
				},
				2L -> {
					let sign = self.beginsWith('-').if { -1L } { 1L };
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

+System {

	defaultDecimalScale { :unused |
		28L
	}

}
