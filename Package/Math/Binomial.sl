/* Requires: Collection Integer Number */

+@Number {

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

}

+@Integer {

	catalanNumber { :self |
		(self.one / (self + 1)) * (2 * self).binomial(self)
	}

	catalanTriangle { :n :k |
		((n - k + 1) / (n + 1)) * (n + k).binomial(k)
	}

	delannoyNumber { :m :n |
		(0 .. m.min(n)).collect { :k |
			(m + n - k).binomial(m) * m.binomial(k)
		}.sum
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
			}.memoize(true);
			f(self)
		}
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
		0:self.collect { :n |
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

	polygonalNumber { :n |
		binomial(n + 1, 2)
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

}

+@Collection {

	multinomial { :self |
		self.sum.factorialOrGamma / self.factorialOrGamma.product
	}

}
