Fraction : [Object, Equatable, Comparable, Magnitude, Number] { | numerator denominator |

	< { :self :aNumber |
		aNumber.isFraction.if {
			(self.numerator * aNumber.denominator) < (aNumber.numerator * self.denominator)
		} {
			aNumber.adaptToFractionAndApply(self, <)
		}
	}

	* { :self :aNumber |
		aNumber.isFraction.if {
			let d1 = self.numerator.gcd(aNumber.denominator);
			let d2 = self.denominator.gcd(aNumber.numerator);
			let numerator = (self.numerator // d1) * (aNumber.numerator // d2);
			(d2 = self.denominator & {
				d1 = aNumber.denominator
			}).if {
				/* preference: answer proper integer */
				ReducedFraction(numerator, numerator.one)
			} {
				Fraction(
					numerator,
					(self.denominator // d2) * (aNumber.denominator // d1)
				)
			}
		} {
			aNumber.adaptToFractionAndApply(self, *)
		}
	}

	+ { :self :aNumber |
		aNumber.isScalarInteger.if {
			ReducedFraction(
				self.numerator + (self.denominator * aNumber.asLargeInteger),
				self.denominator
			)
		} {
			aNumber.isFraction.if {
				let d = self.denominator.gcd(aNumber.denominator);
				let d1 = aNumber.denominator // d;
				let d2 = self.denominator // d;
				let n = (self.numerator * d1) + (aNumber.numerator * d2);
				d1 := d1 * d2;
				d2 := n.gcd(d);
				n := n // d2;
				d := d1 * (d // d2);
				(d = 1).if {
					/* preference: answer proper integer */
					ReducedFraction(n, n.one)
				} {
					ReducedFraction(n, d)
				}
			} {
				aNumber.adaptToFractionAndApply(self, +)
			}
		}
	}

	- { :self :aNumber |
		aNumber.isScalarInteger.if {
			ReducedFraction(
				self.numerator - (self.denominator * aNumber.asLargeInteger),
				self.denominator
			)
		} {
			aNumber.isFraction.if {
				self + aNumber.negate
			} {
				aNumber.adaptToFractionAndApply(self, -)
			}
		}
	}

	/ { :self :aNumber |
		aNumber.isScalarInteger.if {
			self * ReducedFraction(1, aNumber.asLargeInteger)
		} {
			aNumber.isFraction.if {
				self * aNumber.reciprocal
			} {
				aNumber.adaptToFractionAndApply(self, /)
			}
		}
	}

	^ { :self :aNumber |
		aNumber.isScalarInteger.if {
			self.raisedToInteger(aNumber.asInteger)
		} {
			aNumber.isFraction.if {
				self.isNegative.if {
					Complex(self.asFloat, 0) ^ aNumber
				} {
					self.raisedToFraction(aNumber)
				}
			} {
				aNumber.adaptToFractionAndApply(self, ^)
			}
		}
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock:/2 |
		aBlock(
			ReducedFraction(anInteger, 1L),
			self
		)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.isScalarInteger.if {
			aBlock(aNumber.asFraction, self)
		} {
			aBlock(aNumber, self.asFloat)
		}
	}

	asFloat { :self |
		self.numerator.asFloat / self.denominator.asFloat
	}

	asFraction { :self |
		self
	}

	asInteger { :self |
		self.asLargeInteger.asInteger
	}

	asLargeInteger { :self |
		self.isInteger.if {
			self.numerator
		} {
			self.error('Fraction>>asLargeInteger: not integer')
		}
	}

	asSmallFloat { :self |
		self.asFloat
	}

	asSmallInteger { :self |
		self.asLargeInteger.asSmallInteger
	}

	asRecord { :self |
		(
			numerator: self.numerator.asInteger,
			denominator: self.denominator.asInteger
		)
	}

	components { :self |
		[
			self.numerator.asInteger,
			self.denominator.asInteger
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
				answer.add(i);
				f := 1 / f;
				i := f.integerPart;
				f := f - i
			};
			answer.add(i);
			answer
		}
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

	dividesImmediately { :self :aNumber |
		let r = self / aNumber;
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
			a.add(y);
			x := x * y - 1
		};
		a
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isNumber.if {
			anObject.isFraction.if {
				self.numerator = anObject.numerator & {
					self.denominator = anObject.denominator
				}
			} {
				anObject.adaptToFractionAndApply(self, aBlock:/2)
			}
		} {
			false
		}
	}

	exp { :self |
		self.asFloat.exp
	}

	gcd { :self :aFraction |
		aFraction.isFraction.if {
			let d = self.denominator.gcd(aFraction.denominator);
			ReducedFraction(
				(self.numerator * (aFraction.denominator // d)).gcd(
					aFraction.numerator * (self.denominator // d)
				),
				(self.denominator // d * aFraction.denominator)
			)
		} {
			aFraction.adaptToFractionAndApply(self, lcm:/2)
		}
	}

	isAdjacentFraction { :self :operand |
		(operand - self).numerator.abs.isOne
	}

	isCloseToBy { :self :aNumber :epsilon |
		self.asFloat.isCloseToBy(aNumber.asFloat, epsilon)
	}

	isDyadicRational { :self |
		self.denominator.isPowerOfTwo
	}

	isExact { :unused |
		true
	}

	isFareyPair { :self :aFraction |
		let [a, b] = self.numeratorDenominator;
		let [c, d] = aFraction.numeratorDenominator;
		(b * c) - (a * d) = 1
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

	isPhiWeightedMediantNoble { :self :aFraction |
		(
			(self.numerator * aFraction.denominator)
			-
			(self.denominator * aFraction.numerator)
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

	isUnitFraction { :self |
		self.numerator = 1
	}

	isVeryCloseTo { :self :aNumber |
		self = aNumber
	}

	isZero { :self |
		self.numerator.isZero
	}

	lcm { :self :aFraction |
		aFraction.isFraction.if {
			self // self.gcd(aFraction) * aFraction
		} {
			aFraction.adaptToFractionAndApply(self, lcm:/2)
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
				let k = nil;
				let bound1 = nil;
				let bound2 = nil;
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
				k := (maxDenominator - q0) // q1;
				bound1 := ReducedFraction(p0 + (k * p1), q0 + (k * q1));
				bound2 := ReducedFraction(p1, q1);
				((bound2 - self).abs <= (bound1 - self).abs).if {
					bound2
				} {
					bound1
				}
			}
		}
	}

	log { :self |
		self.asFloat.log
	}

	log2 { :self |
		self.asFloat.log2
	}

	log10 { :self |
		self.asFloat.log10
	}

	mediant { :self :aFraction |
		Fraction(
			self.numerator + aFraction.numerator,
			self.denominator + aFraction.denominator
		)
	}

	minkowskiQuestionMark { :self |
		let a = self.continuedFraction;
		let a0 = a.removeFirst;
		let m = a.size;
		a0 + (2 * [1L .. m].sum { :n |
			(-1 ^ (n + 1)) / (2 ^ a.take(n).sum)
		})
	}

	negate { :self |
		ReducedFraction(self.numerator.negate, self.denominator)
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
		ReducedFraction(1L, 1L)
	}

	phiWeightedMediant { :self :aFraction |
		self.weightedMediant(aFraction, 1, 1.goldenRatio)
	}

	printStringToFixed { :self :anInteger |
		self.asFloat.printStringToFixed(anInteger)
	}

	raisedToFraction { :self :aFraction |
		let rootNumerator = self.numerator.nthRoot(aFraction.denominator).truncate;
		let rootDenominator = self.denominator.nthRoot(aFraction.denominator).truncate;
		let root = Fraction(rootNumerator, rootDenominator);
		(root.raisedToInteger(aFraction.denominator) = self).if {
			root.raisedToInteger(aFraction.numerator)
		} {
			self.asFloat ^ aFraction.asFloat
		}
	}

	raisedToInteger { :self :anInteger |
		anInteger.isZero.if {
			self.one
		} {
			(anInteger < 0).if {
				self.reciprocal.raisedToInteger(anInteger.negate)
			} {
				ReducedFraction(
					self.numerator.raisedToInteger(anInteger),
					self.denominator.raisedToInteger(anInteger)
				)
			}
		}
	}

	reciprocal { :self |
		(self.numerator.abs = 1).if {
			/* preference: answer proper integer */
			ReducedFraction(self.denominator * self.numerator, self.denominator.one)
		} {
			Fraction(self.denominator, self.numerator)
		}
	}

	simplify { :self |
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

	simplified { :self |
		self.copy.simplify
	}

	sqrt { :self |
		self.asFloat.sqrt
	}

	storeString { :self |
		[
			self.numerator.basicPrintString(10),
			self.denominator.basicPrintString(10)
		].stringIntercalate('/')
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
				a.add([1 z]);
				x := x * z - y;
				y := y * z
			};
			a.collect(Fraction:/1)
		}
	}

	truncate { :self |
		self.numerator.quotient(self.denominator)
	}

	unicodeFraction { :self |
		system.unicodeFractionsTable.indexOf(self)
	}

	weightedMediant { :self :aFraction :m :n |
		let a = self.numerator;
		let b = self.denominator;
		let c = aFraction.numerator;
		let d = aFraction.denominator;
		(m.isFraction && n.isFraction).if {
			((m * a) + (n * c)) / ((m * b) + (n * d))
		} {
			((m * a.asFloat) + (n * c.asFloat)) / ((m * b.asFloat) + (n * d.asFloat))
		}
	}

	zero { :self |
		ReducedFraction(0L, 1L)
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

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		aBlock(aFraction, Fraction(self, self.one))
	}

	ReducedFraction { :numerator :denominator |
		denominator.isScalarInteger.if {
			(denominator = 0).if {
				'@Integer>>ReducedFraction: zeroDenominatorError'.error
			} {
				newFraction().initializeSlots(
					numerator.asLargeInteger,
					denominator.asLargeInteger
				)
			}
		} {
			denominator.adaptToNumberAndApply(numerator, Fraction:/2)
		}
	}

	Fraction { :numerator :denominator |
		denominator.isScalarInteger.if {
			ReducedFraction(
				numerator.asLargeInteger,
				denominator.asLargeInteger
			).simplify
		} {
			denominator.adaptToNumberAndApply(numerator, Fraction:/2)
		}
	}

	r { :numerator :denominator |
		Fraction(numerator, denominator)
	}

}

+@Collection {

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		self.collect { :each |
			aBlock(aFraction, each)
		}
	}

}

+List {

	Fraction { :self |
		(self.size = 2).if {
			Fraction(self[1], self[2])
		} {
			self.error('List>>Fraction: invalid size')
		}
	}

}

+SmallFloat {

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		self.isInteger.if {
			aBlock(aFraction, Fraction(self, self.one))
		} {
			aBlock(aFraction.asSmallFloat, self)
		}
	}

	asApproximateFraction { :self :epsilon |
		self.rationalize(epsilon)
	}

	asFraction { :self |
		self.asFraction(1E-5)
	}

	asFraction { :self :epsilon |
		self.isInteger.if {
			ReducedFraction(self, 1L)
		} {
			self.rationalize(epsilon)
		}
	}

	rationalize { :self :epsilon |
		let c = self.abs.continuedFraction(16);
		let l = c.semiconvergents(epsilon);
		valueWithReturn { :return:/1 |
			l.do { :r |
				((self - r).abs < epsilon).ifTrue {
					self.copySignTo(r).return
				}
			};
			self.copySignTo(l.last)
		}
	}


}

+LargeInteger {

	asFraction { :self |
		Fraction(self, 1L)
	}

}

+String {

	isFractionString { :self |
		self.matchesRegularExpression('^[-]?[0-9]+/[0-9]+$')
	}

	parseFractionSeparatedBy { :self :separator :elseClause:/0 |
		self.includesSubstring(separator).if {
			let parts = self.splitBy(separator);
			(parts.size = 2).if {
				Fraction(
					parts[1].parseLargeInteger(elseClause:/0),
					parts[2].parseLargeInteger(elseClause:/0)
				)
			} {
				elseClause()
			}
		} {
			self.isDecimalIntegerString.if {
				ReducedFraction(
					self.parseLargeInteger,
					1L
				)
			} {
				elseClause()
			}
		}
	}

	parseFraction { :self :elseClause:/0 |
		self.parseFractionSeparatedBy('/', elseClause:/0)
	}

	parseFraction { :self |
		self.parseFraction {
			self.error('parseFraction: parse failed')
		}
	}

}

+[Fraction, SmallFloat] {

	asDecimalFraction { :self :places |
		self.asFractionOver(10L ^ places)
	}

	asFractionOver { :self :denominator |
		self.isInteger.if {
			ReducedFraction(self, 1L)
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
		Fraction(self['numerator'], self['denominator'])
	}

}
