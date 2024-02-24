{- Requires: Cache Collection Fraction Integer -}

+@Integer {

	factorInteger { :self |
		self.isNegative.if {
			let answer = self.negated.factorInteger;
			answer.addFirst(-1 -> -1);
			answer
		} {
			self.primeFactors.asBag.sortedElements
		}
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

	isCoprime { :self :anInteger |
		self.gcd(anInteger) = 1
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

	leastPrimeGreaterThanOrEqualTo { :self |
		let maybePrime = self;
		{
			maybePrime.isPrime.not
		}.whileTrue {
			maybePrime := maybePrime + 1
		};
		maybePrime
	}

	millerRabinPrimalityTest { :self :k |
		var d, s, a, x, r;
		valueWithReturn { :return:/1 |
			(self = 1).ifTrue {
				false.return
			};
			(self <= 3).ifTrue {
				true.return
			};
			self.even.ifTrue {
				false.return
			};
			d := self - 1;
			s := 0;
			{
				d \\ 2 = 0
			}.whileTrue {
				d := d / 2;
				s := s + 1
			};
			{
				k := k - 1;
				k >= 0
			}.whileTrue {
				a := (self.one * 2).randomInteger(self - 2);
				x := (a ^ d) \\ self;
				(x = 1).ifFalse {
					r := -1;
					{
						r := r + 1;
						r < s & {
							x ~= (self - 1)
						}
					}.whileTrue {
						x := (x ^ 2) \\ self
					};
					(x ~= (self - 1)).ifTrue {
						false.return
					}
				}
			};
			true
		}
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

	primePi { :self |
		let answer = 0;
		self.primesUpToDo { :each |
			answer := answer + 1
		};
		answer
	}

	primeLimit { :self |
		self.primeFactors.maxIfEmpty {
			0
		}
	}

	primesBetweenAnd { :iMin :iMax |
		let startIndex = iMin.isPrime.if {
			iMin.indexOfPrime
		} {
			iMin.nextPrime.indexOfPrime
		};
		system.primesList.copyFromTo(
			startIndex,
			iMax.nextPrime.indexOfPrime - 1
		)
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
		1.toDo(self.leastPrimeGreaterThanOrEqualTo.indexOfPrime - 1) { :index |
			aBlock(primesList[index])
		}
	}

	randomPrime { :iMin :iMax |
		iMin.primesBetweenAnd(iMax).atRandom
	}

	randomPrime { :iMin :iMax :count |
		iMin.primesBetweenAnd(iMax).atRandom(count)
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

}

+@Number {

	isPrimePower { :self |
		let primeFactors = self.primeFactorization;
		primeFactors.size = 1 & {
			primeFactors.first.key.isPrime
		}
	}

}

+Fraction {

	factorInteger { :self |
		self.primeFactorization
	}

	primeFactors { :self |
		self.numerator.primeFactors ++ self.denominator.primeFactors.collect { :each |
			ReducedFraction(1, each)
		}
	}

	primeFactorization { :self |
		let n = self.numerator.primeFactors.asBag.sortedElements;
		let d = self.denominator.primeFactors.asBag.sortedElements.collect { :each |
			each.key -> each.value.negated
		};
		(n ++ d).sorted
	}

	primeLimit { :self |
		self.numerator.primeLimit.max(self.denominator.primeLimit)
	}

}

+@Collection {

	isCoprime { :self |
		valueWithReturn { :return:/1 |
			1.upToDo(self.size - 1) { :i |
				(i + 1).upToDo(self.size) { :j |
					self[i].isCoprime(self[j]).ifFalse {
						false.return
					}
				}
			};
			true
		}
	}

}

+@Cache {

	primesList { :self |
		self.cached('primesList') {
			23.primesList
		}
	}

}
