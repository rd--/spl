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

}

+@Integer {

	catalanNumber { :self |
		(self.one / (self + 1)) * (2 * self).binomial(self)
	}

	multichoose { :n :k |
		[n - 1, k].multinomial
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
		f:/1.memoize.value(self)
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
