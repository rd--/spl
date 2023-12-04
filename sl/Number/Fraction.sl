Fraction : [Object, Magnitude, Number] { | numerator denominator |

	* { :self :aNumber |
		aNumber.isFraction.if {
			|(
				d1 = self.numerator.gcd(aNumber.denominator),
				d2 = self.denominator.gcd(aNumber.numerator),
				numerator = (self.numerator // d1) * (aNumber.numerator // d2)
			)|
			(
				d2 = self.denominator & {
					d1 = aNumber.denominator
				}
			).if {
				(* preference: answer proper integer *)
				Fraction(numerator, numerator.one)
			} {
				Fraction(
					numerator,
					(self.denominator // d2) * (aNumber.denominator // d1)
				).normalized
			}
		} {
			aNumber.adaptToFractionAndApply(self, times:/2)
		}
	}

	+ { :self :aNumber |
		aNumber.isSmallInteger.if {
			Fraction(self.numerator + (self.denominator * aNumber), self.denominator)
		} {
			aNumber.isFraction.if {
				|(
					d = self.denominator.gcd(aNumber.denominator),
					d1 = aNumber.denominator // d,
					d2 = self.denominator // d,
					n = (self.numerator * d1) + (aNumber.numerator * d2)
				)|
				d1 := d1 * d2;
				d2 := n.gcd(d);
				n := n // d2;
				d := d1 * (d // d2);
				(d = 1).if {
					(* preference: answer proper integer *)
					Fraction(n, n.one)
				} {
					Fraction(n, d)
				}
			} {
				aNumber.adaptToFractionAndApply(self, plus:/2)
			}
		}
	}

	- { :self :aNumber |
		aNumber.isSmallInteger.if {
			Fraction(self.numerator - (self.denominator * aNumber), self.denominator)
		} {
			aNumber.isFraction.if {
				self + aNumber.negated
			} {
				aNumber.adaptToFractionAndApply(self, minus:/2)
			}
		}
	}

	/ { :self :aNumber |
		aNumber.isSmallInteger.if {
			self * Fraction(1, aNumber)
		} {
			aNumber.isFraction.if {
				self * aNumber.reciprocal
			} {
				aNumber.adaptToFractionAndApply(self, dividedBy:/2)
			}
		}
	}

	^ { :self :anInteger |
		anInteger.isSmallInteger.if {
			self.raisedToInteger(anInteger)
		} {
			self.error('^ not an integer')
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
			aNumber.adaptToFractionAndApply(self, lessThan:/2)
		}
	}

	<= { :self :aNumber |
		aNumber.isFraction.if {
			(self.numerator * aNumber.denominator) <= (aNumber.numerator * self.denominator)
		} {
			aNumber.adaptToFractionAndApply(self, lessThanEquals:/2)
		}
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :each |
			aBlock(each, self)
		}
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock:/2 |
		Fraction(anInteger, 1).aBlock(self)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.isSmallInteger.if {
			aNumber.asFraction.aBlock(self)
		} {
			aNumber.aBlock(self.asFloat)
		}
	}

	asFloat { :self |
		self.numerator / self.denominator
	}

	asFraction { :self |
		self
	}

	closeTo { :self :aNumber |
		self.asFloat.closeToBy(aNumber.asFloat, 0.0001)
	}

	gcd { :self :aFraction |
		| d = self.denominator.gcd(aFraction.denominator); |
		Fraction(
			(self.numerator * (aFraction.denominator // d)).gcd(aFraction.numerator * (self.denominator // d)),
			(self.denominator // d * aFraction.denominator)
		)
	}

	isInteger { :self |
		self.denominator = 1
	}

	lcm { :self :n |
		self // self.gcd(n) * n
	}

	limitDenominator { :self :maxDenominator |
		(maxDenominator < 1).if {
			self.error('limitDenominator: illegal maxDenominator')
		} {
			(self.denominator <= maxDenominator).if {
				self
			} {
				|(
					p0 = 0, q0 = 1, p1 = 1, q1 = 0,
					n = self.numerator, d = self.denominator,
					continue = true,
					k = nil, bound1 = nil, bound2 = nil
				)|
				{ continue }.whileTrue {
					|(
						a = n // d,
						q2 = q0 + (a * q1)
					)|
					(q2 > maxDenominator).if {
						continue := false
					} {
						[p0, q0, p1, q1, n, d] := [p1, q1, p0 + (a * p1), q2, d, n - (a * d)]
					}
				};
				k := (maxDenominator - q0) // q1;
				bound1 := Fraction(p0 + (k * p1), q0 + (k * q1));
				bound2 := Fraction(p1, q1);
				((bound2 - self).abs <= (bound1 - self).abs).if {
					bound2
				} {
					bound1
				}
			}
		}
	}

	negated { :self |
		Fraction(self.numerator.negated, self.denominator)
	}

	negative { :self |
		self.numerator.negative
	}

	normalize { :self |
		self.copy.normalized
	}

	normalized { :self |
		(self.denominator = 0).if {
			self.error('normalized: zeroDenominatorError')
		} {
			|(
				x = self.numerator * self.denominator.sign,
				y = self.denominator.abs,
				d = x.gcd(y)
			)|
			self.numerator := x // d;
			self.denominator := y // d;
			self
		}
	}

	one { :self |
		Fraction(1, 1)
	}

	primeFactors { :self |
		self.numerator.primeFactors ++ self.denominator.primeFactors.collect { :each |
			Fraction(1, each)
		}
	}

	primeFactorization { :self |
		|(
			n = self.numerator.primeFactors.asBag.sortedElements,
			d = self.denominator.primeFactors.asBag.sortedElements.collect { :each |
				each.key -> each.value.negated
			}
		)|
		(n ++ d).sorted
	}

	primeLimit { :self |
		self.numerator.primeLimit.max(self.denominator.primeLimit)
	}

	printString { :self |
		[self.numerator, ':', self.denominator].join
	}

	raisedToInteger { :self :anInteger |
		(anInteger = 0).if {
			1
		} {
			(anInteger < 0).if {
				self.reciprocal.raisedToInteger(anInteger.negated)
			} {
				Fraction(
					self.numerator.raisedToInteger(anInteger),
					self.denominator.raisedToInteger(anInteger)
				)
			}
		}
	}

	reciprocal { :self |
		(self.numerator.abs = 1).if {
			(* preference: answer proper integer *)
			Fraction(self.denominator * self.numerator, self.denominator.one)
		} {
			Fraction(self.denominator, self.numerator).normalized
		}
	}

	reduce { :self |
		self.copy.reduced
	}

	reduced { :self |
		(self.denominator = 0).if {
			self.error('reduced: zeroDenominatorError')
		} {
			|(
				x = self.numerator * self.denominator.sign,
				y = self.denominator.abs,
				d = x.gcd(y)
			)|
			self.numerator := x // d;
			self.denominator := y // d;
			(self.denominator = 1).if {
				(* preference: answer proper integer *)
				self
			} {
				self
			}
		}
	}

	asSmallFloat { :self |
		self.asFloat
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

	zero { :self |
		Fraction(0, 1)
	}

}

+@Cache {

	unicodeFractionsTable { :self |
		self.cached('unicodeFractionsTable') {
			(
				'⅒': 1:10, (* 0.1 *)
				'⅑': 1:9, (* 1.111 *)
				'⅛': 1:8, (* 0.125 *)
				'⅐': 1:7, (* 0.142 *)
				'⅙': 1:6, (* 0.166 *)
				'⅕': 1:5, (* 0.2 *)
				'¼': 1:4, (* 0.25 *)
				'⅓': 1:3, (* 0.333 *)
				'⅜': 3:8, (* 0.375 *)
				'⅖': 2:5, (* 0.4 *)
				'½': 1:2, (* 0.5 *)
				'⅗': 3:5, (* 0.6 *)
				'⅝': 5:8, (* 0.625 *)
				'⅔': 2:3, (* 0.666*)
				'¾': 3:4, (* 0.75 *)
				'⅘': 4:5, (* 0.8 *)
				'⅚': 5:6, (* 0.833 *)
				'⅞': 7:8 (* 0.875 *)
			)
		}
	}

}

+@Integer {

	Fraction { :self :denominator |
		(denominator = 0).if {
			self.error('@Integer>>Fraction: zeroDenominatorError')
		} {
			newFraction().initializeSlots(self, denominator)
		}
	}

}

+SmallFloat {

	asFraction { :self |
		self.asFraction(100)
	}

	asFraction { :self :maxDenominator |
		self.isSmallInteger.if {
			Fraction(self, 1)
		} {
			| k = 10 ^ (maxDenominator.log10.ceiling + 1); |
			Fraction((self * k).rounded, k).reduced.limitDenominator(maxDenominator)
		}
	}

}

+String {

	asNumber { :self |
		self.includes(':'.asCharacter).if {
			self.parseFraction
		} {
			self.parseNumber
		}
	}

	parseFraction { :self :separator |
		self.includesSubstring(separator).if {
			| parts = self.splitBy(separator); |
			(parts.size = 2).if {
				Fraction(parts[1].parseInteger(10), parts[2].parseInteger(10))
			} {
				self.error('parseFraction: parse failed')
			}
		} {
			Fraction(self.parseInteger(10), 1)
		}
	}

	parseFraction { :self |
		self.parseFraction(':')
	}

}
