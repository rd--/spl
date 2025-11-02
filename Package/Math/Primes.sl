/* Requires: Cache Collection Fraction Integer */

+@Integer {

	assertIsPrime { :self |
		self.assert {
			self.isPrime
		}
	}

	carmichaelLambda { :n |
		(n > 0).if {
			let e = n.eulerPhi;
			(
				[1 2 4].includes(n) | {
					n.isOdd & {
						n.isPrimePower
					}
				}
			).if {
				e
			} {
				n.log(2).isInteger.if {
					e / 2
				} {
					n.factorInteger.collect { :x |
						(x.key ^ x.value).carmichaelLambda
					}.lcm
				}
			}
		} {
			n.error('carmichaelLambda: negative')
		}
	}

	copelandErdosSequence { :n |
		let answer = [];
		let i = 1;
		{ answer.size < n }.whileTrue {
			answer.addAll(
				i.prime.integerDigits(10)
			);
			i := i + 1
		};
		answer.take(n)
	}

	distinctPrimeFactors { :self |
		self.primeFactorization.valuesAndCounts.keys
	}

	euclidNumber { :n |
		1 + n.primorial
	}

	factorInteger { :self |
		self.isNegative.if {
			let answer = self.negate.factorInteger;
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

	fortunateNumber { :n |
		let p = primorial(n);
		nextPrime(p + 1) - p
	}

	indexOfPrime { :self |
		system.cachedPrimesListExtendedToPrime(self).binarySearch(self)
	}

	interprime { :n |
		let a = (n + 1).prime;
		let b = (n + 2).prime;
		(a + b) / 2
	}

	isAlmostPrime { :self :k |
		self.primeFactors.size = k
	}

	isBalancedPrime { :n |
		(n >= 3) & {
			n.isPrime & {
				n.primeBalance = 0
			}
		}
	}

	isCarmichaelNumber { :n |
		let m = n.carmichaelLambda;
		((n % m) = 1) & {
			n.isPrime.not
		}
	}

	isChenPrime { :self |
		self.isPrime & {
			(self + 2).isPrime | {
				(self + 2).isSemiprime
			}
		}
	}

	isComposite { :self |
		self.isPrime.not
	}

	isCoprime { :self :anInteger |
		self.gcd(anInteger) = 1
	}

	isFullReptendPrime { :n :p |
		multiplicativeOrder(p, n) = (n - 1)
	}

	isFullReptendPrime { :self |
		self = 7 | {
			self.isPrime & {
				self.primitiveRootList.includes(10)
			}
		}
	}

	isPowerfulNumber { :self |
		self.primeFactorization.valuesAndCounts.allSatisfy { :each |
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
		self.assertIsInteger('isPrimeTrialDivision');
		(self <= 1).if {
			false
		} {
			(self % 2 = 0).if {
				self = 2
			} {
				let limit = self.sqrt.floor;
				3.toBy(limit, 2).noneSatisfy { :each |
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

	isPythagoreanPrime { :self |
		self.isPrime & {
			((self - 1) % 4) = 0
		}
	}

	isLesserCousinPrime { :self |
		self.isPrime & {
			(self + 4).isPrime
		}
	}

	isLesserTwinPrime { :self |
		self.isPrime & {
			self + 2 = self.nextPrime
		}
	}

	isSemiprime { :n |
		n.factorInteger.values.sum = 2
	}

	isSternPrime { :n |
		n.isPrime & {
			let k = (n / 2).sqrt.floor;
			{
				k > 0 & {
					(n - (2 * k.square)).isPrime.not
				}
			}.whileTrue {
				k := k - 1
			};
			k.isZero
		}
	}

	isStrongPseudoprime { :n :b |
		n.isEven.not & {
			n.isPrime.not & {
				let s = integerExponent(n - 1, 2);
				let d = (n - 1) / (2 ^ s);
				powerMod(b, d, n) = 1 | {
					1.to(s).anySatisfy { :i |
						let z = d * (2 ^ (i - 1));
						powerMod(b, z, n) = (n - 1)
					}
				}
			}
		}
	}

	isStrongPrime { :n |
		(n >= 3) & {
			n.isPrime & {
				n.primeBalance > 0
			}
		}
	}

	isWeakPrime { :n |
		(n >= 3) & {
			n.isPrime & {
				n.primeBalance < 0
			}
		}
	}

	leastPrimeFactor { :n |
		[
			{ n < 2 } -> { 0 },
			{ divisible(n, 2) } -> { 2 },
			{ divisible(n, 3) } -> { 3 },
			{ divisible(n, 5) } -> { 5 },
			{ true } -> {
				valueWithReturn { :return:/1 |
					let inc = [4 2 4 2 4 6 2 6];
					let k = 7;
					let i = 1;
					{ k * k <= n }.whileTrue {
						divisible(n, k).ifTrue {
							k.return
						};
						k := k + inc[i];
						i := (i < 8).if { i + 1 } { 1 }
					};
					n
				}
			}
		].which
	}

	leastPrimeFactorList { :n |
		let lp = List(n, 0);
		let pr = [];
		2.toDo(n) { :i |
			let j = 1;
			let break = false;
			(lp[i] = 0).ifTrue {
				lp[i] := i;
				pr.add(i)
			};
			{
				break | {
					i * pr[j] > n
				}
			}.whileFalse {
				lp[i * pr[j]] := pr[j];
				(pr[j] = lp[i]).ifTrue {
					break := true
				};
				j := j + 1
			}
		};
		[lp, pr]
	}

	leastPrimeGreaterThanOrEqualTo { :self :extendCache |
		let answer = self;
		(
			answer.isEven & {
				answer != 2
			}
		).ifTrue {
			answer := answer + 1
		};
		extendCache.ifTrue {
			system.cachedPrimesListExtendedToPrime(self)
		};
		{
			answer.isPrimeTrialDivision
		}.whileFalse {
			answer := answer + 2
		};
		answer
	}

	leastPrimeGreaterThanOrEqualTo { :self |
		self.leastPrimeGreaterThanOrEqualTo(false)
	}

	liouvilleLambda { :self |
		self.primeFactors.size.isEven.if {
			1
		} {
			-1
		}
	}

	mangoldtLambda { :n |
		let primeFactors = n.factorInteger;
		let isPrimePower = primeFactors.size = 1 & {
			primeFactors.first.key.isPrime
		};
		isPrimePower.if {
			primeFactors.first.key.log
		} {
			0
		}
	}

	mertensFunction { :self |
		1:self.sum { :k |
			k.moebiusMu
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
							x != (self - 1)
						}
					}.whileTrue {
						x := (x ^ 2) \\ self
					};
					(x != (self - 1)).ifTrue {
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

	nearestPrime { :n |
		(n <= 2).if {
			2
		} {
			let a = n.nextPrime;
			let b = (a.primePi - 1).prime;
			(a < (2 * n - b)).if {
				a
			} {
				b
			}
		}
	}

	nextPrime { :n :k |
		let s = k.sign;
		let m = s.caseOf(
			[
				1 -> { n.nextPrime },
				-1 -> { n.previousPrime }
			]
		);
		(k.abs = 1).if {
			m
		} {
			m.nextPrime(k - s)
		}
	}

	nextPrime { :n |
		(n < 2).if {
			2
		} {
			n := n.floor + 1;
			n.isEven.ifTrue {
				n := n + 1
			};
			{
				n.isPrime
			}.whileFalse {
				n := n + 2
			};
			n
		}
	}

	previousPrime { :n |
		(n <= 3).if {
			(n = 3).if {
				2
			} {
				n.error('previousPrime')
			}
		} {
			n := n.ceiling - 1;
			n.isEven.ifTrue {
				n := n - 1
			};
			{
				n.isPrime
			}.whileFalse {
				n := n - 2
			};
			n
		}
	}

	prime { :self |
		let primesList = system.cachedPrimesListExtendedToIndex(self);
		primesList[self]
	}

	primeBalance { :n |
		let k = n.primePi;
		let a = (k - 1).prime;
		let b = (k + 1).prime;
		(n - a) <=> (b - n)
	}

	primeDistance { :n |
		(n - n.nearestPrime).abs
	}

	primeGap { :self |
		(self + 1).prime - self.prime
	}

	primeDivisors { :self |
		self.primeFactorization.valuesAndCounts.keys
	}

	primeExponents { :self |
		let dictionary = self.primeFactorization.valuesAndCounts;
		dictionary.keys.max.primesUpTo.collect { :each |
			dictionary.atIfAbsent(each) {
				0
			}
		}
	}

	primeFactorization { :self |
		self.primeFactors.asMultiset
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
					prime := index.prime;
					{
						k % prime = 0
					}.whileTrue {
						answer.add(prime);
						k := k // prime;
						(k = 1).ifTrue {
							answer.return
						}
					};
					(prime.square > k).ifTrue {
						answer.add(k.normal);
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
		(n != 1).ifTrue {
			answer.add(n)
		};
		answer
	}

	primeFactorsWheel { :n |
		let inc = [4 2 4 2 4 6 2 6];
		let factors = [];
		let k = 7;
		let i = 1;
		{ divisible(n, 2) }.whileTrue {
			factors.add(2);
			n := n / 2
		};
		{ divisible(n, 3) }.whileTrue {
			factors.add(3);
			n := n / 3
		};
		{ divisible(n, 5) }.whileTrue {
			factors.add(5);
			n := n / 5
		};
		{ k * k <= n }.whileTrue {
			divisible(n, k).if {
				factors.add(k);
				n := n / k
			} {
				k := k + inc[i];
				i := (i < 8).if { i + 1 } { 1 }
			}
		};
		(n > 1).ifTrue {
			factors.add(n)
		};
		factors
	}

	primeNu { :self |
		self.primeFactorization.valuesAndCounts.size
	}

	primeOmega { :self |
		self.primeFactors.size
	}

	primePi { :self |
		let answer = 0;
		self.wheelSieveDo { :unusedItem |
			answer := answer + 1
		};
		answer
	}

	primeLimit { :self |
		self.primeFactors.maxIfEmpty {
			0
		}
	}

	primeSignature { :self |
		self.factorInteger.values.sort(>)
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

	wheelSieveDo { :limit :aBlock:/1 |
		(limit >= 2).ifTrue {
			let c = List(limit + 1, false);
			let k = 9;
			let p1 = 11;
			let p2 = 121;
			/* First differences of 11-rough numbers: not divisible by 2, 3, 5 or 7. https://oeis.org/A049296 */
			let z = [2 4 2 4 6 2 6 4 2 4 6 6 2 6 4 2 6 4 6 8 4 2 4 2 4 8 6 4 6 2 4 6 2 6 6 4 2 4 6 2 6 4 2 4 2 10 2 10];
			let w = 0;
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
			aBlock(2);
			{ j <= limit }.whileTrue {
				c[j + 1].ifFalse {
					aBlock(j)
				};
				j := j + 2
			};
			nil
		}
	}

	wheelSieve { :limit |
		let p = [];
		limit.wheelSieveDo { :i |
			p.add(i)
		};
		p
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

	primitiveRootList { :n |
		let e = n.eulerPhi;
		let p = e.primeFactors;
		1.to(n - 1).select { :g |
			g.isCoprime(n)
		}.select { :g |
			p.collect { :i |
				g.powerMod(e / i, n)
			}.allSatisfy { :m |
				m > 1
			}
		}
	}

	primorial { :n |
		1.to(n).product(prime:/1)
	}

	radical { :self |
		self.factorInteger.collect(key:/1).product
	}

	sieveOfAtkinDo { :limit :aBlock:/1 |
		let a = List(limit + 1, false);
		let k = limit.integerSquareRoot;
		(limit > 2).ifTrue {
			a[2] := true
		};
		(limit > 3).ifTrue {
			a[3] := true
		};
		1.toDo(k) { :x |
			1.toDo(k) { :y |
				let n = (4 * x * x) + (y * y);
				(n <= limit & { n % 12 = 1 | { n % 12 = 5 } }).ifTrue {
					a[n] := a[n].not
				};
				n := (3 * x * x) + (y * y);
				(n <= limit & { n % 12 = 7 }).ifTrue {
					a[n] := a[n].not
				};
				n := (3 * x * x) - (y * y);
				(x > y & { n <= limit & { n % 12 = 11 } }).ifTrue {
					a[n] := a[n].not
				}
			}
		};
		5.toDo(k) { :i |
			a[i].ifTrue {
				(i * i).toByDo(limit, i * i) { :j |
					a[j] := false
				}
			}
		};
		2.toDo(limit) { :i |
			a[i].ifTrue {
				aBlock(i)
			}
		};
		nil
	}

	sieveOfAtkin { :limit |
		let p = [];
		limit.sieveOfAtkinDo { :i |
			p.add(i)
		};
		p
	}

	sieveOfEratosthenesDo { :self :aBlock:/1 |
		let size = self;
		let flags = List(size, true);
		2.toDo(size) { :i |
			flags[i - 1].ifTrue {
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

	sieveOfPritchard { :limit |
		let next = { :c :x |
			let i = c.indexOf(x);
			c[i + 1]
		};
		let previous = { :c :x |
			let i = c.indexOf(x);
			c[i - 1]
		};
		let extend = { :c :m :n |
			let w = 1;
			let x = m + 1;
			{ x <= n }.whileTrue {
				c.add(x);
				w := c.next(w);
				x := m + w
			}
		};
		let deleteMultiples = { :a :m :p |
			let w = p;
			{ p * w <= m }.whileTrue {
				w := a.next(w)
			};
			{ w > 1 }.whileTrue {
				w := a.previous(w);
				a.remove(p * w)
			}
		};
		(limit < 2).if {
			[]
		} {
			let k = 1;
			let wList = SortedList([1]);
			let length = 2;
			let p = 3;
			let pList = SortedList([2]);
			{ p.square <= limit}.whileTrue {
				(length < limit).ifTrue {
					let n = limit.min(p * length);
					extend(wList, length, n);
					length := n
				};
				deleteMultiples(wList, length, p);
				pList.add(p);
				k := k + 1;
				p := wList.next(1)
			};
			(length < limit).ifTrue {
				extend(wList, length, limit)
			};
			pList.addAll(wList);
			pList.remove(1);
			pList.contents
		}
	}

	sieveOfSundaram { :n |
		let k = (n - 3) // 2 + 1;
		let z = List(k, true);
		let m = (integerSquareRoot(n) - 3) // 2 + 1;
		let a = [2];
		0.toDo(m - 1) { :i |
			let p = 2 * i + 3;
			let s = ((p * p) - 3) // 2;
			s.toByDo(k - 1, p) { :j |
				z[j + 1] := false
			}
		};
		z.withIndexDo { :b :i |
			b.ifTrue {
				a.add(i - 1 * 2 + 3)
			}
		};
		a
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
			each.key -> each.value.negate
		};
		(n ++ d).sortBy(<|)
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

	isComposite { :self |
		self.isGaussianPrime.not
	}

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
				(a.square + b.square).isPrime
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

	prime { :self |
		self.collect(prime:/1)
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
		let p = self.cachedPrimesList;
		(p.last >= anInteger) & {
			p.binarySearch(anInteger) != 0
		}
	}

	cachedPrimesList { :self |
		self.cached('primesList') {
			200.wheelSieve
		}
	}

	cachedPrimesListExtendedToIndex { :self :anInteger |
		let primesList = self.cachedPrimesList;
		(anInteger > primesList.size).ifTrue {
			let limit = anInteger.primeBounds.max.ceiling;
			primesList := limit.wheelSieve;
			self.cache.atPut('primesList', primesList)
		};
		primesList
	}

	cachedPrimesListExtendedToPrime { :self :anInteger |
		let primesList = self.cachedPrimesList;
		(primesList.last < anInteger).ifTrue {
			primesList := anInteger.wheelSieve;
			self.cache.atPut('primesList', primesList)
		};
		primesList
	}

}

+@RandomNumberGenerator {

	randomPrime { :self :iMin :iMax :shape |
		let list = iMin.primesBetweenAnd(iMax);
		{
			let index = self.randomInteger([1, list.size], []);
			list[index]
		} ! shape
	}

}

+SmallFloat {

	erdosTuranConstruction { :n |
		(
			n.isOdd & {
				n.isPrime
			}
		).if {
			0.to(n - 1).collect { :k |
				(2 * n * k) + k.powerMod(2, n)
			}
		} {
			n.error('erdosTuranConstruction: not odd prime')
		}
	}

	optimalGolombRulers { :m |
		let table = [
			[1 0] -> [0],
			[2 1] -> [0 1],
			[3 3] -> [0 1 3],
			[4 6] -> [0 1 4 6],
			[5 11] -> [0 1 4 9 11; 0 2 7 8 11],
			[6 17] -> [0 1 4 10 12 17; 0 1 4 10 15 17; 0 1 8 11 13 17; 0 1 8 12 14 17],
			[7 25] -> [0 1 4 10 18 23 25; 0 1 7 11 20 23 25; 0 1 11 16 19 23 25; 0 2 3 10 16 21 25; 0 2 7 13 21 22 25],
			[8 34] -> [0 1 4 9 15 22 32 34],
			[9 44] -> [0 1 5 12 25 27 35 41 44],
			[10 55] -> [0 1 6 10 23 26 34 41 53 55],
			[11 72] -> [0 1 4 13 28 33 47 54 64 70 72; 0 1 9 19 24 31 52 56 58 69 72],
			[12 85] -> [0 2 6 24 29 40 43 55 68 75 76 85],
			[13 106] -> [0 2 5 25 37 43 59 70 85 89 98 99 106],
			[14 127] -> [0 4 6 20 35 52 59 77 78 86 89 99 122 127],
			[15 151] -> [0 4 20 30 57 59 62 76 100 111 123 136 144 145 151],
			[16 177] -> [0 1 4 11 26 32 56 68 76 115 117 134 150 163 168 177],
			[17 199] -> [0 5 7 17 52 56 67 80 81 100 122 138 159 165 168 191 199],
			[18 216] -> [0 2 10 22 53 56 82 83 89 98 130 148 153 167 188 192 205 216],
			[19 246] -> [0 1 6 25 32 72 100 108 120 130 153 169 187 190 204 231 233 242 246],
			[20 283] -> [0 1 8 11 68 77 94 116 121 156 158 179 194 208 212 228 240 253 259 283],
			[21 333] -> [0 2 24 56 77 82 83 95 129 144 179 186 195 255 265 285 293 296 310 329 333],
			[22 356] -> [0 1 9 14 43 70 106 122 124 128 159 179 204 223 253 263 270 291 330 341 353 356],
			[23 372] -> [0 3 7 17 61 66 91 99 114 159 171 199 200 226 235 246 277 316 329 348 350 366 372],
			[24 425] -> [0 9 33 37 38 97 122 129 140 142 152 191 205 208 252 278 286 326 332 353 368 384 403 425],
			[25 480] -> [0 12 29 39 72 91 146 157 160 161 166 191 207 214 258 290 316 354 372 394 396 431 459 467 480],
			[26 492] -> [0 1 33 83 104 110 124 163 185 200 203 249 251 258 314 318 343 356 386 430 440 456 464 475 487 492],
			[27 553] -> [0 3 15 41 66 95 97 106 142 152 220 221 225 242 295 330 338 354 382 388 402 415 486 504 523 546 553],
			[28 585] -> [0 3 15 41 66 95 97 106 142 152 220 221 225 242 295 330 338 354 382 388 402 415 486 504 523 546 553 585]
		];
		table.detectIfFoundIfNone { :each |
			each.key.at(1) = m
		} { :each |
			let r = each.value;
			r.isVector.if {
				[r]
			} {
				r
			}
		} {
			[m n].error('optimalGolombRulers: no such ruler')
		}
	}

	welchCostasArrayList { :n |
		n.isPrime.if {
			let r = n.primitiveRootList;
			r.collect { :g |
				SparseArray(
					1.to(n - 1).collect { :i |
						[g.powerMod(i, n), i] -> 1
					}
				)
			}
		} {
			n.error('welchCostasArrayList: not prime')
		}
	}

}

+SmallFloat {

	ellipticCurveOverFiniteField { :a :b :q |
		let p = UnivariatePolynomial([b, a, 0, 1]);
		let c = [];
		0.to(q - 1).collect { :x |
			let a = p.at(x);
			let l = legendreSymbol(a, q);
			(l = 0).ifTrue {
				c.add([x, 0])
			};
			(l = 1).ifTrue {
				let r = tonelliShanksAlgorithm(a, q);
				let s = q - r;
				let i = r.min(s);
				let j = r.max(s);
				c.add([x, i]);
				c.add([x, j])
			}
		};
		c
	}

}

+Fraction {

	nextPrime { :self |
		self.floor.nextPrime
	}

	previousPrime { :self |
		self.ceiling.previousPrime
	}

}

+@Integer{

	primeBounds { :n |
		(n.primeLowerBound -- n.primeUpperBound)
	}

	primeLowerBound { :n |
		[
			{ n > 2 } -> { n * (n.log + n.log.log - 1.5) }
		].which
	}

	primeUpperBound { :n |
		[
			{ n > 20 } -> { n * (n.log + n.log.log - 0.5) },
			{ n > 6 } -> { n * (n.log + n.log.log) },
			{ n > 4 } -> { n * (n.log + (2 * n.log.log)) }
		].which
	}

}

+@Integer{

	primePiBounds { :x |
		(x.primePiLowerBound -- x.primePiUpperBound)
	}

	primePiLowerBound { :x |
		[
			{ x > 55 } -> { x / (x.log + 2) }
		].which
	}

	primePiUpperBound { :x |
		[
			{ x > 55 } -> { x / (x.log - 4) }
		].which
	}

}
