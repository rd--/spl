/* Requires: Collection Integer Number */

+@Number {

	bernoulliPolynomial { :n |
		let b = (n + 1L).bernoulliSequence;
		let c = 0L.to(n).collect { :k |
			binomial(n, k) * b[k + 1L]
		};
		UnivariatePolynomial(c.reverse)
	}

	binomial { :n :k |
		k.isCollection.if {
			k.adaptToNumberAndApply(n, binomial/2)
		} {
			k.isZero.if {
				1L
			} {
				(
					n < 0L & {
						k.isIntegerValuedNumber
					}
				).if {
					(k >= 0L).if {
						(-1L ^ k) * binomial(k - n - 1L, k)
					} {
						(-1L ^ (n - k)) * binomial(-k - 1L, n - k)
					}
				} {
					(
						n.isInteger & {
							k.isInteger
						}
					).if {
						integerBinomial(n, k)
					} {
						n.binomialGamma(k)
					}
				}
			}
		}
	}

	binomialGamma { :n :k |
		k.isCollection.if {
			k.collect { :m |
				binomialGamma(n, m)
			}
		} {
			(k = 0.0).if {
				1.0
			} {
				(n = 0.0).if {
					k.pi.sin / k.pi
				} {
					uncheckedBinomialGamma(n, k)
				}
			}
		}
	}

	binomialPascal { :a :b |
		let answer = 1L;
		0L.toDo(b - 1L) { :i |
			answer := answer * (a - i) / (i + 1L)
		};
		answer
	}

	trinomial { :n :k |
		n := n.integerChop(1E-16);
		0L.to(n).sum { :i |
			binomial(n, i)
			*
			binomial(n - i, k - (2L * i))
		}
	}

	uncheckedBinomialGamma { :n :k |
		let a = (n + 1.0).gamma;
		let b = (k + 1.0).gamma;
		let c = (n - k + 1.0).gamma;
		a / (b * c)
	}

}

+Complex {

	binomial { :n :k |
		binomialGamma(n, k)
	}

}

+@Integer {

	bernoulliTriangle { :self |
		let m = self - 1L;
		0.to(m).triangularArray { :n :k |
			0.to(k).collect { :p |
				n.binomial(p)
			}.sum
		}
	}

	catalanExpansion { :n |
		(n = 0L).if {
			[]
		} {
			let m = n;
			let k = n.catalanIndex;
			let e = List(k, 0L);
			k.toByDo(1L, -1L) { :j |
				let c = 0L;
				{ m >= j.catalanNumber }.whileTrue {
					m := m - j.catalanNumber;
					c := c + 1L
				};
				e[k - j + 1] := c
			};
			(e[1L] = 0L).ifTrue {
				e := e.drop(1L)
			};
			e
		}
	}

	catalanIndex { :n |
		let i = 0L;
		{
			i.catalanNumber <= n
		}.whileTrue {
			i := i + 1L
		};
		i
	}

	catalanNumber { :self |
		((1L / (self + 1L)) * (2L * self).binomial(self)).round
	}

	catalanRank { :n |
		let m = n.integerLength(2L) // 2L;
		let a = n.integerDigits(2L).reverse.fromDigits(2L);
		let y = 0L;
		let t = 1L;
		1L.toDo(2L * m - 1L) { :x |
			let u = 2L * m - x;
			let v = m - ((x + y + 1L) // 2L);
			let mn = binomial(u, v) - binomial(u, v - 1L);
			t := t + (mn * (1L - (a % 2L)));
			y := y - (-1L ^ a);
			a := a // 2L
		};
		0L.to(m).collect(
			catalanNumber/1
		).sum - t
	}

	catalanRestrictedGrowthString { :z |
		(z = 0).if {
			[0]
		} {
			let t = { :j :k |
				let a = (k + j).! * (k - j + 1);
				let b = j.! * (k + 1).!;
				a / b
			};
			let k = 2;
			let i = 0L;
			{ z >= t(i, i + 1) }.whileTrue {
				i := i + 1
			};
			let d = List(i, 0);
			d[1] := 1;
			let x = z - t(i - 1, i);
			let m = i - 1;
			{ x > 0 }.whileTrue {
				let w = 0;
				let s = 0;
				let p = 0;
				{ w <= x }.whileTrue {
					p := w;
					w := w + t(m - 1, m + s);
					s := s + 1
				};
				d[k] := s - 1;
				m := m - 1;
				k := k + 1;
				x := x - p
			};
			d
		}
	}

	catalanTriangle { :r |
		{ :x |
			let y = x.accumulate;
			y ++ [y.last]
		}.nestList([1], r)
	}

	catalanTriangle { :n :k |
		((n - k + 1) / (n + 1)) * (n + k).binomial(k)
	}

	catalanUnrank { :n |
		let m = n + 1;
		let u = system.catalanUnrankTableExtendTo(m);
		u['table'].at(m)
	}

	centeredHexagonalNumber { :n |
		(3 * n.square) - (3 * n) + 1
	}

	centeredPolygonalNumber { :k :n |
		((k * n) / 2) * (n - 1) + 1
	}

	choose { :n :k |
		(k > n).if {
			0
		} {
			n.integerBinomial(k)
		}
	}

	delannoyNumber { :m :n |
		0.to(m.min(n)).collect { :k |
			(m + n - k).integerBinomial(m) * m.integerBinomial(k)
		}.sum
	}

	delannoySequence { :k |
		let answer = [];
		k.antidiagonalIndicesDo { :m :n |
			answer.add!(delannoyNumber(m - 1, n - 1))
		};
		answer
	}

	eulerNumber { :self |
		self.isOdd.if {
			0
		} {
			let f/1 = { :m |
				let n = m // 2;
				n.isZero.if {
					1
				} {
					1.toCollect(n) { :k |
						integerBinomial(2 * n, 2 * k) * f(2 * (n - k))
					}.sum.negate
				}
			}.memoize(false);
			f(self)
		}
	}

	generalisedCatalanNumber { :n |
		let a/1 = { :n |
			(n = 0L).if {
				1L
			} {
				a(n - 1) + Range(2, n - 2, 1).sum { :k |
					a(k) * a(n - 2 - k)
				}
			}
		}.memoize(true);
		a(n)
	}

	generalisedPentagonalNumbers { :n |
		linearRecurrence([1 2 -2 -1 1], [0 1 2 5 7], n)
	}

	hexagonalNumber { :n |
		let m = 2L * n;
		(m * (m - 1L)) / 2L
	}

	integerBinomial { :n :k |
		k.isCollection.if {
			k.collect { :each |
				integerBinomial(n, each)
			}
		} {
			[
				{ n = k } -> { 1L },
				{ k = 1L } -> { n },
				{ n = (k + 1L) } -> { n },
				{ n < k } -> { 0L },
				{ k < 0L } -> { 0L },
				{ true } -> { uncheckedIntegerBinomial(n, k) }
			].which
		}
	}

	inverseTriangularNumber { :n |
		(((1L + (8L * n)).sqrt - 1) / 2L).floor
	}

	lahNumber { :n :k :s |
		s.caseOf(
			[
				'Unsigned' -> {
					lahNumber(n, k)
				},
				'Signed' -> {
					(-1 ^ n) * lahNumber(n, k)
				}
			]
		)
	}

	lahNumber { :n :k |
		binomial(n, k) * factorialPower(n - 1, n - k)
	}

	lassalleNumber { :m |
		let a = List(m, m.one);
		2L.toDo(m) { :n |
			let z = 1.to(n - 1).collect { :j |
				(-1L ^ j)
				* (2 * n - 1).binomial(2 * j - 1)
				* a[j]
				* (n - j).catalanNumber
			}.sum;
			a[n] := -1 ^ (n - 1) * (n.catalanNumber + z)
		};
		a[m]
	}

	leibnizHarmonicTriangle { :self |
		1L.to(self).triangularArray { :n :k |
			Fraction(1, n.binomial(k) * k)
		}
	}

	lobbNumber { :m :n |
		m.isBetween(0L, n).if {
			((2L * n).binomial(m + n) * (2L * m + 1L)) // (m + n + 1L)
		} {
			'@Integer>>lobbNumber: domain error'.error
		}
	}

	mersenneNumber { :n |
		(2L ^ n) - 1L
	}

	multichoose { :n :k |
		[n - 1L, k].multinomial
	}

	narayanaNumber { :n :k |
		k.isBetween(1L, n).if {
			n.binomial(k) * binomial(n, k - 1L) // n
		} {
			'narayanaNumber: domain error'.error
		}
	}

	orderedBellNumber { :n |
		0L.to(n).sum { :k |
			k.! * stirlingS2(n, k)
		}
	}

	pascalTriangle { :self |
		0L.to(self - 1L).triangularArray(binomial/2)
	}

	pascalTriangle { :n :m |
		0L.to(n).triangularArray { :n :k |
			(n = k).if {
				m
			} {
				n.binomial(k) * (1L + ((m - 1L) * k / n))
			}
		}
	}

	pentagonalNumber { :n |
		(3L * n.square - n) / 2L
	}

	pyramidalNumber { :r |
		{ :n |
			((3L * n.square) + (n.cube * (r - 2L)) - (n * (r - 5L))) / 6L
		}
	}

	pyramidalNumber { :r :n |
		let f/1 = r.pyramidalNumber;
		n.isCollection.if {
			n.collect(f/1)
		} {
			f(n)
		}
	}

	qBinomial { :n :m |
		qBinomialCyclotomic(n, m)
	}

	qBinomial { :n :m :q |
		qBinomial(n, m).at(q)
	}

	qBinomialCyclotomic { :n :m |
		/* https://arminstraub.com/math/qbinomials-mma */
		(m > n).if {
			Polynomial([])
		} {
			(n < 2L).if {
				Polynomial([1L])
			} {
				2L.to(n).product { :d |
					let a = floor(n / d);
					let b = floor(m / d);
					let c = floor((n - m) / d);
					(a = (b + c)).if {
						Polynomial([1L])
					} {
						cyclotomic(d)
					}
				}
			}
		}
	}

	qBinomialDirect { :n :m |
		let a = 0L.to(m - 1L).product { :i |
			Polynomial(
				Dictionary(
					[0L -> 1L, (n - i) -> -1L]
				)
			)
		};
		let b = 0L.to(m - 1L).product { :i |
			Polynomial(
				Map(
					[0L -> 1L, (i + 1L) -> -1L]
				)
			)
		};
		a.polynomialQuotient(b)
	}

	qFactorial { :n |
		/* https://arminstraub.com/math/qbinomials-mma */
		(n < 2L).if {
			Polynomial([1L])
		} {
			2L.to(n).product { :d |
				d.cyclotomic ^ floor(n / d)
			}
		}
	}

	qFactorial { :n :q |
		n.qFactorial.at(q)
	}

	rencontresNumber { :n :k |
		(n - k).subfactorial * n.binomial(k)
	}

	simplicialPolytopicNumber { :r :n |
		binomial(n + (r - 1L), r)
	}

	subfactorial { :self |
		0L.to(self).collect { :each |
			each.factorial * (-1L ^ (self - each)) * self.binomial(each)
		}.sum
	}

	superCatalanNumber { :self |
		let f/1 = { :n |
			(n <= 2L).if {
				1L
			} {
				((3L * (2L * n - 3L) * f(n - 1L)) - ((n - 3L) * f(n - 2L))) / n
			}
		}.memoize(false);
		f(self)
	}

	tetrahedralNumber { :n |
		1L.toCollect(n) { :k |
			(k * (k + 1L)) / 2L
		}.sum
	}

	triangularNumber { :n |
		(n + 1L).integerBinomial(2L)
	}

	uncheckedIntegerBinomial { :n :k |
		let numerator = 1L;
		let denominator = 1L;
		n.toByDo(k.max(n - k) + 1L, -1L) { :factor |
			numerator := numerator * factor
		};
		1L.toDo(k.min(n - k)) { :factor |
			denominator := denominator * factor
		};
		numerator // denominator
	}

}

+[@Integer, Fraction] {

	fussCatalanNumber { :p :r :m |
		let a = (m * p) + r;
		(r / a) * binomial(a, m)
	}

	fussCatalanNumber { :p :r |
		{ :m |
			fussCatalanNumber(p, r, m)
		}
	}

}

+@Collection {

	multinomial { :self |
		self.sum.factorialOrGamma / self.factorialOrGamma.product
	}

}

+Integer {

	gouldsNumber { :n |
		0L.to(n).collect { :k |
			binomial(n, k) % 2
		}.sum
	}

}

+System {

	catalanUnrankTable { :self |
		self.cached('catalanUnrankTable') {
			(
				table: 0.to(999).select(isDyckWord/1),
				limit: 999
			)
		}
	}

	catalanUnrankTableExtendTo { :self :k |
		let u = self.catalanUnrankTable;
		let t = u['table'];
		{ k > t.size }.whileTrue {
			let m = u['limit'];
			(m + 1).toDo(m * 2) { :i |
				i.isDyckWord.ifTrue {
					t.add!(i)
				}
			};
			u['limit'] := m * 2
		};
		u
	}

}
