Fraction : [Object, Store, Copy, Equal, Compare, Number, ImplicitFloat] {

	| numerator denominator |

	[less, <] { :self :operand |
		operand.isFraction.if {
			(self.numerator * operand.denominator)
			<
			(operand.numerator * self.denominator)
		} {
			operand.adaptToFractionAndApply(self, less/2)
		}
	}

	[divide, /, Fraction] { :self :operand |
		operand.isInteger.if {
			self * uncheckedFraction(1L, LargeInteger(operand))
		} {
			operand.isFraction.if {
				self * operand.reciprocal
			} {
				operand.adaptToFractionAndApply(self, divide/2)
			}
		}
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
				(d = 1).if {
					/* preference: answer proper integer */
					uncheckedFraction(n, 1)
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
					Complex(self.SmallFloat, 0) ^ operand
				} {
					self.raisedToFraction(operand)
				}
			} {
				operand.adaptToFractionAndApply(self, power/2)
			}
		}
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

	[times, *] { :self :operand |
		operand.isFraction.if {
			let d1 = self.numerator.gcd(operand.denominator);
			let d2 = self.denominator.gcd(operand.numerator);
			let numerator = (self.numerator // d1) * (operand.numerator // d2);
			(d2 = self.denominator & {
				d1 = operand.denominator
			}).if {
				/* preference: answer proper integer */
				uncheckedFraction(numerator, numerator.one)
			} {
				Fraction(
					numerator,
					(self.denominator // d2) * (operand.denominator // d1)
				)
			}
		} {
			operand.adaptToFractionAndApply(self, times/2)
		}
	}

	adaptToIntegerAndApply { :self :operand :aBlock/2 |
		aBlock(
			uncheckedFraction(operand, 1L),
			self
		)
	}

	adaptToNumberAndApply { :self :operand :aBlock/2 |
		operand.isInteger.if {
			aBlock(Fraction(LargeInteger(operand), 1L), self)
		} {
			aBlock(operand, SmallFloat(self))
		}
	}

	arithmeticDerivative { :n |
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

	components { :self |
		[
			self.numerator.normal,
			self.denominator.normal
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
				f != 0
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
		(powerMod(10, n, n) = 0).if {
			0
		} {
			let a = 2L ^ n.integerExponent(2);
			let b = 5L ^ n.integerExponent(5);
			let c = n / a / b;
			10.multiplicativeOrder(c)
		}
	}

	dividesImmediately { :self :operand |
		let r = self / operand;
		r.denominator = 1 & {
			r.numerator.isPrime
		}
	}

	engelExpansion { :x |
		let a = [];
		{
			x != 0
		}.whileTrue {
			let y = (1 / x).ceiling;
			a.add!(y);
			x := x * y - 1
		};
		a
	}

	equalBy { :self :anObject :aBlock/2 |
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

	gcd { :self :operand |
		operand.isFraction.if {
			let d = self.denominator.gcd(operand.denominator);
			uncheckedFraction(
				(self.numerator * (operand.denominator // d)).gcd(
					operand.numerator * (self.denominator // d)
				),
				(self.denominator // d * operand.denominator)
			)
		} {
			operand.adaptToFractionAndApply(self, gcd/2)
		}
	}

	Integer { :self |
		LargeInteger(self).normal
	}

	isAdjacentFraction { :self :operand |
		(operand - self).numerator.abs.isOne
	}

	isDyadicRational { :self |
		self.denominator.isPowerOfTwo
	}

	isEven { :self |
		self.isInteger & {
			self.numerator.isEven
		}
	}

	isExact { :unused |
		true
	}

	isFareyPair { :self :operand |
		let [a, b] = self.numeratorDenominator;
		let [c, d] = operand.numeratorDenominator;
		(b * c) - (a * d) = 1
	}

	isFinite { :unused |
		true
	}

	isInteger { :self |
		self.denominator = 1
	}

	isLiteral { :self |
		true
	}

	isNegative { :self |
		self.numerator.isNegative
	}

	isOdd { :self |
		self.isInteger & {
			self.numerator.isOdd
		}
	}

	isPhiWeightedMediantNoble { :self :operand |
		(
			(self.numerator * operand.denominator)
			-
			(self.denominator * operand.numerator)
		).abs = 1
	}

	isPowerOfTwo { :self |
		self.isInteger & {
			self.numerator.isPowerOfTwo
		}
	}

	isRational { :unused |
		true
	}

	isRepeatingDecimal { :self |
		self.decimalPeriod > 0
	}

	isSmallInteger { :self |
		self.isInteger & {
			self.numerator.isSmallInteger
		}
	}

	isSquareSuperparticular { :self |
		self.isSuperparticular & {
			self.numerator.isSquareFree.not
		}
	}

	isSuperpartient { :self |
		self > 1 & { self.isSuperparticular.not }
	}

	isSuperparticular { :self |
		self.numerator - 1 = self.denominator
	}

	isTerminatingDecimal { :self |
		self.decimalPeriod = 0
	}

	isUnitFraction { :self |
		self.numerator = 1
	}

	isVeryCloseTo { :self :operand |
		self = operand
	}

	isZero { :self |
		self.numerator.isZero
	}

	[LargeInteger, fractionToLargeInteger] { :self |
		self.isInteger.if {
			self.numerator
		} {
			self.error('Fraction>>LargeInteger: not integer')
		}
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
				let bound1 = uncheckedFraction(p0 + (k * p1), q0 + (k * q1));
				let bound2 = uncheckedFraction(p1, q1);
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
		a0 + (2 * [1L .. m].sum { :n |
			(-1 ^ (n + 1)) / (2 ^ a.take(n).sum)
		})
	}

	[negate, -] { :self |
		uncheckedFraction(self.numerator.negate, self.denominator)
	}

	normal { :self |
		self.copy.normalize
	}

	normalize { :self |
		(self.denominator = 0).if {
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
		uncheckedFraction(1L, 1L)
	}

	phiWeightedMediant { :self :operand |
		self.weightedMediant(operand, 1, 1.goldenRatio)
	}

	raisedToFraction { :self :operand |
		let rootNumerator = self.numerator.nthRoot(operand.denominator).truncate;
		let rootDenominator = self.denominator.nthRoot(operand.denominator).truncate;
		let root = Fraction(rootNumerator, rootDenominator);
		(root.raisedToInteger(operand.denominator) = self).if {
			root.raisedToInteger(operand.numerator)
		} {
			self.SmallFloat ^ operand.SmallFloat
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

	[Record, fractionToRecord] { :self |
		(
			numerator: self.numerator.Integer,
			denominator: self.denominator.Integer
		)
	}

	[reciprocal, /] { :self |
		(self.numerator.abs = 1).if {
			/* preference: answer proper integer */
			uncheckedFraction(self.denominator * self.numerator, self.denominator.one)
		} {
			Fraction(self.denominator, self.numerator)
		}
	}

	simplify! { :self |
		(self.denominator = 0).if {
			self.error('Fraction>>simplify: zeroDenominatorError')
		} {
			let x = self.numerator * self.denominator.sign;
			let y = self.denominator.abs;
			let d = x.gcd(y);
			self.numerator := x // d;
			self.denominator := y // d;
			(self.denominator = 1).if {
				/* preference: answer proper integer */
				self
			} {
				self
			}
		}
	}

	simplify { :self |
		self.copy.simplify!
	}


	[SmallFloat, Float, fractionToSmallFloat] { :self |
		SmallFloat(self.numerator)
		/
		SmallFloat(self.denominator)
	}

	[SmallInteger, fractionToSmallInteger] { :self |
		SmallInteger(LargeInteger(self))
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
		self.continuedFraction.sum.normal
	}

	sternBrocotParent { :self |
		(self = 1/1).if {
			1/1
		} {
			let c = self.continuedFraction;
			let n = c.size;
			c[n] := c[n] - 1;
			c.fromContinuedFraction
		}
	}

	sternBrocotPath { :self |
		sternBrocotParent/1.nestWhileList(self) { :x |
			x != 1/1
		}
	}

	storeStringLiteral { :self |
		[
			self.numerator.uncheckedPrintString(10),
			self.denominator.uncheckedPrintString(10)
		].stringIntercalate('/')
	}

	storeString { :self |
		self.storeStringLiteral
	}

	sylvesterExpansion { :self |
		let a = [];
		let [x, y] = self.numeratorDenominator;
		(x = 0 | { y = 0 }).if {
			[]
		} {
			{
				x != 0
			}.whileTrue {
				let z = (y / x).ceiling;
				a.add!(Fraction(1, z));
				x := x * z - y;
				y := y * z
			};
			a
		}
	}

	truncate { :self |
		self.numerator.quotient(self.denominator)
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
		uncheckedFraction(0L, 1L)
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

	adaptToFractionAndApply { :self :aFraction :aBlock/2 |
		aBlock(aFraction, Fraction(self, 1L))
	}

	Fraction { :numerator :denominator |
		denominator.isInteger.if {
			uncheckedFraction(numerator, LargeInteger(denominator)).simplify
		} {
			denominator.adaptToIntegerAndApply(numerator, Fraction/2)
		}
	}

	[toFraction, integerToFraction] { :self |
		Fraction(LargeInteger(self), 1L)
	}

	numeratorDenominator { :self |
		[self, 1L]
	}

	[r, \] { :numerator :denominator |
		Fraction(numerator, denominator)
	}

	uncheckedFraction { :numerator :denominator |
		denominator.isInteger.if {
			(denominator = 0).if {
				'@Integer>>uncheckedFraction: zeroDenominatorError'.error
			} {
				newFraction().initializeSlots(
					LargeInteger(numerator),
					LargeInteger(denominator)
				)
			}
		} {
			denominator.adaptToNumberAndApply(numerator, Fraction/2)
		}
	}

}

+@Sequence {

	Fraction { :self :anObject |
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

	lambdomaMatrix { :self |
		let [m, n] = self;
		Fraction/2
		.swap
		.table([1 .. m], [1 .. n])
	}

	[Fraction, listToFraction] { :self |
		self.atVectorOrElementwise { :each |
			let [n, d] = each;
			Fraction(n, d)
		}
	}

}

+SmallFloat {

	adaptToFractionAndApply { :self :operand :aBlock/2 |
		self.isInteger.if {
			aBlock(operand, Fraction(self, self.one))
		} {
			aBlock(operand.SmallFloat, self)
		}
	}

	[rationalize, approximateFraction] { :self :epsilon |
		let c = self.abs.continuedFraction(16);
		let l = c.semiconvergents(epsilon);
		valueWithReturn { :return/1 |
			l.do { :r |
				((self - r).abs < epsilon).ifTrue {
					self.copySign(r).return
				}
			};
			self.copySign(l.last)
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

	parseFractionSeparatedBy { :self :separator :elseClause/0 |
		self.includesSubstring(separator).if {
			let parts = self.splitBy(separator);
			(parts.size = 2).if {
				Fraction(
					parts[1].parseLargeInteger(elseClause/0),
					parts[2].parseLargeInteger(elseClause/0)
				)
			} {
				elseClause()
			}
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
	}

	parseFraction { :self :elseClause/0 |
		self.parseFractionSeparatedBy('/', elseClause/0)
	}

	parseFraction { :self |
		self.parseFraction {
			self.error('parseFraction: parse failed')
		}
	}

}

+[Fraction, SmallFloat] {

	fractionOver { :self :denominator |
		self.isInteger.if {
			uncheckedFraction(LargeInteger(self), 1L)
		} {
			Fraction(
				(self * denominator).round,
				denominator
			)
		}
	}

	decimalFraction { :self :scale |
		self.fractionOver(10L ^ scale)
	}

}

+Record {

	parseFraction { :self |
		Fraction(self['numerator'], self['denominator'])
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


/*

The elementwise forms of numerator and denominator have been edited to answer small integers.
This is a little confusing.
Should numerator and denominator always answer small integers?
Should only the below answer small integers?

+List {

	denominatorList { :self |
		self.denominator.Integer
	}

	numeratorList { :self |
		self.numerator.Integer
	}

}
*/
