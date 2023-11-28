(* Require: Cache *)

@Integer {

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		aFraction.aBlock(Fraction(self, self.one))
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
				milCount +:= 1
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
			self.error('@Integer>>doubleFactorial: not valid for negative integers')
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
			'@Integer>>factorial: not valid for negative integers'.error
		};
		(self <= 1).if {
			1
		} {
			| next = self, answer = self; |
			{ next > 1 }.whileTrue {
				next -:= 1;
				answer *:= next
			};
			answer
		}
	}

	foldBetweenAnd { :self :low :high |
		|(
			b = high - low,
			c = (self - low) % (b * 2)
		)|
		(c > b).ifTrue {
			c := (b * b) - c
		};
		c + low
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

	indexOfPrime { :self |
		| primesArray = system.primesArray; |
		(self <= primesArray.last).if {
			primesArray.indexOf(self)
		} {
			(primesArray.size + 8).primesArrayExtend(primesArray);
			self.indexOfPrime
		}
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
		self.typeResponsibility('@Integer>>isInteger')
	}

	isAlmostPrime { :self :k |
		self.primeFactors.size = k
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
						i +:= 1
					};
					true.return
				}
			}
		}
	}

	isPrimePower { :self |
		| primeFactors = self.primeFactorization; |
		primeFactors.size = 1 & {
			primeFactors.first.key.isPrime
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

	leastPrimeGreaterThanOrEqualTo { :self |
		| maybePrime = self; |
		{ maybePrime.isPrime.not }.whileTrue {
			maybePrime +:= 1
		};
		maybePrime
	}

	nextPrime { :self |
		(self + 1).leastPrimeGreaterThanOrEqualTo
	}

	nthPrime { :self |
		| primesArray = system.primesArray; |
		(self > primesArray.size).if {
			self.primesArrayExtend(primesArray)
		} {
			primesArray[self]
		}
	}

	previousPrime { :self |
		| index = self.leastPrimeGreaterThanOrEqualTo.indexOfPrime - 1; |
		system.primesArray[index]
	}

	primeDivisors { :self |
		self.primeFactorization.collect(key:/1)
	}

	primeFactors { :self |
		(self <= 1).if {
			[]
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
					index +:= 1
				}.repeat;
				answer
			}
		}
	}

	primeFactorization { :self |
		self.primeFactors.asBag.sortedElements
	}

	primeLimit { :self |
		self.primeFactors.maxIfEmpty {
			0
		}
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
		system.primesArray.copyFromTo(1, self.nextPrime.indexOfPrime - 1)
	}

	primesUpToDo { :self :aBlock:/1 |
		| primesArray = system.primesArray; |
		1.toDo(self.leastPrimeGreaterThanOrEqualTo.indexOfPrime) { :index |
			aBlock(primesArray[index])
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
				numerator *:= factor
			};
			1.toDo(k.min(self - k)) { :factor |
				denominator *:= factor
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

	timesRepeat { :self :aBlock:/0 |
		| remaining = self; |
		{ remaining > 0 }.whileTrue {
			aBlock();
			remaining -:= 1
		};
		self
	}

	tuplesIndicesDo { :self :n :aBlock:/1 |
		| indices = Array(n, 1); |
		(self ^ n).timesRepeat {
			| k = n; |
			aBlock(indices);
			{
				k >= 1 & {
					indices[k] +:= 1;
					indices[k] > self
				}
			}.whileTrue {
				indices[k] := 1;
				k -:= 1
			}
		}
	}

}

+@Integer {

	asLargerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.positive.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver)
			} {
				self.error('@Integer>>asLargerPowerOfTwo: non-positive')
			}
		}
	}

	asPowerOfTwo { :self |
		self.asSmallerPowerOfTwo
	}

	asSmallerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.positive.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver - 1)
			} {
				self.error('@Integer>>asSmallerPowerOfTwo: non-positive')
			}
		}
	}

	isPowerOfTwo { :self |
		(self ~= 0) & {
			self.bitAnd(self - 1) = 0
		}
	}

}

+@Integer {

	digitAt { :self :n |
		(n = 1).if {
			(self < 0).if {
				-256 - self.bitAnd(255)
			} {
				self.bitAnd(255)
			}
		} {
			(self < 0).if {
				(-256 - self.bitShift(-8) + 1).digitAt(n - 1)
			} {
				self.bitShift(8 - n.bitShift(3)).bitAnd(255)
			}
		}
	}

	digitLength { :self |
		| value = self, length = 1; |
		(value < -255).ifTrue {
			length := 2;
			value := (-256 - self.bitShift(-8)) + 1
		};
		{ value > 255 }.whileTrue {
			value := value.bitShift(-8);
			length +:= 1
		};
		length
	}

}

+@Cache {

	primesArray { :self |
		self.cached('primesArray') {
			23.primesArray
		}
	}

}
