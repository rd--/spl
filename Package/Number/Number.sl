@Number {

	+ { :self |
		self.conjugated
	}

	* { :self |
		self.sign
	}

	- { :self |
		self.negated
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
			self.negated
		} {
			self
		}
	}

	absArg { :self |
		self.j(0).absArg
	}

	absSquared { :self |
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
		self.truncated
	}

	asNumber { :self |
		self
	}

	asStringWithCommas { :self |
		<primitive: return _self.toLocaleString('en-US');>
	}

	atRandom { :self :shape |
		self.atRandom(shape, system)
	}

	atRandom { :self |
		self.atRandom([], system)
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

	boltzmannConstant { :self |
		self * 1.380649E-23
	}

	brunsConstant { :self |
		1.90216058 * self
	}

	ceiling { :self |
		let truncation = self.truncated;
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
			aNumber.abs.negated
		} {
			aNumber.abs
		}
	}

	coth { :self |
		self.cosh / self.sinh
	}

	cubed { :self |
		self * self * self
	}

	decrement { :self |
		self - 1
	}

	degree { :self |
		self * 0.017453292519943295
	}

	degreeCos { :self |
		(90 - (180 + self % 360 - 180).abs).degreesToRadians.sin
	}

	degreeSin { :self |
		(90 - self).degreeCos
	}

	degreesToRadians { :self |
		self * 0.01745329251994329547 /* 1/180.pi */
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
			(n.divisors ^ k).sum
		} {
			n.adaptToNumberAndApply(k, divisorSigma:/2)
		}
	}

	downToDo { :self :anInteger :aBlock:/1 |
		Range(self, anInteger, -1).do(aBlock:/1)
	}

	e { :self |
		self * 2.71828182845904523536028747135266249775724709369995
	}

	e { :self :aNumber |
		self * (10 ^ aNumber)
	}

	epsilon { :self |
		self * 0.000000000000001
	}

	erfAbramowitzStegun { :x |
		(x >= 0).if {
			let p = 0.47047;
			let t = 1 / (1 + (p * x));
			let a1 = 0.3480242 * t;
			let a2 = -0.0958798 * t * t;
			let a3 = 0.7478556 * t * t * t;
			1 - ((a1 + a2 + a3) * x.squared.negated.exp)
		} {
			x.negated.erf.negated
		}
	}

	erf { :x |
		(x >= 0).if {
			let p = 0.3275911;
			let t = 1 / (1 + (p * x));
			let a1 = 0.254829592 * t;
			let a2 = -0.284496736 * t * t;
			let a3 = 1.421413741 * t * t * t;
			let a4 = -1.453152027 * t * t * t * t;
			let a5 = 1.061405429 * t * t * t * t * t;
			1 - ((a1 + a2 + a3 + a4 + a5) * x.squared.negated.exp)
		} {
			x.negated.erf.negated
		}
	}

	erfc { :x |
		1 - x.erf
	}

	euclideanDistance { :self :aNumber |
		(aNumber - self).abs
	}

	eulerGamma { :self |
		self * 0.577215664901532860606512090082402431042
	}

	factorialOrGamma { :self |
		self.isNonNegativeInteger.if {
			self.factorial
		} {
			(1 + self).gamma
		}
	}

	factorialPower { :self :anInteger |
		(self - 0.to(anInteger - 1)).product
	}

	floor { :self |
		let truncation = self.truncated;
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

	foldBetweenAnd { :self :low :high |
		let range = high - low;
		let twiceRange = range + range;
		let z = (self - low) % twiceRange;
		(z > range).ifTrue {
			z := twiceRange - z
		};
		low + z
	}

	fractionPart { :self |
		self - self.integerPart
	}

	goldenAngle { :self |
		self.pi * (3 - 5.sqrt)
	}

	goldenRatio { :self |
		let phi = (5.sqrt + 1) / 2;
		self * phi
	}

	halved { :self |
		self / 2
	}

	haversine { :self |
		0.5 * (1 - self.cos)
	}

	imaginary { :self |
		self.zero
	}

	increment { :self |
		self + 1
	}

	inf { :self |
		self * Infinity
	}

	integerPart { :self |
		self.truncated
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
				let y = ((1 - z) / 2).log.negated.sqrt;
				r := ((c[4] * y + c[3]) * y + c[2]) * y + c[1];
				r := r / ((d[3] * y + d[2]) * y + d[1])
			};
			r := r * x.sign;
			z := z * x.sign;
			r := r - ((r.erf - z) / (2 / 1.pi.sqrt * (r.negated * r).exp));
			r := r - ((r.erf - z) / (2 / 1.pi.sqrt * (r.negated * r).exp));
			r
		}
	}

	inverseErfc { :self |
		(self / 2).standardNormalDistributionInverseCdf.- / 2.sqrt
	}

	inverseErfWinitzki { :x |
		let a = 0.147;
		let b = (2 / a.pi);
		let c = (1 - x.squared).log;
		(((b + (c / 2)).squared - (c / a)).sqrt - (b + (c / 2))).sqrt * x.sign
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

	isNumber { :self |
		true
	}

	isPositive { :self |
		self > self.zero
	}

	isOne { :self |
		self = 1
	}

	isZero { :self |
		self = 0
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

	logarithmicPhi { :self |
		self * (2 ^ 1.goldenRatio)
	}

	logScale { :self |
		self.isZero.if {
			0
		} {
			let x = self.asFloat;
			x.sign * x.abs.log
		}
	}

	logisticSigmoid { :z |
		1 / (1 + z.-.exp)
	}

	metallicMean { :n |
		(n + (n.squared + 4).sqrt) / 2
	}

	minkowskiDistance { :p :u :v |
		((u - v).abs ^ p).sum ^ (1 / p)
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

	negated { :self |
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
			l[l.bisect(n, <=)]
		}
	}

	niceNumberBy { :self :aBlock:/2 |
		let n = self;
		let m = 10 ^ n.abs.log10.floor.negated;
		let steps = [1 1.5 2 2.5 5 7.5 10];
		let z = steps.aBlock(n * m);
		z / m
	}

	niceNumberNear { :self |
		self.niceNumberBy { :l :n |
			l.nearest(n, -).first
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

	perrinFunction { :n |
		let rho = 1.plasticRatio;
		let theta = ((rho ^ 3).sqrt.- / 2).arcCos;
		(rho ^ n) + (2 * (n * theta).cos * (rho ^ n.-).sqrt)
	}

	pi { :self |
		self * 3.1415926535897932384626433
	}

	planckConstant { :self |
		self * 6.62607015E-34
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
		((2 * h * nu.cubed) / (c.squared)) * (1 / (((h * nu) / (k * t)).exp - 1))
	}

	planckRadiationLawWavelength { :lambda :t |
		let c = 1.speedOfLight;
		let h = 1.planckConstant;
		let k = 1.boltzmannConstant;
		((2 * h * c.squared) / (lambda ^ 5)) * (1 / (((h * c) / (lambda * k * t)).exp - 1))
	}

	planckRadiationLaw { :nuOrLambda :t |
		(nuOrLambda > 1).if {
			nuOrLambda.planckRadiationLawFrequency(t)
		} {
			nuOrLambda.planckRadiationLawWavelength(t)
		}
	}

	plasticRatio { :self |
		self * 1.3247179572447460259609089
	}

	powerMod { :self :exponent :modulo |
		(exponent > 0).if {
			(self ^ exponent) % modulo
		} {
			'Number>>powerMod: not implemented for negative exponents'
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
			self.rounded.printString
		} {
			let rounder = 10 ^ placesDesired;
			let rounded = self.roundTo(rounder.reciprocal);
			let prefix = rounded.isNegative.if { '-' } { '' };
			let roundedFractionPart = (rounded.abs.fractionPart * rounder).rounded; /* truncated? */
			[
				prefix,
				rounded.abs.integerPart.truncated.printString,
				'.',
				roundedFractionPart.printString.padLeft([placesDesired], '0')
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
		self.quotientBy(aNumber, truncated:/1)
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
			result := result.squared;
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
					self.raisedToInteger(operand.negated).reciprocal
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
		self.remainderBy(aNumber, truncated:/1)
	}

	rescale { :self :min :max |
		(self - min) / (max - min)
	}

	rescale { :self :min :max :ymin :ymax |
		((self - min) / (max - min)) * (ymax - ymin) + ymin
	}

	roundDown { :self |
		self.roundDownTo(1)
	}

	roundDownTo { :self :aNumber |
		(self / aNumber).floor * aNumber
	}

	rounded { :self |
		(self + (self.sign / 2)).truncated
	}

	roundToTowardsZero { :self :aNumber |
		(self < 0).if {
			self.roundUpTo(aNumber)
		} {
			self.roundDownTo(aNumber)
		}
	}

	roundTo { :self :quantum |
		(self / quantum).rounded * quantum
	}

	roundToPrecision { :self :precision |
		let scalar = 10 ^ precision;
		(self * scalar).rounded / scalar
	}

	roundTowardsZero { :self |
		self.roundToTowardsZero(1)
	}

	roundUp { :self |
		self.roundUpTo(1)
	}

	roundUpTo { :self :aNumber |
		(self / aNumber).ceiling * aNumber
	}

	sign { :self |
		(self > 0).if {
			self.unit
		} {
			(self < 0).if {
				self.unit.negated
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

	silverConstant { :self |
		self * (2 + (2 * (2 / 7).pi.cos))
	}

	silverRatio { :self |
		self * (2.sqrt + 1)
	}

	smallFloatEpsilon { :self |
		self * system.smallFloatEpsilon
	}

	smallFloatMax { :self |
		self * system.smallFloatMax
	}

	speedOfLight { :self |
		self * 299792458
	}

	squared { :self |
		self * self
	}

	stolarskyHarborthConstant { :self |
		self * 0.81255655901600638769
	}

	stope { :x :p :y |
		(x + (p * (1:y - 1))).reduce(*)
	}

	strictlyPositive { :self |
		self > 0
	}

	supergoldenRatio { :self |
		self * 1.465571231876768
	}

	supersilverRatio { :self |
		self * 2.2055694304005903
	}

	symmetricPower { :self :aNumber |
		self.isNegative.if {
			(self.negated ^ aNumber).negated
		} {
			self ^ aNumber
		}
	}

	toByDo { :self :stop :step :aBlock:/1 |
		(step = 0).if {
			'@Number>>toByDo: step must be non-zero'.error
		} {
			let nextValue = self;
			(step < 0).if{
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

	unitVector { :n :k |
		let answer = List(n, 0);
		answer[k] := 1;
		answer
	}

	upOrDownToDo { :self :end :aBlock:/1 |
		let step = (end < self).if { -1 } { 1 };
		self.toByDo(end, step, aBlock:/1)
	}

	wrapBetweenAnd { :self :low :high |
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

}
