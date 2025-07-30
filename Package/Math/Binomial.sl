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
				n.positiveIntegerBinomial(k)
			} {
				(n + 1).gamma / ((k + 1).gamma * (n - k + 1).gamma)
			}
		}
	}

	binomialPascal { :a :b |
		let answer = 1;
		0.toDo(b - 1) { :i |
			answer := answer * (a - i) / (i + 1)
		};
		answer
	}

	positiveIntegerBinomial { :n :k |
		let numerator = n.one;
		let denominator = n.one;
		n.toByDo(k.max(n - k) + 1, -1) { :factor |
			numerator := numerator * factor
		};
		1.toDo(k.min(n - k)) { :factor |
			denominator := denominator * factor
		};
		numerator // denominator
	}

}

+@Integer {

	bernoulliTriangle { :self |
		let m = self - 1;
		0:m.collect { :n |
			0:n.collect { :k |
				0:k.collect { :p |
					n.binomial(p)
				}.sum
			}
		}
	}

	catalanNumber { :self |
		(self.one / (self + 1)) * (2 * self).binomial(self)
	}

	catalanTriangle { :n :k |
		((n - k + 1) / (n + 1)) * (n + k).binomial(k)
	}

	centeredHexagonalNumber { :n |
		(3 * n.squared) - (3 * n) + 1
	}

	delannoyNumber { :m :n |
		(0 .. m.min(n)).collect { :k |
			(m + n - k).binomial(m) * m.binomial(k)
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
						binomial(2 * n, 2 * k) * f(2 * (n - k))
					}.sum.negated
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
		let m = self - 1;
		0:m.collect { :n |
			0:n.collect { :k |
				n.binomial(k)
			}
		}
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

	partitionFunctionQ { :n :k |
		partitionFunctionP(n - binomial(k, 2), k)
	}

	partitionsP { :n |
		(n = 0).if {
			1
		} {
			let answer = 1;
			let k = 2;
			{
				let i = n.partitionFunctionP(k);
				answer := answer + i;
				k := k + 1;
				i > 0
			}.whileTrue;
			answer
		}
	}

	partitionsQ { :n |
		(n = 0).if {
			1
		} {
			let answer = 1;
			let k = 2;
			{
				let i = n.partitionFunctionQ(k);
				answer := answer + i;
				k := k + 1;
				i > 0
			}.whileTrue;
			answer
		}
	}

	pentagonalNumber { :n |
		(3 * n.squared - n) / 2
	}

	polygonalNumber { :n |
		binomial(n + 1, 2)
	}

	pyramidalNumber { :r |
		{ :n |
			((3 * n.squared) + (n.cubed * (r - 2)) - (n * (r - 5))) / 6
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
			n.positiveIntegerBinomial(k)
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
