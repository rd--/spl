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
			{ i * i <= self }.while  {
				(self.remainder(i) = 0).ifTrue { return(false) };
				i := i + 1
			};
			true
		}
	}

	modulo { :self :aNumber |
		self % aNumber
	}

	negated { :self |
		0 - self
	}

	nextPrime { :self |
		| maybePrime = self + 1; |
		while { maybePrime.isPrime.not } {
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

	toDo { :self :end :aProcedure |
		| index = self; |
		while { index <= end } {
			aProcedure(index);
			index := index + 1
		}
	}

	truncateTo { :self :aNumber |
		self.quotient(aNumber) * aNumber
	}

}
