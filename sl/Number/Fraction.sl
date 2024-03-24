Fraction : [Object, Magnitude, Number] { | numerator denominator |

	* { :self :aNumber |
		aNumber.isFraction.if {
			let d1 = self.numerator.gcd(aNumber.denominator);
			let d2 = self.denominator.gcd(aNumber.numerator);
			let numerator = (self.numerator // d1) * (aNumber.numerator // d2);
			(d2 = self.denominator & {
				d1 = aNumber.denominator
			}).if {
				{- preference: answer proper integer -}
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
		aNumber.isSmallInteger.if {
			ReducedFraction(self.numerator + (self.denominator * aNumber), self.denominator)
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
					{- preference: answer proper integer -}
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
		aNumber.isSmallInteger.if {
			ReducedFraction(self.numerator - (self.denominator * aNumber), self.denominator)
		} {
			aNumber.isFraction.if {
				self + aNumber.negated
			} {
				aNumber.adaptToFractionAndApply(self, -)
			}
		}
	}

	/ { :self :aNumber |
		aNumber.isSmallInteger.if {
			self * ReducedFraction(1, aNumber)
		} {
			aNumber.isFraction.if {
				self * aNumber.reciprocal
			} {
				aNumber.adaptToFractionAndApply(self, /)
			}
		}
	}

	^ { :self :operand |
		operand.isSmallInteger.if {
			self.raisedToInteger(operand)
		} {
			self.asFloat ^ operand
		}
	}

	= { :self :aFraction |
		aFraction.isFraction & {
			self.numerator = aFraction.numerator & {
				self.denominator = aFraction.denominator
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
		aNumber.isSmallInteger.if {
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

	asTuple { :self |
		(self.numerator, self.denominator)
	}

	closeTo { :self :aNumber |
		self.closeToBy(aNumber, 0.0001)
	}

	closeToBy { :self :aNumber :epsilon |
		self.asFloat.closeToBy(aNumber.asFloat, epsilon)
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

	isInteger { :self |
		self.denominator = 1
	}

	isLiteral { :self |
		true
	}

	isNegative { :self |
		self.numerator.isNegative
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

	printString { :self |
		[self.numerator, '/', self.denominator].join
	}

	raisedToInteger { :self :anInteger |
		(anInteger = 0).if {
			self.one
		} {
			(anInteger < 0).if {
				self.reciprocal.raisedToInteger(anInteger.negated)
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
			{- preference: answer proper integer -}
			ReducedFraction(self.denominator * self.numerator, self.denominator.one)
		} {
			Fraction(self.denominator, self.numerator)
		}
	}

	reduce { :self |
		(self.denominator = 0).if {
			self.error('reduced: zeroDenominatorError')
		} {
			let x = self.numerator * self.denominator.sign;
			let y = self.denominator.abs;
			let d = x.gcd(y);
			self.numerator := x // d;
			self.denominator := y // d;
			(self.denominator = 1).if {
				{- preference: answer proper integer -}
				self
			} {
				self
			}
		}
	}

	reduced { :self |
		self.copy.reduce
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
		].join
	}

	truncated { :self |
		self.numerator.quotient(self.denominator)
	}

	unicode { :self |
		system.unicodeFractionsTable.indexOf(self)
	}

	veryCloseTo { :self :aNumber |
		self = aNumber
	}

	zero { :self |
		ReducedFraction(0, 1)
	}

}

+@Cache {

	unicodeFractionsTable { :self |
		self.cached('unicodeFractionsTable') {
			(
				'⅒': 1/10, {- 0.1 -}
				'⅑': 1/9, {- 1.111 -}
				'⅛': 1/8, {- 0.125 -}
				'⅐': 1/7, {- 0.142 -}
				'⅙': 1/6, {- 0.166 -}
				'⅕': 1/5, {- 0.2 -}
				'¼': 1/4, {- 0.25 -}
				'⅓': 1/3, {- 0.333 -}
				'⅜': 3/8, {- 0.375 -}
				'⅖': 2/5, {- 0.4 -}
				'½': 1/2, {- 0.5 -}
				'⅗': 3/5, {- 0.6 -}
				'⅝': 5/8, {- 0.625 -}
				'⅔': 2/3, {- 0.666-}
				'¾': 3/4, {- 0.75 -}
				'⅘': 4/5, {- 0.8 -}
				'⅚': 5/6, {- 0.833 -}
				'⅞': 7/8 {- 0.875 -}
			)
		}
	}

}

+@Integer {

	ReducedFraction { :numerator :denominator |
		denominator.isInteger.if {
			(denominator = 0).if {
				'@Integer>>ReducedFraction: zeroDenominatorError'.error
			} {
				newFraction().initializeSlots(numerator, denominator)
			}
		} {
			denominator.adaptToNumberAndApply(numerator, Fraction:/2)
		}
	}

	Fraction { :numerator :denominator |
		ReducedFraction(numerator, denominator).reduce
	}

	r { :numerator :denominator |
		Fraction(numerator, denominator)
	}

}

+@Sequence {

	asFraction { :self |
		let [numerator, denominator] = self;
		Fraction(numerator, denominator)
	}

	Fraction { :numerator :denominator |
		numerator.withCollectOrAdaptTo(denominator, Fraction:/2)
	}

	mediant { :self |
		Fraction(
			self.collect(numerator:/1).sum,
			self.collect(denominator:/1).sum
		)
	}

	r { :numerator :denominator |
		Fraction(numerator, denominator)
	}

}

+SmallFloat {

	asApproximateFraction { :self :epsilon |
		self.rationalize(epsilon)
	}

	asFractionOver { :self :denominator |
		self.isSmallInteger.if {
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
		self.isSmallInteger.if {
			ReducedFraction(self, 1)
		} {
			self.rationalize(epsilon)
		}
	}

	rationalize { :self :epsilon |
		let c = self.continuedFraction(16);
		let l = c.semiconvergents(epsilon);
		valueWithReturn { :return:/1 |
			l.do { :r |
				((self - r).abs < epsilon).ifTrue {
					r.return
				}
			};
			l.last
		}
	}


}

+String {

	asNumber { :self |
		self.includes('/'.asCharacter).if {
			self.parseFraction
		} {
			self.parseNumber
		}
	}

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
