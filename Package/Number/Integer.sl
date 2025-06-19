/* Require: Cache */

@Integer {

	additivePersistence { :x :b |
		x.digitalRootSet(b).second.size - 1
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

	berahaConstant { :n |
		2 + (2 * (2.pi / n).cos)
	}

	bernsteinBasis { :d :n :x |
		x := x.clip([0 1]);
		d.binomial(n) * (x ^ n) * ((1 - x) ^ (d - n))
	}

	binetsFormula { :n |
		let z = 5.sqrt;
		((1 + z) ^ n) - ((1 - z) ^ n) / (2 ^ n * z)
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
		(self .. anInteger).collect(asCharacter:/1)
	}

	combinations { :n :m |
		(1 .. n).combinations(m)
	}

	commonResidue { :self :modulus |
		self % modulus
	}

	denominator { :self |
		1
	}

	digitalRootSet { :x :b |
		let digitSum = { :x :b |
			let total = 0;
			{
				x > 0
			}.whileTrue {
				total := total + (x % b);
				x := x // b
			};
			total
		};
		let seen = IdentitySet();
		{
			seen.includes(x)
		}.whileFalse {
			seen.add(x);
			x := digitSum(x, b)
		};
		(x, seen)
	}

	digitalRoot { :x :b |
		x.digitalRootSet(b).first
	}

	digitCount { :n :b :d |
		n.integerDigits(b).count { :each |
			each = d
		}
	}

	digitCount { :n :b |
		let digits = n.integerDigits(b);
		((b - 1) .. 0).collect { :d |
			digits.count { :each |
				each = d
			}
		}
	}

	dividesImmediately { :self :aNumber |
		Fraction(self, 1).dividesImmediately(Fraction(aNumber, 1))
	}

	divisorSum { :self :aBlock:/1 |
		self.divisors.collect(aBlock:/1).sum
	}

	divisors { :self |
		1.to(self).select { :each |
			self \\ each = 0
		}
	}

	dyckWords { :n |
		let f = { :x :i :n0 :n1 |
			let d0 = { f(x ++ [0], i + 1, n0 + 1, n1) };
			let d1 = { f(x ++ [1], i + 1, n0, n1 + 1) };
			((n0 < n) && (n1 < n) && (n0 > n1)).if {
				d0() ++ d1()
			} {
				(
					((n0 < n) && (n1 < n) && (n0 = n1)) ||
					((n0 < n) && (n1 = n))
				).if {
					d0()
				} {
					((n0 = n) && (n1 < n)).if {
						d1()
					} {
						((n0 = n1) && (n1 = n)).if {
							[x]
						} {
							n.error('Integer>>dyckWords')
						}
					}
				}
			}
		};
		f([0], 1, 1, 0)
	}

	elementaryCellularAutomaton { :ruleNumber :initialState :stepLimit |
		let stateSize = initialState.size;
		let ruleTable = ruleNumber.integerDigits(2, 8);
		let stepCount = 0;
		let answer = [initialState];
		let previousState = initialState;
		{ stepCount < stepLimit }.whileTrue {
			let nextState = (1 .. stateSize).collect { :i |
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
			b ~= 0
		}.whileTrue {
			let t = b;
			b := a % b;
			a := t
		};
		a
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
			r ~= 0
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
					answer.basicInclude(n);
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

	integerCompositionsDo { :n :k :aBlock:/1 |
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

	integerCompositionsDo { :n :aBlock:/1 |
		1:n.do { :k |
			n.integerCompositionsDo(k, aBlock:/1)
		}
	}

	integerCompositions { :n :k |
		let answer = [];
		n.integerCompositionsDo(k) { :each |
			answer.add(each.copy)
		};
		answer
	}

	integerCompositions { :n |
		let answer = [];
		n.integerCompositionsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	integerCompositionsWeakDo { :n :k :aBlock:/1 |
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

	integerCompositionsWeak { :n :k |
		let answer = [];
		n.integerCompositionsWeakDo(k) { :each |
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
				(self.abs.log / base.log + 0.0000000001).asInteger + 1
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
			self.abs.log(radix).floor + 1
		}
	}

	integerPartitionsDescendingDo { :self :aBlock:/1 |
		let n = self;
		let d = List(n, 1);
		let k = 1;
		d[1] := n;
		aBlock(d.copyFromTo(1, 1));
		{
			k ~= n
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

	integerPartitions { :self |
		let answer = [];
		self.integerPartitionsDescendingDo { :each |
			answer.add(each)
		};
		answer
	}

	integerPartitionsAscendingDo { :self :aBlock:/1 |
		let n = self;
		let a = List(n, 0);
		let k = 2;
		let y = n - 1;
		{
			k ~= 1
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

	integerPartitionsRecursive { :n |
		1:n.collectCatenate { :k |
			n.integerPartitions(k)
		}
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

	isByte { :self |
		self.isInteger & {
			self.betweenAnd(0, 255)
		}
	}

	isInteger { :self |
		self.typeResponsibility('@Integer>>isInteger')
	}

	isPerfectNumber { :self |
		self.divisors.allButLast.sum = self
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

	isRoughNumber { :self :k |
		self.primeFactors.allSatisfy { :each |
			each >= k
		}
	}

	isSmoothNumber { :self :k |
		self.primeLimit <= k
	}

	isSquareFree { :self |
		self.divisors.allButFirst.noneSatisfy(isPerfectSquare:/1)
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

	lowerChristoffelWord { :a :b |
		a.isCoprime(b).if {
		} {
			self.error('lowerChristoffelWord: not coprime')
		}
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
		let r = (n < 0).if { n.negated } { n };
		let r1 = (a < 0).if { (n - (a.negated % n)) % n } { a % n };
		{
			r1 ~= 0
		}.whileTrue {
			let quotient = r // r1;
			[t, t1] := [t1, t - (quotient * t1)];
			[r, r1] := [r1, r - (quotient * r1)]
		};
		(r > 1).if {
			'@Integer>>modularInverse: not invertible'.error
		} {
			(t < 0).if {
				t + n
			} {
				t
			}
		}
	}

	multiplicativeOrder { :k :n :r |
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

	numberOfCompositions { :n :k |
		(n - 1).factorial / ((k - 1).factorial * (n - k).factorial)
	}

	numberOfCompositionsWeak { :n :k |
		(n + k - 1).factorial / (n.factorial * (k - 1).factorial)
	}

	numberOfDigitsInBase { :self :radix |
		self.isNegative.if {
			self.negated.numberOfDigitsInBase(radix)
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

	partitionFunctionP { :n |
		let a = List(n + 1);
		a[1] := 1L;
		1.toDo(n) { :i |
			let k = 1;
			let s = 1;
			a[i + 1] := 0L;
			{
				s <= i
			}.whileTrue {
				k.isOdd.if {
					a[i + 1] := a[i + 1] + a[i - s + 1]
				} {
					a[i + 1] := a[i + 1] - a[i - s + 1]
				};
				(k > 0).if {
					s := s + k;
					k := k.-
				} {
					k := 1 - k;
					s := k * (3 * k - 1) / 2
				}
			}
		};
		a[n + 1]
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

	printStringRoman { :self |
		{ :stream |
			romanDigitsOn(self, stream)
		}.asciiStringStreamContents
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

	tribonacciNumber { :n |
		let a = (19 + (3 * 33.sqrt)).cubeRoot;
		let b = (586 + (102 * 33.sqrt)).cubeRoot;
		let c = (19 - (3 * 33.sqrt)).cubeRoot;
		let d = ((1 / 3) * (a + c + 1)) ^ (n - 1);
		let e = b.squared - (2 * b) + 4;
		((3 * b) * (d / e)).rounded
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

	truncated { :self |
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

+@Object {

	isScalarInteger { :self |
		self.isNumber & {
			self.isInteger
		}
	}

}
