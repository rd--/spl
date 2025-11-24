+SmallFloat {

	binetsFormula { :n |
		let z = 5.sqrt;
		((1 + z) ^ n) - ((1 - z) ^ n) / ((2 ^ n) * z)
	}

	dualZeckendorfRepresentation { :n |
		(n = 0).if {
			[0]
		} {
			let z = zeckendorfRepresentation(n);
			let i = 1;
			{ i <= (z.size - 2) }.whileTrue {
				(z[i] = 1 & { z[i + 1] = 0 & { z[i + 2] = 0 } }).ifTrue {
					z[i] := 0;
					z[i + 1] := 1;
					z[i + 2] := 1;
					(i > 2).ifTrue {
						i := i - 3
					}
				};
				i := i + 1
			};
			(z[1] = 0).ifTrue {
				z.removeFirst
			};
			z
		}
	}

	fibonacci { :n :x |
		(x = 1).if {
			n.fibonacci
		} {
			let a = (4 + x.square).sqrt;
			let b = x + a;
			let c = 2 ^ (0 - n);
			let d = 2 ^ n;
			let e = b ^ n;
			let f = b ^ (0 - n);
			let g = n.pi.cos;
			let r = ((c * e) - (d * f * g)) / a;
			(n.isInteger & { x.isInteger }).if {
				r.round
			} {
				r
			}
		}
	}

	fibonacci { :n |
		n.isPositiveInteger.if {
			n.fibonacciNumber.asInteger
		} {
			let phi = 1.goldenRatio;
			let r = ((phi ^ n) - (n.pi.cos * (phi ^ n.-))) / 5.sqrt;
			r
		}
	}

	fibonacciEntryPoint { :n |
		let k = 1;
		{ k.fibonacci % n != 0 }.whileTrue {
			k := k + 1
		};
		k
	}

	fibonacciNumber { :n |
		let m = n + 1;
		system
		.cachedFibonacciSequenceExtendedTo(m)
		.at(m)
	}

	fibonacciPolynomial { :n |
		(n = 0 | { n = 1 }).if {
			UnivariatePolynomial([n])
		} {
			let x = UnivariatePolynomial([0 1]);
			let a = fibonacciPolynomial(n - 1);
			let b = fibonacciPolynomial(n - 2);
			(x * a) + b
		}
	}

	fibonacciSequence { :n |
		n.lucasSequence('U', 1L, -1L)
	}

	fibonacciSequenceUpTo { :self |
		let answer = [0];
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

	fibonacciWord { :self |
		let a = self.goldenRatio.floor;
		let b = (self + 1).goldenRatio.floor;
		2 + a - b
	}

	lucasInteger { :self |
		(self = 1).if {
			1
		} {
			let phi = 1.goldenRatio;
			(phi ^ self).round
		}
	}

	lucasNumber { :self |
		let phi = 1.goldenRatio;
		(phi ^ self) + (self.pi.cos * (phi ^ self.negate))
	}

	lucasSequence { :self |
		[1 1].linearRecurrence([2 1 3], self)
	}

	lucasSequence { :n :p :q :a :b |
		let answer = [a];
		let i = 1;
		{ i < n }.whileTrue {
			let c = b;
			answer.add(b);
			b := (p * b) - (q * a);
			a := c;
			i := i + 1
		};
		answer
	}

	lucasSequence { :n :k :p :q |
		k.caseOf(
			[
				'U' -> { lucasSequence(n, p, q, 0, 1) },
				'V' -> { lucasSequence(n, p, q, 2, p) }
			]
		)
	}

	pellLucasSequence { :self |
		[2 1].linearRecurrence([2 2], self)
	}

	pellNumber { :self |
		let n = self;
		let x = 2.sqrt;
		((((1 + x) ^ n) - ((1 - x) ^ n)) / (2 * x)).real
	}

	pellSequence { :self |
		[2 1].linearRecurrence([0 1], self)
	}

	pisanoPeriod { :n |
		(n <= 1).if {
			1
		} {
			let a = [1 0];
			let a0 = a;
			let k = 0;
			{
				let s = a.sum % n;
				a := a.rotateLeft;
				a[2] := s;
				k := k + 1
			}.doWhileTrue {
				a != a0
			};
			k
		}
	}

	stolarskyArray { :m :n |
		let c = system.cachedStolarskyArray;
		let d = cartesianIndexToDiagonalIndex(m, n);
		c.atIfAbsentPut(d) {
			let phi = 1.goldenRatio;
			let g = { :x |
				(x * phi + 0.5).floor
			};
			(n = 1).if {
				(m = 1).if {
					1
				} {
					let z = stolarskyArray(m - 1, 1) + 1;
					let rowContains = { :r :x |
						let k = stolarskyArray(r, 1);
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
				g(stolarskyArray(m, n - 1))
			}
		}
	}

	stolarskyIndex { :n |
		n.wythoffIndex(stolarskyArray:/2)
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

	wythoffIndex { :n :array:/2 |
		valueWithReturn { :return:/1 |
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
		n.wythoffIndex(wythoffArray:/2)
	}

	wythoffLower { :self |
		(self * 1.goldenRatio).floor
	}

	wythoffPair { :self |
		let phi = 1.goldenRatio;
		[(self * phi).floor, (self * phi.square).floor]
	}

	wythoffUpper { :self |
		(self * 1.goldenRatio.square).floor
	}

	zeckendorfRepresentation { :self |
		(self <= 0).if {
			[0]
		} {
			let f = self.fibonacciSequenceUpTo;
			let k = f.size - 1;
			let z = [];
			f.removeFirst;
			k.toByDo(2, -1) { :i |
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

+System {

	cachedFibonacciSequence { :self |
		self.cached('fibonacciSequence') {
			200.fibonacciSequence
		}
	}

	cachedFibonacciSequenceExtendedTo { :self :anInteger |
		let answer = self.cachedFibonacciSequence;
		(anInteger > answer.size).ifTrue {
			answer := anInteger.fibonacciSequence;
			self.cache.atPut('fibonacciSequence', answer)
		};
		answer
	}

	cachedStolarskyArray { :self |
		self.cached('stolarskyArray') {
			Map()
		}
	}

}

