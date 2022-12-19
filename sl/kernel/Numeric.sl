@Numeric {

	// { :self :anObject |
		self.quotient(anObject)
	}

	bitShiftLeft { :self :anObject |
		self << anObject
	}

	bitShiftRight { :self :anObject |
		self >> anObject
	}

	cubed { :self |
		self * self * self
	}

	do { :self :aProcedure |
		toDo(1, self, aProcedure)
	}

	isByte { :self |
		self.isInteger & { self >= 0 } & { self < 256 }
	}

	isPrime { :self |
		| i = 2; |
		withReturn {
			{ i * i <= self }.whileTrue  {
				(self.remainder(i) = 0).ifTrue { return(false) };
				i := i + 1
			};
			true
		}
	}

	negated { :self |
		0 - self
	}

	nextPrime { :self |
		| maybePrime = self + 1; |
		whileTrue { maybePrime.isPrime.not } {
			maybePrime := maybePrime + 1
		};
		maybePrime
	}

	pow { :self :anObject |
		self ** anObject
	}

	quotient { :self :anObject |
		(self / anObject).floor
	}

	reciprocal { :self |
		1 / self
	}

	roundTo { :self :quantum |
		(self / quantum).rounded * quantum
	}

	squared { :self |
		self * self
	}

	timesRepeat { :self :aProcedure |
		| remaining = self; |
		whileTrue { remaining > 0 } {
			aProcedure.value;
			remaining := remaining - 1
		}
	}

	toDo { :self :end :aProcedure |
		| index = self; |
		whileTrue { index <= end } {
			aProcedure.value(index);
			index := index + 1
		}
	}

	truncateTo { :self :aNumber |
		self.quotient(aNumber) * aNumber
	}

}
