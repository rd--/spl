/* Requires: List String */

+@Integer {

	ramanujansSum { :q :n |
		1.to(q).sum { :a |
			(a.gcd(q) = 1).if {
				(2I.pi * (a / q) * n).exp
			} {
				0
			}
		}.real.round
	}

	additivePersistence { :x :b |
		x.digitalRootSet(b, sum/1).second.size - 1
	}

	aliquotSum { :n |
		n.divisors.allButLast.sum
	}

	alternatingBitSum { :self |
		self.integerDigits(2)
		.reverse
		.alternatingSum
	}

	amusicalPermutation { :n |
		n.isEven.if {
			3 * n // 2
		} {
			((3 * n + 2) / 4).floor
		}
	}

	antiDivisors { :n |
		let m = n - 1;
		2.to(m).select { :x |
			((n % x) - (x / 2)).abs < 1
		}
	}

	radixString { :self :radix |
		SmallInteger(self).radixString(radix)
	}

	antiDivisorsClassSum { :n |
		let m = n - 1;
		2.to(m).sum { :d |
			let a = n % d;
			let b = (d - 1) / 2;
			let c = (d + 1) / 2;
			[
				{ a = b } -> { -1 },
				{ a = c } -> { 1 },
				{ true } -> { 0 }
			].which
		}
	}

	assertIsInteger { :self :origin |
		self.isIntegerValuedNumber.if {
			self
		} {
			self.error('Not an integer', [origin])
		}
	}

	assertIsNonNegativeInteger { :self :origin |
		self.isNonNegativeInteger.if {
			self
		} {
			self.error('Negative integer', [origin])
		}
	}

	assertIsPositiveInteger { :self :origin |
		self.isPositiveInteger.if {
			self
		} {
			self.error('Not a positive integer', [origin])
		}
	}

	assertIsPositiveOddInteger { :self :origin |
		self.isPositiveOddInteger.if {
			self
		} {
			self.error('Not a positive odd integer', [origin])
		}
	}

	balancedTernaryDigits { :self |
		let f = { :n |
			(n = 0).if {
				[]
			} {
				(n % 3).caseOf(
					[
						0 -> { [0] ++ f(n // 3) },
						1 -> { [1] ++ f(n // 3) },
						2 -> { [-1] ++ f((n + 1) // 3) }
					]
				)
			}
		};
		f(self).reverse
	}

	bernsteinBasis { :d :n :x |
		x := x.clip(0, 1);
		d.binomial(n) * (x ^ n) * ((1 - x) ^ (d - n))
	}

	binaryExpansion { :n :k |
		n.integerDigits(2L, k)
	}

	binaryExpansion { :n |
		n.integerDigits(2L)
	}

	binaryExponents { :self |
		let answer = [];
		1.toDo(self.bitLength) { :index |
			(self.bitAt(index) = 1).ifTrue {
				answer.add!(index - 1)
			}
		};
		answer
	}

	binaryRunLengthEncode { :self |
		(self < 0L).if {
			self.error('binaryRunLengthEncode: negative integer')
		} {
			(self = 0L).if {
				[]
			} {
				self.binaryExpansion.runLengths
			}
		}
	}

	bitIff { :p :q |
		let k = p.bitLength.max(q.bitLength);
		Range(k, 1L, -1L).collect { :i |
			p.bitAt(i) = q.bitAt(i)
		}.boole.binaryContraction
	}

	bitImplies { :p :q |
		let k = p.bitLength.max(q.bitLength);
		let r = p.bitNot(k);
		r.bitOr(q)
	}

	bitLength { :self |
		self.isBetween(-1, 0).if {
			0L
		} {
			self.isPositive.if {
				self.integerLength(2L)
			} {
				self.bitNot.integerLength(2L)
			}
		}
	}

	bitNor { :a :b :k |
		bitOr(a, b).bitNot(k)
	}

	bitNot { :self :k |
		let d = self.integerDigits(2L, k);
		(1L - d).fromDigits(2L)
	}

	bjorklundsAlgorithm { :k :n |
		k.bjorklundsAlgorithmDo(n) { :each | nil }
	}

	bjorklundsAlgorithmDo { :k :n :aBlock/1 |
		let s = 1L.toCollect(n) { :i |
			(i <= k).if {
				[1L]
			} {
				[0L]
			}
		};
		let d = n - k;
		let z = d;
		aBlock(s);
		n := k.max(d);
		k := k.min(d);
		{
			z > 0L | {
				k > 1L
			}
		}.whileTrue {
			1.toDo(k) { :i |
				s[i].addAll!(s[s.size - i + 1])
			};
			s.removeLast!(k);
			aBlock(s);
			z := z - k;
			d := n - k;
			n := k.max(d);
			k := k.min(d)
		};
		s.flatten
	}

	bjorklundsAlgorithmSequence { :k :n |
		let a = [];
		k.bjorklundsAlgorithmDo(n) { :each |
			a.add!(each.flatten)
		};
		a
	}

	boole { :self |
		self.isZero.if {
			0L
		} {
			self.isOne.if {
				1L
			} {
				self.error('boole')
			}
		}
	}

	carryLessMultiplication { :m :n :b |
		(b = 2).if {
			let s = m.zero;
			{
				n > 0
			}.whileTrue {
				(1 = (n % 2)).ifTrue {
					s := bitXor(s, m)
				};
				n := floor(n / 2);
				m := m * 2
			};
			s
		} {
			b.error('carryLessMultiplication: b!=2')
		}
	}

	carryLessMultiplication { :m :n |
		carryLessMultiplication(m, n, 2)
	}

	carryLessPower { :n :m :b |
		{ :x |
			carryLessMultiplication(x, n, b)
		}.iterate(n.one, m)
	}

	carryLessPower { :n :m |
		carryLessPower(m, n, 2)
	}

	characterRange { :self :anInteger |
		self.toCollect(anInteger, fromCodePoint/1)
	}

	combinations { :n :m |
		1.to(n).combinations(m)
	}

	commonResidue { :self :modulus |
		self % modulus
	}

	congruencePredicate { :c :m |
		{ :b |
			b % m = c
		}
	}

	decimalExpansion { :n |
		n.integerDigits(10L)
	}

	decimalPeriod { :self |
		self.assertIsInteger('decimalPeriod');
		0L
	}

	dedekindPsi { :n |
		let m = n.divisorSum { :d |
			d.moebiusMu ^ 2L / d
		};
		(n * m).round
	}

	dedekindPsi { :n :k |
		(k * 2L).jordanTotient(n) / k.jordanTotient(n)
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

	digitalRoot { :x :b |
		x.digitalRootSet(b, sum/1).first
	}

	digitalRootSet { :x :b :f/1 |
		let seen = Set([], =);
		{
			seen.includes(x)
		}.whileFalse {
			seen.add!(x);
			x := x.integerDigits(b).f
		};
		[x, seen]
	}

	divideOutAll { :n :d |
		let a = [n];
		{ :break/0 |
			let m = d.detectIfNone { :x |
				n.divisible(x)
			} {
				break()
			};
			n := n // m;
			a.add!(n)
		}.repeatForeverWithBreak;
		a
	}

	dividesImmediately { :self :operand |
		(self / operand).isPrime
	}

	divisorSum { :self :aBlock/1 |
		self.divisors.collect(aBlock/1).sum
	}

	divisorSummatoryFunction { :x |
		let u = x.isqrt;
		2 * 1.to(u).sum { :k |
			(x / k).floor
		} - u.square
	}

	divisors { :self |
		let n = Integer(self);
		1L.to(n).select { :each |
			n \\ each = 0L
		}
	}

	elementaryCellularAutomaton { :ruleNumber :initialState :stepLimit |
		let stateSize = initialState.size;
		let ruleTable = ruleNumber.integerDigits(2, 8);
		let stepCount = 0;
		let answer = [initialState];
		let previousState = initialState;
		{ stepCount < stepLimit }.whileTrue {
			let nextState = 1.toCollect(stateSize) { :i |
				let j = [i - 1, i, i + 1];
				let k = previousState.atAllWrap(j).fromDigits(2);
				ruleTable[8 - k]
			};
			answer.add!(nextState);
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

	eulerPhiInverse { :m |
		(m = 1).if {
			[1, 2]
		} {
			m.isOdd.if {
				[]
			} {
				let p = select(divisors(m) + 1, isPrime/1);
				let nmax = m * (p / (p - 1)).product;
				let n = m;
				let nn = [];
				{ n <= nmax }.whileTrue {
					(n.eulerPhi = m).ifTrue {
						nn.add!(n)
					};
					n := n + 1
				};
				nn
			}
		}
	}

	evenPart { :n |
		(n = 0).if {
			1
		} {
			2 ^ n.integerExponent(2)
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

	foldIndex { :self :size |
		self.fold(1, size)
	}

	gcd { :self :anInteger |
		anInteger.isIntegerValuedNumber.if {
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
			anInteger.adaptToIntegerAndApply(self, gcd/2)
		}
	}

	gcdSum { :n |
		1L.to(n).sum { :k |
			gcd(n, k)
		}
	}

	hammingNumbers { :end :start |
		let answer = IdentitySet();
		let step = { :n |
			(n <= end).ifTrue {
				answer.includes(n).ifFalse {
					answer.uncheckedInclude!(n);
					step(n * 2L);
					step(n * 3L);
					step(n * 5L)
				}
			}
		};
		step(start);
		SortedList(answer).collection
	}

	hammingNumbers { :end |
		hammingNumbers(end, 1L)
	}

	hammingWeight { :self |
		self.digitCount(2L, 1L)
	}

	hexDigitCharacter { :self |
		'0123456789ABCDEF'.at(self + 1)
	}

	inEnglishWords { :self |
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
				let three = (num % 1000).threeDigitName;
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

	integerCompositions { :n |
		let answer = [];
		n.integerCompositionsDo { :each |
			answer.add!(each.copy)
		};
		answer
	}

	integerCompositions { :n :k |
		let answer = [];
		n.integerCompositionsDo(k) { :each |
			answer.add!(each.copy)
		};
		answer
	}

	integerCompositionsDo { :n :kList :aBlock/1 |
		kList.do { :k |
			n.integerCompositionsExactlyDo(k, aBlock/1)
		}
	}

	integerCompositionsDo { :n :aBlock/1 |
		integerCompositionsDo(n, 1.to(n), aBlock/1)
	}

	integerCompositionsExactly { :n :k |
		let answer = [];
		n.integerCompositionsExactlyDo(k) { :each |
			answer.add!(each.copy)
		};
		answer
	}

	integerCompositionsExactlyDo { :n :k :aBlock/1 |
		(n < k).ifFalse {
			let a = List(k, 1);
			a[k] := n - k + 1;
			aBlock(a);
			{
				a[1] = (n - k + 1)
			}.whileFalse {
				let last = k;
				{
					a[last] = 1
				}.whileTrue {
					last := last - 1
				};
				let z = a[last];
				a[last - 1] := a[last - 1] + 1;
				a[last] := 1;
				a[k] := z - 1;
				aBlock(a)
			}
		}
	}

	integerCompositionsWeak { :n |
		integerCompositionsWeak(n, 1.to(n))
	}

	integerCompositionsWeak { :n :kList |
		let answer = [];
		kList.do { :k |
			n.integerCompositionsWeakExactlyDo(k) { :each |
				answer.add!(each.copy)
			}
		};
		answer
	}

	integerCompositionsWeakExactly { :n :k |
		let answer = [];
		n.integerCompositionsWeakExactlyDo(k) { :each |
			answer.add!(each.copy)
		};
		answer
	}

	integerCompositionsWeakExactlyDo { :n :k :aBlock/1 |
		let a = List(k, 0);
		a[k] := n;
		aBlock(a);
		{
			a[1] = n
		}.whileFalse {
			let last = k;
			{
				a[last] = 0
			}.whileTrue {
				last := last - 1
			};
			let z = a[last];
			a[last - 1] := a[last - 1] + 1;
			a[last] := 0;
			a[k] := z - 1;
			aBlock(a)
		}
	}

	integerConcatenation { :m :n :b |
		(m * (b ^ n.integerLength(b))) + n
	}

	integerConcatenation { :m :n |
		integerConcatenation(m, n, 10L)
	}

	integerDigits { :self :base :numDigits |
		let answer = [];
		self.integerDigitsReverseDo(base, numDigits) { :each |
			answer.addFirst!(each)
		};
		answer
	}

	integerDigits { :self :base |
		self.assertIsInteger('@Integer>>integerDigits');
		base.caseOf(
			[
				-2 -> { self.negabinaryExpansion },
				1 -> { self.unaryExpansion }
			]
		) {
			base.isIntegerValuedNumber.if {
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
				base.adaptToNumberAndApply(self, integerDigits/2)
			}
		}
	}

	integerDigits { :self |
		self.integerDigits(10)
	}

	integerDigitsReverseDo { :self :base :numDigits :aBlock/1 |
		let num = self.abs;
		numDigits.timesRepeat {
			aBlock(num % base);
			num := num // base
		}
	}

	integerExponent { :n :b |
		let answer = 0L;
		{
			n.divisible(b ^ (answer + 1L))
		}.whileTrue {
			answer := answer + 1L
		};
		answer
	}

	integerLength { :self :radix |
		self.isZero.if {
			0L
		} {
			let n = 1L;
			let m = Integer(self).abs;
			{ m >= (radix ^ n) }.whileTrue {
				n := n + 1L
			};
			n
		}
	}

	integerLength { :self |
		self.integerLength(10L)
	}

	integerReverse { :self :base :length |
		self.integerDigits(base, length).reverse.fromDigits(base)
	}

	integerReverse { :self :base |
		self.integerDigits(base).reverse.fromDigits(base)
	}

	integerReverse { :self |
		self.integerReverse(10)
	}

	integerString { :self :radix |
		Integer(self).integerString(radix)
	}

	integerString { :self |
		self.integerString(10L)
	}

	isAbundantNumber { :n |
		n.divisors.sum > (2 * n)
	}

	isAmicablePair { :m :n |
		m.divisors.allButLast.sum = n & {
			n.divisors.allButLast.sum = m
		}
	}

	isByte { :self |
		self.isIntegerValuedNumber & {
			self.isBetween(0, 255)
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

	isCongruence { :b :x :m |
		let c = x % m;
		(b % m) = c
	}

	isCubeFree { :n |
		let [_, d] = n.factorInteger.transpose;
		d.max < 3
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
		self.isIntegerValuedNumber
	}

	isFundamentalDiscriminant { :n |
		n != 1 & {
			n % 4 = 1 | {
				let m = n % 16;
				m = 8 | { m = 12 }
			}
		} & {
			(n / (2 ^ n.integerExponent(2))).isSquareFree
		}
	}

	isHappyNumber { :self |
		self.perfectDigitalInvariantSequence(10, 2).last = 1
	}

	isHarmonicDivisorNumber { :n |
		(
			n * divisorSigma(0, n)
			/
			divisorSigma(1, n)
		).isIntegerValuedNumber
	}

	isHighlyAbundantNumber { :n |
		let k = n.divisors.sum;
		1.to(n - 1).allSatisfy { :i |
			k > i.divisors.sum
		}
	}

	isHighlyCompositeNumber { :self |
		let n = 0.divisorSigma(self);
		1.to(self - 1).allSatisfy { :each |
			n > 0.divisorSigma(each)
		}
	}

	isIntegerSquare { :self |
		self.isIntegerValuedNumber & {
			self.sqrt.isIntegerValuedNumber
		}
	}

	isIntegerValuedNumber { :self |
		self.typeResponsibility('@Integer>>isIntegerValuedNumber')
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

	isKeithNumber { :n :b |
		let d = n.integerDigits(b);
		let t = d.size;
		let x = d.last;
		{
			x < n
		}.whileTrue {
			x := d.last(t).sum;
			d.add!(x)
		};
		(x = n)
	}

	isKeithNumber { :n |
		n.isKeithNumber(10)
	}

	isNarcissisticNumber { :self :base |
		let power = self.integerLength(base);
		(self.integerDigits(base) ^ power).sum = self
	}

	isNarcissisticNumber { :self |
		self.isNarcissisticNumber(10)
	}

	isPalindrome { :self :base |
		self.integerDigits(base).isPalindrome
	}

	isPalindrome { :self |
		self.isPalindrome(10)
	}

	isPerfectCube { :n |
		n.cubeRoot.isNearInteger(1E-14)
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
		self.sqrt.isNearInteger(1E-14)
	}

	isPositiveOddInteger { :self |
		self.isPositiveInteger & {
			self % 2 = 1
		}
	}

	isPrimitiveAbundantNumber { :n |
		n.isAbundantNumber & {
			n.divisors.allButLast.allSatisfy(isDeficientNumber/1)
		}
	}

	isPrimitivePythagoreanTriple { :a :b :c |
		[a, b, c].allSatisfy(isIntegerValuedNumber/1) & {
			a.isCoprime(b) & {
				[a, b].collect(isOdd/1).boole.sum = 1 & {
					(a.square + b.square) = c.square
				}
			}
		}
	}

	isPrimitivePythagoreanTriple { :a :b |
		isPrimitivePythagoreanTriple(a, b, (a.square + b.square).sqrt)
	}

	isPronicNumber { :self |
		let x = self.isqrt;
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
		[a, b, c].allSatisfy(isIntegerValuedNumber/1) & {
			(a.square + b.square) = c.square
		}
	}

	isPythagoreanTriple { :a :b |
		isPythagoreanTriple(a, b, (a.square + b.square).isqrt)
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

	isRepeatingDecimal { :self |
		self.decimalPeriod > 0
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
			self.abs.divisors.allButFirst.noneSatisfy(isPerfectSquare/1)
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

	isSuperparticular { :self |
		self = 2
	}

	isTerminatingDecimal { :self |
		self.decimalPeriod = 0
	}

	isTriangularNumber { :self |
		(self * 8 + 1).isSquare
	}

	isUnhappyNumber { :self |
		self.isHappyNumber.not
	}

	isWeirdNumber { :self |
		self.isAbundantNumber & {
			self.isPseudoperfectNumber.not
		}
	}

	jacobiSymbol { :n :m |
		m.isOdd.if {
			m.isOne.if {
				1L
			} {
				m.factorInteger.collect { :each |
					n.legendreSymbol(each[1]) ^ each[2]
				}.product
			}
		} {
			[n, m].error('jacobiSymbol: even m?')
		}
	}

	jordanTotient { :k :n |
		n.isCollection.if {
			n.collect { :i |
				jordanTotient(k, i)
			}
		} {
			n.divisorSum { :d |
				(d ^ k) * (n // d).moebiusMu
			}
		}
	}

	kroneckerSymbol { :a :b |
		b.isPositive.if {
			b.isOdd.if {
				a.jacobiSymbol(b)
			} {
				a.isEven.if {
					0L
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
				Integer((a.abs = 1).boole)
			}
		}
	}

	lcm { :self :anInteger |
		anInteger.isIntegerValuedNumber.if {
			self.uncheckedLcm(anInteger)
		} {
			anInteger.adaptToNumberAndApply(self, lcm/2)
		}
	}

	leadingDigit { :self :base |
		self.integerDigits(base).first
	}

	legendreSymbol { :a :p |
		let e = (p - 1L) // 2L;
		let r = powerMod(a, e, p);
		(r > 1L).if { r - p } { r }
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

	modularInverse { :a :n |
		let t = 0L;
		let t1 = 1L;
		let r = (n < 0L).if { n.negate } { n };
		let r1 = (a < 0L).if { (n - (a.negate % n)) % n } { a % n };
		{
			r1 != 0L
		}.whileTrue {
			let quotient = r // r1;
			[t, t1] := [t1, t - (quotient * t1)];
			[r, r1] := [r1, r - (quotient * r1)]
		};
		(r > 1L).if {
			'@Integer>>modularInverse: not invertible'.error
		} {
			(t < 0L).ifTrue {
				t := t + n
			};
			(n < 0L).ifTrue {
				t := t + n
			};
			t
		}
	}

	multiplicativeDigitalRoot { :x :b |
		x.digitalRootSet(b, product/1).first
	}

	multiplicativeDigitalRoot { :x |
		x.multiplicativeDigitalRoot(10L)
	}

	multiplicativeOrder { :k :n :r |
		k := Integer(k);
		r := r % n;
		(n = 1).if {
			1L
		} {
			k.isCoprime(n).if {
				let m = k.one;
				{
					r.includes(k ^ m % n)
				}.whileFalse {
					m := m + 1L
				};
				m
			} {
				nil
			}
		}
	}

	multiplicativeOrder { :k :n |
		k.multiplicativeOrder(n, [1L])
	}

	multiplicativePersistence { :x :b |
		x.digitalRootSet(b, product/1).second.size - 1L
	}

	multiplicativeSuborder { :a :n |
		(
			n > 1L & {
				a.gcd(n) = 1L
			}
		).if {
			let m = n - 1L;
			1L.to(Infinity).detect { :e |
				let r = (a ^ e) % n;
				r = 1L | { r = m }
			}
		} {
			0L
		}
	}

	negabinaryExpansion { :n |
		let a = n.abs + 1;
		let b = a.log(4) + 2;
		let c = (4 ^ b.floor) - 1;
		let d = c / 3 * 2;
		(n + d).bitXor(d).integerDigits(2)
	}

	numberDigit { :x :n :b |
		x := x.abs;
		n.isCollection.if {
			n.collect { :m |
				x.numberDigit(m, b)
			}
		} {
			x.isIntegerValuedNumber.if {
				n.timesRepeat {
					x := x // b
				};
				x % b
			} {
				x.error('numberDigit: not integer')
			}
		}
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

	oddPart { :n |
		(n = 0).if {
			0
		} {
			n / (2 ^ n.integerExponent(2))
		}
	}

	onesComplement { :self :wordSize |
		let a = self.twosComplement(wordSize);
		(a < 0).if {
			a + 1
		} {
			a
		}
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
			answer.add!(self);
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

	perfectPower { :self |
		(self < 4L).if {
			nil
		} {
			let a = self.factorInteger;
			let b = a.column(2L);
			let c = b.gcd;
			(c > 1L).if {
				let d = a.column(1L);
				[d.product, c]
			} {
				nil
			}
		}
	}

	positiveResidue { :self :modulus |
		let n = self % modulus;
		n.isZero.if {
			modulus
		} {
			n
		}
	}

	primitivePythagoreanTriples { :k |
		let m = (2 * k) + 1;
		let n = (2 * (k ^ 2)) + m;
		let t = [[3, 4, 5]];
		let i = 4;
		let j = 5;
		{
			i < n
		}.whileTrue {
			(gcd(i, j) = 1).ifTrue {
				let h = sqrt((i ^ 2) + (j ^ 2));
				(h.isIntegerValuedNumber & { j < n }).ifTrue {
					t.add!([i, j, h])
				}
			};
			(j < n).if {
				j := j + 2
			} {
				i := i + 1;
				j := i + 1
			}
		};
		t.select { :p |
			p[1] < m
		}
	}

	printStringHexadecimal { :self |
		self.radixString(16)
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
		let c = 691/3 * 1L.to(n - 1).sum { :k |
			divisorSigma(5L, k) * divisorSigma(5L, n - k)
		};
		a + b - c
	}

	reducedResidueSystem { :self |
		0.to(self - 1).select { :each |
			each.isCoprime(self)
		}
	}

	romanDigitsForOn { :self :digits :base :aCollection |
		let n = self % (base * 10) // base;
		(n = 9).if {
			aCollection.addAll!([digits.last, digits.first])
		} {
			(n = 4).if {
				aCollection.addAll!([digits.last, digits.second])
			} {
				(n > 4).ifTrue {
					aCollection.add!(digits.second)
				};
				(n % 5).timesRepeat {
					aCollection.add!(digits.last)
				}
			}
		}
	}

	romanDigitsOn { :self :aCollection |
		let integer = self.isNegative.if {
			aCollection.add!('-'.asciiValue);
			self.negate
		} {
			self
		};
		(integer // 1000).timesRepeat {
			aCollection.add!('M'.asciiValue)
		};
		integer.romanDigitsForOn('MDC'.asciiByteArray, 100, aCollection);
		integer.romanDigitsForOn('CLX'.asciiByteArray, 10, aCollection);
		integer.romanDigitsForOn('XVI'.asciiByteArray, 1, aCollection)
	}

	romanNumeral { :self |
		self.isZero.if {
			'N'
		} {
			{ :aCollection |
				romanDigitsOn(self, aCollection)
			}.asciiStringBuilder
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

	signedGcd { :self :aNumber |
		(
			self.isNegative & {
				aNumber.isNegative
			}
		).if {
			self.negate.gcd(aNumber.negate).negate
		} {
			self.gcd(aNumber)
		}
	}

	signedLcm { :self :aNumber |
		(
			self.isNegative | {
				aNumber.isNegative
			}
		).if {
			self.abs.lcm(aNumber.abs).negate
		} {
			self.lcm(aNumber)
		}
	}

	squareFreePart { :n |
		let [p, e] = n.factorInteger.transpose;
		(p ^ (e % 2)).product
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
					1 -> {
						n.sqrt.isIntegerValuedNumber.boole * 2
					},
					2 -> {
						let f = { :c |
							n.divisors.count { :x |
								(x % 4) = c
							}
						};
						4 * (f(1) - f(3))
					},
					3 -> {
						let m = n.integerSquareRoot + 1;
						2.squaresR(n) + (
							1:m.sum { :k |
								2.squaresR(n - (k ^ 2))
							} << 1
						)
					},
					4 -> {
						8 * n.divisors.select { :x |
							x.divisible(4).not
						}.sum
					}
				]
			) {
				d.error('squaresR: d≠{1,2,4}')
			}
		}
	}

	subdivide { :self |
		Range(0, 1, Fraction(1, self))
	}

	ternaryExpansion { :n |
		n.integerDigits(3)
	}

	theodorusSpiral { :n |
		let theta = 0;
		1.toCollect(n) { :i |
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
		withReturn { :return/1 |
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

	timesRepeat { :self :aBlock/0 |
		let remaining = self;
		{
			remaining > 0
		}.whileTrue {
			aBlock();
			remaining := remaining - 1
		}
	}

	toCollect { :start :end :aBlock/1 |
		let size = end - start + 1L;
		(size < 1L).if {
			[]
		} {
			let answer = List(size, nil);
			let i = 1L;
			let j = start;
			{
				i <= size
			}.whileTrue {
				answer[i] := aBlock(j);
				i := i + 1L;
				j := j + 1L
			};
			answer
		}
	}

	tonelliShanksAlgorithm { :n :p |
		(legendreSymbol(n, p) != 1L).if {
			[n, p].error('tonelliShanksAlgorithm: not square')
		} {
			let q = p - 1L;
			let s = 0L;
			{ q.isEven }.whileTrue {
				q := q / 2L;
				s := s + 1L
			};
			(s = 1L).if {
				powerMod(n, (p + 1L) / 4L, p)
			} {
				let z = 2L;
				let m = s;
				{
					z < p & {
						legendreSymbol(z, p) != -1L }
				}.whileTrue {
					z := z + 1L
				};
				let c = powerMod(z, q, p);
				let r = powerMod(n, (q + 1L) / 2L, p);
				let t = powerMod(n, q, p);
				{
					(t - 1L) % p != 0L
				}.whileTrue {
					let t2 = (t ^ 2L) % p;
					let i = 1L;
					{
						i < m & {
							(t2 - 1L) % p != 0L }
					}.whileTrue {
						t2 := (t2 ^ 2L) % p;
						i := i + 1L
					};
					let b = powerMod(c, 2L ^ (m - i - 1L), p);
					r := (r * b) % p;
					c := (b ^ 2L) % p;
					t := (t * c) % p;
					m := i
				};
				r
			}
		}
	}

	totientSummatoryFunction { :n |
		1L.to(n).sum(eulerPhi/1)
	}

	truncate { :self |
		self
	}

	twosComplement { :self :wordSize |
		let m = 2L ^ wordSize;
		let u = self % m;
		(u >= (m / 2L)).if {
			u - m
		} {
			u
		}
	}

	twosComplementBitwise { :self :wordSize |
		let bitMask = (1 << wordSize) - 1;
		let signBit = 1 << (wordSize - 1);
		let n = self.bitAnd(bitMask);
		(n.bitAnd(signBit) != 0).if {
			n - (1 << wordSize)
		} {
			n
		}
	}

	unaryExpansion { :self |
		self.isPositiveInteger.if {
			List(self, 1)
		} {
			self.error('unaryExpansion')
		}
	}

	uncheckedLcm { :a :b |
		(
			a = 0L | {
				b = 0L
			}
		).if {
			0L
		} {
			let ab = a * b;
			{
				b = 0L
			}.whileFalse {
				let c = b;
				b := a % c;
				a := c
			};
			(ab // a).abs
		}
	}

	unitaryDivisors { :n |
		n.divisors.select { :d |
			d.gcd(n // d) = 1L
		}
	}

	unitaryPhi { :n |
		(n = 1).if {
			1
		} {
			n.factorInteger.product { :x |
				let [p, e] = x;
				p ^ e - 1
			}
		}
	}

	unusedIntegerSquareRoot { :self |
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

	withoutTrailingZeroes { :self |
		self // (10L ^ self.integerExponent(10L))
	}

	wrapIndex { :self :size |
		self - 1L % size + 1L
	}

}

+@Integer {

	digitAt { :self :n |
		let value = Integer(self);
		(n = 1L).if {
			(value < 0L).if {
				-256L - value.bitAnd(255L)
			} {
				value.bitAnd(255L)
			}
		} {
			(value < 0L).if {
				(-256L - value.bitShift(-8L) + 1L).digitAt(n - 1L)
			} {
				value.bitShift(8L - n.bitShift(3L)).bitAnd(255L)
			}
		}
	}

	digitLength { :self |
		let value = Integer(self);
		let length = 1L;
		(value < -255L).ifTrue {
			length := 2L;
			value := (-256L - self.bitShift(-8L)) + 1L
		};
		{
			value > 255L
		}.whileTrue {
			value := value.bitShift(-8L);
			length := length + 1L
		};
		length
	}

}

+List {

	binaryRunLengthDecode { :self |
		self.isEmpty.if {
			0L
		} {
			let k = self.size;
			let b = [1L 0L].reshape([k]);
			b.replicate(self).binaryContraction
		}
	}

	integerString { :self :radix |
		self.collect { :each |
			each.integerString(radix)
		}
	}

	isAmicablePair { :self |
		let [m, n] = self;
		isAmicablePair(m, n)
	}

	isIntegerArray { :self |
		self.isArray(self.arrayDepth, isIntegerValuedNumber/1)
	}

}

+String {

	figurateNumber { :self |
		self.caseOf(
			[
				'Triangular' -> { 3.polygonalNumber },
				'Square' -> { 4.polygonalNumber },
				'Pentagonal' -> { 5.polygonalNumber },
				'Hexagonal' -> { 6.polygonalNumber },
				'Heptagonal' -> { 7.polygonalNumber },
				'Octagonal' -> { 8.polygonalNumber },
				'Enneagonal' -> { 9.polygonalNumber },
				'Decagonal' ->  { 10.polygonalNumber },
				'Hendecagonal' -> { 11.polygonalNumber },
				'Dodecagonal' -> { 12.polygonalNumber },
				'Tridecagonal' -> { 13.polygonalNumber },
				'Tetradecagonal' -> { 14.polygonalNumber },
				'Pentadecagonal' -> { 15.polygonalNumber },
				'Hexadecagonal' -> { 16.polygonalNumber },
				'CenteredDodecahedral' -> {
					{ :n |
						(2 * n + 1) * (5 * (n ^ 2) + (5 * n) + 1)
					}
				},
				'CenteredOctahedral' -> {
					{ :n |
						let a = 4 * (n ^ 3);
						let b = -6 * (n ^ 2);
						let c = 8 * n;
						(a + b + c - 3) / 3
					}
				},
				'Dodecahedral' -> {
					{ :n |
						n * (3 * n - 1) * (3 * n - 2) / 2
					}
				},
				'Icosahedral' -> {
					{ :n |
						n * (5 * (n ^ 2) - (5 * n) + 2) / 2
					}
				},
				'Octahedral' -> {
					{ :n |
						(2 * (n ^ 3) + n) / 3
					}
				},
				'RhombicDodecahedral' -> {
					{ :n |
						(n ^ 4) - ((n - 1) ^ 4)
					}
				},
				'Tetrahedral' -> {
					{ :n |
						n * (n + 1) * (n + 2) / 6
					}
				},
				'TruncatedOctahedral' -> {
					{ :n |
						(16 * (n ^ 3)) - (33 * (n ^ 2)) + (24 * n) - 6
					}
				}
			]
		)
	}

}

+@Integer {

	figurateNumber { :self :k |
		let f/1 = k.figurateNumber;
		f(self)
	}

}

+@Cache {

	akiyamaTanigawaFunction { :self |
		self.cached('akiyamaTanigawaFunction') {
			let a/2 = { :n :m |
				(n = 0L).if {
					1L / (m + 1L)
				} {
					(m + 1L) * (a(n - 1L, m) - a(n - 1L, m + 1L))
				}
			}.memoize(false);
			a/2
		}
	}

}

+@Integer {

	akiyamaTanigawaNumber { :n :m |
		let f/2 = system.akiyamaTanigawaFunction;
		f(Integer(n), Integer(m))
	}

}
