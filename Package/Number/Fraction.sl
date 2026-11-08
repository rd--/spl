Fraction : [Object, Store, Copy, Equal, Compare, Number, ImplicitFloat] {

	| numerator denominator |

	[Integer, normalInteger] { :self |
		LargeInteger(self).normalInteger
	}

	[LargeInteger, L, fractionToLargeInteger] { :self |
		self.isInteger.if {
			self.numerator
		} {
			self.error('Fraction>>LargeInteger: not integer')
		}
	}

	[Record, fractionToRecord] { :self |
		(
			numerator: self.numerator.Integer,
			denominator: self.denominator.Integer
		)
	}

	[SmallFloat, Float, fractionToSmallFloat] { :self |
		SmallFloat(self.numerator)
		/
		SmallFloat(self.denominator)
	}

	[SmallInteger, fractionToSmallInteger] { :self |
		SmallInteger(LargeInteger(self))
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock/2 |
		aBlock(
			uncheckedFraction(
				LargeInteger(anInteger),
				1L
			),
			self
		)
	}

	adaptToNumberAndApply { :self :operand :aBlock/2 |
		operand.isInteger.if {
			/* self.adaptToIntegerAndApply(operand, aBlock/2) */
			aBlock(
				Fraction(
					LargeInteger(operand),
					1L
				),
				self
			)
		} {
			aBlock(
				operand,
				SmallFloat(self)
			)
		}
	}

	arithmeticDerivative { :n |
		n.abs.isZeroOrOne.if {
			n.zero
		} {
			(n < 0).if {
				n.negate.arithmeticDerivative.negate
			} {
				let f = n.factorInteger;
				let a = f.collect { :x |
					Fraction(x[2], x[1])
				}.sum;
				a * n
			}
		}
	}

	components { :self |
		[
			self.numerator.normalInteger,
			self.denominator.normalInteger
		]
	}

	continuedFraction { :self |
		let i = self.integerPart;
		let f = self - i;
		self.isNegative.if {
			let answer = (1 + f).continuedFraction;
			answer[1] := answer[1] + i - 1;
			answer
		} {
			let answer = [];
			{
				f.isZero.not
			}.whileTrue {
				answer.add!(i);
				f := 1 / f;
				i := f.integerPart;
				f := f - i
			};
			answer.add!(i);
			answer
		}
	}

	decimalExpansion { :self :places |
		Decimal(self, places + 1).decimalExpansion.allButLast
	}

	decimalPeriod { :self |
		let n = self.denominator;
		powerMod(10, n, n).isZero.if {
			0/1
		} {
			let a = 2L ^ n.integerExponent(2);
			let b = 5L ^ n.integerExponent(5);
			let c = n / a / b;
			10.multiplicativeOrder(c)
		}
	}

	[divide, /, Fraction] { :self :operand |
		operand.isInteger.if {
			self * uncheckedFraction(
				1L,
				LargeInteger(operand)
			)
		} {
			operand.isFraction.if {
				self * operand.reciprocal
			} {
				operand.adaptToFractionAndApply(self, divide/2)
			}
		}
	}

	dividesImmediately { :self :operand |
		(self / operand).isPrime
	}

	engelExpansion { :x |
		let a = [];
		{
			x.isZero.not
		}.whileTrue {
			let y = (1 / x).ceiling;
			a.add!(y);
			x := x * y - 1
		};
		a
	}

	fullSimplify { :self |
		let answer = self.simplify;
		answer.denominator.isOne.if {
			answer.numerator
		} {
			answer
		}
	}

	gcd { :self :operand |
		operand.isFraction.if {
			let d = self.denominator.gcd(operand.denominator);
			let a = self.numerator * (operand.denominator // d);
			let b = operand.numerator * (self.denominator // d);
			let c = self.denominator // d * operand.denominator;
			uncheckedFraction(
				gcd(a, b),
				c
			)
		} {
			operand.adaptToFractionAndApply(self, gcd/2)
		}
	}

	[integerSquareRoot, isqrt] { :self |
		self.sqrt.floor
	}

	isAdjacentFraction { :self :operand |
		(operand - self).numerator.abs.isOne
	}

	isDyadicRational { :self |
		self.denominator.isPowerOfTwo
	}

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isNumber.if {
			anObject.isFraction.if {
				self.numerator = anObject.numerator & {
					self.denominator = anObject.denominator
				}
			} {
				anObject.adaptToFractionAndApply(self, aBlock/2)
			}
		} {
			false
		}
	}

	isEven { :self |
		self.isIntegerAnd(isEven/1)
	}

	isExact { :unused |
		true
	}

	isFareyPair { :self :operand |
		let [a, b] = self.numeratorDenominator;
		let [c, d] = operand.numeratorDenominator;
		let e = (b * c) - (a * d);
		e.isOne
	}

	isFinite { :unused |
		true
	}

	isInteger { :self |
		self.denominator.isOne
	}

	isIntegerAnd { :self :aBlock/1 |
		self.denominator.isOne & {
			aBlock(self.numerator)
		}
	}

	[isLess, <] { :self :operand |
		operand.isFraction.if {
			let a = self.numerator * operand.denominator;
			let b = operand.numerator * self.denominator;
			a < b

		} {
			operand.adaptToFractionAndApply(self, isLess/2)
		}
	}

	isLiteral { :self |
		true
	}

	isNaN { :unused |
		false
	}

	isNegative { :self |
		self.numerator.isNegative
	}

	isOdd { :self |
		self.isIntegerAnd(isOdd/1)
	}

	isPhiWeightedMediantNoble { :self :operand |
		(
			(self.numerator * operand.denominator)
			-
			(self.denominator * operand.numerator)
		).abs.isOne
	}

	isPowerOfTwo { :self |
                self.isIntegerAnd(isPowerOfTwo/1)
	}

	isPrime { :self |
		self.isIntegerAnd(isPrime/1)
	}

	isRational { :unused |
		true
	}

	isRepeatingDecimal { :self |
		self.decimalPeriod > 0
	}

	isSmallInteger { :self |
		self.isIntegerAnd(isSmallInteger/1)
	}

	isSquareSuperparticular { :self |
		self.isSuperparticular & {
			self.numerator.isSquareFree.not
		}
	}

	isSuperparticular { :self |
		self.numerator - 1 = self.denominator
	}

	isSuperpartient { :self |
		self > 1 & { self.isSuperparticular.not }
	}

	isTerminatingDecimal { :self |
		self.decimalPeriod.isZero
	}

	isUnitFraction { :self |
		self.numerator.isOne
	}

	isVeryClose { :self :operand |
		self = operand
	}

	isZero { :self |
		self.numerator.isZero
	}

	lcm { :self :operand |
		operand.isFraction.if {
			self // self.gcd(operand) * operand
		} {
			operand.adaptToFractionAndApply(self, lcm/2)
		}
	}

	limitDenominator { :self :maxDenominator |
		(maxDenominator < 1).if {
			self.error('limitDenominator: illegal maxDenominator')
		} {
			(self.denominator <= maxDenominator).if {
				self
			} {
				let p0 = 0;
				let q0 = 1;
				let p1 = 1;
				let q1 = 0;
				let n = self.numerator;
				let d = self.denominator;
				let continue = true;
				{
					continue
				}.whileTrue {
					let a = n // d;
					let q2 = q0 + (a * q1);
					(q2 > maxDenominator).if {
						continue := false
					} {
						[p0, q0, p1, q1, n, d] := [p1, q1, p0 + (a * p1), q2, d, n - (a * d)]
					}
				};
				let k = (maxDenominator - q0) // q1;
				let bound1 = uncheckedFraction(
					p0 + (k * p1),
					q0 + (k * q1)
				);
				let bound2 = uncheckedFraction(
					p1,
					q1
				);
				((bound2 - self).abs <= (bound1 - self).abs).if {
					bound2
				} {
					bound1
				}
			}
		}
	}

	mediant { :self :operand |
		Fraction(
			self.numerator + operand.numerator,
			self.denominator + operand.denominator
		)
	}

	minkowskiQuestionMark { :self |
		let a = self.continuedFraction;
		let a0 = a.removeFirst!;
		let m = a.size;
		a0 + (
			2 * [1L .. m].sum { :n |
				(-1L ^ (n + 1)) / (2L ^ a.take(n).sum)
			}
		)
	}

	[negate, -] { :self |
		uncheckedFraction(
			self.numerator.negate,
			self.denominator
		)
	}

	normalFraction { :self |
		self.copy.normalize
	}

	normalize { :self |
		self.denominator.isZero.if {
			self.error('Fraction>>normalize: zeroDenominatorError')
		} {
			let x = self.numerator * self.denominator.sign;
			let y = self.denominator.abs;
			let d = x.gcd(y);
			self.numerator := x // d;
			self.denominator := y // d;
			self
		}
	}

	numeratorDenominator { :self |
		[self.numerator, self.denominator]
	}

	one { :self |
		1/1
	}

	phiWeightedMediant { :self :operand |
		self.weightedMediant(operand, 1, 1.goldenRatio)
	}

	[plus, +] { :self :operand |
		operand.isInteger.if {
			uncheckedFraction(
				self.numerator + (self.denominator * LargeInteger(operand)),
				self.denominator
			)
		} {
			operand.isFraction.if {
				let d = self.denominator.gcd(operand.denominator);
				let d1 = operand.denominator // d;
				let d2 = self.denominator // d;
				let n = (self.numerator * d1) + (operand.numerator * d2);
				d1 := d1 * d2;
				d2 := n.gcd(d);
				n := n // d2;
				d := d1 * (d // d2);
				d.isOne.if {
					/* preference: answer proper integer */
					uncheckedFraction(n, 1L)
				} {
					uncheckedFraction(n, d)
				}
			} {
				operand.adaptToFractionAndApply(self, plus/2)
			}
		}
	}

	[power, ^] { :self :operand |
		operand.isInteger.if {
			self.raisedToInteger(LargeInteger(operand))
		} {
			operand.isFraction.if {
				self.isNegative.if {
					Complex(SmallFloat(self), 0) ^ operand
				} {
					self.raisedToFraction(operand)
				}
			} {
				operand.adaptToFractionAndApply(self, power/2)
			}
		}
	}

	raisedToFraction { :self :operand |
		let rootNumerator = self.numerator.nthRoot(operand.denominator).truncate;
		let rootDenominator = self.denominator.nthRoot(operand.denominator).truncate;
		let root = Fraction(rootNumerator, rootDenominator);
		(root.raisedToInteger(operand.denominator) = self).if {
			root.raisedToInteger(operand.numerator)
		} {
			SmallFloat(self) ^ SmallFloat(operand)
		}
	}

	raisedToInteger { :self :operand |
		operand.isZero.if {
			self.one
		} {
			(operand < 0).if {
				self.reciprocal.raisedToInteger(operand.negate)
			} {
				uncheckedFraction(
					self.numerator.raisedToInteger(operand),
					self.denominator.raisedToInteger(operand)
				)
			}
		}
	}

	rationalize { :self :epsilon |
		SmallFloat(self).rationalize(
			SmallFloat(epsilon)
		)
	}

	rationalize { :self |
		self
	}

	[reciprocal, /] { :self |
		self.numerator.abs.isOne.if {
			/* preference: answer proper integer */
			uncheckedFraction(
				self.denominator * self.numerator,
				1L
			)
		} {
			Fraction(
				self.denominator,
				self.numerator
			)
		}
	}

	simplify { :self |
		self.copy.simplify!
	}

	simplify! { :self |
		self.denominator.isZero.if {
			/* self.error('Fraction>>simplify: zeroDenominatorError') */
			self.numerator.copySign(Infinity)
		} {
			let x = self.numerator * self.denominator.sign;
			let y = self.denominator.abs;
			let d = x.gcd(y);
			self.numerator := x // d;
			self.denominator := y // d;
			self.denominator.isOne.if {
				/* preference: answer proper integer */
				self
			} {
				self
			}
		}
	}

	sternBrocotChildren { :self |
		let a = self.continuedFraction;
		let b = a.copy;
		a[a.size] := a[a.size] + 1;
		b[a.size] := b[a.size] - 1;
		b.add!(2);
		[
			a.fromContinuedFraction,
			b.fromContinuedFraction
		].sort
	}

	sternBrocotLevel { :self |
		self.continuedFraction.sum.normalInteger
	}

	sternBrocotParent { :self |
		self.isOne.if {
			self
		} {
			let c = self.continuedFraction;
			let n = c.size;
			c[n] := c[n] - 1;
			c.fromContinuedFraction
		}
	}

	sternBrocotPath { :self |
		sternBrocotParent/1.nestWhileList(self) { :x |
			x.isOne.not
		}
	}

	storeString { :self |
		self.storeStringLiteral
	}

	storeStringLiteral { :self |
		[
			self.numerator.uncheckedPrintString(10),
			self.denominator.uncheckedPrintString(10)
		].stringIntercalate('/')
	}

	[subtract, -] { :self :operand |
		operand.isInteger.if {
			uncheckedFraction(
				self.numerator - (self.denominator * LargeInteger(operand)),
				self.denominator
			)
		} {
			operand.isFraction.if {
				self + operand.negate
			} {
				operand.adaptToFractionAndApply(self, subtract/2)
			}
		}
	}

	sylvesterExpansion { :self |
		let a = [];
		let [x, y] = self.numeratorDenominator;
		(
			x.isZero | {
				y.isZero
			}
		).if {
			[]
		} {
			{
				x.isZero.not
			}.whileTrue {
				let z = (y / x).ceiling;
				a.add!(Fraction(1, z));
				x := x * z - y;
				y := y * z
			};
			a
		}
	}

	[times, *] { :self :operand |
		operand.isFraction.if {
			let d1 = self.numerator.gcd(operand.denominator);
			let d2 = self.denominator.gcd(operand.numerator);
			let numerator = (self.numerator // d1) * (operand.numerator // d2);
			(
				d2 = self.denominator & {
					d1 = operand.denominator
				}
			).if {
				/* preference: answer proper integer */
				uncheckedFraction(
					numerator,
					1L
				)
			} {
				Fraction(
					numerator,
					(self.denominator // d2) * (operand.denominator // d1)
				)
			}
		} {
			operand.isInteger.if {
				Fraction(
					self.numerator * operand,
					self.denominator
				)
			} {
				operand.adaptToFractionAndApply(self, times/2)
			}
		}
	}

	truncate { :self |
		self.numerator.quotient(
			self.denominator
		)
	}

	unicodeFraction { :self |
		system.unicodeFractionsTable.indexOf(self)
	}

	weightedMediant { :self :operand :m :n |
		let a = self.numerator;
		let b = self.denominator;
		let c = operand.numerator;
		let d = operand.denominator;
		(m.isFraction && n.isFraction).if {
			((m * a) + (n * c)) / ((m * b) + (n * d))
		} {
			(
				(m * SmallFloat(a)) + (n * SmallFloat(c))
			)
			/
			(
				(m * SmallFloat(b)) + (n * SmallFloat(d))
			)
		}
	}

	zero { :self |
		0/1
	}

}

+@Cache {

	unicodeFractionsTable { :self |
		self.cached('unicodeFractionsTable') {
			(
				'⅒': 1/10, /* 0.1 */
				'⅑': 1/9, /* 1.111 */
				'⅛': 1/8, /* 0.125 */
				'⅐': 1/7, /* 0.142 */
				'⅙': 1/6, /* 0.166 */
				'⅕': 1/5, /* 0.2 */
				'¼': 1/4, /* 0.25 */
				'⅓': 1/3, /* 0.333 */
				'⅜': 3/8, /* 0.375 */
				'⅖': 2/5, /* 0.4 */
				'½': 1/2, /* 0.5 */
				'⅗': 3/5, /* 0.6 */
				'⅝': 5/8, /* 0.625 */
				'⅔': 2/3, /* 0.666 */
				'¾': 3/4, /* 0.75 */
				'⅘': 4/5, /* 0.8 */
				'⅚': 5/6, /* 0.833 */
				'⅞': 7/8 /* 0.875 */
			)
		}
	}

}

+@Integer {

	[Fraction, R] { :numerator :denominator |
		numerator.isNaN.if {
			NaN
		} {
			denominator.isInteger.if {
				uncheckedFraction(
					LargeInteger(numerator),
					LargeInteger(denominator)
				).simplify!
			} {
				denominator.adaptToIntegerAndApply(
					numerator,
					Fraction/2
				)
			}
		}
	}

	adaptToFractionAndApply { :self :aFraction :aBlock/2 |
		aBlock(
			aFraction,
			uncheckedFraction(self, 1L)
		)
	}

	arithmeticDerivative { :self |
		Fraction(self, 1L)
		.arithmeticDerivative
		.Integer
	}

	checkedFraction { :numerator :denominator |
		denominator.isInteger.if {
			uncheckedFraction(
				LargeInteger(numerator),
				LargeInteger(denominator)
			)
		} {
			[numerator, denominator].error('checkedFraction')
			/* denominator.adaptToNumberAndApply(numerator, Fraction/2) */
		}
	}

	[integerToFraction, toFraction] { :self |
		uncheckedFraction(
			LargeInteger(self),
			1L
		)
	}

	numeratorDenominator { :self |
		[
			LargeInteger(self),
			1L
		]
	}

}

+LargeInteger {

	uncheckedFraction { :numerator :denominator |
		newFraction().initializeSlots(
			numerator,
			denominator
		)
	}

}

+@Sequence {

	[Fraction, R] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, Fraction/2)
	}

}

+@Collection {

	adaptToFractionAndApply { :self :aFraction :aBlock/2 |
		self.collect { :each |
			aBlock(aFraction, each)
		}
	}

}

+List {

	[Fraction, listToFraction] { :self |
		self.atVectorOrElementwise { :each |
			let [n, d] = each;
			Fraction(n, d)
		}
	}

	lambdomaMatrix { :self |
		let [m, n] = self;
		Fraction/2
		.swap
		.table([1 .. m], [1 .. n])
	}

}

+SmallFloat {

	adaptToFractionAndApply { :self :operand :aBlock/2 |
		self.isInteger.if {
			aBlock(
				operand,
				Fraction(
					uncheckedLargeInteger(self),
					1L
				)
			)
		} {
			aBlock(
				SmallFloat(operand),
				self
			)
		}
	}

}

+@Integer {

	[rationalize, approximateFraction] { :self :epsilon |
		self.isInteger.if {
			Fraction(self, 1L)
		} {
			let c = self.abs.continuedFraction(16);
			let l = c.semiconvergents(epsilon);
			withReturn { :return/1 |
				l.do { :r |
					((self - r).abs < epsilon).ifTrue {
						self.copySign(r).return
					}
				};
				self.copySign(l.last)
			}
		}
	}

	rationalize { :self |
		self.rationalize(1E-5)
	}

}

+String {

	isFractionString { :self |
		self.matchesRegularExpression('^[-]?[0-9]+/[0-9]+$')
	}

	parseFraction { :self :elseClause/0 |
		self.parseFractionSeparatedBy('/', elseClause/0)
	}

	parseFraction { :self |
		self.parseFraction {
			self.error('parseFraction: parse failed')
		}
	}

	parseFractionSeparatedBy { :self :separator :elseClause/0 |
		self.includesSubstring(separator).if {
			let parts = self.splitOn(separator);
			(parts.size = 2).if {
				Fraction(
					parts[1].parseLargeInteger(elseClause/0),
					parts[2].parseLargeInteger(elseClause/0)
				)
			} {
				self.isDecimalIntegerString.if {
					uncheckedFraction(
						self.parseLargeInteger,
						1L
					)
				} {
					elseClause()
				}
			}
		} {
			elseClause()
		}
	}

}

+[Fraction, SmallFloat] {

	deriveDecimalFraction { :self :scale |
		self.deriveFractionOver(10L ^ scale)
	}

	deriveFractionOver { :self :denominator |
		self.isInteger.if {
			uncheckedFraction(
				LargeInteger(self),
				1L
			)
		} {
			Fraction(
				(self * denominator).round,
				denominator
			)
		}
	}

}

+Record {

	parseFraction { :self |
		Fraction(
			self['numerator'],
			self['denominator']
		)
	}

}

+SmallFloat {

	fareyApproximants { :x :n |
		let p = Fraction(x.floor, 1L);
		let q = p + 1;
		let a = [p, q];
		(n - 2).timesRepeat {
			let p = a.detectLast { :y |
				y < x
			};
			let q = a.detectLast { :y |
				y > x
			};
			a.add!(p.mediant(q))
		};
		a
	}

	fareyConvergence { :x :n |
		let n1 = 0;
		let d1 = 1;
		let n9 = 1;
		let d9 = 1;
		let f = 0;
		let fp = x.fractionalPart;
		let a = [
			Fraction(
				(2 * fp > 1).if { x.ceiling } { x.floor },
				1L
			)
		];
		{
			d1 + d9 < n
		}.whileTrue {
			let a1 = Fraction(n1, d1);
			let a9 = Fraction(n9, d9);
			let n0 = n1 + n9;
			let d0 = d1 + d9;
			let a0 = Fraction(n0, d0);
			(a0 < fp).if {
				a1 := a0;
				n1 := n0;
				d1 := d0
			} {
				a9 := a0;
				n9 := n0;
				d9 := d0
			};
			(abs(fp - f) > abs(fp - a0)).ifTrue {
				f := a0;
				a.add!(a0 + x.integerPart)
			}
		};
		a
	}

}

+LargeInteger {

	raisedToFraction { :self :operand |
		uncheckedFraction(self, 1L)
		.raisedToFraction(operand)
	}

}
