+@Integer {

	aliquotSequence { :n :k |
		let a = n;
		let b = a.aliquotSum;
		let r = [a];
		let i = 1;
		{
			i < k & { b ~= n & { r.includes(b).not & { a > 1 } } }
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

	bernoulli { :k |
		k.bernoulliSequence.last
	}

	bernoulliSequence { :k |
		let a = List(k + 1);
		let b = List(k + 1);
		0:k.do { :n |
			a[n + 1] := Fraction(1L, n + 1);
			n.toByDo(1, -1) { :j |
				a[j] := j * (a[j] - a[j + 1])
			};
			b[n + 1] := a[1]
		};
		b
	}

	collatzSequence { :n |
		let answer = [];
		let i = n;
		{
			answer.add(i);
			i ~= 1
		}.whileTrue {
			i.isEven.if {
				i := i / 2
			} {
				i := 3 * i + 1
			}
		};
		answer
	}

	fareySequence { :n |
		let [a, b, c, d] = [0, 1, 1, n];
		let answer = [Fraction(a, b)];
		{
			c <= n
		}.whileTrue {
			let k = ((n + b) / d).floor;
			[a, b, c, d] := [c, d, k * c - a, k * d - b];
			answer.add(Fraction(a, b))
		};
		answer
	}

	fibonacciSequence { :self |
		self.fibonacciSequenceInto([])
	}

	fibonacciSequenceUpTo { :self |
		let answer = [1];
		let n = 1;
		let k = 1;
		{
			n <= self
		}.whileTrue {
			answer.add(n);
			n := n + answer[k];
			k := k + 1
		};
		answer
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
		(0 .. k - 1).collect(gouldsNumber:/1)
	}

	harmonicNumber { :self |
		1:self.reciprocal.sum
	}

	hofstadterQSequence { :self |
		let f:/1 = { :n |
			(n <= 2).if {
				1
			} {
				f(n - f(n - 1)) + f(n - f(n - 2))
			}
		}.memoize(true);
		(1 .. self).collect(f:/1)
	}

	inventorySequence { :terms |
		let number = 0;
		let answer = [0];
		let inventory = [0].asIdentityBag;
		(2 .. terms).do { :n |
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

	lucasNumber { :self |
		(self = 1).if {
			1
		} {
			let phi = 1.goldenRatio;
			(phi ^ self).rounded
		}
	}

	lucasNumbers { :self |
		[1 1].linearRecurrence([1 3], self)
	}

	mallowsSequence { :n |
		let a = List(n, 1);
		3.toDo(n) { :i |
			a[i] := a[a[i - 2]] + a[i - a[i - 2]]
		};
		a
	}

	moserDeBruijnSequence { :self |
		(0 .. self - 1).collect { :n |
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

	noergaardInfinitySequence { :self |
		let f:/1 = { :n |
			(n = 0).if {
				0
			} {
				(n % 2 = 1).if {
					f((n - 1) // 2) + 1
				} {
					f(n // 2).-
				}
			}
		}.memoize(true);
		(0 .. self - 1).collect(f:/1)
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

	pellNumber { :self |
		let n = self;
		let x = 2.sqrt;
		(((1 + x) ^ n) - ((1 - x) ^ n)) / (2 * x)
	}

	pellNumbers { :self |
		[2 1].linearRecurrence([0 1], self)
	}

	pellLucasNumbers { :self |
		[2 1].linearRecurrence([2 2], self)
	}

	perrinSequence { :self |
		self.padovanSequence([3 0 2])
	}

	recamanSequence { :self |
		let answer = List(self, 0);
		let seen = [0].asIdentitySet;
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

	selfCountingNumber { :n |
		(0.5 + (2 * n).sqrt).floor
	}

	selfCountingSequence { :k |
		(1 .. k).collect(selfCountingNumber:/1)
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

	wythoffArray { :m :n |
		let phi = 1.goldenRatio;
		(n = 1).if {
			((m * phi).floor * phi).floor
		} {
			(n = 2).if {
				((m * phi).floor * phi.squared).floor
			} {
				m.wythoffArray(n - 2) + m.wythoffArray(n - 1)
			}
		}
	}

	wythoffLower { :self |
		(self * 1.goldenRatio).floor
	}

	wythoffPair { :self |
		let phi = 1.goldenRatio;
		[(self * phi).floor, (self * phi.squared).floor]
	}

	wythoffUpper { :self |
		(self * 1.goldenRatio.squared).floor
	}

}
