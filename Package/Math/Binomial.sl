/* Requires: Collection Integer Number */

+@Number {

	bernoulliPolynomial { :n |
		let b = (n + 1).bernoulliSequence;
		let c = 0.to(n).collect { :k |
			binomial(n, k) * b[k + 1]
		};
		UnivariatePolynomial(c.reverse)
	}

	binomial { :n :k |
		k.isCollection.if {
			k.adaptToNumberAndApply(n, binomial:/2)
		} {
			(
				n.isNonNegativeInteger & {
					k.isNonNegativeInteger & {
						k <= n
					}
				}
			).if {
				n.asLargeInteger.integerBinomial(k).normal
			} {
				n.binomialGamma(k)
			}
		}
	}

	binomialGamma { :n :k |
		let a = (n + 1).gamma;
		let b = (k + 1).gamma;
		let c = (n - k + 1).gamma;
		a / (b * c)
	}

	binomialPascal { :a :b |
		let answer = 1;
		0.toDo(b - 1) { :i |
			answer := answer * (a - i) / (i + 1)
		};
		answer
	}

	trinomial { :n :k |
		0.to(n).sum { :i |
			binomial(n, i)
			*
			binomial(n - i, k - (2 * i))
		}
	}

}

+@Integer {

	bernoulliTriangle { :self |
		let m = self - 1;
		0.to(m).triangularArray { :n :k |
			0.to(k).collect { :p |
				n.binomial(p)
			}.sum
		}
	}

	catalanExpansion { :n |
		(n = 0).if {
			[]
		} {
			let m = n;
			let k = n.catalanIndex;
			let e = List(k, 0);
			k.toByDo(1, -1) { :j |
				let c = 0;
				{ m >= j.catalanNumber }.whileTrue {
					m := m - j.catalanNumber;
					c := c + 1
				};
				e[k - j + 1] := c
			};
			(e[1] = 0).ifTrue {
				e := e.drop(1)
			};
			e
		}
	}

	catalanIndex { :n |
		let i = 0;
		{ i.catalanNumber <= n }.whileTrue {
			i := i + 1
		};
		i
	}

	catalanNumber { :self |
		(self.one / (self + 1)) * (2 * self).binomial(self)
	}

	catalanRank { :n |
		let m = n.integerLength(2) // 2;
		let a = n.integerDigits(2).reverse.fromDigits(2);
		let y = 0;
		let t = 1;
		1.toDo(2 * m - 1) { :x |
			let u = 2 * m - x;
			let v = m - ((x + y + 1 ) / 2);
			let mn = binomial(u, v) - binomial(u, v - 1);
			t := t + (mn * (1 - (a % 2 )));
			y := y - (-1 ^ a);
			a := a // 2
		};
		0.to(m).collect(catalanNumber:/1).sum - t
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
			let i = 0;
			let d = nil;
			let x = nil;
			let m = nil;
			{ z >= t(i, i + 1) }.whileTrue {
				i := i + 1
			};
			d := List(i, 0);
			d[1] := 1;
			x := z - t(i - 1, i);
			m := i - 1;
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

	delannoyNumber { :m :n |
		0.to(m.min(n)).collect { :k |
			(m + n - k).integerBinomial(m) * m.integerBinomial(k)
		}.sum
	}

	delannoySequence { :k |
		let answer = [];
		k.antidiagonalIndicesDo { :m :n |
			answer.add(delannoyNumber(m - 1, n - 1))
		};
		answer
	}

	eulerNumber { :self |
		self.isOdd.if {
			0
		} {
			let f:/1 = { :m |
				let n = m / 2;
				(n = 0).if {
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

	fussCatalanNumber { :p :r :m |
		let a = (m * p) + r;
		(r / a) * binomial(a, m)
	}

	fussCatalanNumber { :p :r |
		{ :m |
			fussCatalanNumber(p, r, m)
		}
	}

	generalizedPentagonalNumbers { :n |
		linearRecurrence([1 2 -2 -1 1], [0 1 2 5 7], n)
	}

	hexagonalNumber { :n |
		let m = 2 * n;
		(m * (m - 1)) / 2
	}

	integerBinomial { :n :k |
		let numerator = 1L;
		let denominator = 1L;
		n.toByDo(k.max(n - k) + 1, -1) { :factor |
			numerator := numerator * factor
		};
		1.toDo(k.min(n - k)) { :factor |
			denominator := denominator * factor
		};
		numerator // denominator
	}

	lassalleNumber { :m |
		let a = List(m, m.one);
		2.toDo(m) { :n |
			let z = 1.to(n - 1).collect { :j |
				-1 ^ j * (2 * n - 1).binomial(2 * j - 1) * a[j] * (n - j).catalanNumber
			}.sum;
			a[n] := -1 ^ (n - 1) * (n.catalanNumber + z)
		};
		a[m]
	}

	leibnizHarmonicTriangle { :self |
		1.to(self).triangularArray { :n :k |
			Fraction(1, n.binomial(k) * k)
		}
	}

	lobbNumber { :m :n |
		m.betweenAnd(0, n).if {
			((2 * n).binomial(m + n) * (2 * m + 1)) // (m + n + 1)
		} {
			'@Integer>>lobbNumber: domain error'.error
		}
	}

	mersenneNumber { :n |
		(2 ^ n) - 1
	}

	multichoose { :n :k |
		[n - 1, k].multinomial
	}

	narayanaNumber { :n :k |
		k.betweenAnd(1, n).if {
			n.binomial(k) * binomial(n, k - 1) // n
		} {
			'narayanaNumber: domain error'.error
		}
	}

	orderedBellNumber { :n |
		0:n.sum { :k |
			k.! * stirlingS2(n, k)
		}
	}

	pascalTriangle { :self |
		0.to(self - 1).triangularArray(binomial:/2)
	}

	pentagonalNumber { :n |
		(3 * n.square - n) / 2
	}

	pyramidalNumber { :r |
		{ :n |
			((3 * n.square) + (n.cube * (r - 2)) - (n * (r - 5))) / 6
		}
	}

	pyramidalNumber { :r :n |
		let f:/1 = r.pyramidalNumber;
		n.isCollection.if {
			n.collect(f:/1)
		} {
			f(n)
		}
	}

	qBinomialDirect { :n :m |
		let a = 0.to(m - 1).product { :i |
			Polynomial([0: 1, (n - i): -1])
		};
		let b = 0.to(m - 1).product { :i |
			Polynomial([0: 1, (i + 1): -1])
		};
		a.polynomialQuotient(b)
	}

	qBinomialCyclotomic { :n :m |
		/* https://arminstraub.com/math/qbinomials-mma */
		(m > n).if {
			Polynomial([])
		} {
			(n < 2).if {
				Polynomial([1])
			} {
				2.to(n).product { :d |
					let a = floor(n / d);
					let b = floor(m / d);
					let c = floor((n - m) / d);
					(a = (b + c)).if {
						Polynomial([1])
					} {
						cyclotomic(d)
					}
				}
			}
		}
	}

	qBinomial { :n :m |
		qBinomialCyclotomic(n, m)
	}

	qBinomial { :n :m :q |
		qBinomial(n, m).at(q)
	}

	qFactorial { :n |
		/* https://arminstraub.com/math/qbinomials-mma */
		(n < 2).if {
			Polynomial([1])
		} {
			2.to(n).product { :d |
				d.cyclotomic ^ floor(n / d)
			}
		}
	}

	qFactorial { :n :q |
		n.qFactorial.at(q)
	}

	simplicialPolytopicNumber { :r :n |
		binomial(n + (r - 1), r)
	}

	subfactorial { :self |
		0.to(self).collect { :each |
			each.factorial * (-1 ^ (self - each)) * self.binomial(each)
		}.sum
	}

	superCatalanNumber { :self |
		let f = { :n |
			(n <= 2).if {
				1
			} {
				((3 * (2 * n - 3) * f(n - 1)) - ((n - 3) * f(n - 2))) / n
			}
		};
		f:/1.memoize(true).value(self)
	}

	take { :n :k |
		(k > n).if {
			0
		} {
			n.integerBinomial(k)
		}
	}

	tetrahedralNumber { :n |
		1.toCollect(n) { :k |
			(k * (k + 1)) / 2
		}.sum
	}

	triangularNumber { :n |
		(n + 1).binomial(2)
	}

}

+@Collection {

	multinomial { :self |
		self.sum.factorialOrGamma / self.factorialOrGamma.product
	}

}

+LargeInteger {

	gouldsNumber { :n |
		0L.to(n).collect { :k |
			binomial(n, k) % 2L
		}.sum
	}

}

+System {

	catalanUnrankTable { :self |
		self.cached('catalanUnrankTable') {
			(
				table: 0.to(999).select(isDyckWord:/1),
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
					t.add(i)
				}
			};
			u['limit'] := m * 2
		};
		u
	}

}
