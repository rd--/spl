/* Require: Cache */

@Integer {

	additivePersistence { :x :b |
		x.digitalRootSet(b, sum:/1).second.size - 1
	}

	aliquotSum { :n |
		n.divisors.allButLast.sum
	}

	asBit { :self |
		self.isZero.if {
			0
		} {
			self.isOne.if {
				1
			} {
				self.error('asBit')
			}
		}
	}

	asCodePoint { :self |
		self
	}

	asHexDigit { :self |
		'0123456789ABCDEF'[self + 1]
	}

	assertIsInteger { :self :origin |
		self.isInteger.if {
			self
		} {
			self.error('Not an integer: ' ++ origin)
		}
	}

	assertIsPositiveInteger { :self :origin |
		self.isPositiveInteger.if {
			self
		} {
			self.error('Not a positive integer: ' ++ origin)
		}
	}

	assertIsPositiveOddInteger { :self :origin |
		self.isPositiveOddInteger.if {
			self
		} {
			self.error('Not a positive odd integer: ' ++ origin)
		}
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
				num := self.negate
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

	bernsteinBasis { :d :n :x |
		x := x.clip([0 1]);
		d.binomial(n) * (x ^ n) * ((1 - x) ^ (d - n))
	}

	binetsFormula { :n |
		let z = 5.sqrt;
		((1 + z) ^ n) - ((1 - z) ^ n) / ((2 ^ n) * z)
	}

	bitLength { :self |
		self.integerLength(2)
	}

	bjorklundsAlgorithmDo { :k :n :aBlock:/1 |
		let s = 1:n.collect { :i |
			(i <= k).if {
				[1]
			} {
				[0]
			}
		};
		let d = n - k;
		let z = d;
		aBlock(s);
		n := k.max(d);
		k := k.min(d);
		{
			z > 0 | {
				k > 1
			}
		}.whileTrue {
			1:k.do { :i |
				s[i].addAll(s[s.size - i + 1])
			};
			s.removeLast(k);
			aBlock(s);
			z := z - k;
			d := n - k;
			n := k.max(d);
			k := k.min(d)
		};
		s.flatten
	}

	bjorklundsAlgorithm { :k :n |
		k.bjorklundsAlgorithmDo(n) { :each | nil }
	}

	characterRange { :self :anInteger |
		self.to(anInteger).collect(asCharacter:/1)
	}

	combinations { :n :m |
		1.to(n).combinations(m)
	}

	commonResidue { :self :modulus |
		self % modulus
	}

	denominator { :self |
		1
	}

	digitalRootSet { :x :b :f:/1 |
		let seen = IdentitySet();
		{
			seen.includes(x)
		}.whileFalse {
			seen.add(x);
			x := x.integerDigits(b).f
		};
		[x, seen]
	}

	digitalRoot { :x :b |
		x.digitalRootSet(b, sum:/1).first
	}

	digitCount { :n :b :d |
		n.integerDigits(b).count { :each |
			each = d
		}
	}

	digitCount { :n :b |
		let digits = n.integerDigits(b);
		(b - 1).toBy(0, -1).collect { :d |
			digits.count { :each |
				each = d
			}
		}
	}

	digitCount { :n |
		n.digitCount(10)
	}

	digitProduct { :self :base |
		self.integerDigits(base).product
	}

	digitProduct { :self |
		self.digitProduct(10)
	}

	digitSum { :self :base |
		self.integerDigits(base).sum
	}

	digitSum { :self |
		self.digitSum(10)
	}

	dividesImmediately { :self :aNumber |
		Fraction(self, 1).dividesImmediately(Fraction(aNumber, 1))
	}

	divisorSum { :self :aBlock:/1 |
		self.divisors.collect(aBlock:/1).sum
	}

	divisorSummatoryFunction { :x |
		let u = x.sqrt.floor;
		2 * 1.to(u).sum { :k |
			(x / k).floor
		} - u.square
	}

	divisors { :self |
		1.to(self).select { :each |
			self \\ each = 0
		}
	}

	elementaryCellularAutomaton { :ruleNumber :initialState :stepLimit |
		let stateSize = initialState.size;
		let ruleTable = ruleNumber.integerDigits(2, 8);
		let stepCount = 0;
		let answer = [initialState];
		let previousState = initialState;
		{ stepCount < stepLimit }.whileTrue {
			let nextState = 1.to(stateSize).collect { :i |
				let j = [i - 1, i, i + 1];
				let k = previousState.atAllWrap(j).fromDigits(2);
				ruleTable[8 - k]
			};
			answer.add(nextState);
			previousState := nextState;
			stepCount := stepCount + 1
		};
		answer
	}

	euclideanAlgorithm { :a :b |
		{
			b != 0
		}.whileTrue {
			let t = b;
			b := a % b;
			a := t
		};
		a
	}

	euclidsFormula { :m :n :k |
		let a = k * (m.square - n.square);
		let b = k * 2 * m * n;
		let c = k * (m.square + n.square);
		[a, b, c]
	}

	euclidsFormula { :m :n |
		euclidsFormula(m, n, 1)
	}

	eulerPhi { :self |
		self.isZero.if {
			0
		} {
			let l = self.isNegative.if {
				-1.toBy(self, -1)
			} {
				1.to(self)
			};
			l.select { :each |
				self.gcd(each) = 1
			}.size
		}
	}

	extendedEuclideanAlgorithm { :a :b |
		let [r0, r] = [a, b];
		let [s0, s] = [1, 0];
		let [t0, t] = [0, 1];
		{
			r != 0
		}.whileTrue {
			let quotient = r0 // r;
			[r0, r] := [r, r0 - (quotient * r)];
			[s0, s] := [s, s0 - (quotient * s)];
			[t0, t] := [t, t0 - (quotient * t)]
		};
		(r0 < 0).if {
			[r0.-, [s0, t0].-]
		} {
			[r0, [s0, t0]]
		}
	}

	extendedGcd { :self :anInteger |
		self.extendedEuclideanAlgorithm(anInteger)
	}

	fibonacciWord { :self |
		2 + self.goldenRatio.floor - (self + 1).goldenRatio.floor
	}

	foldIndex { :self :size |
		self.fold(1, size)
	}

	gcd { :self :anInteger |
		anInteger.isScalarInteger.if {
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
		let answer = IdentitySet();
		let step = { :n |
			(n <= limit).ifTrue {
				answer.includes(n).ifFalse {
					answer.uncheckedInclude(n);
					step(n * 2);
					step(n * 3);
					step(n * 5)
				}
			}
		};
		step(self);
		answer.asSortedList.contents
	}

	hammingWeight { :self |
		self.digitCount(2, 1)
	}

	integerCompositionsDo { :n :kList :aBlock:/1 |
		kList.do { :k |
			n.integerCompositionsExactlyDo(k, aBlock:/1)
		}
	}

	integerCompositionsDo { :n :aBlock:/1 |
		integerCompositionsDo(n, 1:n, aBlock:/1)
	}

	integerCompositions { :n |
		let answer = [];
		n.integerCompositionsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	integerCompositions { :n :k |
		let answer = [];
		n.integerCompositionsDo(k) { :each |
			answer.add(each.copy)
		};
		answer
	}

	integerCompositionsExactlyDo { :n :k :aBlock:/1 |
		(n < k).ifFalse {
			let a = List(k, 1);
			a[k] := n - k + 1;
			aBlock(a);
			{
				a[1] = (n - k + 1)
			}.whileFalse {
				let last = k;
				let z = nil;
				{
					a[last] = 1
				}.whileTrue {
					last := last - 1
				};
				z := a[last];
				a[last - 1] := a[last - 1] + 1;
				a[last] := 1;
				a[k] := z - 1;
				aBlock(a)
			}
		}
	}

	integerCompositionsExactly { :n :k |
		let answer = [];
		n.integerCompositionsExactlyDo(k) { :each |
			answer.add(each.copy)
		};
		answer
	}

	integerCompositionsWeakExactlyDo { :n :k :aBlock:/1 |
		let a = List(k, 0);
		a[k] := n;
		aBlock(a);
		{
			a[1] = n
		}.whileFalse {
			let last = k;
			let z = nil;
			{
				a[last] = 0
			}.whileTrue {
				last := last - 1
			};
			z := a[last];
			a[last - 1] := a[last - 1] + 1;
			a[last] := 0;
			a[k] := z - 1;
			aBlock(a)
		}
	}

	integerCompositionsWeak { :n |
		integerCompositionsWeak(n, 1:n)
	}

	integerCompositionsWeak { :n :kList |
		let answer = [];
		kList.do { :k |
			n.integerCompositionsWeakExactlyDo(k) { :each |
				answer.add(each.copy)
			}
		};
		answer
	}

	integerCompositionsWeakExactly { :n :k |
		let answer = [];
		n.integerCompositionsWeakExactlyDo(k) { :each |
			answer.add(each.copy)
		};
		answer
	}

	integerDigitsReverseDo { :self :base :numDigits :aBlock:/1 |
		let num = self.abs;
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
		self.assertIsInteger('@Integer>>integerDigits');
		base.isScalarInteger.if {
			let numDigits = self.isZero.if {
				1
			} {
				(self.abs.log / base.log + 0.0000000001).truncate + 1
			};
			self.integerDigits(
				base,
				numDigits
			)
		} {
			base.adaptToNumberAndApply(self, integerDigits:/2)
		}
	}

	integerDigits { :self |
		self.integerDigits(10)
	}

	integerExponent { :n :b |
		let answer = 0;
		{
			n.divisible(b ^ (answer + 1))
		}.whileTrue {
			answer := answer + 1
		};
		answer
	}

	integerLength { :self :radix |
		self.isZero.if {
			0
		} {
			let n = 1;
			let m = self.abs;
			{ m >= (radix ^ n) }.whileTrue {
				n := n + 1
			};
			n
		}
	}

	integerPartitions { :n |
		let answer = [];
		n.integerPartitionsDescendingDo { :each |
			answer.add(each)
		};
		answer
	}

	integerPartitions { :n :k |
		k.collect { :each |
			n.integerPartitionsExactly(each)
		}.++
	}

	integerPartitionsDescendingDo { :self :aBlock:/1 |
		let n = self;
		let d = List(n, 1);
		let k = 1;
		d[1] := n;
		aBlock(d.copyFromTo(1, 1));
		{
			k != n
		}.whileTrue {
			let l = k;
			let m = d[k];
			let nPrime = nil;
			{
				m = 1
			}.whileTrue {
				k := k - 1;
				m := d[k]
			};
			nPrime := m + l - k;
			m := m - 1;
			{
				m < nPrime
			}.whileTrue {
				d[k] := m;
				nPrime := nPrime - m;
				k := k + 1
			};
			d[k] := nPrime;
			aBlock(d.copyFromTo(1, k))
		}
	}

	integerPartitionsAscendingDo { :self :aBlock:/1 |
		let n = self;
		let a = List(n, 0);
		let k = 2;
		let y = n - 1;
		{
			k != 1
		}.whileTrue {
			var x, l;
			k := k - 1;
			x := a[k] + 1;
			{
				(2 * x) <= y
			}.whileTrue {
				a[k] := x;
				y := y - x;
				k := k + 1
			};
			l := k + 1;
			{
				x <= y
			}.whileTrue {
				a[k] := x;
				a[l] := y;
				aBlock(a.copyFromTo(1, l));
				x := x + 1;
				y := y - 1
			};
			y := y + x - 1;
			a[k] := y + 1;
			aBlock(a.copyFromTo(1, k))
		}
	}

	integerPartitionsAscending { :self |
		let answer = [];
		self.integerPartitionsAscendingDo { :each |
			answer.add(each)
		};
		answer
	}

	integerPartitionsExactly { :j :i |
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

	integerPartitionsOdd { :self |
		self.integerPartitions.select { :each |
			each.allSatisfy(isOdd:/1)
		}
	}

	integerPartitionsRecursive { :n |
		1:n.collectCatenate { :k |
			n.integerPartitionsExactly(k)
		}
	}

	integerPartitionsStrict { :self |
		self.integerPartitions.select(isDuplicateFree:/1)
	}

	integerReverse { :self :base |
		self.integerDigits(base).reverse.fromDigits(base)
	}

	integerReverse { :self |
		self.integerReverse(10)
	}

	integerSquareRoot { :self |
		(self < 0).if {
			self.error('integerSquareRoot: negative')
		} {
			let x = self;
			let z = self;
			let r = self.zero;
			let q = self.one;
			{ q <= x }.whileTrue {
				q := q.bitShiftLeft(2)
			};
			{ q > 1 }.whileTrue {
				let t = x - r;
				q := q.bitShiftRight(2);
				t := t - q;
				r := r.bitShiftRight(1);
				(t >= 0).ifTrue {
					x := t;
					r := r + q
				}
			};
			r
		}
	}

	integerString { :self :radix |
		self.basicPrintString(radix)
	}

	integerString { :self |
		self.integerString(10)
	}

	isAbundantNumber { :n |
		n.divisors.sum > (2 * n)
	}

	isAmicablePair { :m :n |
		m.divisors.allButLast.sum = n & {
			n.divisors.allButLast.sum = m
		}
	}

	isColossallyAbundantNumber { :n |
		(n > 224403121196654400L).if {
			n.error('isColossallyAbundantNumber: domain error')
		} {
			[
				2, 6, 12, 60, 120,
				360, 2520, 5040, 55440, 720720,
				1441440, 4324320, 21621600, 367567200, 6983776800,
				160626866400, 321253732800, 9316358251200, 288807105787200, 2021649740510400,
				6064949221531200, 224403121196654400L
			].includes(n)
		}
	}

	isCubicResidue { :q :p |
		let r = q.mod(p);
		0.to(p - 1).anySatisfy { :x |
			x.cube.mod(p) = r
		}
	}

	isDeficientNumber { :n |
		n.divisors.sum < (2 * n)
	}

	isDyadicRational { :self |
		self.isInteger
	}

	isHighlyAbundantNumber { :n |
		let k = n.divisors.sum;
		1.to(n - 1).allSatisfy { :i |
			k > i.divisors.sum
		}
	}

	isByte { :self |
		self.isInteger & {
			self.betweenAnd(0, 255)
		}
	}

	isHappyNumber { :self |
		self.perfectDigitalInvariantSequence(10, 2).last = 1
	}

	isHarmonicDivisorNumber { :n |
		isInteger(n * divisorSigma(0, n) / divisorSigma(1, n))
	}

	isHighlyCompositeNumber { :self |
		let n = 0.divisorSigma(self);
		1.to(self - 1).allSatisfy { :each |
			n > 0.divisorSigma(each)
		}
	}

	isInteger { :self |
		self.typeResponsibility('@Integer>>isInteger')
	}

	isIntegerSquare { :self |
		self.isInteger & {
			self.sqrt.isInteger
		}
	}

	isKaprekarNumber { :self :base :power |
		let n = self.integerLength(base);
		let d = (self ^ power).integerDigits(base);
		let p = d.last(n).fromDigits(base);
		let q = d.dropLast(n).fromDigits(base);
		(p + q) = self
	}

	isKaprekarNumber { :self |
		self.isKaprekarNumber(10, 2)
	}

	isNarcissisticNumber { :self :base |
		let power = self.integerLength(base);
		(self.integerDigits(base) ^ power).sum = self
	}

	isNarcissisticNumber { :self |
		self.isNarcissisticNumber(10)
	}

	isPalindrome { :self |
		self.integerDigits.isPalindrome
	}

	isPerfectDigitalInvariant { :self :base :power |
		self.perfectDigitalInvariantFunction(base, power) = self
	}

	isPerfectNumber { :self |
		self.divisors.allButLast.sum = self
	}

	isPerfectPower { :self |
		(self >= 4) & {
			let alpha = self.factorInteger.column(2);
			alpha.gcd > 1
		}
	}

	isPerfectSquare { :self |
		self.sqrt.isInteger
	}

	isPositiveInteger { :self |
		self.isInteger & {
			self.isPositive
		}
	}

	isPositiveOddInteger { :self |
		self.isPositiveInteger & {
			self % 2 = 1
		}
	}

	isPrimitiveAbundantNumber { :n |
		n.isAbundantNumber & {
			n.divisors.allButLast.allSatisfy(isDeficientNumber:/1)
		}
	}

	isPrimitivePythagoreanTriple { :a :b :c |
		[a, b, c].allSatisfy(isInteger:/1) & {
			a.isCoprime(b) & {
				[a, b].collect(isOdd:/1).boole.sum = 1 & {
					(a.square + b.square) = c.square
				}
			}
		}
	}

	isPrimitivePythagoreanTriple { :a :b |
		isPrimitivePythagoreanTriple(a, b, (a.square + b.square).sqrt)
	}

	isPronicNumber { :self |
		let x = self.sqrt.floor;
		self = (x * (x + 1))
	}

	isPseudoperfectNumber { :self |
		self
		.divisors
		.allButLast
		.powerSet
		.anySatisfy { :each |
			each.sum = self
		}
	}

	isPythagoreanTriple { :a :b :c |
		[a, b, c].allSatisfy(isInteger:/1) & {
			(a.square + b.square) = c.square
		}
	}

	isPythagoreanTriple { :a :b |
		isPythagoreanTriple(a, b, (a.square + b.square).sqrt)
	}

	isQuadraticResidue { :q :p |
		let r = q.mod(p);
		1.to((p / 2).floor).anySatisfy { :x |
			x.square.mod(p) = r
		}
	}

	isRefactorableNumber { :self |
		self.divisible(
			self.divisors.size
		)
	}

	isRegularNumber { :self |
		self.primeLimit <= 5
	}

	isRoughNumber { :self :k |
		self.primeFactors.allSatisfy { :each |
			each >= k
		}
	}

	isSinglyEven { :self |
		self.isEven & {
			self.divisible(4).not
		}
	}

	isSmoothNumber { :self :k |
		self.primeLimit <= k
	}

	isSphenicNumber { :self |
		self.isSquareFree & {
			self.isAlmostPrime(3)
		}
	}

	isSquareFree { :self |
		self.isZero.if {
			false
		} {
			self.abs.divisors.allButFirst.noneSatisfy(isPerfectSquare:/1)
		}
	}

	isSumOfTwoSquares { :self |
		self.factorInteger.select { :each |
			(each[1] % 4) = 3
		}.allSatisfy { :each |
			each[2].isEven
		}
	}

	isSumProductNumber { :self :base |
		let d = self.integerDigits(base);
		(d.sum * d.product) = self
	}

	isSumProductNumber { :self |
		self.isSumProductNumber(10)
	}

	isSuperabundantNumber { :n |
		let x = n.divisors.sum / n;
		1.to(n - 1).allSatisfy { :k |
			let y = k.divisors.sum / k;
			x > y
		}
	}

	isSuperiorHighlyCompositeNumber { :n |
		(n > 6064949221531200).if {
			n.error('isSuperiorHighlyCompositeNumber: domain error')
		} {
			[
				2, 6, 12, 60, 120,
				360, 2520, 5040, 55440, 720720,
				1441440, 4324320, 21621600, 367567200, 6983776800,
				13967553600, 321253732800, 2248776129600, 65214507758400, 195643523275200,
				6064949221531200
			].includes(n)
		}
	}

	isUnhappyNumber { :self |
		self.isHappyNumber.not
	}

	isWeirdNumber { :self |
		self.isAbundantNumber & {
			self.isPseudoperfectNumber.not
		}
	}

	jacobiSymbol { :a :n |
		n.isOdd.if {
			(n = 1).if {
				1
			} {
				n.factorInteger.collect { :each |
					a.legendreSymbol(each[1]) ^ each[2]
				}.product
			}
		} {
			[a, n].error('jacobiSymbol: even n?')
		}
	}

	kroneckerSymbol { :a :b |
		b.isPositive.if {
			b.isOdd.if {
				a.jacobiSymbol(b)
			} {
				a.isEven.if {
					0
				} {
					let r = a % 8;
					(r = 1 | { r = 7 }).if {
						a.kroneckerSymbol(b // 2)
					} {
						0  - a.kroneckerSymbol(b // 2)
					}
				}
			}
		} {
			b.isNegative.if {
				a.isNegative.if {
					0 - a.kroneckerSymbol(0 - b)
				} {
					a.kroneckerSymbol(0 - b)
				}
			} {
				(a.abs = 1).boole
			}
		}
	}

	lcm { :self :anInteger |
		anInteger.isScalarInteger.if {
			let a = self;
			let b = anInteger;
			(
				a = 0 | {
					b = 0
				}
			).if {
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

	legendreSymbol { :a :p |
		let e = (p - 1) // 2;
		let r = powerMod(a, e, p);
		(r > 1).if { r - p } { r }
	}

	minimalResidue { :self :modulus |
		let p = self % modulus;
		let q = p - modulus;
		(p < q.abs).if {
			p
		} {
			q
		}
	}

	mixedRadixEncode { :self :factors |
		let answer = List(factors.size);
		factors.size.toByDo(1, -1) { :index |
			answer[index] := self % factors[index];
			self := self // factors[index]
		};
		(self > 0).ifTrue {
			answer.addFirst(self)
		};
		answer
	}

	modularInverse { :a :n |
		let t = 0;
		let t1 = 1;
		let r = (n < 0).if { n.negate } { n };
		let r1 = (a < 0).if { (n - (a.negate % n)) % n } { a % n };
		{
			r1 != 0
		}.whileTrue {
			let quotient = r // r1;
			[t, t1] := [t1, t - (quotient * t1)];
			[r, r1] := [r1, r - (quotient * r1)]
		};
		(r > 1).if {
			'@Integer>>modularInverse: not invertible'.error
		} {
			(t < 0).ifTrue {
				t := t + n
			};
			(n < 0).ifTrue {
				t := t + n
			};
			t
		}
	}

	multiplicativeDigitalRoot { :x :b |
		x.digitalRootSet(b, product:/1).first
	}

	multiplicativeDigitalRoot { :x |
		x.multiplicativeDigitalRoot(10)
	}

	multiplicativeOrder { :k :n :r |
		k := k.asLargeInteger;
		(n = 1).if {
			1
		} {
			k.isCoprime(n).if {
				let m = k.one;
				{
					r.includes(k ^ m % n)
				}.whileFalse {
					m := m + 1
				};
				m
			} {
				nil
			}
		}
	}

	multiplicativeOrder { :k :n |
		k.multiplicativeOrder(n, [1])
	}

	multiplicativePersistence { :x :b |
		x.digitalRootSet(b, product:/1).second.size - 1
	}

	numberOfCompositions { :n :k |
		/* (n - 1).factorial / ((k - 1).factorial * (n - k).factorial) */
		(n - 1).binomial(k - 1)
	}

	numberOfCompositionsWeak { :n :k |
		/* (n + k - 1).factorial / (n.factorial * (k - 1).factorial) */
		binomial(n + k - 1, n)
	}

	numberOfDigitsInBase { :self :radix |
		self.isNegative.if {
			self.negate.numberOfDigitsInBase(radix)
		} {
			(self < radix).if {
				1
			} {
				radix.isPowerOfTwo.if {
					(self.highBit + radix.highBit - 2).quotient(
						radix.highBit - 1
					)
				} {
					let q = self;
					let total = 0;
					{
						let nDigits = (radix = 10).if {
							((q.highBit - 1) * 1233 >> 12) + 1
						} {
							q.highBit.quotient(radix.highBit)
						};
						total := total + nDigits;
						q := q.quotient(radix.raisedToInteger(nDigits));
						(q < radix)
					}.whileFalse;
					(q = 0).if {
						total
					} {
						total + 1
					}
				}
			}
		}
	}

	numerator { :self |
		self
	}

	perfectDigitalInvariantFunction { :self :base :power |
		let sum = 0;
		{ self > 0 }.whileTrue {
			sum := sum + ((self % base) ^ power);
			self := self // base
		};
		sum
	}

	perfectDigitalInvariantSequence { :self :base :power |
		let answer = [];
		{ answer.includes(self) }.whileFalse {
			answer.add(self);
			self := self.perfectDigitalInvariantFunction(base, power)
		};
		answer
	}

	perfectNumber { :n |
		[
			6,
			28,
			496,
			8128,
			33550336,
			8589869056,
			137438691328,
			2305843008139952128L,
			2658455991569831744654692615953842176L,
			191561942608236107294793378084303638130997321548169216L
		].at(n)
	}

	positiveResidue { :self :modulus |
		let n = self % modulus;
		n.isZero.if {
			modulus
		} {
			n
		}
	}

	printString { :self :radix |
		(radix = 10).if {
			self.basicPrintString(10)
		} {
			let unsignedAnswer = '%r%'.format([
				radix.basicPrintString(10),
				self.abs.basicPrintString(radix)
			]);
			self.isNegative.if {
				'-' ++ unsignedAnswer
			} {
				unsignedAnswer
			}
		}
	}

	printString { :self |
		self.printString(10)
	}

	printStringHex { :self |
		self.printString(16)
	}

	quadraticNonresidues { :p |
		2.to(p - 1).reject { :q |
			isQuadraticResidue(q, p)
		}
	}

	quadraticResidues { :p |
		1.to(p - 1).select { :q |
			isQuadraticResidue(q, p)
		}
	}

	ramanujanTau { :n |
		let a = 65/756 * divisorSigma(11, n);
		let b = 691/756 * divisorSigma(5, n);
		let c = 691/3 * 1.to(n - 1).sum { :k |
			divisorSigma(5, k) * divisorSigma(5, n - k)
		};
		a + b - c
	}

	reducedResidueSystem { :self |
		0.to(self - 1).select { :each |
			each.isCoprime(self)
		}
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
		let integer = self.isNegative.if {
			aStream.nextPut('-'.asciiValue);
			self.negate
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

	romanNumeral { :self |
		self.isZero.if {
			'N'
		} {
			{ :stream |
				romanDigitsOn(self, stream)
			}.asciiStringStreamContents
		}
	}

	rudinShapiro { :n |
		let b = n.integerDigits(2);
		let k = b.size;
		-1 ^ 1.to(k - 1).sum { :i |
			b[i] * b[i + 1]
		}
	}

	rulerFunction { :n |
		(2 * n).integerExponent(2)
	}

	squarePyramidalNumber { :n |
		(n * (n + 1) * ((2 * n) + 1)) / 6
	}

	squaresR { :d :n |
		(n = 0).if {
			1
		} {
			d.caseOf(
				[
					2 -> {
						let f = { :c |
							n.divisors.count { :x | (x % 4) = c }
						};
						4 * (f(1) - f(3))
					},
					4 -> {
						8 * n.divisors.select { :x | x.divisible(4).not }.sum
					}
				]
			) {
				d.error('squaresR: d≠{2,4}')
			}
		}
	}

	stolarskyArray { :m :n |
		let phi = 1.goldenRatio;
		let g = { :x | (x * phi + 0.5).floor };
		(n = 1).if {
			(m = 1).if {
				1
			} {
				let z = (m - 1).stolarskyArray(1) + 1;
				let rowContains = { :r :x |
					let k = r.stolarskyArray(1);
					{
						k < x
					}.whileTrue {
						k := g(k)
					};
					k = x
				};
				{
					1.to(m - 1).anySatisfy { :r |
						r.rowContains(z)
					}
				}.whileTrue {
					z := z + 1
				};
				z
			}
		} {
			g(m.stolarskyArray(n - 1))
		}
	}

	subdivide { :self |
		Range(0, 1, Fraction(1, self))
	}

	theodorusSpiral { :n |
		let theta = 0;
		1.to(n).collect { :i |
			let p = [i.sqrt theta];
			theta := theta + (1 / i.sqrt).arcTan;
			p.fromPolarCoordinates
		}
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

	tonelliShanksAlgorithm { :n :p |
		(legendreSymbol(n, p) != 1).if {
			[n, p].error('tonelliShanksAlgorithm: not square')
		} {
			let q = p - 1;
			let s = 0;
			{ q.isEven }.whileTrue {
				q := q / 2;
				s := s + 1
			};
			(s = 1).if {
				powerMod(n, (p + 1) / 4, p)
			} {
				let z = 2;
				let m = s;
				let c = nil;
				let r = nil;
				let t = nil;
				{ z < p & { legendreSymbol(z, p) != -1 } }.whileTrue {
					z := z + 1
				};
				c := powerMod(z, q, p);
				r := powerMod(n, (q + 1) / 2, p);
				t := powerMod(n, q, p);
				{ (t - 1) % p != 0 }.whileTrue {
					let t2 = (t ^ 2) % p;
					let i = 1;
					let b = nil;
					{ i < m & { (t2 - 1) % p != 0 } }.whileTrue {
						t2 := (t2 ^ 2) % p;
						i := i + 1
					};
					b := powerMod(c, 2 ^ (m - i - 1), p);
					r := (r * b) % p;
					c := (b ^ 2) % p;
					t := (t * c) % p;
					m := i
				};
				r
			}
		}
	}

	tribonacciNumber { :n |
		let a = (19 + (3 * 33.sqrt)).cubeRoot;
		let b = (586 + (102 * 33.sqrt)).cubeRoot;
		let c = (19 - (3 * 33.sqrt)).cubeRoot;
		let d = ((1 / 3) * (a + c + 1)) ^ (n - 1);
		let e = b.square - (2 * b) + 4;
		((3 * b) * (d / e)).round
	}

	tribonacciWords { :n |
		let t = [1; 1 2; 1 2 1 3];
		4.toDo(n) { :i |
			t.add(t[i - 1] ++ t[i - 2] ++ t[i - 3])
		};
		t
	}

	tribonacciWord { :n |
		(n + 1).tribonacciWords.at(n + 1)
	}

	truncate { :self |
		self
	}

	wrapIndex { :self :size |
		self - 1 % size + 1
	}

	zeckendorfRepresentation { :self |
		(self <= 0).if {
			[0]
		} {
			let f = self.fibonacciSequenceUpTo;
			let k = f.size - 1;
			let z = [];
			f.removeFirst;
			k.toByDo(1, -1) { :i |
				let n = f[i];
				z.add((n <= self).if { 1 } { 0 });
				(n <= self).ifTrue {
					self := self - n
				}
			};
			z
		}
	}

}

+@Integer {

	asLargerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.isNonNegative.if {
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
			self.isNonNegative.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver - 1)
			} {
				self.error('@Integer>>asSmallerPowerOfTwo: non-positive')
			}
		}
	}

	isPowerOfTwo { :self |
		self != 0 & {
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

+@Object {

	isScalarInteger { :self |
		self.isNumber & {
			self.isInteger
		}
	}

}

+List {

	conjugatePartition { :self |
		let answer = [];
		let j = self.size;
		let done = false;
		(j <= 0).if {
			answer
		} {
			{
				done
			}.whileFalse {
				answer.add(j);
				{
					done.not & {
						answer.size >= self[j]
					}
				}.whileTrue {
					j := j - 1;
					(j = 0).ifTrue {
						done := true
					}
				}
			}
		};
		answer
	}

	ferrersDiagram { :self |
		let m = self.size;
		0.to(m - 1).collect { :i |
			1.to(self[m - i]).collect { :j |
				Disk([j, i], 0.25)
			}
		}.LineDrawing
	}

	isAmicablePair { :self |
		let [m, n] = self;
		isAmicablePair(m, n)
	}

}
