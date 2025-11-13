UnivariatePolynomial : [Object, Storeable, Copyable, Equatable] { | coefficientList |

	+ { :self :operand |
		let c1 = self.coefficientList;
		let c2 = operand.coefficientList;
		let n = c1.size.max(c2.size);
		UnivariatePolynomial(
			c1.padRight([n], 0) + c2.padRight([n], 0)
		)
	}

	- { :self :operand |
		self + operand.negate
	}

	* { :self :operand |
		let a = self.coefficientList;
		operand.isUnivariatePolynomial.if {
			let b = operand.coefficientList;
			let m = a.size;
			let n = b.size;
			let c = List(m + n - 1, 0);
			1.toDo(m) { :i |
				1.toDo(n) { :j |
					c[i + j - 1] := c[i + j - 1] + (a[i] * b[j])
				}
			};
			UnivariatePolynomial(c)
		} {
			UnivariatePolynomial(a * operand)
		}
	}

	^ { :self :operand |
		(operand = 0).if {
			Polynomial([1])
		} {
			let answer = self;
			(operand - 1).timesRepeat {
				answer := answer * self
			};
			answer
		}
	}

	asBlock { :self |
		let c = self.coefficientList;
		{ :x |
			c.evaluateUnivariatePolynomial(x)
		}
	}

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

	degree { :self |
		self.coefficientList.size - 1
	}

	discriminant { :self |
		self.coefficientList.discriminant
	}

	equalBy { :self :operand :aBlock:/2 |
		operand.isUnivariatePolynomial & {
			aBlock(self.coefficientList, operand.coefficientList)
		}
	}

	exponent { :self |
		self.degree
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

	gcd { :self :operand |
		self.euclideanAlgorithm(operand).monicPolynomial
	}

	isNormal { :self |
		self.isSymbolic | {
			let c = self.coefficientList;
			(c.size = 0) | {
				c.last != 0
			}
		}
	}

	isSymbolic { :self |
		self.coefficientList.allSatisfy(isSymbol:/1)
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

	mod { :self :modulus |
		UnivariatePolynomial(
			self.coefficientList % modulus
		)
	}

	monicPolynomial { :self |
		self * self.leadingCoefficient.reciprocal
	}

	negate { :self |
		self * -1
	}

	normalize { :self |
		self.isSymbolic.not.ifTrue {
			let c = self.coefficientList;
			{
				c.size > 0 & {
					c.last = 0
				}
			}.whileTrue {
				c.removeLast
			}
		};
		self
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

	quotient { :numerator :denominator |
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
			let temporary = UnivariatePolynomial(Map([[exponent, coefficient]]));
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

	terms { :self |
		let answer = Map();
		self.coefficientList.withIndexDo { :c :i |
			(c != 0).ifTrue {
				answer.add((i - 1) -> c)
			}
		};
		answer
	}

}

+List {

	discriminant { :self |
		(self.size - 1).caseOf([
			1 -> { 1 },
			2 -> {
				let [c, b, a] = self;
				b.square - (4 * a * c)
			},
			3 -> {
				let [d, c, b, a] = self;
				(b.square * c.square)
				- (4 * a * c.cube)
				- (4 * b.cube * d)
				- (27 * a.square * d.square)
				+ (18 * a * b * c * d)
			},
			4 -> {
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
					256 * a.cube * e.cube,
					-192 * a.square * b * d * e.square,
					-128 * a.square * c.square * e.square,
					144 * a.square * c * d.square * e,
					-27 * a.square * (d ^ 4),
					144 * a * b.square * c * e.square,
					-6 * a * b.square * d.square * e,
					-80 * a * b * c.square * d * e,
					18 * a * b * c * d.cube,
					16 * a * (c ^ 4) * e,
					-4 * a * c.cube * d.square,
					-27 * (b ^ 4) * e.square,
					18 * b.cube * c * d * e,
					-4 * b.cube * d.cube,
					-4 * b.square * c.cube * e,
					1 * b.square * c.square * d.square
				].sum
			}
		]) {
			self.error('discriminant: degree≠{1,2,3,4}')
		}
	}

	evaluateUnivariatePolynomial { :coefficientList :x |
		let n = coefficientList.size;
		(n = 0).if {
			0
		} {
			let answer = coefficientList[n];
			(n - 1).downToDo(1) { :i |
				answer := x * answer + coefficientList[i]
			};
			answer
		}
	}

	evaluateUnivariatePolynomialDirectForm { :coefficientList :x |
		let c = coefficientList.reverse;
		let n = coefficientList.size;
		(n = 0).if {
			0
		} {
			let answer = c[1] * (x ^ (n - 1));
			2.toDo(n) { :i |
				let m = c[i];
				let j = n - i;
				let t = (j = 0).if { 1 } { (j = 1).if { x } { x ^ (n - i) } };
				let f:/2 = (m < 0).if { - } { + };
				(m != 0).ifTrue {
					answer := f(answer, (m == 1).if { t } { (t == 1).if { m.abs } { m.abs * t } })
				}
			};
			answer
		}
	}

	lagrangeInterpolatingPolynomial { :c |
		let n = c.size;
		let [x, y] = c.transpose;
		let p = List(n, UnivariatePolynomial([1]));
		1.toDo(n) { :i |
			1.toDo(n) { :j |
				(i = j).ifFalse {
					let q = UnivariatePolynomial([0 - x[j], 1]);
					p[i] := p[i] * q
				}
			};
			p[i] := p[i] * (1 / p[i].at(x[i]))
		};
		(p * y).sum
	}

	resultant { :p :q |
		p.sylvesterMatrix(q).determinant
	}

	UnivariatePolynomial { :self |
		newUnivariatePolynomial().initializeSlots(self).normalize
	}

}

+Map {

	Polynomial { :self |
		self.keyType.caseOf(
			[
				'SmallFloat' -> { UnivariatePolynomial(self) },
				'List' -> { BivariatePolynomial(self) }
			]
		) {
			self.error('Polynomial: invalid coefficient dictionary')
		}
	}

	UnivariatePolynomial { :self |
		let n = self.keys.max;
		let c = 0:n.collect { :i |
			self.atIfAbsent(i) { 0 }
		};
		UnivariatePolynomial(c)
	}

}

+SmallFloat {

	bellB { :n |
		(n = 0).if {
			UnivariatePolynomial([1])
		} {
			1.to(n).sum { :k |
				let x = UnivariatePolynomial([0 1]);
				let c = UnivariatePolynomial([binomial(n - 1, k - 1)]);
				x * c * bellB(k - 1)
			}
		}
	}

	bellB { :n :x |
		bellB(n).at(x)
	}

	cardanosAlgorithm { :a :b :c :d |
		<primitive:
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
				0 -> { UnivariatePolynomial([1]) },
				1 -> { UnivariatePolynomial([0 kind]) }
			]
		) {
			let n = self - 1;
			let a = UnivariatePolynomial([0 2]);
			let b = chebyshevPolynomial(n, kind);
			let c = chebyshevPolynomial(n - 1, kind);
			(a * b) - c
		}
	}

	chebyshevT { :self |
		self.chebyshevPolynomial(1)
	}

	chebyshevT { :n :x |
		n.chebyshevT.at(x)
	}

	chebyshevU { :self |
		self.chebyshevPolynomial(2)
	}

	quadraticEquationRoots { :a :b :c |
		let d = sqrt((b ^ 2) - (4 * a * c));
		(0 < b).if {
			[
				(2 * c) / (0 - b - d),
				(0 - b - d) / (2 * a)
			]
		} {
			[
				(0 - b + d) / (2 * a),
				(2 * c) / (0 - b + d)
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
		).collect(coefficientList:/1)
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
			[1: UnivariatePolynomial([-1 1])]
		}
	}

}

+@Integer {

	cyclotomic { :self |
		let c = system.cachedCyclotomic;
		c.includesKey(self).if {
			c.at(self)
		} {
			let p = self.isPrime.if {
				UnivariatePolynomial(
					List(self, 1)
				)
			} {
				let p = UnivariatePolynomial([-1] ++ List(self - 1, 0) ++ [1]);
				self.divisors.allButLast.do { :d |
					p := p.quotient(d.cyclotomic)
				};
				p
			};
			c.add(self -> p);
			p
		}
	}

	legendreP { :self |
		self.caseOf(
			[
				0 -> { UnivariatePolynomial([1]) },
				1 -> { UnivariatePolynomial([0 1]) }
			]
		) {
			let n = self - 1;
			let a = UnivariatePolynomial([0, (2 * n) + 1]);
			let b = legendreP(n);
			let c = legendreP(n - 1);
			let d = 1 / (n + 1);
			((a * b) - (c * n)) * d
		}
	}

}
