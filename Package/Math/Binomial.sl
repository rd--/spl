/* Requires: Collection Integer Number */

+@Number {

	bernoulliPolynomial { :n |
		let b = (n + 1).bernoulliSequence;
		let c = 0:n.collect { :k |
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
		(0 .. n).sum { :i |
			binomial(n, i)
			*
			binomial(n - i, k - (2 * i))
		}
	}

}

+@Integer {

	bernoulliTriangle { :self |
		let m = self - 1;
		0:m.triangularArray { :n :k |
			0:k.collect { :p |
				n.binomial(p)
			}.sum
		}
	}

	catalanNumber { :self |
		(self.one / (self + 1)) * (2 * self).binomial(self)
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

	centeredHexagonalNumber { :n |
		(3 * n.square) - (3 * n) + 1
	}

	centeredPolygonalNumber { :k :n |
		((k * n) / 2) * (n - 1) + 1
	}

	delannoyNumber { :m :n |
		(0 .. m.min(n)).collect { :k |
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
					1:n.collect { :k |
						integerBinomial(2 * n, 2 * k) * f(2 * (n - k))
					}.sum.negate
				}
			}.memoize(false);
			f(self)
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
			let z = (1 .. (n - 1)).collect { :j |
				-1 ^ j * (2 * n - 1).binomial(2 * j - 1) * a[j] * (n - j).catalanNumber
			}.sum;
			a[n] := -1 ^ (n - 1) * (n.catalanNumber + z)
		};
		a[m]
	}

	leibnizHarmonicTriangle { :self |
		1:self.collect { :n |
			1:n.collect { :k |
				Fraction(1, n.binomial(k) * k)
			}
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

	pascalTriangle { :self |
		(0 .. self - 1).triangularArray(binomial:/2)
	}

	partitionFunctionP { :self :anInteger |
		let p = { :n :k |
			(k > n).if {
				0
			} {
				(k = n).if {
					1
				} {
					(k = 0).if {
						0
					} {
						p(n - 1, k - 1) + p(n - k, k)
					}
				}
			}
		};
		p(self, anInteger)
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

	partitionFunctionQ { :n |
		(n < 1).if {
			1
		} {
			1:n.sum { :k |
				partitionFunctionQ(n, k)
			}
		}
	}

	partitionFunctionQ { :n :k |
		partitionFunctionP(n - k.binomial(2), k)
	}

	partitionsP { :n |
		n.partitionFunctionP
	}

	partitionsQ { :n |
		n.partitionFunctionQ
	}

	pentagonalNumber { :n |
		(3 * n.square - n) / 2
	}

	polygonalNumber { :n |
		binomial(n + 1, 2)
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

	qBinomial { :n :m |
		let a = (0 .. m - 1).product { :i |
			Polynomial([0: 1, (n - i): -1])
		};
		let b = (0 .. m - 1).product { :i |
			Polynomial([0: 1, (i + 1): -1])
		};
		a.polynomialQuotient(b)
	}

	qBinomial { :n :m :q |
		qBinomial(n, m).at(q)
	}

	subfactorial { :self |
		(0 .. self).collect { :each |
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
		1:n.collect { :k |
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
		(0L .. n).collect { :k |
			binomial(n, k) % 2L
		}.sum
	}

}
