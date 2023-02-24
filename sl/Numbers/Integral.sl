@Integral {

	gcd { :self :anInteger |
		| a = self.abs, b = anInteger.abs; |
		{ b = 0 }.whileFalse {
			| r = a % b; |
			a := b;
			b := r
		};
		a
	}

	isByte { :self |
		self.isInteger & {
			self >= 0 & {
				self < 256
			}
		}
	}

	isInteger { :self |
		self.subclassResponsibility
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

	lcm { :self :anInteger |
		| a = self, b = anInteger; |
		(a = 0 | {
			b = 0
		}).if {
			0
		} {
			| ab = a * b; |
			{ b = 0}.whileFalse {
				| t = b; |
				b := a % t;
				a := t
			};
			(ab / a).abs
		}
	}

	nextPrime { :self |
		| maybePrime = self + 1; |
		{ maybePrime.isPrime.not }.whileTrue {
			maybePrime := maybePrime + 1
		};
		maybePrime
	}

	timesRepeat { :self :aProcedure:/0 |
		| remaining = self; |
		{ remaining > 0 }.whileTrue {
			aProcedure();
			remaining := remaining - 1
		}
	}

}

+ @Object {

	isByte { :self |
		false
	}

	isInteger { :self |
		false
	}

}
