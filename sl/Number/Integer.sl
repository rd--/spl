{- Require: Cache -}

@Integer {

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		aFraction.aBlock(Fraction(self, self.one))
	}

	asHexDigit { :self |
		'0123456789ABCDEF'[self + 1]
	}

	asWords { :self |
		let mils = [
			'',
			' thousand',
			' million', ' billion',
			' trillion', ' quadrillion',
			' quintillion', ' sextillion',
			' septillion', ' octillion',
			' nonillion', ' decillion',
			' undecillion', ' duodecillion',
			' tredecillion', ' quattuordecillion',
			' quindecillion', ' sexdecillion',
			' septendecillion', ' octodecillion',
			' novemdecillion', ' vigintillion'
		];
		(self = 0).if {
			'zero'
		} {
			let minus = '';
			let three = nil;
			let num = self;
			let answer = '';
			let milCount = 1;
			(self < 0).ifTrue {
				minus := 'negative ';
				num := self.negated
			};
			{
				num > 0
			}.whileTrue {
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

	atRandomUsing { :self :random |
		random.nextRandomInteger(self)
	}

	atRandom { :self |
		system.nextRandomInteger(self)
	}

	binomialCoefficient { :n :k |
		k.isCollection.if {
			k.adaptToNumberAndApply(n, binomialCoefficient:/2)
		} {
			(k < 0 | {
				k > n
			}).if {
				0
			} {
				let numerator = n.one;
				let denominator = n.one;
				n.toByDo(k.max(n - k) + 1, -1) { :factor |
					numerator := numerator * factor
				};
				1.toDo(k.min(n - k)) { :factor |
					denominator :=denominator *  factor
				};
				numerator // denominator
			}
		}
	}

	characterRange { :self :anInteger |
		(self .. anInteger).collect(asCharacter:/1)
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

	eulerPhi { :self |
		self.isZero.if {
			0
		} {
			let l = self.negative.if {
				-1.downTo(self)
			} {
				1.upTo(self)
			};
			l.select { :each |
				self.gcd(each) = 1
			}.size
		}
	}

	factorial { :self |
		self.negative.ifTrue {
			'@Integer>>factorial: not valid for negative integers'.error
		};
		(self <= 1).if {
			1
		} {
			let next = self;
			let answer = self;
			{
				next > 1
			}.whileTrue {
				next := next - 1;
				answer := answer * next
			};
			answer
		}
	}

	factorInteger { :self |
		self.isNegative.if {
			let answer = self.negated.factorInteger;
			answer.addFirst(-1 -> -1);
			answer
		} {
			self.primeFactors.asBag.sortedElements
		}
	}

	foldIndex { :self :size |
		self.foldBetweenAnd(1, size)
	}

	fromCharacterCode { :self |
		self.asCharacter.string
	}

	gcd { :self :anInteger |
		anInteger.isInteger.if {
			let a = self.abs;
			let b = anInteger.abs;
			{
				b = 0
			}.whileFalse {
				let r = a % b;
				a := b;
				b := r
			};
			a
		} {
			anInteger.adaptToNumberAndApply(self, gcd:/2)
		}
	}

	hammingNumbersFromUpTo { :self :limit |
		let answer = Set();
		let step = { :n |
			(n <= limit).ifTrue {
				answer.includes(n).ifFalse {
					answer.include(n);
					step(n * 2);
					step(n * 3);
					step(n * 5)
				}
			}
		};
		step(self);
		answer.asSortedList.contents
	}

	harmonicNumber { :self |
		1:self.reciprocal.sum
	}

	indexOfPrime { :self |
		let primesList = system.primesList;
		(self <= primesList.last).if {
			primesList.indexOf(self)
		} {
			(primesList.size + 8).primesListExtend(primesList);
			self.indexOfPrime
		}
	}

	integerDigitsReverseDo { :self :base :numDigits :aBlock:/1 |
		let num = self;
		numDigits.timesRepeat {
			aBlock(num % base);
			num := num // base
		}
	}

	integerDigits { :self :base :numDigits |
		let answer = [];
		self.integerDigitsReverseDo(base, numDigits) { :each |
			answer.addFirst(each)
		};
		answer
	}

	integerDigits { :self :base |
		base.isInteger.if {
			self.integerDigits(
				base,
				(self.log / base.log + 0.0000000001).asInteger + 1
			)
		} {
			base.adaptToNumberAndApply(self, integerDigits:/2)
		}
	}

	integerDigits { :self |
		self.integerDigits(10)
	}

	integerPartitions { :j :i |
		let f = { :t :m :n |
			(m = 1 & { t = n }).if {
				[[t]]
			} {
				(n < m | { n < 1 | { m < 1 | { t < 1 } } }).if {
					[]
				} {
					f(t, m - 1, n - t).collect { :r |
						([t] ++ r)
					} ++ f(t - 1, m, n)
				}
			}
		};
		f(j - i + 1, i, j)
	}

	integerPartitions { :n |
		(1 .. n).collect { :k | n.integerPartitions(k) }.concatenation
	}

	isByte { :self |
		self.isInteger & {
			self.betweenAnd(0, 255)
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
				let selfSqrt = self.sqrt;
				let i = 2;
				valueWithReturn { :return:/1 |
					{
						i <= selfSqrt
					}.whileTrue {
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
		anInteger.isInteger.if {
			let a = self;
			let b = anInteger;
			(a = 0 | {
				b = 0
			}).if {
				0
			} {
				let ab = a * b;
				{
					b = 0
				}.whileFalse {
					let tmp = b;
					b := a % tmp;
					a := tmp
				};
				(ab / a).abs
			}
		} {
			anInteger.adaptToNumberAndApply(self, lcm:/2)
		}
	}

	leastPrimeGreaterThanOrEqualTo { :self |
		let maybePrime = self;
		{
			maybePrime.isPrime.not
		}.whileTrue {
			maybePrime := maybePrime + 1
		};
		maybePrime
	}

	mixedRadixEncode { :self :factors |
		let answer = List(factors.size);
		factors.size.downToDo(1) { :index |
			answer[index] := self % factors[index];
			self := self // factors[index]
		};
		(self > 0).ifTrue {
			answer.addFirst(self)
		};
		answer
	}

	nextPrime { :self |
		(self + 1).leastPrimeGreaterThanOrEqualTo
	}

	nthPrime { :self |
		let primesList = system.primesList;
		(self > primesList.size).if {
			self.primesListExtend(primesList)
		} {
			primesList[self]
		}
	}

	numerator { :self |
		self
	}

	partitionFunctionP { :self |
		let table = Map();
		let p = { :n |
			table.includesIndex(n).if {
				table[n]
			} {
				(n < 1).if {
					1
				} {
					let answer = (1 / n) * (0 .. n - 1).collect { :k |
						1.divisorSigma(n - k) * p(k)
					}.sum;
					table[n] := answer;
					answer
				}
			}
		};
		p(self)
	}

	partitionFunctionP { :self :anInteger |
		let p = { :n :k |
			(k > n).if {
				0
			} {
				(k = n).if {
					1
				} {
					(k = 0).if {
						0
					} {
						p(n - 1, k - 1) + p(n - k, k)
					}
				}
			}
		};
		p(self, anInteger)
	}

	partitionFunctionQ { :n :k |
		partitionFunctionP(n - binomialCoefficient(k, 2), k)
	}

	previousPrime { :self |
		let index = self.leastPrimeGreaterThanOrEqualTo.indexOfPrime - 1;
		system.primesList[index]
	}

	primeDivisors { :self |
		self.primeFactorization.collect(key:/1)
	}

	primeFactors { :self |
		(self <= 1).if {
			[]
		} {
			valueWithReturn { :return:/1 |
				let index = 1;
				let prime = 2;
				let k = self;
				let answer = [];
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
		self.primeFactors.asBag.sortedElements
	}

	primeLimit { :self |
		self.primeFactors.maxIfEmpty {
			0
		}
	}

	primesList { :self |
		let answer = List(self);
		let n = 1;
		answer.indicesDo { :index |
			n := n.nextPrime;
			answer[index] := n
		};
		answer
	}

	primesListExtend { :self :aList |
		let n = aList.last;
		(self - aList.size).timesRepeat {
			n := n.nextPrime;
			aList.add(n)
		};
		n
	}

	primesUpTo { :self |
		system.primesList.copyFromTo(1, self.nextPrime.indexOfPrime - 1)
	}

	primesUpToDo { :self :aBlock:/1 |
		let primesList = system.primesList;
		1.toDo(self.leastPrimeGreaterThanOrEqualTo.indexOfPrime) { :index |
			aBlock(primesList[index])
		}
	}

	printStringHex { :self |
		<primitive: return _self.toString(16).toUpperCase();>
	}

	printStringRoman { :self |
		{ :stream |
			romanDigitsOn(self, stream)
		}.asciiStringStreamContents
	}

	randomIntegerBipolar { :self |
		system.nextRandomIntegerBipolar(self)
	}

	romanDigitsForOn { :self :digits :base :aStream |
		let n = self % (base * 10) // base;
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
		let integer = self.negative.if {
			aStream.nextPut('-'.asciiValue);
			self.negated
		} {
			self
		};
		(integer // 1000).timesRepeat {
			aStream.nextPut('M'.asciiValue)
		};
		integer.romanDigitsForOn('MDC'.asciiByteArray, 100, aStream);
		integer.romanDigitsForOn('CLX'.asciiByteArray, 10, aStream);
		integer.romanDigitsForOn('XVI'.asciiByteArray, 1, aStream)
	}

	sieveOfEratosthenes { :self |
		let size = self;
		let flags = List(size);
		let primeCount = 0;
		flags.atAllPut(true);
		2.toDo(size) { :i |
			flags[i - 1].ifTrue{
				let k = i + i;
				primeCount := primeCount + 1;
				{
					k <= size
				}.whileTrue {
					flags[k - 1] := false;
					k := k + i
				}
			}
		};
		primeCount
	}

	subfactorial { :self |
		(0 .. self).collect { :each |
			each.factorial * (-1 ^ (self - each)) * self.binomialCoefficient(each)
		}.sum
	}

	take { :self :k |
		self.binomialCoefficient(k)
	}

	threeDigitName { :self |
		let units = [
			'one', 'two', 'three', 'four', 'five',
			'six', 'seven', 'eight', 'nine', 'ten',
			'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
			'sixteen', 'seventeen', 'eighteen', 'nineteen'
		];
		let decades = [
			'twenty', 'thirty', 'forty', 'fifty',
			'sixty', 'seventy', 'eighty', 'ninety'
		];
		valueWithReturn { :return:/1 |
			let answer = nil;
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
		let remaining = self;
		{
			remaining > 0
		}.whileTrue {
			aBlock();
			remaining := remaining - 1
		};
		self
	}

	wrapIndex { :self :size |
		self - 1 % size + 1
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
		self ~= 0 & {
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
		let value = self;
		let length = 1;
		(value < -255).ifTrue {
			length := 2;
			value := (-256 - self.bitShift(-8)) + 1
		};
		{
			value > 255
		}.whileTrue {
			value := value.bitShift(-8);
			length := length + 1
		};
		length
	}

}

+@Cache {

	primesList { :self |
		self.cached('primesList') {
			23.primesList
		}
	}

}
