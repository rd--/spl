@Integral {

	adaptToFractionAndApply { :self :aFraction :aProcedure:/2 |
		aFraction.aProcedure(Fraction(self, 1))
	}

	asHexDigit { :self |
		'0123456789ABCDEF'[self + 1]
	}

	asWords { :self |
		|(
			mils = [
				'', ' thousand',
				' million', ' billion', ' trillion', ' quadrillion', ' quintillion',
				' sextillion', ' septillion', ' octillion', ' nonillion', ' decillion',
				' undecillion', ' duodecillion', ' tredecillion', ' quattuordecillion', ' quindecillion',
				' sexdecillion', ' septendecillion', ' octodecillion', ' novemdecillion', ' vigintillion'
			]
		)|
		(self = 0).if {
			'zero'
		} {
			| minus = '', three = nil, num = self, answer = '', milCount = 1; |
			(self < 0).ifTrue {
				minus := 'negative ';
				num := self.negated
			};
			{ num > 0 }.whileTrue {
				three := (num % 1000).threeDigitName;
				num := num // 1000;
				three.isEmpty.ifFalse {
					answer.isEmpty.ifFalse {
						answer := ', ' ++ answer
					};
					answer := three ++ mils[milCount] ++ answer
				};
				milCount := milCount + 1
			};
			minus ++ answer
		}
	}

	atRandomBy { :self :random |
		random.randomInteger(self)
	}

	atRandom { :self |
		system.randomInteger(self)
	}

	denominator { :self |
		1
	}

	divisors { :self |
		1.to(self).select { :each |
			self \\ each = 0
		}
	}

	doubleFactorial { :self |
		self.negative.if {
			self.error('@Integral>>doubleFactorial: not valid for negative integers')
		} {
			(self <= 3).if {
				self.max(1)
			} {
				self * (self - 2).doubleFactorial
			}
		}
	}

	factorial { :self |
		self.negative.ifTrue {
			'@Integral>>factorial: not valid for negative integers'.error
		};
		(self <= 1).if {
			1
		} {
			| next = self, answer = self; |
			{ next > 1 }.whileTrue {
				next := next - 1;
				answer := answer * next
			};
			answer
		}
	}

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

	isCoprime { :self :anInteger |
		self.gcd(anInteger) = 1
	}

	isInteger { :self |
		self.typeResponsibility('@Integral>>isInteger')
	}

	isPrime { :self |
		(self <= 1).if {
			false
		} {
			(self = 2).if {
				true
			} {
				| selfSqrt = self.sqrt, i = 2; |
				valueWithReturn { :return:/1 |
					{ i <= selfSqrt }.whileTrue {
						(self % i = 0).ifTrue {
							false.return
						};
						i := i + 1
					};
					true.return
				}
			}
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

	nthPrime { :self |
		| primesArray = system.primesArray; |
		(self > primesArray.size).if {
			self.primesArrayExtend(primesArray)
		} {
			primesArray[self]
		}
	}

	primeFactors { :self |
		(self <= 1).if {
			[].return
		} {
			valueWithReturn { :return:/1 |
				| index = 1, prime = 2, k = self, answer = []; |
				{
					prime := index.nthPrime;
					{
						k % prime = 0
					}.whileTrue {
						answer.add(prime);
						k := k // prime;
						(k = 1).ifTrue {
							answer.return
						}
					};
					(prime.squared > k).ifTrue {
						answer.add(k);
						answer.return
					};
					index := index + 1
				}.repeat;
				answer
			}
		}
	}

	primeFactorization { :self |
		self.primeFactors.Bag
	}

	primeLimit { :self |
		self.primeFactors.max
	}

	primesArray { :self |
		| answer = Array(self), n = 1; |
		answer.indicesDo { :index |
			n := n.nextPrime;
			answer[index] := n
		};
		answer
	}

	primesArrayExtend { :self :anArray |
		| n = anArray.last; |
		(self - anArray.size).timesRepeat {
			n := n.nextPrime;
			anArray.add(n)
		};
		n
	}

	primesUpTo { :self |
		| answer = []; |
		self.primesUpToDo { :n |
			answer.add(n)
		};
		answer
	}

	primesUpToDo { :self :aProcedure:/1 |
		| n = 2; |
		{ n <= self }.whileTrue {
			aProcedure(n);
			n := n.nextPrime
		}
	}

	printStringHex { :self |
		<primitive: return _self.toString(16).toUpperCase();>
	}

	numerator { :self |
		self
	}

	printStringRoman { :self |
		{ :stream |
			romanDigitsOn(self, stream)
		}.asciiStringStreamContents
	}

	romanDigitsForOn { :self :digits :base :aStream |
		| n = self % (base * 10) // base; |
		(n = 9).if {
			aStream.nextPutAll([digits.last, digits.first])
		} {
			(n = 4).if {
				aStream.nextPutAll([digits.last, digits.second])
			} {
				(n > 4).ifTrue {
					aStream.nextPut(digits.second)
				};
				(n % 5).timesRepeat {
					aStream.nextPut(digits.last)
				}
			}
		}
	}

	romanDigitsOn { :self :aStream |
		|(
			integer = self.negative.if {
				aStream.nextPut('-'.asciiValue);
				self.negated
			} {
				self
			}
		)|
		(integer // 1000).timesRepeat {
			aStream.nextPut('M'.asciiValue)
		};
		integer.romanDigitsForOn('MDC'.asciiByteArray, 100, aStream);
		integer.romanDigitsForOn('CLX'.asciiByteArray, 10, aStream);
		integer.romanDigitsForOn('XVI'.asciiByteArray, 1, aStream)
	}

	take { :self :k |
		(k < 0 | { k > self }).if {
			0
		} {
			| numerator = 1, denominator = 1; |
			self.toByDo(k.max(self - k) + 1, -1) { :factor |
				numerator := numerator * factor
			};
			1.toDo(k.min(self - k)) { :factor |
				denominator := denominator * factor
			};
			numerator // denominator
		}
	}

	threeDigitName { :self |
		|(
			units = [
				'one', 'two', 'three', 'four', 'five',
				'six', 'seven', 'eight', 'nine', 'ten',
				'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
				'sixteen', 'seventeen', 'eighteen', 'nineteen'
			],
			decades = [
				'twenty', 'thirty', 'forty', 'fifty',
				'sixty', 'seventy', 'eighty', 'ninety'
			]
		)|
		valueWithReturn { :return:/1 |
			| answer |
			(self = 0).ifTrue {
				''.return
			};
			(self > 99).ifTrue {
				answer := (units[self // 100]) ++' hundred';
				((self % 100) = 0).ifFalse {
					answer := answer ++ ' ' ++ (self % 100).threeDigitName
				};
				answer.return
			};
			(self < 20).ifTrue {
				units[self].return
			};
			answer := decades[self // 10 - 1];
			((self % 10) = 0).ifFalse {
				answer := answer ++ '-' ++ (units[self % 10])
			};
			answer.return
		}
	}

	timesRepeat { :self :aProcedure:/0 |
		| remaining = self; |
		{ remaining > 0 }.whileTrue {
			aProcedure();
			remaining := remaining - 1
		};
		self
	}

}

+@SystemCache {

	primesArray { :self |
		{
			23.primesArray
		}.once(self, 'primesArray')
	}

}
