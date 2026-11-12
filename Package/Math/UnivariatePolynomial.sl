UnivariatePolynomial : [Object, Copy, Store, Equal] {

	| coefficientList |

	assertIsNormal { :self |
		self.isNormal.ifFalse {
			self.error('assertIsNormal: not normal')
		}
	}

	at { :self :x |
		self.coefficientList.evaluateUnivariatePolynomial(x)
	}

	atAll { :self :aCollection |
		aCollection.collect { :each |
			self.at(each)
		}
	}

	atAllPath { :self :operand |
		let [indices] = operand;
		indices.collect { :each |
			self.at(each)
		}
	}

	degree { :self |
		self.coefficientList.size - 1L
	}

	discriminant { :self |
		self.coefficientList.discriminant
	}

	euclideanAlgorithm { :self :operand |
		let a = self;
		let b = operand;
		{
			b.isZero
		}.whileFalse {
			let r = a.remainder(b);
			a := b;
			b := r
		};
		a
	}

	exponent { :self |
		self.degree
	}

	gcd { :self :operand |
		self.euclideanAlgorithm(operand).monicPolynomial
	}

	isEqualBy { :self :operand :aBlock/2 |
		operand.isUnivariatePolynomial & {
			aBlock(self.coefficientList, operand.coefficientList)
		}
	}

	isNormal { :self |
		self.isSymbolic | {
			let c = self.coefficientList;
			(c.size = 0L) | {
				c.last != 0L
			}
		}
	}

	isSymbolic { :self |
		self.coefficientList.allSatisfy(isSymbol/1)
	}

	isUnimodal { :self |
		self.coefficientList.isUnimodal
	}

	isZero { :self |
		self.coefficientList.isEmpty
	}

	leadingCoefficient { :self |
		self.coefficientList.last
	}

	[mod, %] { :self :modulus |
		UnivariatePolynomial(
			self.coefficientList % modulus
		)
	}

	monicPolynomial { :self |
		self * self.leadingCoefficient.reciprocal
	}

	[negate, -] { :self |
		self * -1L
	}

	normalize { :self |
		self.isSymbolic.not.ifTrue {
			let c = self.coefficientList;
			{
				c.size > 0L & {
					c.last = 0L
				}
			}.whileTrue {
				c.removeLast!
			}
		};
		self
	}

	[plus, +] { :self :operand |
		let c1 = self.coefficientList;
		let c2 = operand.coefficientList;
		let n = c1.size.max(c2.size);
		UnivariatePolynomial(
			c1.padRight([n], 0L)
			+
			c2.padRight([n], 0L)
		)
	}

	polynomialGcd { :self :operand |
		self.gcd(operand)
	}

	polynomialQuotient { :self :operand |
		self.quotient(operand)
	}

	polynomialQuotientRemainder { :self :operand |
		self.quotientRemainder(operand)
	}

	polynomialRemainder { :self :operand |
		self.remainder(operand)
	}

	postCopy { :self |
		self.coefficientList := self.coefficientList.copy
	}

	[power, ^] { :self :operand |
		(operand = 0L).if {
			Polynomial([1L])
		} {
			let answer = self;
			(operand - 1L).timesRepeat {
				answer := answer * self
			};
			answer
		}
	}

	[quotient, //] { :numerator :denominator |
		let [q, _] = numerator.quotientRemainder(denominator);
		q
	}

	quotientRemainder { :numerator :denominator |
		let quotient = UnivariatePolynomial([]);
		let remainder = numerator.copy;
		let denominatorDegree = denominator.degree;
		let denominatorLeadingCoefficient = denominator.leadingCoefficient;
		{ remainder.degree >= denominatorDegree }.whileTrue {
			let exponent = remainder.degree - denominatorDegree;
			let coefficient = remainder.leadingCoefficient / denominatorLeadingCoefficient;
			let temporary = UnivariatePolynomial(Dictionary([[exponent, coefficient]]));
			quotient := quotient + temporary;
			remainder := remainder - (temporary * denominator)
		};
		[quotient, remainder]
	}

	remainder { :numerator :denominator |
		let [_, r] = numerator.quotientRemainder(denominator);
		r
	}

	resultant { :self :operand |
		self.coefficientList.resultant(
			operand.coefficientList
		)
	}

	[subtract, -] { :self :operand |
		self + operand.negate
	}

	terms { :self |
		let answer = Dictionary();
		self.coefficientList.withIndexDo { :c :i |
			(c != 0L).ifTrue {
				answer.add!(
					(i - 1L) -> c
				)
			}
		};
		answer
	}

	[times, *] { :self :operand |
		let a = self.coefficientList;
		operand.isUnivariatePolynomial.if {
			let b = operand.coefficientList;
			let m = a.size;
			let n = b.size;
			let c = List(m + n - 1L, 0L);
			1L.toDo(m) { :i |
				1L.toDo(n) { :j |
					c[i + j - 1L] := c[i + j - 1L] + (a[i] * b[j])
				}
			};
			UnivariatePolynomial(c)
		} {
			UnivariatePolynomial(a * operand)
		}
	}

	unaryBlock { :self |
		let c = self.coefficientList;
		{ :x |
			c.evaluateUnivariatePolynomial(x)
		}
	}

}

+List {

	UnivariatePolynomial { :self |
		newUnivariatePolynomial().initializeSlots(self).normalize
	}

	discriminant { :self |
		(self.size - 1L).caseOf(
			[
				1L -> { 1L },
				2L -> {
					let [c, b, a] = self;
					b.square - (4L * a * c)
				},
				3L -> {
					let [d, c, b, a] = self;
					(b.square * c.square)
					- (4L * a * c.cube)
					- (4L * b.cube * d)
					- (27L * a.square * d.square)
					+ (18L * a * b * c * d)
				},
				4L -> {
					/*
						256a³e³
						-192a²bde²
						-128a²c²e²
						+144a²cd²e
						-27a²d⁴
						+144ab²ce²
						-6ab²d²e
						-80abc²de
						+18abcd³
						+16ac⁴e
						-4ac³d²
						-27b⁴e²
						+18b³cde
						-4b³d³
						-4b²c³e
						+b²c²d²
					*/
					let [e, d, c, b, a] = self;
					[
						256L * a.cube * e.cube,
						-192L * a.square * b * d * e.square,
						-128L * a.square * c.square * e.square,
						144L * a.square * c * d.square * e,
						-27L * a.square * (d ^ 4),
						144L * a * b.square * c * e.square,
						-6L * a * b.square * d.square * e,
						-80L * a * b * c.square * d * e,
						18L * a * b * c * d.cube,
						16L * a * (c ^ 4) * e,
						-4L * a * c.cube * d.square,
						-27L * (b ^ 4) * e.square,
						18L * b.cube * c * d * e,
						-4L * b.cube * d.cube,
						-4L * b.square * c.cube * e,
						1L * b.square * c.square * d.square
					].sum
				}
			]
		) {
			self.error('discriminant: degree≠{1,2,3,4}')
		}
	}

	evaluateUnivariatePolynomial { :coefficientList :x |
		let n = coefficientList.size;
		(n = 0L).if {
			0L
		} {
			let answer = coefficientList[n];
			(n - 1L).downToDo(1L) { :i |
				answer := x * answer + coefficientList[i]
			};
			answer
		}
	}

	evaluateUnivariatePolynomialDirectForm { :coefficientList :x |
		let c = coefficientList.reverse;
		let n = coefficientList.size;
		(n = 0L).if {
			0L
		} {
			let answer = c[1L] * (x ^ (n - 1L));
			2L.toDo(n) { :i |
				let m = c[i];
				let j = n - i;
				let t = (j = 0L).if {
					1L
				} {
					(j = 1L).if {
						x
					} {
						x ^ (n - i) }
				};
				let f/2 = (m < 0L).if {
					-
				} {
					+
				};
				(m != 0L).ifTrue {
					answer := f(
						answer,
						(m = 1L).if {
							t
						} {
							(t = 1L).if {
								m.abs
							} {
								m.abs * t
							}
						}
					)
				}
			};
			answer
		}
	}

	lagrangeInterpolatingPolynomial { :c |
		let n = c.size;
		let [x, y] = c.transpose;
		let p = List(n, UnivariatePolynomial([1L]));
		1L.toDo(n) { :i |
			1L.toDo(n) { :j |
				(i = j).ifFalse {
					let q = UnivariatePolynomial([0L - x[j], 1L]);
					p[i] := p[i] * q
				}
			};
			p[i] := p[i] * (1L / p[i].at(x[i]))
		};
		(p * y).sum
	}

	resultant { :p :q |
		p.sylvesterMatrix(q).determinant
	}

}

+Dictionary {

	Polynomial { :self |
		let p = normalInteger/1.keyMap(self);
		p.keyType.caseOf(
			[
				'Float' -> { UnivariatePolynomial(p) },
				'List' -> { BivariatePolynomial(p) }
			]
		) {
			self.error('Polynomial: invalid coefficient dictionary')
		}
	}

	UnivariatePolynomial { :self |
		let n = self.keys.max;
		let c = 0L.to(n).collect { :i |
			self.atIfAbsent(i) { 0L }
		};
		UnivariatePolynomial(c)
	}

}

+@Integer {

	bellB { :n |
		(n = 0L).if {
			UnivariatePolynomial([1L])
		} {
			1L.to(n).sum { :k |
				let x = UnivariatePolynomial([0L 1L]);
				let c = UnivariatePolynomial([integerBinomial(n - 1L, k - 1L)]);
				x * c * bellB(k - 1L)
			}
		}
	}

	bellB { :n :x |
		bellB(n).at(x)
	}

	cardanosAlgorithm { :a :b :c :d |
		<primitive:
		_a = sl.toFloat(_a);
		_b = sl.toFloat(_b);
		_c = sl.toFloat(_c);
		_d = sl.toFloat(_d);
		/* https://www.mosismath.com/Cardano/Cardano.html */
		function xroot(a, x) {
			const i = (a < 0) ? -1 : 1;
			return (i * Math.exp(Math.log(a * i) / x));
		}
		function splComplex(r, i) {
			return _Complex_2(r, i);
		}
		if (_a === 0) {
			throw new Error("cardanosAlgorithm: a=0");
		}
		const a = _b / _a;
		const b = _c / _a;
		const c = _d / _a;
		const p = -(a * a / 3) + b;
		const q = (2 / 27 * a * a * a) - (a * b / 3) + c;
		const pi = Math.PI;
		let d = q * q / 4 + p * p * p / 27;
		if (Math.abs(d) < Math.pow(10, -11)) {
			d = 0;
		}
		if (d > 1e-20) {
			const u = xroot(-q / 2 + Math.sqrt(d), 3);
			const v = xroot(-q / 2 - Math.sqrt(d), 3);
			const x1 = u + v - a / 3;
			const x2r = -(u + v) / 2 - a / 3;
			const x2i = Math.sqrt(3) / 2 * (u - v);
			const x3r = x2r;
			const x3i = -x2i;
			return [x1, splComplex(x2r, x2i), splComplex(x3r, x3i)];
		}
		if (Math.abs(d) <= 1e-20) {
			const u = xroot(-q / 2, 3);
			const v = xroot(-q / 2, 3);
			const x1 = u + v - a / 3;
			const x2 = -(u + v) / 2 - a / 3;
			return [x1, x2];
		}
		if (d < -1e-20) {
			const r = Math.sqrt(-p * p * p / 27);
			let alpha = Math.atan(Math.sqrt(-d) / -q * 2);
			if (q > 0) {
				alpha = pi + alpha;
			}
			const x1 = xroot(r, 3) * (Math.cos((6 * pi - alpha) / 3) + Math.cos(alpha / 3)) - a / 3;
			const x2 = xroot(r, 3) * (Math.cos((2 * pi + alpha) / 3) + Math.cos((4 * pi - alpha) / 3)) - a / 3;
			const x3 = xroot(r, 3) * (Math.cos((4 * pi + alpha) / 3) + Math.cos((2 * pi - alpha) / 3)) - a / 3;
			return [x1, x2, x3];
		}
		>
	}

	chebyshevPolynomial { :self :kind |
		self.caseOf(
			[
				0L -> { UnivariatePolynomial([1L]) },
				1L -> { UnivariatePolynomial([0L kind]) }
			]
		) {
			let n = self - 1L;
			let a = UnivariatePolynomial([0L 2L]);
			let b = chebyshevPolynomial(n, kind);
			let c = chebyshevPolynomial(n - 1L, kind);
			(a * b) - c
		}
	}

	chebyshevT { :self |
		self.chebyshevPolynomial(1L)
	}

	chebyshevT { :n :x |
		n.chebyshevT.at(x)
	}

	chebyshevU { :self |
		self.chebyshevPolynomial(2L)
	}

	quadraticEquationRoots { :a :b :c |
		let d = sqrt((b ^ 2L) - (4L * a * c));
		(0L < b).if {
			[
				(2L * c) / (0L - b - d),
				(0L - b - d) / (2L * a)
			]
		} {
			[
				(0L - b + d) / (2L * a),
				(2L * c) / (0L - b + d)
			]
		}
	}

}

+List {

	Polynomial { :self |
		self.isVector.if {
			UnivariatePolynomial(self)
		} {
			self.isMatrix.if {
				BivariatePolynomial(self)
			} {
				self.error('Polynomial: not vector or matrix')
			}
		}
	}

	polynomialGcd { :self :operand |
		UnivariatePolynomial(self).gcd(
			UnivariatePolynomial(operand)
		).coefficientList
	}

	polynomialMod { :self :operand |
		UnivariatePolynomial(self).mod(
			operand
		).coefficientList
	}

	polynomialQuotient { :self :operand |
		UnivariatePolynomial(self).quotient(
			UnivariatePolynomial(operand)
		).coefficientList
	}

	polynomialQuotientRemainder { :self :operand |
		UnivariatePolynomial(self).quotientRemainder(
			UnivariatePolynomial(operand)
		).collect(coefficientList/1)
	}

	polynomialRemainder { :self :operand |
		UnivariatePolynomial(self).remainder(
			UnivariatePolynomial(operand)
		).coefficientList
	}

}

+System {

	cachedCyclotomic { :self |
		self.cached('cyclotomic') {
			Dictionary(
				[1L -> UnivariatePolynomial([-1L 1L])]
			)
		}
	}

}

+Integer {

	cyclotomic { :self |
		let c = system.cachedCyclotomic;
		c.includesKey(self).if {
			c.at(self)
		} {
			let p = (self = 0L).if {
				UnivariatePolynomial([1L])
			} {
				self.isPrime.if {
					UnivariatePolynomial(
						List(self, 1L)
					)
				} {
					let p = UnivariatePolynomial(
						[-1L] ++ List(self - 1L, 0L) ++ [1L]
					);
					self.divisors.allButLast.do { :d |
						p := p.quotient(
							d.cyclotomic
						)
					};
					p
				}
			};
			c.add!(self -> p);
			p
		}
	}

	legendreP { :self |
		self.caseOf(
			[
				0L -> { UnivariatePolynomial([1L]) },
				1L -> { UnivariatePolynomial([0L 1L]) }
			]
		) {
			let n = self - 1L;
			let a = UnivariatePolynomial([0L, (2L * n) + 1L]);
			let b = legendreP(n);
			let c = legendreP(n - 1L);
			let d = 1L / (n + 1L);
			((a * b) - (c * n)) * d
		}
	}

	lucasPolynomial { :n |
		(n = 0L).if {
			Polynomial([2L])
		} {
			(n = 1L).if {
				Polynomial([0L 1L])
			} {
				let a = lucasPolynomial(n - 1L);
				let b = lucasPolynomial(n - 2L);
				(a * Polynomial([0L 1L])) + b
			}
		}
	}

}
