+@Integer {

	dualZeckendorfRepresentation { :n |
		(n = 0L).if {
			[0L]
		} {
			let z = zeckendorfRepresentation(n);
			let i = 1L;
			{
				i <= (z.size - 2L)
			}.whileTrue {
				(
					z[i] = 1L & {
						z[i + 1L] = 0L & {
							z[i + 2L] = 0L }
					}
				).ifTrue {
					z[i] := 0L;
					z[i + 1L] := 1L;
					z[i + 2L] := 1L;
					(i > 2L).ifTrue {
						i := i - 3L
					}
				};
				i := i + 1L
			};
			(z[1L] = 0L).ifTrue {
				z.removeFirst!
			};
			z
		}
	}

	fibonacciSequenceUpTo { :self |
		let answer = [self.zero];
		let n = self.one;
		let k = 1;
		{
			n <= self
		}.whileTrue {
			answer.add!(n);
			n := n + answer[k];
			k := k + 1
		};
		answer
	}

	zeckendorfRepresentation { :self |
		(self <= 0L).if {
			[0L]
		} {
			let f = self.fibonacciSequenceUpTo;
			let k = f.size - 1L;
			let z = [];
			f.removeFirst!;
			k.toByDo(2L, -1L) { :i |
				let n = f[i];
				z.add!(
					(n <= self).boole
				);
				(n <= self).ifTrue {
					self := self - n
				}
			};
			z
		}
	}

}

+[@Integer, Fraction] {

	fibonacci { :n :x |
		(x = 1L).if {
			n.fibonacci
		} {
			n.fibonacciClosedForm(x)
		}
	}

	fibonacci { :n |
		n.isNonNegativeInteger.if {
			n.fibonacciNumber
		} {
			n.fibonacciClosedForm
		}
	}

	fibonacciClosedForm { :n :x |
		let a = (4 + x.square).sqrt;
		let b = x + a;
		let c = 2 ^ (0 - n);
		let d = 2 ^ n;
		let e = b ^ n;
		let f = b ^ (0 - n);
		let g = n.pi.cos;
		let r = ((c * e) - (d * f * g)) / a;
		(
			n.isIntegerValuedNumber & {
				x.isIntegerValuedNumber
			}
		).if {
			r.round
		} {
			r
		}
	}

	fibonacciClosedForm { :n |
		let phi = 1.goldenRatio;
		let r = ((phi ^ n) - (n.pi.cos * (phi ^ n.-))) / 5.sqrt;
		r
	}

	lucasL { :n :x |
		let a = (x.square + 4).sqrt;
		(2L ^ -n)
		*
		(
			((x - a) ^ n)
			+
			((x + a) ^ n)
		)
	}

	lucasL { :n |
		n.lucasL(1L)
	}

	lucasNumber { :self |
		let phi = 1.goldenRatio;
		(phi ^ self) + (self.pi.cos * (phi ^ self.negate))
	}

}

+@Integer {

	binetsFormula { :n |
		let z = 5.sqrt;
		((1.0 + z) ^ n) - ((1.0 - z) ^ n) / ((2.0 ^ n) * z)
	}

	fibonacciEntryPoint { :n |
		let k = 1L;
		{
			k.fibonacci % n != 0L
		}.whileTrue {
			k := k + 1L
		};
		k
	}

	fibonacciNumber { :n |
		n.isZero.if {
			0L
		} {
			let m = n + 1L;
			system
			.cachedFibonacciSequenceExtendedTo(m)
			.at(m)
		}
	}

	fibonacciPolynomial { :n |
		(
			n = 0L | {
				n = 1L }
		).if {
			UnivariatePolynomial([n])
		} {
			let x = UnivariatePolynomial([0L 1L]);
			let a = fibonacciPolynomial(n - 1L);
			let b = fibonacciPolynomial(n - 2L);
			(x * a) + b
		}
	}

	fibonacciSequence { :n :k |
		k.caseOf(
			[
				'Fibonacci' -> { n.fibonacciSequence },
				'Semi-Fibonacci' -> { n.semiFibonacciSequence }
			]
		)
	}

	fibonacciSequence { :n |
		n.lucasSequence('U', 1L, -1L)
	}

	fibonacciWord { :self |
		let a = self.goldenRatio.floor;
		let b = (self + 1L).goldenRatio.floor;
		2L + a - b
	}

	lucasInteger { :self |
		(self = 1L).if {
			1L
		} {
			let phi = 1.0.goldenRatio;
			(phi ^ self).round
		}
	}

	lucasSequence { :self |
		[1L 1L].linearRecurrence([2L 1L 3L], self)
	}

	lucasSequence { :n :p :q :a :b |
		let answer = [a];
		let i = 1L;
		{ i < n }.whileTrue {
			let c = b;
			answer.add!(b);
			b := (p * b) - (q * a);
			a := c;
			i := i + 1L
		};
		answer
	}

	lucasSequence { :n :k :p :q |
		k.caseOf(
			[
				'U' -> { lucasSequence(n, p, q, 0L, 1L) },
				'V' -> { lucasSequence(n, p, q, 2L, p) }
			]
		)
	}

	moduloFibonacciSequence { :n :m :i |
		{ :a :k |
			(a[k - 1L] + a[k - 2L]) % m
		}.recurrenceTable(i, n)
	}

	moduloFibonacciSequence { :n :m |
		n.moduloFibonacciSequence(m, [0, 1])
	}

	pellLucasSequence { :self |
		[2L 1L].linearRecurrence([2L 2L], self)
	}

	pellNumber { :self |
		let n = self;
		let x = 2.sqrt;
		((((1 + x) ^ n) - ((1 - x) ^ n)) / (2 * x)).real
	}

	pellSequence { :self |
		[2L 1L].linearRecurrence([0L 1L], self)
	}

	pellianArray { :n :k |
		(n = 0).if {
			k.isEven.if {
				0
			} {
				2 ^ ((k - 1 // 2))
			}
		} {
			(k = 0).if {
				n.pellNumber.round
			} {
				pellianArray(n, k - 1) + pellianArray(n - 1,k - 1)
			}
		}
	}

	semiFibonacciSequence { :m |
		let a = Map { :n |
			(n = 1L).if {
				1L
			} {
				n.isEven.if {
					a[n // 2L]
				} {
					a[n - 1L] + a[n - 2L]
				}
			}
		};
		a[1L .. m]
	}

	stolarskyArray { :m :n |
		let c = system.cachedStolarskyArray;
		let d = cartesianIndexToDiagonalIndex(m, n);
		c.atIfAbsentPut!(d) {
			let phi = 1.goldenRatio;
			let g = { :x |
				(x * phi + 0.5).floor.L
			};
			(n = 1L).if {
				(m = 1L).if {
					1L
				} {
					let z = stolarskyArray(m - 1L, 1L) + 1L;
					let rowContains = { :r :x |
						let k = stolarskyArray(r, 1L);
						{
							k < x
						}.whileTrue {
							k := g(k)
						};
						k = x
					};
					{
						1L.to(m - 1L).anySatisfy { :r |
							r.rowContains(z)
						}
					}.whileTrue {
						z := z + 1L
					};
					z
				}
			} {
				g(stolarskyArray(m, n - 1L))
			}
		}
	}

	stolarskyIndex { :n |
		n.wythoffIndex(
			stolarskyArray/2
		)
	}

	tribonacciNumber { :n |
		let a = (19 + (3 * 33.sqrt)).cubeRoot;
		let b = (586 + (102 * 33.sqrt)).cubeRoot;
		let c = (19 - (3 * 33.sqrt)).cubeRoot;
		let d = ((1 / 3) * (a + c + 1)) ^ (n - 1);
		let e = b.square - (2 * b) + 4;
		((3 * b) * (d / e)).round
	}

	tribonacciPisanoPeriod { :n |
		let a = [0 1 1];
		let k = 0;
		{
			a := [a[2], a[3], a.sum % n];
			k := k + 1
		}.doWhileTrue {
			a != [0 1 1]
		};
		k
	}

	tribonacciWord { :n |
		(n + 1).tribonacciWords.at(n + 1)
	}

	tribonacciWords { :n |
		let t = [1; 1 2; 1 2 1 3];
		4.toDo(n) { :i |
			t.add!(t[i - 1] ++ t[i - 2] ++ t[i - 3])
		};
		t
	}

	wythoffArray { :m :n |
		let phi = 1.goldenRatio;
		(n = 1).if {
			((m * phi).floor * phi).floor
		} {
			(n = 2).if {
				((m * phi).floor * phi.square).floor
			} {
				m.wythoffArray(n - 2) + m.wythoffArray(n - 1)
			}
		}
	}

	wythoffIndex { :n :array/2 |
		withReturn { :return/1 |
			let r = 1;
			let m = 1;
			{ m < n }.whileTrue {
				let c = 1;
				{ m < n }.whileTrue {
					c := c + 1;
					m := array(r, c)
				};
				(m = n).if {
					[r, c].return
				} {
					r := r + 1;
					m := array(r, 1)
				}
			};
			[r, 1]
		}
	}

	wythoffIndex { :n |
		n.wythoffIndex(wythoffArray/2)
	}

	wythoffLower { :self |
		(self * 1.0.goldenRatio).floor
	}

	wythoffPair { :self |
		let phi = 1.0.goldenRatio;
		[(self * phi).floor, (self * phi.square).floor]
	}

	wythoffUpper { :self |
		(self * 1.0.goldenRatio.square).floor
	}

}

+@Integer {

	pisanoPeriod { :n |
		n.isPrime.if {
			n.pisanoPeriodDirectForm
		} {
			n.factorInteger.collect { :f |
				pisanoPeriodPrimePower(f[1], f[2])
			}.lcm
		}
	}

	pisanoPeriodDirectForm { :n |
		(n <= 1L).if {
			1L
		} {
			let a = 0L;
			let b = 1L;
			let k = 0L;
			{
				[a, b] := [b, (a + b) % n];
				k := k + 1L
			}.doWhileFalse {
				a = 0L & {
					b = 1L
				}
			};
			k
		}
	}

	pisanoPeriodPrimePower { :n :k |
		(n ^ (k - 1L)) * pisanoPeriodDirectForm(n)
	}

}

+List {

	fromZeckendorfRepresentation { :self |
		let i = self.reverse.indicesOf(1);
		(i + 1).fibonacciNumber.sum
	}

}

+System {

	cachedFibonacciSequence { :self |
		self.cached('fibonacciSequence') {
			200L.fibonacciSequence
		}
	}

	cachedFibonacciSequenceExtendedTo { :self :anInteger |
		let answer = self.cachedFibonacciSequence;
		(anInteger > answer.size).ifTrue {
			answer := anInteger.fibonacciSequence;
			self.cache.put!('fibonacciSequence', answer)
		};
		answer
	}

	cachedStolarskyArray { :self |
		self.cached('stolarskyArray') {
			Map()
		}
	}

}
