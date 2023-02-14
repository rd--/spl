@Integral {

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

	nextPrime { :self |
		| maybePrime = self + 1; |
		whileTrue { maybePrime.isPrime.not } {
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
