+SmallFloat {

	noergaardInfinityNumber { :n |
		let w = n.integerDigits(2);
		let a = 1;
		let b = 0;
		1.toDo(w.size) { :i |
			(w[i] = 0).if {
				b := b * -1
			} {
				b := b + 1
			}
		};
		b.clearZeroSignBit
	}

}

+@Integer {

	aliquotSequence { :n :k |
		let a = n;
		let b = a.aliquotSum;
		let r = [a];
		let i = 1;
		{
			i < k & {
				b != n & {
					r.includes(b).not & {
						a > 1
					}
				}
			}
		}.whileTrue {
			r.add(b);
			i := i + 1;
			a := b;
			(a > 0).ifTrue {
				b := a.aliquotSum
			}
		};
		r
	}

	aliquotSequence { :n |
		aliquotSequence(n, 21)
	}

	baumSweetSequence { :n |
		let a:/1 = { :i |
			(i < 2).if {
				1
			} {
				let k = i;
				{ (k % 4) = 0 }.whileTrue {
					k := k / 4
				};
				k.isOdd.if {
					a((k - 1) / 2)
				} {
					0
				}
			}
		}.memoize(true);
		0.toCollect(n - 1, a:/1)
	}

	beattySequence { :n :theta |
		(1.to(n) * theta).floor
	}

	bernoulliNumber { :k |
		(k + 1).bernoulliSequence.last
	}

	bernoulliSequence { :k |
		let a = List(k);
		let b = List(k);
		0.toDo(k - 1) { :n |
			a[n + 1] := Fraction(1, n + 1);
			n.toByDo(1, -1) { :j |
				a[j] := j * (a[j] - a[j + 1])
			};
			b[n + 1] := a[1]
		};
		(k > 1).ifTrue {
			b[2] := -1/2
		};
		b
	}

	calkinWilfSequence { :self |
		let answer = List(self);
		answer[1] := 1/1;
		2.toDo(self) { :i |
			let p = answer[i - 1];
			let t = p.floor * 2 - p + 1;
			answer[i] := 1 / t
		};
		answer
	}

	cantorNumbers { :self |
		let answer = [];
		let n = 0;
		{ answer.size < self }.whileTrue {
			(n.digitCount(3, 1) = 0).ifTrue {
				answer.add(n)
			};
			n := n + 1
		};
		answer
	}

	champernowneSequence { :b :n |
		let answer = [];
		let i = 0;
		{ answer.size < n }.whileTrue {
			answer.addAll(i.integerDigits(b));
			i := i + 1
		};
		answer.take(n)
	}

	collatzSequence { :self |
		{ :n |
			n.isOdd.if {
				3 * n + 1
			} {
				n / 2
			}
		}.nestWhileList(self) { :n |
			n > 1
		}
	}

	connellSequence { :self |
		0.toCollect(self) { :n |
			2 * 1.to(n + 1) + (n ^ 2) - 1
		}
	}

	doudnaSequenceFunction { :n |
		let a = n.integerDigits(2);
		let b = a.reverse;
		let c = b.indicesOf(1);
		let d = 1.to(n.digitCount(2, 1));
		let e = c - d + 1;
		e.prime.product
	}

	doudnaSequence { :n |
		0.toCollect(n - 1, doudnaSequenceFunction:/1)
	}

	ehrenfeuchtMycielskiSequence { :n |
		let t = system.oeisSequenceData.at('A038219');
		let k = t.size;
		(n < k).if {
			1:n.collect { :i |
				t.at(i).at(2)
			}
		} {
			n.error('ehrenfeuchtMycielskiSequence')
		}
	}

	ekgSequence { :n |
		let l = [1 2];
		let i = 2;
		{ i < n }.whileTrue {
			let k = 3;
			{
				gcd(l[i], k) = 1 | {
					l.includes(k)
				}
			}.whileTrue {
				k := k + 1
			};
			l.add(k);
			i := i + 1
		};
		l
	}

	entringerTriangle { :self |
		let f:/2 = { :n :k |
			k.isZero.if {
				n.isZero.boole
			} {
				f(n, k - 1) + f(n - 1, n - k)
			}
		}.memoize;
		0.to(self - 1).triangularArray(f:/2)
	}

	entringerNumber { :n :k |
		(n + 1).entringerTriangle.last.at(k + 1)
	}

	erdosSelfridgeFunction { :n |
		let m = n + 2;
		{
			let z = factorInteger(binomial(m, n));
			z[1][1] <= n
		}.whileTrue {
			m := m + 1
		};
		m
	}

	eulerUpDownNumber { :n |
		n.isEven.if {
			n.eulerNumber.abs
		} {
			let a = n + 1;
			let b = 2 ^ a;
			let c = a.bernoulliNumber;
			let d = b * (b - 1) * c;
			(d / a).abs
		}
	}

	fareySequenceDo { :n :visit:/1 |
		let [a, b, c, d] = [0, 1, 1, n];
		visit(Fraction(a, b));
		{
			c <= n
		}.whileTrue {
			let k = (n + b) // d;
			[a, b, c, d] := [c, d, k * c - a, k * d - b];
			visit(Fraction(a, b))
		}
	}

	fareySequence { :n |
		let answer = [];
		n.fareySequenceDo { :each |
			answer.add(each)
		};
		answer
	}

	finesSequence { :self |
		0.toCollect(self) { :n |
			0.to(n).collect { :m |
				(-1 ^ (m + n))
				*
				((n + m).! / n.! / m.!)
				*
				((n - m + 1) / (n + 1))
			}.sum
		}
	}

	grahlSequenceStanely { :self |
		let answer = [];
		0.toDo(self - 1) { :n |
			let i = 1;
			let j = 1;
			let b = IdentitySet();
			{ n - (2 * i) >= 0 }.whileTrue {
				let x = answer[n - (2 * i) + 1];
				let y = answer[n - i + 1];
				let z = (y * 2) - x;
				i := i + 1;
				(
					x <= y & {
						y <= z
					}
				).ifTrue {
					b.include(z);
					{ b.includes(j) }.whileTrue {
						j := j + 1
					}
				}
			};
			answer.add(j)
		};
		answer
	}

	grahlSequence { :self |
		let answer = [];
		0.toDo(self - 1) { :n |
			let i = 1;
			let j = 1;
			let b = IdentitySet();
			{ n - (2 * i) >= 0 }.whileTrue {
				let x = answer[n - (2 * i) + 1];
				let y = answer[n - i + 1];
				let z = (y * 2) - x;
				b.include(z);
				i := i + 1;
				{ b.includes(j) }.whileTrue {
					b.remove(j);
					j := j + 1
				}
			};
			answer.add(j)
		};
		answer
	}

	grahlSequence { :self :kind |
		kind.caseOf(
			[
				'Stanley' -> { self.grahlSequenceStanely },
				'Grahl' -> { self.grahlSequence }
			]
		)
	}

	gijswijtsSequence { :n |
		let k = { :s |
			let z = 1;
			valueWithReturn { :return:/1 |
				1.toDo(s.size) { :m |
					let i = 1;
					let y = s.last(m);
					let kk = s.size // m;
					(kk <= z).ifTrue {
						z.return
					};
					{
						let k = s.size;
						let a = k - ((i + 1) * m) + 1;
						let b = k - (i * m);
						(i * m < k) & { s.copyFromTo(a, b) = y }
					}.whileTrue {
						i := i + 1
					};
					z := max(z, i)
				};
				nil
			}
		};
		let answer = [1];
		2.toDo(n) { :i |
			answer.add(k(answer))
		};
		answer
	}

	goebelsSequence { :m |
		let a = List(m);
		0.toDo(m - 1) { :n |
			a[n + 1] := (n < 2).if {
				1L
			} {
				0.to(n - 1).sum { :k |
					a[k + 1] ^ 2
				} / (n - 1)
			}
		};
		a
	}

	golombsSequence { :n |
		let a = List(n, 1);
		2.toDo(n) { :i |
			a[i] := 1 + a[i - a[a[i - 1]]]
		};
		a
	}

	gouldsNumber { :self |
		2 ^ self.hammingWeight
	}

	gouldsSequence { :k |
		0.to(k - 1).collect(gouldsNumber:/1)
	}

	hammersleyPointSet { :d :n |
		(d = 2).if {
			1.to(n).collect { :i |
				[i.vanDerCorputNumber(2), Fraction(i, n)]
			}
		} {
			d.unimplementedCase('hammersleyPointSet')
		}
	}

	harmonicNumber { :self |
		1.to(self).reciprocal.sum
	}

	harmoniousNumber { :d :n |
		let x = 2;
		n.timesRepeat {
			x := (1 + x) ^ (1 / (d + 1))
		};
		x
	}

	harmoniousNumber { :d |
		d.harmoniousNumber(25)
	}

	hofstadterQSequence { :self |
		let f:/1 = { :n |
			(n <= 2).if {
				1
			} {
				f(n - f(n - 1)) + f(n - f(n - 2))
			}
		}.memoize(true);
		1.to(self).collect(f:/1)
	}

	josephusProblem { :n :k |
		(k = 2).if {
			fromDigits(rotateLeft(integerDigits(n, 2), 1), 2)
		} {
			(n <= 1).if {
				n
			} {
				let m = mod(josephusProblem(n - 1, k) + k, n);
				(m != 0).if {
					m
				} {
					n
				}
			}
		}
	}

	josephusSequence { :n :k |
		let z = [];
		{ :x |
			let y = x.rotateLeft(k);
			z.add(y.removeLast);
			y
		}.iterate([1 .. n], n);
		z
	}

	jugglerMap { :n |
		let e = n.isEven.if { 0.5 } { 1.5 };
		(n ^ e).floor
	}

	jugglerSequence { :n |
		(n < 1).if {
			[]
		} {
			let a = [n];
			{ n != 1 }.whileTrue {
				n := n.jugglerMap;
				a.add(n)
			};
			a
		}
	}

	inventorySequence { :terms |
		let number = 0;
		let answer = [0];
		let inventory = [0].asIdentityMultiset;
		2.toDo(terms) { :n |
			let count = inventory.occurrencesOf(number);
			number := (count = 0).if {
				0
			} {
				number + 1
			};
			answer.add(count);
			inventory.add(count)
		};
		answer
	}

	isHarshadNumber { :self :base |
		self.divisible(
			self.integerDigits(base).sum
		)
	}

	isHarshadNumber { :self |
		self.isHarshadNumber(10)
	}

	isPoliteNumber { :self |
		self.isPositive & {
			self.isPowerOfTwo.not
		}
	}

	isPracticalNumber { :n |
		let product = 1;
		(
			n < 1 | {
				n > 1 & {
					n.isOdd
				}
			}
		).if {
			false
		} {
			(n = 1).if {
				true
			} {
				let factors = factorInteger(n);
				let [p, e] = factors.transpose;
				let i = 1;
				let ok = true;
				{
					ok & {
						i <= p.size
					}
				}.whileTrue {
					(p[i] > (1 + divisorSigma(1, product))).if {
						ok := false
					} {
						product := product * (p[i] ^ e[i]);
						i := i + 1
					}
				};
				ok
			}
		}
	}

	jacobsthalNumber { :n |
		((2 ^ n) - (-1 ^ n)) / 3
	}

	kaprekarSequenceStep { :self :base :fixedLength |
		let d = self.integerDigits(base);
		fixedLength.ifNotNil {
			d := d.padLeft([fixedLength], 0)
		};
		d.sort(>).fromDigits(base) - d.sort(<).fromDigits(base)
	}

	kaprekarSequence { :self :base :fixedLength |
		let answer = [];
		{ answer.includes(self) }.whileFalse {
			answer.add(self);
			self := self.kaprekarSequenceStep(base, fixedLength)
		};
		answer
	}

	kaprekarSequence { :self |
		self.kaprekarSequence(10, nil)
	}

	kolakoskiSequence { :n |
		let a = [1 2 2];
		[3 .. n].injectInto(a) { :i :j |
			i ++ List(i[j], mod(j, 2, 1))
		}.take(n)
	}

	lookAndSaySequence { :m |
		{ :n |
			n.split(=).collect { :x |
				[x.size, x.first]
			}.flatten
		}.nestList([1], m - 1)
	}

	mallowsSequence { :n |
		let a = List(n, 1);
		3.toDo(n) { :i |
			a[i] := a[a[i - 2]] + a[i - a[i - 2]]
		};
		a
	}

	mersennePrimeExponent { :self |
		[
			2 3 5 7 13 17 19 31 61 89
			107 127 521 607 1279 2203 2281 3217 4253 4423
			9689 9941 11213 19937 21701 23209 44497 86243 110503 132049
			216091 756839 859433 1257787 1398269 2976221 3021377 6972593 13466917 20996011
			24036583 25964951 30402457 32582657 37156667 42643801 43112609 57885161 74207281 77232917
		].at(self)
	}

	moserDeBruijnSequence { :self |
		0.toCollect(self - 1) { :n |
			n.integerDigits(2).riffle([0]).fromDigits(2)
		}
	}

	motzkinNumber { :k |
		k.motzkinSequence.last
	}

	motzkinSequence { :k |
		let s = [1, 1];
		2.toDo(k - 1) { :n |
			let a = ((2 * n) + 1) / (n + 2);
			let b = ((3 * n) - 3) / (n + 2);
			let c = (a * s[n]) + (b * s[n - 1]);
			s.add(c)
		};
		s
	}

	narayanaSequence { :self |
		let answer = [1 1 1];
		4.toDo(self) { :i |
			answer.add(answer[i - 1] + answer[i - 3])
		};
		answer
	}

	noergaardInfinitySequence { :self :variant |
		variant.caseOf(
			[
				0 -> {
					let f:/1 = { :n |
						[
							{ n = 0 } -> { 0 },
							{ n % 2 = 0 } -> { 0 - f(n // 2) },
							{ n % 2 = 1 } -> { f((n - 1) // 2) + 1 }
						].which
					}.memoize(true);
					0.toCollect(self - 1, f:/1)
				},
				1 -> {
					let f:/1 = { :n |
						[
							{ n = 0 } ->  { 0 },
							{ n % 3 = 0 } -> { 0 - f(n // 3) },
							{ n % 3 = 1 } -> { f(n // 3) - 2 },
							{ n % 3 = 2 } -> { f(n // 3) - 1 }
						].which
					}.memoize(true);
					0.toCollect(self - 1, f:/1)
				},
				2 -> {
					let f:/1 = { :n |
						[
							{ n = 0 } ->  { 0 },
							{ n % 3 = 0 } -> { 0 - f(n // 3) },
							{ n % 3 = 1 } -> { f(n // 3) - 3 },
							{ n % 3 = 2 } -> { -2 - f(n // 3) }
						].which
					}.memoize(true);
					0.toCollect(self - 1, f:/1)
				}
			]
		)
	}

	noergaardInfinitySequence { :self |
		self.noergaardInfinitySequence(0)
	}

	noergaardRhythmicInfinitySystem { :n |
		let z = [3];
		1.toDo(n - 1) { :i |
			z.add(
				(i.integerDigits(2).split(=).size + 4).fibonacci
			)
		};
		z
	}

	padovanSequence { :self :initial |
		let answer = initial.copy;
		4.toDo(self) { :i |
			answer.add(answer[i - 2] + answer[i - 3])
		};
		answer
	}

	padovanSequence { :self |
		self.padovanSequence([1 1 1])
	}

	periodDoublingSequence { :n |
		let k = n.log(2).ceiling;
		[
			0 -> [0 1],
			1 -> [0 0]
		].substitutionSystem([0 1], k)
		.last
		.first(n)
	}

	perrinSequence { :self |
		self.padovanSequence([3 0 2])
	}

	politeness { :n |
		(n.divisors.count(isOdd:/1) - 1).max(0)
	}

	recamanSequence { :self |
		let answer = List(self, 0);
		let seen = IdentitySet([0]);
		1.toDo(self - 1) { :n |
			let next = answer[n] - n;
			(
				(next <= 0) | {
					seen.includes(next)
				}
			).ifTrue {
				next := answer[n] + n
			};
			answer[n + 1] := next;
			seen.include(next)
		};
		answer
	}

	regularPaperfoldingSequence { :self |
		0.toCollect(self - 1) { :n |
			let a = n + 1;
			let b = 2 ^ integerExponent(a, 2);
			let c = ((a / b) - 1) / 2;
			c.isEven.boole
		}
	}

	repunit { :n :b |
		(b ^ n - 1) / (b - 1)
	}

	schroderNumber { :k |
		k.schroderSequence.last
	}

	schroderSequence { :k |
		let s = [1, 2];
		2.toDo(k - 1) { :n |
			let a = ((6 * n) - 3) / (n + 1);
			let b = (n - 2) / (n + 1);
			let c = (a * s[n]) - (b * s[n - 1]);
			s.add(c)
		};
		s
	}

	seidelTriangle { :self |
		let answer = self.entringerTriangle;
		2.toByDo(self, 2) { :i |
			answer[i].reverseInPlace
		};
		answer
	}

	selfCountingNumber { :n |
		(0.5 + (2 * n).sqrt).floor
	}

	selfCountingSequence { :k |
		1.toCollect(k, selfCountingNumber:/1)
	}

	somosSequence { :k :m |
		let a = List(m);
		0.toDo(m - 1) { :n |
			a[n + 1] := (n < k).if {
				1L
			} {
				1.to((k / 2).floor).sum { :j |
					a[n - j + 1] * a[n - (k - j) + 1]
				} / a[n - k + 1]
			}
		};
		a
	}

	sortingNumber { :n |
		let m = n.log(2).ceiling;
		(n * m) - (2 ^ m) + 1
	}

	stanleySequence { :self |
		let answer = [];
		let n = 0;
		{ answer.size < self }.whileTrue {
			(n.digitCount(3, 2) = 0).ifTrue {
				answer.add(n)
			};
			n := n + 1
		};
		answer
	}

	sternBrocotNumber { :self |
		let f = { :n |
			(n < 2).if {
				n
			} {
				n.isEven.if {
					f(n / 2)
				} {
					let m = (n - 1) / 2;
					f(m) + f(m + 1)
				}
			}
		};
		f(self)
	}

	sternBrocotSequence { :n |
		let answer = [1 1];
		let index = 2;
		{
			answer.size < n
		}.whileTrue {
			let c = answer[index];
			answer.add(c + answer[index - 1]);
			answer.add(c);
			index := index + 1
		};
		answer
	}

	sylvestersSequence { :n |
		{ :x |
			(x ^ 2) - x + 1
		}.nestList(2L, n - 1)
	}

	szekeresSequence { :self |
		0.toCollect(self - 1) { :n |
			fromDigits(integerDigits(n, 2), 3) + 1
		}
	}

	toothpickSequence { :self |
		let a:/1 = { :n |
			(n = 0).if {
				0
			} {
				let m = 2 ^ (n.integerDigits(2).size - 1);
				let k = (2 * (m ^ 2) + 1) / 3;
				(n = m).if {
					k
				} {
					k + (2 * a(n - m)) + a(n - m + 1) - 1
				}
			}
		}.memoize;
		0.toCollect(self - 1, a:/1)
	}

	thueMorse { :index |
		index.digitCount(2, 1) % 2
	}

	thueMorseSequence { :k |
		(k <= 0).if {
			[]
		} {
			let answer = List(k);
			let i =2;
			let iMax = 1;
			answer[1] := 0;
			{
				i <= k
			}.whileTrue {
				{
					i <= k & {
						i <= (2 * iMax)
					}
				}.whileTrue {
					answer[i] := 1 - answer[i - iMax];
					i := i + 1
				};
				iMax := iMax * 2
			};
			answer
		}
	}

	vanDerCorputNumber { :n :base |
		let p = 0;
		let q = 1;
		let nn = n;
		{
			nn = 0
		}.whileFalse {
			p := (p * base) + (nn % base);
			q := q * base;
			nn := nn // base
		};
		Fraction(p, q)
	}

	vanDerLaanSequence { :self |
		self.padovanSequence([1 0 1])
	}

	vanEckSequence { :n |
		let l = [0 0];
		2.toDo(n - 1) { :i |
			let k = (1 .. i - 1).findLast { :m |
				l[i] = l[m]
			};
			l.add(
				(k = 0).if { 0 } { i - k }
			)
		};
		l
	}

	yellowstonePermutation { :n |
		let l = [1 2 3];
		let i = 3;
		{ i < n }.whileTrue {
			let k = 4;
			{
				gcd(l[i - 1], k) = 1 | {
					gcd(l[i], k) > 1 | {
						l.includes(k)
					}
				}
			}.whileTrue {
				k := k + 1
			};
			l.add(k);
			i := i + 1
		};
		l
	}

}

+List {

	haltonSequence { :self :k |
		self.collect { :b |
			1.to(k).vanDerCorputNumber(b)
		}.transpose
	}

	kroneckerSequence { :alpha :n :k0 |
		alpha.collect { :each |
			each.kroneckerSequence(n, k0)
		}.transpose
	}

	kroneckerSequence { :alpha :n |
		alpha.collect { :each |
			each.kroneckerSequence(n)
		}.transpose
	}

	locallyCatenativeSequence { :w :i :n :f |
		let u = w.copy;
		let k = i.size;
		n.timesRepeat {
			let j = u.size;
			u.add(
				1.toCollect(k) { :m |
					f[m].value(u[j - i[m] + 1])
				}.catenate
			)
		};
		u
	}

	locallyCatenativeSequence { :w :i :n |
		locallyCatenativeSequence(w, i, n, List(w.size, identity:/1))
	}

	stanleySequence { :s1 :m :mmm |
		/* https://oeis.org/A185256 */
		let t1 = s1.size;
		let s2 = List(t1 + m, s1).flatten;
		let chvec = List(mmm + 1, 0);
		let swi = nil;
		1.toDo(t1) { :i |
			chvec[s2[i] + 1] := 1
		};
		(t1 + 1).toDo(t1 + m) { :n |
			(s2[n - 1] + 1).toDoWithBreak(mmm) { :i :break:/0 |
				swi := -1;
				1.toDoWithBreak(n - 2) { :j :break:/0 |
					let p = s2[n - j];
					let k = 2 * p - i;
					(k < 0).ifTrue {
						break()
					};
					(
						k <= mmm & {
							chvec[k + 1] = 1
						}
					).ifTrue {
						swi := 1;
						break()
					}
				};
				(swi = -1).ifTrue {
					s2[n] := i;
					chvec[i + 1] := 1;
					break()
				}
			};
			(swi = 1).ifTrue {
				s1.warning('stanleySequence: no solution at n=' ++ n)
			}
		};
		s2.first(m)
	}

	stanleySequence { :s1 :m |
		stanleySequence(s1, m, 4000)
	}

}

+SmallFloat {

	faurePermutation { :n |
		(n = 1).if {
			[0]
		} {
			n.isEven.if {
				let a = 2 * (n / 2).faurePermutation;
				let b = a + 1;
				a ++ b
			} {
				let a = (n - 1).faurePermutation;
				let b = (n - 1) / 2;
				let c = a.collect { :x |
					(x >= b).if {
						x + 1
					} {
						x
					}
				};
				c.first(b) ++ [b] ++ c.last(b)
			}
		}
	}

	kroneckerSequence { :alpha :n |
		(0.to(n - 1) * alpha) % 1
	}

	kroneckerSequence { :alpha :n :k0 |
		let s = List(n);
		s[1] := k0;
		2.toDo(n) { :i |
			s[i] := (s[i - 1] + alpha) % 1
		};
		s
	}

	signatureSequence { :theta :n :p :q |
		{ :i :j |
			[i + (j * theta), i]
		}.table(1:p, 1:q)
		.catenate
		.sortOn(first:/1)
		.collect(second:/1)
		.take(n)
	}

	signatureSequence { :theta :n |
		let m = n.sqrt.ceiling;
		let s = [];
		let z = s;
		{
			s := { :i :j |
				[i, i + (j * theta)]
			}.table(1:m, 1:m)
			.catenate
			.sortOn(second:/1)
			.collect(first:/1)
			.take(n);
			s != z
		}.whileTrue {
			z := s;
			m := 2 * m
		};
		s
	}

	tagSystem { :m :r :i :k |
		let word = i;
		let answer = [word];
		let rules = r.asMap;
		let j = 2;
		{ word.size >= m & { j <= k } }.whileTrue {
			let initial = word.first;
			let suffix = word.allButFirst(m);
			word := suffix ++ rules.at(initial);
			answer.add(word);
			j := j + 1
		};
		answer
	}

}

+List {

	isMarkovTriple { :self |
		self.square.sum = (3 * self.product)
	}

	nextMarkovTriple { :self |
		let [x, y, z] = self;
		[x, y, 3 * x * y - z].sort
	}

	markovTripleNeighbours { :self |
		let [x, y, z] = self;
		[
			[x, y, z].nextMarkovTriple,
			[x, z, y].nextMarkovTriple,
			[z, y, x].nextMarkovTriple
		].nub
	}

}

+@Integer {

	isMarkovNumber { :self |
		let u = 100.markovNumberSequence;
		(self > u.max).if {
			self.unimplementedCase('isMarkovNumber')
		} {
			u.includes(self)
		}
	}

	lagrangeNumber { :n |
		let m = n.markovNumber;
		(9 - (4 / m.square)).sqrt
	}

	markovNumber { :self |
		self.markovNumberSequence.last
	}

	markovNumberGenerator { :k |
		let m = SortedList([1]);
		k.timesRepeat {
			1.toDo(m.size) { :i |
				1.toDo(i) { :j |
					let x = m[i];
					let y = m[j];
					let a = (3 * x * y + sqrt((-4 * (x ^ 2)) - (4 * (y ^ 2)) + (9 * (x ^ 2) * (y ^ 2)))) / 2;
					a.isInteger.ifTrue {
						m.addIfNotPresent(a)
					}
				}
			}
		};
		m.contents
	}

	markovNumberSequence { :self |
		/* https://oeis.org/A002559/b002559.txt */
		[1, 2, 5, 13, 29, 34, 89, 169, 194, 233, 433, 610, 985, 1325, 1597, 2897, 4181, 5741, 6466, 7561, 9077, 10946, 14701, 28657, 33461, 37666, 43261, 51641, 62210, 75025, 96557, 135137, 195025, 196418, 294685, 426389, 499393, 514229, 646018, 925765, 1136689, 1278818, 1346269, 1441889, 1686049, 2012674, 2423525, 2922509, 3276509, 3524578, 4400489, 6625109, 7453378, 8399329, 9227465, 9647009, 11485154, 13782649, 16609837, 16964653, 20031170, 21531778, 24157817, 38613965, 43484701, 48928105, 63245986, 78442645, 94418953, 111242465, 137295677, 144059117, 165580141, 205272962, 225058681, 253191266, 285018617, 298045301, 321534781, 375981346, 433494437, 447626321, 537169541, 576298801, 647072098, 780291637, 941038565, 981277621, 1134903170, 1311738121, 1405695061, 1475706146, 1873012681, 2151239746, 2561077037, 2971215073, 3057250481, 3778847945, 4434764269, 4801489937].first(self)
	}

	markovNumberTree { :n |
		n.unfoldTree(
			[1 1 1],
			{ :triple |
				let k = triple.sum;
				triple
				.markovTripleNeighbours
				.select { :each |
					each.sum > k
				}
			}
		)
	}

}

+Block {

	binomialTransform { :b:/1 |
		{ :n |
			0:n.sum { :k |
				binomial(n, k) * b(k)
			}
		}
	}

	eulerTransform { :a:/1 |
		let b:/1 = { :n |
			(n = 0).if {
				1
			} {
				let s = 1.to(n).sum { :j |
					j.divisors.sum { :d |
						d * a(d)
					} * b(n - j)
				};
				s // n
			}
		}.memoize(true);
		b:/1
	}

	inverseBinomialTransform { :b:/1 |
		{ :n |
			0:n.sum { :k |
				(-1 ^ (n - k)) * binomial(n, k) * b(k)
			}
		}
	}

}

+@Sequenceable {

	runLengthTransform { :x :f:/1 |
		x.collect { :n |
			n.binaryExpansion
			.runLengthsOf(1)
			.collect(f:/1).product
		}
	}

}

+SmallFloat {

	runLengthTransform { :n :f:/1 |
		runLengthTransform(Range(0, n - 1, 1), f:/1)
	}

}

+List {

	binomialTransform { :self |
		self.zeroIndexedListTransform(binomialTransform:/1)
	}

	inverseBinomialTransform { :a |
		self.zeroIndexedListTransform(inverseBinomialTransform:/1)
	}

	zeroIndexedListTransform { :self :aBlock:/1 |
		let n = self.size - 1;
		0:n.collect(
			{ :i |
				self[i + 1]
			}.aBlock
		)
	}

}
