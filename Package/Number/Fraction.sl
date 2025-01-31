Fraction : [Object, Magnitude, Number] { | numerator denominator |

	= { :self :anObject |
		anObject.isNumber.if {
			anObject.isFraction.if {
				self.numerator = anObject.numerator & {
					self.denominator = anObject.denominator
				}
			} {
				anObject.adaptToFractionAndApply(self, =)
			}
		} {
			false
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
		aNumber.isInteger.if {
			ReducedFraction(
				self.numerator + (self.denominator * aNumber.asInteger),
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
		aNumber.isInteger.if {
			ReducedFraction(
				self.numerator - (self.denominator * aNumber.asInteger),
				self.denominator
			)
		} {
			aNumber.isFraction.if {
				self + aNumber.negated
			} {
				aNumber.adaptToFractionAndApply(self, -)
			}
		}
	}

	/ { :self :aNumber |
		aNumber.isInteger.if {
			self * ReducedFraction(1, aNumber.asInteger)
		} {
			aNumber.isFraction.if {
				self * aNumber.reciprocal
			} {
				aNumber.adaptToFractionAndApply(self, /)
			}
		}
	}

	^ { :self :aNumber |
		aNumber.isInteger.if {
			self.raisedToInteger(aNumber)
		} {
			aNumber.isFraction.if {
				self.asFloat ^ aNumber.asFloat
			} {
				aNumber.adaptToFractionAndApply(self, ^)
			}
		}
	}

	< { :self :aNumber |
		aNumber.isFraction.if {
			(self.numerator * aNumber.denominator) < (aNumber.numerator * self.denominator)
		} {
			aNumber.adaptToFractionAndApply(self, <)
		}
	}

	<= { :self :aNumber |
		aNumber.isFraction.if {
			(self.numerator * aNumber.denominator) <= (aNumber.numerator * self.denominator)
		} {
			aNumber.adaptToFractionAndApply(self, <=)
		}
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :each |
			aBlock(each, self)
		}
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock:/2 |
		ReducedFraction(anInteger, 1).aBlock(self)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.isInteger.if {
			aNumber.asFraction.aBlock(self)
		} {
			aNumber.aBlock(self.asFloat)
		}
	}

	asFloat { :self |
		self.numerator.asFloat / self.denominator.asFloat
	}

	asFraction { :self |
		self
	}

	asSmallFloat { :self |
		self.asFloat
	}

	asList { :self |
		[self.numerator, self.denominator]
	}

	asTuple { :self |
		(self.numerator, self.denominator)
	}

	dividesImmediately { :self :aNumber |
		let r = self / aNumber;
		r.denominator = 1 & {
			r.numerator.isPrime
		}
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

	isCloseTo { :self :aNumber |
		self.isCloseToBy(aNumber, 0.0001)
	}

	isCloseToBy { :self :aNumber :epsilon |
		self.asFloat.isCloseToBy(aNumber.asFloat, epsilon)
	}

	isFareyPair { :self :aFraction |
		let [a, b] = self.asTuple;
		let [c, d] = aFraction.asTuple;
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

	isSquareSuperparticular { :self |
		self.isSuperparticular & {
			self.numerator.isSquareFree.not
		}
	}

	isSuperparticular { :self |
		self.numerator - 1 = self.denominator
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

	mediant { :self :aFraction |
		Fraction(
			self.numerator + aFraction.numerator,
			self.denominator + aFraction.denominator
		)
	}

	negated { :self |
		ReducedFraction(self.numerator.negated, self.denominator)
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

	normalized { :self |
		self.copy.normalize
	}

	one { :self |
		ReducedFraction(1, 1)
	}

	parts { :self |
		[self.numerator, self.denominator]
	}

	phiWeightedMediant { :self :aFraction |
		self.weightedMediant(aFraction, 1, 1.goldenRatio)
	}

	printString { :self |
		[
			self.numerator.printString,
			self.denominator.printString
		].join('/')
	}

	raisedToInteger { :self :anInteger |
		anInteger.isZero.if {
			self.one
		} {
			(anInteger < 0).if {
				self.reciprocal.raisedToInteger(anInteger.negated)
			} {
				let n = anInteger.asInteger;
				ReducedFraction(
					self.numerator.raisedToInteger(n),
					self.denominator.raisedToInteger(n)
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
			'Fraction(',
			self.numerator.storeString,
			', ',
			self.denominator.storeString,
			')'
		].join('')
	}

	truncated { :self |
		self.numerator.quotient(self.denominator)
	}

	unicode { :self |
		system.unicodeFractionsTable.indexOf(self)
	}

	weightedMediant { :self :aFraction :m :n |
		let a = self.numerator;
		let b = self.denominator;
		let c = aFraction.numerator;
		let d = aFraction.denominator;
		((m * a) + (n * c)) / ((m * b) + (n * d))
	}

	zero { :self |
		ReducedFraction(0, 1)
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
		aFraction.aBlock(Fraction(self, self.one))
	}

	ReducedFraction { :numerator :denominator |
		denominator.isInteger.if {
			(denominator = 0).if {
				'@Integer>>ReducedFraction: zeroDenominatorError'.error
			} {
				newFraction().initializeSlots(
					numerator.asInteger,
					denominator.asInteger
				)
			}
		} {
			denominator.adaptToNumberAndApply(numerator, Fraction:/2)
		}
	}

	Fraction { :numerator :denominator |
		denominator.isInteger.if {
			ReducedFraction(numerator, denominator).simplify
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
			aFraction.aBlock(each)
		}
	}

}

+@Sequence {

	Fraction { :self |
		(self.size = 2).if {
			Fraction(self[1], self[2])
		} {
			self.error('@Sequence>>Fraction: invalid size')
		}
	}

}

+SmallFloat {

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		self.isInteger.if {
			aFraction.aBlock(Fraction(self, self.one))
		} {
			aFraction.asSmallFloat.aBlock(self)
		}
	}

	asApproximateFraction { :self :epsilon |
		self.rationalize(epsilon)
	}

	asFractionOver { :self :denominator |
		self.isInteger.if {
			ReducedFraction(self, 1)
		} {
			Fraction(
				(self * denominator).rounded,
				denominator
			)
		}
	}

	asFraction { :self |
		self.asFraction(1E-5)
	}

	asFraction { :self :epsilon |
		self.isInteger.if {
			ReducedFraction(self, 1)
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

+String {

	parseFraction { :self :separator |
		self.includesSubstring(separator).if {
			let parts = self.splitBy(separator);
			(parts.size = 2).if {
				Fraction(parts[1].parseInteger(10), parts[2].parseInteger(10))
			} {
				self.error('parseFraction: parse failed')
			}
		} {
			ReducedFraction(self.parseInteger(10), 1)
		}
	}

	parseFraction { :self |
		self.parseFraction('/')
	}

}
