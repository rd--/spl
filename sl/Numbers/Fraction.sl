Fraction : [Object, Magnitude, Numeric] { | numerator denominator |

	* { :self :aNumber |
		aNumber.isFraction.if {
			|
			d1 = self.numerator.gcd(aNumber.denominator),
			d2 = self.denominator.gcd(aNumber.numerator);
			|
			(d2 = self.denominator & {
				d1 = aNumber.denominator
			}).if {
				(self.numerator // d1) * (aNumber.numerator // d2)
			} {
				Fraction(
					(self.numerator // d1) * (aNumber.numerator // d2),
					(self.denominator // d2) * (aNumber.denominator // d1)
				).reduced
			}
		} {
			aNumber.adaptToFractionAndApply(self, times:/2)
		}
	}

	+ { :self :aNumber |
		aNumber.isInteger.if {
			Fraction(self.numerator + (self.denominator * aNumber), self.denominator)
		} {
			aNumber.isFraction.if {
				|
				d = self.denominator.gcd(aNumber.denominator),
				d1 = aNumber.denominator // d,
				d2 = self.denominator // d,
				n = (self.numerator * d1) + (aNumber.numerator * d2);
				|
				d1 := d1 * d2;
				d2 := n.gcd(d);
				n := n // d2;
				d := d1 * (d // d2);
				(d = 1).if {
					n
				} {
					Fraction(n, d)
				}
			} {
				aNumber.adaptToFractionAndApply(self, plus:/2)
			}
		}
	}

	- { :self :aNumber |
		aNumber.isInteger.if {
			Fraction(self.numerator - (self.denominator * aNumber), self.denominator)
		} {
			aNumber.isFraction.if {
				self + aNumber.negated
			} {
				aNumber.adaptToFractionAndSend(minus:/2)
			}
		}
	}

	/ { :self :aNumber |
		aNumber.isFraction.if {
			self * aNumber.reciprocal
		} {
			aNumber.adaptToFractionAndSend(dividedBy:/2)
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

	adaptToIntegerAndApply { :self :anInteger :aProcedure:/2 |
		Fraction(anInteger, 1).aProcedure(self)
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aNumber.isInteger.if {
			Fraction(aNumber, 1).aProcedure(self)
		} {
			'Fraction>>adaptToNumberAndApply: not integral'.error
		}
	}

	asFloat { :self |
		self.numerator / self.denominator
	}

	copy { :self |
		Fraction(self.numerator, self.denominator)
	}

	gcd { :self :aFraction |
		| d = self.denominator.gcd(aFraction.denominator); |
		Fraction(
			(self.numerator * (aFraction.denominator // d)).gcd(aFraction.numerator * (self.denominator // d)),
			(self.denominator // d * aFraction.denominator)
		)
	}

	negated { :self |
		Fraction(self.numerator.negated, self.denominator)
	}

	negative { :self |
		self.numerator.negative
	}

	printString { :self |
		self.numerator.printString ++ ':' ++ self.denominator.printString
	}

	reciprocal { :self |
		(self.numerator.abs = 1).if {
			self.denominator * self.numerator
		} {
			Fraction(self.denominator, self.numerator).reduced
		}
	}

	reduce { :self |
		self.copy.reduced
	}

	reduced { :self |
		(self.denominator = 0).if {
			'Fraction>>reduce: zeroDenominatorError'.error
		} {
			|
				x = self.numerator * self.denominator.sign,
				y = self.denominator.abs,
				d = x.gcd(y);
			|
			self.numerator := x // d;
			self.denominator := y // d;
			self
		}
	}

	truncated { :self |
		self.numerator.quotient(self.denominator)
	}

}

+ @Integral {

	Fraction { :numerator :denominator |
		(denominator = 0).if {
			'Integral>>Fraction: zeroDenominatorError'.error
		} {
			newFraction().initializeSlots(numerator, denominator)
		}
	}

}
