@Number {

	+ { :self |
		self.conjugate
	}

	* { :self |
		self.sign
	}

	- { :self |
		self.negate
	}

	/ { :self |
		self.reciprocal
	}

	^ { :self |
		1.e ^ self
	}

	! { :self |
		self.factorialOrGamma
	}

	// { :self :aNumber |
		self.quotient(aNumber)
	}

	\\ { :self :aNumber |
		self.remainder(aNumber)
	}

	% { :self :aNumber |
		self - (self // aNumber * aNumber)
	}

	\ { :self :aNumber |
		self.Fraction(aNumber)
	}

	~ { :self :aNumber |
		self.isCloseTo(aNumber)
	}

	!~ { :self :aNumber |
		self.isCloseTo(aNumber).not
	}

	<~ { :self :aNumber |
		self < aNumber | {
			self.isCloseTo(aNumber)
		}
	}

	>~ { :self :aNumber |
		self > aNumber | {
			self.isCloseTo(aNumber)
		}
	}

	*+ { :self :mul :add |
		self * mul + add
	}

	abs { :self |
		self.isNegative.if {
			self.negate
		} {
			self
		}
	}

	absArg { :self |
		self.j(0).absArg
	}

	absSquare { :self |
		let abs = self.abs;
		abs * abs
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :each |
			aBlock(each, self)
		}
	}

	arcMinute { :self |
		self * 0.0002908882086657216
	}

	arcSecond { :self |
		self * 0.00000484813681109536
	}

	angleVector { :self |
		[self.cos, self.sin]
	}

	arg { :self |
		self.isZero.if {
			0
		} {
			self.j(0).arg
		}
	}

	arithmeticGeometricMean { :self :aNumber |
		let a = self;
		let b = aNumber;
		{
			a.isVeryCloseTo(b)
		}.whileFalse {
			[a, b] := [0.5 * (a + b), (a * b).sqrt]
		};
		a
	}

	asInteger { :self |
		self.truncate
	}

	asNumber { :self |
		self
	}

	asStringWithCommas { :self |
		<primitive: return _self.toLocaleString('en-US');>
	}

	barronCurve { :s :t |
		let epsilon = 1.smallFloatEpsilon;
		{ :x |
			(x < t).if {
				(t * x) / (x + (s * (t - x)) + epsilon)
			} {
				((1 - t) * (x - 1)) / (1 - x - (s * (t - x)) + epsilon) + 1
			}
		}
	}

	basicPlus { :self :aNumber |
		aNumber.isNumber.if {
			self + aNumber
		} {
			('Number>>basicPlus: operand not a number' ++ aNumber).error
		}
	}

	basicTimes { :self :aNumber |
		aNumber.isNumber.if {
			self * aNumber
		} {
			('Number>>basicTimes: operand not a number: ' ++ aNumber).error
		}
	}

	ceiling { :self |
		let truncation = self.truncate;
		(self <= 0).if {
			truncation
		} {
			(self = truncation).if {
				truncation
			} {
				truncation + 1
			}
		}
	}

	clamp { :self :low :high |
		low.max(self.min(high))
	}

	concisePrintString { :self |
		self.printString
	}

	continuedFraction { :self :limit |
		let answer = [];
		let i = self.floor;
		let f = self - i;
		{
			(limit > 1) & {
				f.isVeryCloseTo(0).not
			}
		}.whileTrue {
			answer.add(i);
			f := 1 / f;
			i := f.floor;
			f := f - i;
			limit := limit - 1
		};
		answer.add(i);
		answer
	}

	continuedFraction { :self |
		self.continuedFraction(24)
	}

	copySignTo { :self :aNumber |
		self.signBit.if {
			aNumber.abs.negate
		} {
			aNumber.abs
		}
	}

	cube { :self |
		self * self * self
	}

	decrement { :self |
		self - 1
	}

	degreesToRadians { :self |
		self * 0.01745329251994329547 /* 1/180.pi */
	}

	diracComb { :x :z |
		x.isInteger.if {
			z
		} {
			0
		}
	}

	diracComb { :x |
		x.diracComb(Infinity)
	}

	diracDelta { :self :aNumber |
		self.isZero.if {
			aNumber
		} {
			0
		}
	}

	diracDelta { :self |
		self.diracDelta(Infinity)
	}

	divisible { :self :aNumber |
		aNumber.isNumber.if {
			(self % aNumber).isVeryCloseTo(0)
		} {
			aNumber.adaptToNumberAndApply(self, divisible:/2)
		}
	}

	divisorSigma { :k :n |
		n.isNumber.if {
			(k = 0).if {
				(n.factorInteger.values + 1).product
			} {
				(n.divisors ^ k).sum
			}
		} {
			n.adaptToNumberAndApply(k, divisorSigma:/2)
		}
	}

	downToDo { :self :anInteger :aBlock:/1 |
		Range(self, anInteger, -1).do(aBlock:/1)
	}

	double { :self |
		self * 2
	}

	e { :self :aNumber |
		self * (10 ^ aNumber)
	}

	ellipticK { :m |
		1.pi / (2 * arithmeticGeometricMean(1, (1 - m).sqrt))
	}

	epanechnikovKernel { :u |
		0.75 * (1 - (u * u))
	}

	factorialOrGamma { :self |
		self.isNonNegativeInteger.if {
			self.factorial
		} {
			(1 + self).gamma
		}
	}

	floor { :self |
		let truncation = self.truncate;
		(self >= 0).if {
			truncation
		} {
			(self = truncation).if {
				truncation
			} {
				truncation - 1
			}
		}
	}

	floorLog { :self :radix |
		self.log(radix).floor
	}

	fold { :self :low :high |
		let range = high - low;
		let twiceRange = range + range;
		let z = (self - low) % twiceRange;
		(z > range).ifTrue {
			z := twiceRange - z
		};
		low + z
	}

	fractionalPart { :self |
		self - self.integerPart
	}

	gaussianKernel { :sigma |
		let m = 1 / (2.pi.sqrt * sigma);
		let sigmaSquared = sigma * sigma;
		{ :u |
			m * (u.square / (2 * sigmaSquared)).negate.exp
		}
	}

	gompertzFunction { :a :b :c |
		{ :t |
			a * ((c.negate * t).exp * b.negate).exp
		}
	}

	halve { :self |
		self / 2
	}

	heavisideLambda { :x |
		(x.abs < 1).if {
			(x > 0).if {
				1 - x
			} {
				1 + x
			}
		} {
			0
		}
	}

	heavisidePi { :self |
		(self.abs <= 0.5).boole
	}

	heavisideTheta { :self |
		(self < 0).if {
			0
		} {
			(self > 0).if {
				1
			} {
				0.5
			}
		}
	}

	imaginary { :self |
		self.zero
	}

	increment { :self |
		self + 1
	}

	infinity { :self |
		self * Infinity
	}

	integerPart { :self |
		self.truncate
	}

	inverseErf { :x |
		(x.abs >= 1).if {
			Infinity * x.sign
		} {
			let a = [0.886226899 -1.645349621 0.914624893 -0.140543331];
			let b = [1 -2.118377725 1.442710462 -0.329097515 0.012229801];
			let c = [-1.970840454 -1.62490649 3.429567803 1.641345311];
			let d = [1 3.543889200 1.637067800];
			let z = x.sign * x;
			let r = nil;
			(z <= 0.7).if {
				let x2 = z * z;
				r := z * (((a[4] * x2 + a[3]) * x2 + a[2]) * x2 + a[1]);
				r := r / ((((b[5] * x2 + b[4]) * x2 + b[3]) * x2 + b[2]) * x2 + b[1])
			} {
				let y = ((1 - z) / 2).log.negate.sqrt;
				r := ((c[4] * y + c[3]) * y + c[2]) * y + c[1];
				r := r / ((d[3] * y + d[2]) * y + d[1])
			};
			r := r * x.sign;
			z := z * x.sign;
			r := r - ((r.erf - z) / (2 / 1.pi.sqrt * (r.negate * r).exp));
			r := r - ((r.erf - z) / (2 / 1.pi.sqrt * (r.negate * r).exp));
			r
		}
	}

	inverseErfc { :self |
		(self / 2).standardNormalDistributionInverseCdf.- / 2.sqrt
	}

	inverseErfWinitzki { :x |
		let a = 0.147;
		let b = (2 / a.pi);
		let c = (1 - x.square).log;
		(((b + (c / 2)).square - (c / a)).sqrt - (b + (c / 2))).sqrt * x.sign
	}

	isHalfInteger { :self |
		(self.fractionalPart.abs * 2).isOne
	}

	isNegative { :self |
		self < self.zero
	}

	isNegativeZero { :self |
		false
	}

	isNonNegative { :self |
		self >= self.zero
	}

	isNonNegativeInteger { :self |
		self.isInteger & {
			self.isNonNegative
		}
	}

	isNonPositive { :self |
		self <= self.zero
	}

	isNonZero { :self |
		self != 0
	}

	isNumber { :self |
		true
	}

	isPositive { :self |
		self > self.zero
	}

	isOne { :self |
		self = 1
	}

	isScalar { :self |
		true
	}

	isZero { :self |
		self = 0
	}

	kroneckerDelta { :self |
		(self = 0).boole
	}

	kroneckerDelta { :self :aNumber |
		(self = aNumber).if {
			1
		} {
			0
		}
	}

	log2 { :self |
		self.asSmallFloat.log2
	}

	logarithmicIntegralRamanujan { :self :limit |
		self.isZero.if {
			0
		} {
			1.eulerGamma + (self.log.abs.log) + 1:limit.collect { :k |
				(self.log ^ k) / (k.factorial * k)
			}.sum
		}
	}

	logarithmicIntegral { :self |
		self.logarithmicIntegralRamanujan(9)
	}

	logScale { :self |
		self.isZero.if {
			0
		} {
			let x = self.asFloat;
			x.sign * x.abs.log
		}
	}

	logisticSigmoid { :l :k :x0 |
		{ :z |
			l / (1 + (k.- * (z - x0)).exp)
		}
	}

	logisticSigmoid { :z |
		1 / (1 + z.-.exp)
	}

	logit { :x |
		(x / (1 - x)).log
	}

	metallicMean { :n |
		(n + (n.square + 4).sqrt) / 2
	}

	mixedFractionParts { :self |
		let i = self.integerPart;
		[i, self - i]
	}

	mod { :m :n |
		m - (n * m.quotient(n))
	}

	mod { :m :n :d |
		m - (n * ((m - d) / n).floor)
	}

	multiplyAdd { :i :j :k |
		(i * j) + k
	}

	negate { :self |
		self * -1
	}

	/*
	niceNumberAbove { :self |
		let exponent = self.log10.floor;
		let fraction = self / (10 ^ exponent);
		let niceFraction = (fraction <= 1).if {
			1
		} {
			(fraction <= 2).if {
				2
			} {
				(fraction <= 5).if {
					5
				} {
					10
				}
			}
		};
		niceFraction * (10 ^ exponent)
	}
	*/

	niceNumberAbove { :self |
		self.niceNumberBy { :l :n |
			l[l.bisect(n)]
		}
	}

	niceNumberBy { :self :aBlock:/2 |
		let n = self;
		let m = 10 ^ n.abs.log10.floor.negate;
		let steps = [1 1.5 2 2.5 5 7.5 10];
		let z = steps.aBlock(n * m);
		z / m
	}

	niceNumberNear { :self |
		self.niceNumberBy { :l :n |
			l.nearest(n).first
		}
	}

	numberDecompose { :self :u |
		(self < 0).if {
			self.-.numberDecompose(u).-
		} {
			let answer = [];
			let x = self;
			let k = u.size;
			u.withIndexDo { :each :index |
				(index = k).if {
					answer.add(x / each)
				} {
					let n = (x / each).floor;
					x := x - (n * each);
					answer.add(n)
				}
			};
			answer
		}
	}

	perlinBiasFunction { :b :x |
		b.perlinBiasFunction.value(x)
	}

	perlinBiasFunction { :b |
		let p = b.log / 0.5.log;
		{ :x |
			x ^ p
		}
	}

	perlinGainFunction { :g :x |
		g.perlinGainFunction.value(x)
	}

	perlinGainFunction { :g |
		let p = (1 / (1 - g)) - 2;
		{ :x |
			let q = 1 - (2 * x);
			(x < 0.5).if {
				x / ((p * q) + 1)
			} {
				1 - ((2 - (2 * x)) / (2 * ((p * q.-) + 1)))
			}
		}
	}

	perrinFunction { :n |
		let rho = 1.plasticRatio;
		let theta = ((rho ^ 3).sqrt.- / 2).arcCos;
		(rho ^ n) + (2 * (n * theta).cos * (rho ^ n.-).sqrt)
	}

	plancksRadiationFunction { :x |
		(x <= 0).if {
			0
		} {
			(15 / (1.pi ^ 4)) * (1 / ((x ^ 5) * ((1.e ^ (1 / x)) - 1)))
		}
	}

	planckRadiationLawFrequency { :nu :t |
		let c = 1.speedOfLight;
		let h = 1.planckConstant;
		let k = 1.boltzmannConstant;
		((2 * h * nu.cube) / (c.square)) * (1 / (((h * nu) / (k * t)).exp - 1))
	}

	planckRadiationLawWavelength { :lambda :t |
		let c = 1.speedOfLight;
		let h = 1.planckConstant;
		let k = 1.boltzmannConstant;
		((2 * h * c.square) / (lambda ^ 5)) * (1 / (((h * c) / (lambda * k * t)).exp - 1))
	}

	planckRadiationLaw { :nuOrLambda :t |
		(nuOrLambda > 1).if {
			nuOrLambda.planckRadiationLawFrequency(t)
		} {
			nuOrLambda.planckRadiationLawWavelength(t)
		}
	}

	powerMod { :base :exponent :modulo |
		(exponent > 0).if {
			(modulo = 1).if {
				0
			} {
				let r = 1;
				let b = base % modulo;
				let e = exponent;
				let m = modulo;
				{ e > 0 }.whileTrue {
					((e % 2) = 1).ifTrue {
						r := (r * b) % m
					};
					b := (b * b) % m;
					e := (e / 2).floor
				};
				r
			}
		} {
			(base ^ exponent.abs).modularInverse(modulo)
		}
	}

	powerRange { :a :b :r |
		let answer = [];
		let next = a;
		{
			(r > 1).if {
				next.abs <= b.abs
			} {
				next.abs >= b.abs
			}
		}.whileTrue {
			answer.add(next);
			next := next * r
		};
		answer
	}

	printStringShowingDecimalPlaces { :self :placesDesired |
		(placesDesired <= 0).if {
			self.round.printString
		} {
			let rounder = 10 ^ placesDesired;
			let round = self.roundTo(rounder.reciprocal);
			let prefix = round.isNegative.if { '-' } { '' };
			let roundFractionPart = (round.abs.fractionalPart * rounder).round; /* truncate? */
			[
				prefix,
				round.abs.integerPart.truncate.printString,
				'.',
				roundFractionPart.printString.padLeft([placesDesired], '0')
			].stringCatenate
		}
	}

	quotientBy { :self :aNumber :aBlock:/1 |
		(aNumber = 0).if {
			'@Number>>quotient: divideByZero'.error
		} {
			aBlock(self / aNumber)
		}
	}

	quotient { :self :aNumber |
		self.quotientBy(aNumber, truncate:/1)
	}

	quotientRemainder { :self :aNumber |
		[
			self.quotient(aNumber),
			self.remainder(aNumber)
		]
	}

	radiansToDegrees { :self |
		self * 57.29577951308232286465 /* 1/180.pi */
	}

	raisedToSmallInteger { :self :operand |
		let count = 1.bitShift((operand - 1).highBit);
		let result = self.one;
		{
			count > 0
		}.whileTrue {
			result := result.square;
			(operand.bitAnd(count) = 0).ifFalse {
				result := result * self
			};
			count := count.bitShift(-1)
		};
		result
	}

	raisedToInteger { :self :operand |
		operand.isInteger.ifFalse {
			'Numnber>>raisedToInteger: operand is not an Integer'.error
		};
		(operand = 0).if {
			self.one
		} {
			(operand = 1).if {
				self
			} {
				(operand < 0).if {
					self.raisedToInteger(operand.negate).reciprocal
				} {
					operand.isLargeInteger.if {
						self.asLargeInteger ^ operand
					} {
						self.raisedToSmallInteger(operand)
					}
				}
			}
		}
	}

	ramp { :self |
		let zero = self.zero;
		(self >= zero).if {
			self
		} {
			zero
		}
	}

	real { :self |
		self
	}

	realImaginary { :self |
		[self, self.zero]
	}

	reciprocal { :self |
		self.one / self
	}

	remainderBy { :self :aNumber :aBlock:/1 |
		self - (self.quotientBy(aNumber, aBlock:/1) * aNumber)
	}

	remainder { :self :aNumber |
		self.remainderBy(aNumber, truncate:/1)
	}

	rescale { :self :a |
		let [min, max] = a;
		(self - min) / (max - min)
	}

	rescale { :self :a :b |
		let [min, max] = a;
		let [yMin, yMax] = b;
		((self - min) / (max - min)) * (yMax - yMin) + yMin
	}

	richardsCurve { :a :k :b :nu :q :c |
		{ :t |
			a + ((k - a) / ((c + (q * (0 - (b * t)).exp)) ^ (1 / nu)))
		}
	}

	roundDown { :self |
		self.roundDownTo(1)
	}

	roundDownTo { :self :aNumber |
		(self / aNumber).floor * aNumber
	}

	round { :self |
		(self + (self.sign / 2)).truncate
	}

	roundTowardsZeroTo { :self :aNumber |
		(self < 0).if {
			self.roundUpTo(aNumber)
		} {
			self.roundDownTo(aNumber)
		}
	}

	roundTo { :self :quantum |
		(self / quantum).round * quantum
	}

	roundToPrecision { :self :precision |
		let scalar = 10 ^ precision;
		(self * scalar).round / scalar
	}

	roundTowardsZero { :self |
		self.roundTowardsZeroTo(1)
	}

	roundUp { :self |
		self.roundUpTo(1)
	}

	roundUpTo { :self :aNumber |
		(self / aNumber).ceiling * aNumber
	}

	schlickBiasFunction { :b :x |
		b.schlickBiasFunction.value(x)
	}

	schlickBiasFunction { :b |
		let p = (1 / b) - 2;
		{ :x |
			x / ((p * (1 - x)) + 1)
		}
	}

	schlickGainFunction { :g :x |
		g.schlickGainFunction.value(x)
	}

	schlickGainFunction { :g |
		let p = (1 / g) - 2;
		{ :x |
			let q = 1 - (2 * x);
			(x < 0.5).if {
				x / ((p * q) + 1)
			} {
				((p * q) - x) / ((p * q) - 1)
			}
		}
	}

	sign { :self |
		(self > 0).if {
			self.unit
		} {
			(self < 0).if {
				self.unit.negate
			} {
				self.zero
			}
		}
	}

	sign { :self :aNumber |
		aNumber.copySignTo(self)
	}

	signBit { :self |
		self.isNegativeZero | {
			self < 0
		}
	}

	smallFloatEpsilon { :self |
		self * system.smallFloatEpsilon
	}

	smallFloatMax { :self |
		self * system.smallFloatMax
	}

	softPlus { :x |
		(1 + x.exp).log
	}

	softSign { :x |
		x / (1 + x.abs)
	}

	square { :self |
		self * self
	}

	stope { :x :p :y |
		(x + (p * (1:y - 1))).reduce(*)
	}

	strictlyPositive { :self |
		self > 0
	}


	succeeds { :self :operand |
		operand.isNumber.if {
			self > operand
		} {
			self.error('succeeds: invalid operand')
		}
	}

	succeedsOrEqualTo { :self :operand |
		operand.isNumber.if {
			self >= operand
		} {
			self.error('succeedsOrEqualTo: invalid operand')
		}
	}

	swishFunction { :beta |
		{ :x |
			x / (1 + (beta.negate * x).exp)
		}
	}

	symmetricPower { :self :aNumber |
		self.isNegative.if {
			(self.negate ^ aNumber).negate
		} {
			self ^ aNumber
		}
	}

	toByDo { :self :stop :step :aBlock:/1 |
		(step = 0).if {
			'@Number>>toByDo: step must be non-zero'.error
		} {
			let nextValue = self;
			(step < 0).if {
				{
					stop <= nextValue
				}.whileTrue {
					aBlock(nextValue);
					nextValue := nextValue + step
				}
			} {
				{
					stop >= nextValue
				}.whileTrue {
					aBlock(nextValue);
					nextValue := nextValue + step
				}
			}
		};
		self
	}

	toDo { :self :end :aBlock:/1 |
		let index = self;
		{
			index <= end
		}.whileTrue {
			aBlock(index);
			index := index + 1
		};
		self
	}

	truncateTo { :self :aNumber |
		self.quotient(aNumber) * aNumber
	}

	twice { :self |
		self * 2
	}

	unit { :self |
		1
	}

	unitBox { :self |
		(self.abs <= 0.5).boole
	}

	unitize { :self :dx |
		(self.abs < dx).if {
			self.zero
		} {
			self.one
		}
	}

	unitize { :self |
		self.isZero.if {
			self.zero
		} {
			self.one
		}
	}

	unitStep { :self |
		(self > 0).boole
	}

	unitTriangle { :self |
		self.betweenAnd(-1, 0).if {
			self + 1
		} {
			self.betweenAnd(0, 1).if {
				1 - self
			} {
				0
			}
		}
	}

	unitVector { :n :k |
		let answer = List(n, 0);
		answer[k] := 1;
		answer
	}

	upOrDownToDo { :self :end :aBlock:/1 |
		let step = (end < self).if { -1 } { 1 };
		self.toByDo(end, step, aBlock:/1)
	}

	wrap { :self :low :high |
		let range = high - low;
		{ self < low }.whileTrue { self := self + range };
		{ self > high }.whileTrue { self := self - range };
		self
	}

	wrapExclusive { :self :low :high |
		let range = high - low;
		let z = (self - low) % range;
		low + z
	}

	zero { :self |
		0
	}

}

+@Object {

	isNumber { :self |
		false
	}

}

+List {

	unitBox { :self |
		self.collect(unitBox:/1).product
	}

	unitStep { :self |
		self.collect(unitStep:/1).product
	}

	unitTriangle { :self |
		self.collect(unitTriangle:/1).product
	}

}

+@Number {

	aperysConstant { :self |
		self * 1.2020569031595942853997381
	}

	avogadroConstant { :self |
		self * 6.02214076E+23
	}

	berahaConstant { :n |
		2 + (2 * (2.pi / n).cos)
	}

	boltzmannConstant { :self |
		self * 1.380649E-23
	}

	brunsConstant { :self |
		1.90216058 * self
	}

	catalansConstant { :self |
		self * 0.9159655941772190150
	}

	champernowneNumber { :b |
		(b = 10).if {
			0.1234567891011121314151617181920
		} {
			b.error('champernowneNumber: b≠10')
		}
	}

	conwaysConstant { :self |
		1.303577269034296391257099112152551890730702504659404875755
	}

	degree { :self |
		self * 0.017453292519943295
	}

	e { :self |
		self * 2.71828182845904523536028747135266249775724709369995
	}

	electricConstant  { :self |
		self * 8.8541878188E-12
	}

	elementaryCharge { :self |
		self * 1.602176634E-19
	}

	epsilon { :self |
		self * 0.000000000000001
	}

	eulerGamma { :self |
		self * 0.57721566490153286060651209008240243104215933593992
	}

	feigenbaumConstant { :self |
		self * 4.669201609102990671853203820466201617258
	}

	fibonacciFactorialConstant { :self |
		self * 1.22674201072035324441763023045536165587140969044025
	}

	fineStructureConstant { :self |
		self * 0.0072973525643
	}

	freimansConstant { :self |
		self * 4.527829566160879140882695988070469646929833632769728
	}

	gausssConstant { :self |
		self * 0.83462684167407318628142973
	}

	gelfondsConstant { :self |
		self * 1.pi.exp
	}

	glaisher { :self |
		self * 1.2824271291006226368753425688697917277676889
	}

	goldenAngle { :self |
		self.pi * (3 - 5.sqrt)
	}

	goldenRatio { :self |
		let phi = (5.sqrt + 1) / 2;
		self * phi
	}

	gompertzConstant { :self |
		self * 0.596347362323194074341078499369
	}

	hlawkasSchneckenkonstante { :self |
		self * -2.15778299665944622092914278682957772350
	}

	keplerBouwkampConstant { :self |
		self * 0.114942044853296200701040157469598742831
	}

	khinchinsConstant { :self |
		self * 2.685452001065306445309714835
	}

	komornikLoretiConstant { :self |
		1.7872316501829659330132748903370084
	}

	landauConstant { :self |
		self * 0.543258965342976706952728295
	}

	landauRamanujanConstant { :self |
		self * 0.764223653589220662990698731
	}

	lemniscateConstant { :self |
		self * 2.62205755429211981046483959
	}

	levysConstant { :self |
		self * 3.27582291872181115978768188
	}

	logarithmicPhi { :self |
		self * (2 ^ 1.goldenRatio)
	}

	magneticConstant { :self |
		self * 1.25663706127E-6
	}

	meisselMertensConstant { :self |
		self * 0.2614972128476427837554268386086958590516
	}

	omegaConstant { :self |
		self * 0.567143290409783872999968662210
	}

	paperFoldingConstant { :self |
		self * 0.8507361882018672603677977
	}

	pi { :self |
		self * 3.1415926535897932384626433
	}

	planckConstant { :self |
		self * 6.62607015E-34
	}

	plasticRatio { :self |
		self * 1.3247179572447460259609089
	}

	prouhetThueMorseConstant { :self |
		self * 0.4124540336401075977833614
	}

	pythagorasConstant { :self |
		self * 1.4142135623730950488
	}

	rabbitConstant { :self |
		self * 0.7098034428612913146417873994445755970125
	}

	reciprocalFibonacciConstant { :self |
		self * 3.359885666243177553172011302918927179689
	}

	reducedPlanckConstant { :self |
		self * 1.054571817E-34
	}

	secondFeigenbaumConstant { :self |
		self * 2.502907875095892822283902873218215786381
	}

	sierpinskiConstant { :self |
		self * 0.822825249678847032995328716261464949475
	}

	silverConstant { :self |
		self * (2 + (2 * (2 / 7).pi.cos))
	}

	silverRatio { :self |
		self * (2.sqrt + 1)
	}

	soldnersConstant { :self |
		self * 1.45136923488338105028396848589202744949303228
	}

	speedOfLight { :self |
		self * 299792458
	}

	stieltjesGamma { :self |
		let k = [
			0.57721566490153286061,
			-0.072815845483676724861,
			-0.0096903631928723184845,
			0.0020538344203033458662,
			0.0023253700654673000575,
			0.00079332381730106270175,
			-0.00023876934543019960987,
			-0.00052728956705775104607,
			-0.00035212335380303950960,
			-0.000034394774418088048178,
			0.00020533281490906479468,
			0.00027018443954390352667,
			0.00016727291210514019335,
			-0.000027463806603760158860,
			-0.00020920926205929994584,
			-0.00028346865532024144664,
			-0.00019969685830896977471,
			0.000026277037109918336699,
			0.00030736840814925282659,
			0.00050360545304735562906,
			0.00046634356151155944940,
			0.00010443776975600011581,
			-0.00054159958220399770166,
			-0.0012439620904082457793,
			-0.0015885112789035615619,
			-0.0010745919527384888247
		];
		k.at(self + 1)
	}

	stolarskyHarborthConstant { :self |
		self * 0.81255655901600638769
	}

	supergoldenRatio { :self |
		self * 1.465571231876768
	}

	supersilverRatio { :self |
		self * 2.2055694304005903
	}

	tribonacciConstant { :n |
		n * 1.83928675521416113255185
	}

	vacuumPermeability { :self |
		self * 1.25663706127E-6
	}

	vacuumPermittivity { :self |
		self * 8.8541878188E-12
	}

}

+List {

	rescaleBlock { :a :b |
		let [min, max] = a;
		let [yMin, yMax] = b;
		{ :x |
			((x - min) / (max - min)) * (yMax - yMin) + yMin
		}
	}

}
