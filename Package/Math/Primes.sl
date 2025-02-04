/* Requires: Cache Collection Fraction Integer */

+@Integer {

	factorInteger { :self |
		self.isNegative.if {
			let answer = self.negated.factorInteger;
			answer.addFirst(-1 -> 1);
			answer
		} {
			self.isZero.if {
				[0 -> 1]
			} {
				self.primeFactorization.sortedElements
			}
		}
	}

	indexOfPrime { :self |
		system.cachedPrimesListExtendedToPrime(self).binarySearch(self)
	}

	isCoprime { :self :anInteger |
		self.gcd(anInteger) = 1
	}

	isAlmostPrime { :self :k |
		self.primeFactors.size = k
	}

	isPowerfulNumber { :self |
		self.primeFactorization.asDictionary.values.allSatisfy { :each |
			each > 1
		}
	}

	isPrime { :self |
		system.isCachedPrime(self).if {
			true
		} {
			self.isPrimeTrialDivision
		}
	}

	isPrimeTrialDivision { :self |
		(self <= 1).if {
			false
		} {
			(self % 2 = 0).if {
				self = 2
			} {
				let limit = self.sqrt.floor;
				(3, 5 .. limit).noneSatisfy { :each |
					self % each = 0
				}
			}
		}
	}

	isPrimeWilson { :self |
		(self < 2).if {
			false
		} {
			((self - 1).factorial + 1).divisible(self)
		}
	}

	isLesserTwinPrime { :self |
		self.isPrime & {
			self + 2 = self.nextPrime
		}
	}

	leastPrimeGreaterThanOrEqualTo { :self |
		let answer = self;
		{
			answer.isPrime
		}.whileFalse {
			answer := answer + 1
		};
		answer
	}

	liouvilleLambda { :self |
		self.primeFactors.size.isEven.if {
			1
		} {
			-1
		}
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
			self.isEven.ifTrue {
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
				a := system.randomLargeInteger(self.one * 2, self - 2);
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

	moebiusMu { :self |
		self.isSquareFree.if {
			self.liouvilleLambda
		} {
			0
		}
	}

	nextPrime { :self |
		(self + 1).leastPrimeGreaterThanOrEqualTo
	}

	nthPrime { :self |
		let primesList = system.cachedPrimesListExtendedToIndex(self);
		primesList[self]
	}

	nthPrimeGap { :self |
		(self + 1).nthPrime - self.nthPrime
	}

	previousPrime { :self |
		let index = self.leastPrimeGreaterThanOrEqualTo.indexOfPrime - 1;
		system.cachedPrimesList[index]
	}

	primeDivisors { :self |
		self.primeFactorization.asDictionary.keys
	}

	primeExponents { :self |
		let dictionary = self.primeFactorization.asDictionary;
		dictionary.keys.max.primesUpTo.collect { :each |
			dictionary.atIfAbsent(each) {
				0
			}
		}
	}

	primeFactorization { :self |
		self.primeFactors.asBag
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

	primeFactorsTrialDivision { :self |
		let n = self;
		let m = 3;
		let answer = [];
		{
			n % 2 = 0
		}.whileTrue {
			answer.add(2);
			n := n // 2
		};
		{
			m * m <= n
		}.whileTrue {
			(n % m = 0).if {
				answer.add(m);
				n := n // m
			} {
				m := m + 2
			}
		};
		(n ~= 1).ifTrue {
			answer.add(n)
		};
		answer
	}

	primeNu { :self |
		self.primeFactorization.asDictionary.size
	}

	primeOmega { :self |
		self.primeFactors.size
	}

	primePi { :self |
		let answer = 0;
		self.sieveOfEratosthenesDo { :unusedItem |
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
		system.cachedPrimesList.copyFromTo(
			startIndex,
			iMax.nextPrime.indexOfPrime - 1
		)
	}

	primesList { :self |
		system.cachedPrimesListExtendedToIndex(self).take(self)
	}

	primesListWheelSieve { :limit |
		(limit < 2).if {
			0
		} {
			let c = List(limit + 1, false);
			let k = 9;
			let p1 = 11;
			let p2 = 121;
			/* First differences of 11-rough numbers: not divisible by 2, 3, 5 or 7. */
			let z = [2 4 2 4 6 2 6 4 2 4 6 6 2 6 4 2 6 4 6 8 4 2 4 2 4 8 6 4 6 2 4 6 2 6 6 4 2 4 6 2 6 4 2 4 2 10 2 10];
			let w = 0;
			let answer = [2];
			let j = 3;
			c[1] := true;
			c[2] := true;
			{ k <= limit }.whileTrue {
				c[k + 1] := true;
				k := k + 6
			};
			k := 25;
			{ k <= limit }.whileTrue {
				c[k + 1] := true;
				k := k + 10
			};
			k := 49;
			{ k <= limit }.whileTrue {
				c[k + 1] := true;
				k := k + 14
			};
			{ p2 <= limit }.whileTrue {
				let i = p2;
				let ok = true;
				{ i <= limit }.whileTrue {
					c[i + 1] := true;
					i := i + (2 * p1)
				};
				{ ok }.whileTrue {
					p1 := p1 + z[w + 1];
					w := (w + 1) % 48;
					ok := c[p1 + 1]
				};
				p2 := p1 * p1
			};
			{ j <= limit }.whileTrue {
				c[j + 1].ifFalse {
					answer.add(j)
				};
				j := j + 2
			};
			answer
		}
	}

	primesUpTo { :self |
		system.cachedPrimesList.copyFromTo(
			1,
			self.nextPrime.indexOfPrime - 1
		)
	}

	primesUpToDo { :self :aBlock:/1 |
		let k = self.nextPrime.indexOfPrime - 1;
		let primesList = system.cachedPrimesListExtendedToIndex(k);
		1.toDo(k) { :index |
			aBlock(primesList[index])
		}
	}

	sieveOfEratosthenesDo { :self :aBlock:/1 |
		let size = self;
		let flags = List(size);
		flags.atAllPut(true);
		2.toDo(size) { :i |
			flags[i - 1].ifTrue{
				let k = i + i;
				aBlock(i);
				{
					k <= size
				}.whileTrue {
					flags[k - 1] := false;
					k := k + i
				}
			}
		}
	}

	sieveOfEratosthenes { :self |
		let answer = [];
		self.sieveOfEratosthenesDo { :each |
			answer.add(each)
		};
		answer
	}

}

+@Number {

	isPrimePower { :self |
		let primeFactors = self.factorInteger;
		primeFactors.size = 1 & {
			primeFactors.first.key.isPrime
		}
	}

}

+Fraction {

	factorInteger { :self |
		let n = self.numerator.factorInteger;
		let d = self.denominator.factorInteger.collect { :each |
			each.key -> each.value.negated
		};
		(n ++ d).sorted
	}

	primeFactors { :self |
		self.numerator.primeFactors ++ self.denominator.primeFactors.collect { :each |
			ReducedFraction(1, each)
		}
	}

	primeLimit { :self |
		self.numerator.primeLimit.max(self.denominator.primeLimit)
	}

}

+Complex {

	isGaussianPrime { :self |
		let a = self.real;
		let b = self.imaginary;
		let f = { :n |
			n.isPrime & {
				(n % 4) = 3
			}
		};
		(a = 0).if {
			b.abs.isPrime & {
				f(b.abs)
			}
		} {
			(b = 0).if {
				a.abs.isPrime & {
					f(a.abs)
				}
			} {
				(a.squared + b.squared).isPrime
			}
		}
	}

}

+@Collection {

	isCoprime { :self |
		valueWithReturn { :return:/1 |
			1.toDo(self.size - 1) { :i |
				(i + 1).toDo(self.size) { :j |
					self[i].isCoprime(self[j]).ifFalse {
						false.return
					}
				}
			};
			true
		}
	}

	nthPrime { :self |
		self.collect(nthPrime:/1)
	}

	primeOmega { :self |
		self.collect(primeOmega:/1)
	}

}

+List {

	primesListExtendedToIndex { :self :anInteger |
		let p = self.last;
		(anInteger - self.size).timesRepeat {
			p := p.nextPrime;
			self.add(p)
		};
		p
	}

}

+@Cache {

	isCachedPrime { :self :anInteger |
		self.cachedPrimesList.binarySearch(anInteger) ~= 0
	}

	cachedPrimesList { :self |
		self.cached('primesList') {
			1:99.select(isPrimeTrialDivision:/1)
		}
	}

	cachedPrimesListExtendedToIndex { :self :anInteger |
		let primesList = self.cachedPrimesList;
		(anInteger > primesList.size).ifTrue {
			primesList.primesListExtendedToIndex(anInteger)
		};
		primesList
	}

	cachedPrimesListExtendedToPrime { :self :anInteger |
		let primesList = self.cachedPrimesList;
		{
			primesList.last < anInteger
		}.whileTrue {
			primesList.primesListExtendedToIndex(primesList.size + 8)
		};
		primesList
	}

}

+@RandomNumberGenerator {

	randomPrime { :self :iMin :iMax :shape |
		let list = iMin.primesBetweenAnd(iMax);
		{
			let index = self.randomInteger(1, list.size, []);
			list[index]
		} ! shape
	}

}
