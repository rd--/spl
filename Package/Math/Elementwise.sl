/* Requires: Collection, Sequenceable */

+@Collection {

	[conjugate, +] { :self |
		self.collect(conjugate:/1)
	}

	[doubleFactorial, !!] { :self |
		self.collect(doubleFactorial:/1)
	}

	[exp, ^] { :self |
		self.collect(exp:/1)
	}

	[factorialOrGamma, !] { :self |
		self.collect(factorialOrGamma:/1)
	}

	[negate, -] { :self |
		self.collect(negate:/1)
	}

	[reciprocal, /] { :self |
		self.collect(reciprocal:/1)
	}

	[sign, *] { :self |
		self.collect(sign:/1)
	}

	abs { :self |
		self.collect(abs:/1)
	}

	absSquare { :self |
		self.collect(absSquare:/1)
	}

	asBit { :self |
		self.collect(asBit:/1)
	}

	asBoolean { :self |
		self.collect(asBoolean:/1)
	}

	asComplex { :self |
		self.collect(asComplex:/1)
	}

	asFloat { :self |
		self.collect(asFloat:/1)
	}

	asFraction { :self |
		self.collect(asFraction:/1)
	}

	asInteger { :self |
		self.collect(asInteger:/1)
	}

	asNumber { :self |
		self.collect(asNumber:/1)
	}

	bellNumber { :self |
		self.collect(bellNumber:/1)
	}

	between { :self :interval |
		self.collect(interval.between)
	}

	betweenAnd { :self :min :max |
		self.collect { :each |
			each.betweenAnd(min, max)
		}
	}

	bitAnd { :self |
		self.reduce(bitAnd:/2)
	}

	bitOr { :self |
		self.reduce(bitOr:/2)
	}

	bitNot { :self |
		self.collect(bitNot:/1)
	}

	boole { :self |
		self.collect(boole:/1)
	}

	catalanNumber { :self |
		self.collect(catalanNumber:/1)
	}

	cantorStaircase { :self |
		self.collect(cantorStaircase:/1)
	}

	ceiling { :self |
		self.collect(ceiling:/1)
	}

	chop { :self |
		self.collect(chop:/1)
	}

	continuedFraction { :self |
		self.collect(continuedFraction:/1)
	}

	cube { :self |
		self.collect(cube:/1)
	}

	degree { :self |
		self.collect(degree:/1)
	}

	decrement { :self |
		self.collect(decrement:/1)
	}

	degreesToRadians { :self |
		self.collect(degreesToRadians:/1)
	}

	denominator { :self |
		self.collect { :each |
			each.denominator.asInteger
		}
	}

	diagonalIndexToCartesianIndex { :self |
		self.collect(diagonalIndexToCartesianIndex:/1)
	}

	digitCount { :self :b :d |
		self.collect { :n |
			digitCount(n, b, d)
		}
	}

	divisors { :self |
		self.collect(divisors:/1)
	}

	double { :self |
		self.collect(double:/1)
	}

	e { :self |
		self.collect(e:/1)
	}

	E { :self :aNumber |
		self * (10 ^ aNumber)
	}

	ellipticE { :self |
		self.collect(ellipticE:/1)
	}

	ellipticK { :self |
		self.collect(ellipticK:/1)
	}

	ellipticPi { :self |
		self.collect(ellipticPi:/1)
	}

	erf { :self |
		self.collect(erf:/1)
	}

	erfc { :self |
		self.collect(erfc:/1)
	}

	eulerPhi { :self |
		self.collect(eulerPhi:/1)
	}

	factorial { :self |
		self.collect(factorial:/1)
	}

	factorInteger { :self |
		self.collect(factorInteger:/1)
	}

	fibonacci { :self |
		self.collect(fibonacci:/1)
	}

	fibonacciNumber { :self |
		self.collect(fibonacciNumber:/1)
	}

	fibonacciWord { :self |
		self.collect(fibonacciWord:/1)
	}

	floor { :self :epsilon |
		self.collect { :each |
			each.floor(epsilon)
		}
	}

	floor { :self |
		self.collect(floor:/1)
	}

	fold { :self :low :high |
		self.collect { :each |
			each.fold(low, high)
		}
	}

	fractionalPart { :self |
		self.collect(fractionalPart:/1)
	}

	fromRomanNumeral { :self |
		self.collect(fromRomanNumeral:/1)
	}

	gamma { :self |
		self.collect(gamma:/1)
	}

	grayDecode { :self |
		self.collect(grayDecode:/1)
	}

	grayEncode { :self |
		self.collect(grayEncode:/1)
	}

	harmonicNumber { :self |
		self.collect(harmonicNumber:/1)
	}

	halve { :self |
		self.collect(halve:/1)
	}

	hexagonalNumber { :self |
		self.collect(hexagonalNumber:/1)
	}

	i { :self |
		self.collect(i:/1)
	}

	imaginary { :self |
		self.collect(imaginary:/1)
	}

	increment { :self |
		self.collect(increment:/1)
	}

	integerDigits { :self :base :count |
		self.collect { :each |
			each.integerDigits(base, count)
		}
	}

	integerDigits { :self |
		self.collect(integerDigits:/1)
	}

	integerLength { :self :radix |
		self.collect { :each |
			each.integerLength(radix)
		}
	}

	integerPart { :self |
		self.collect(integerPart:/1)
	}

	integerReverse { :self :base :length |
		self.collect { :each |
			each.integerReverse(base, length)
		}
	}

	integerReverse { :self |
		self.collect(integerReverse:/1)
	}

	integerSquareRoot { :self |
		self.collect(integerSquareRoot:/1)
	}

	inverseErf { :self |
		self.collect(inverseErf:/1)
	}

	inverseErfc { :self |
		self.collect(inverseErfc:/1)
	}

	isComposite { :self |
		self.collect(isComposite:/1)
	}

	isGaussianPrime { :self |
		self.collect(isGaussianPrime:/1)
	}

	isInteger { :self |
		self.collect(isInteger:/1)
	}

	isNegative { :self |
		self.collect(isNegative:/1)
	}

	isPrime { :self |
		self.collect(isPrime:/1)
	}

	isPrimePower { :self |
		self.collect(isPrimePower:/1)
	}

	isSmallInteger { :self |
		self.collect(isSmallInteger:/1)
	}

	isZero { :self |
		self.collect(isZero:/1)
	}

	jacobiSymbol { :a :n |
		a.collect { :each |
			each.jacobiSymbol(n)
		}
	}

	lcm { :self |
		self.reduce(lcm:/2)
	}

	log { :self |
		self.collect(log:/1)
	}

	log { :self :base |
		let k = 1 / base.log;
		self.log * k
	}

	log10 { :self |
		self.collect(log10:/1)
	}

	log2 { :self |
		self.collect(log2:/1)
	}

	logisticSigmoid { :self |
		self.collect(logisticSigmoid:/1)
	}

	logit { :self |
		self.collect(logit:/1)
	}

	logScale { :self :c |
		self.collect { :each |
			each.logScale(c)
		}
	}

	logScale { :self |
		self.logScale(1 / 10.log)
	}

	lucasNumber { :self |
		self.collect(lucasNumber:/1)
	}

	minkowskiQuestionMark { :self |
		self.collect(minkowskiQuestionMark:/1)
	}

	minkowskiQuestionMarkInverse { :self |
		self.collect(minkowskiQuestionMarkInverse:/1)
	}

	mixedFractionParts { :self |
		self.collect(mixedFractionParts:/1)
	}

	nextPrime { :self |
		self.collect(nextPrime:/1)
	}

	numerator { :self |
		self.collect { :each |
			each.numerator.asInteger
		}
	}

	partitionsP { :self |
		self.collect(partitionsP:/1)
	}

	partitionsQ { :self |
		self.collect(partitionsQ:/1)
	}

	pellNumber { :self |
		self.collect(pellNumber:/1)
	}

	percent { :self |
		self.collect(percent:/1)
	}

	pi { :self |
		self.collect(pi:/1)
	}

	pentagonalNumber { :self |
		self.collect(pentagonalNumber:/1)
	}

	powerMod { :self :exponent :modulo |
		self.collect { :each |
			each.powerMod(exponent, modulo)
		}
	}

	previousPrime { :self |
		self.collect(previousPrime:/1)
	}

	primeFactors { :self |
		self.collect(primeFactors:/1)
	}

	primeLimit { :self |
		self.collect(primeLimit:/1)
	}

	primePi { :self |
		self.collect(primePi:/1)
	}

	radiansToDegrees { :self |
		self.collect(radiansToDegrees:/1)
	}

	ramp { :self |
		self.collect(ramp:/1)
	}

	real { :self |
		self.collect(real:/1)
	}

	realImaginary { :self |
		self.collect(realImaginary:/1)
	}

	replaceNaN { :x :y |
		x.collect { :each |
			each.replaceNaN(y)
		}
	}

	replaceNil { :x :y |
		x.collect { :each |
			each.replaceNil(y)
		}
	}

	riemannXi { :self |
		self.collect(riemannXi:/1)
	}

	romanNumeral { :self |
		self.collect(romanNumeral:/1)
	}

	round { :self |
		self.collect(round:/1)
	}

	roundTiesEven { :self |
		self.collect(roundTiesEven:/1)
	}

	rudinShapiro { :self |
		self.collect(rudinShapiro:/1)
	}

	sqrt { :self |
		self.collect(sqrt:/1)
	}

	square { :self |
		self.collect(square:/1)
	}

	stirlingS1 { :self :k |
		self.collect { :n |
			n.stirlingS1(k)
		}
	}

	tan { :self |
		self.collect(tan:/1)
	}

	thueMorse { :self |
		self.collect(thueMorse:/1)
	}

	triangularNumber { :self |
		self.collect(triangularNumber:/1)
	}

	tribonacciNumber { :self |
		self.collect(tribonacciNumber:/1)
	}

	truncate { :self |
		self.collect(truncate:/1)
	}

	unitize { :self |
		self.collect(unitize:/1)
	}

	unitStep { :self |
		self.collect(unitStep:/1)
	}

	vanDerCorputNumber { :self :base |
		self.collect { :n |
			n.vanDerCorputNumber(base)
		}
	}

	wrap { :self :lo :hi |
		self.collect { :each |
			each.wrap(lo, hi)
		}
	}

	wrapExclusive { :self :lo :hi |
		self.collect { :each |
			each.wrapExclusive(lo, hi)
		}
	}

	wrapIndex { :self :size |
		self.collect { :each |
			each.wrapIndex(size)
		}
	}

	zeckendorfRepresentation { :self |
		self.collect(zeckendorfRepresentation:/1)
	}

	zeta { :self |
		self.collect(zeta:/1)
	}

}

+@Sequenceable {

	\ { :self :aNumber |
		self.Fraction(aNumber)
	}

	< { :self :anObject |
		anObject.adaptToCollectionAndApply(self, <)
	}

	<= { :self :anObject |
		anObject.adaptToCollectionAndApply(self, <=)
	}

	> { :self :anObject |
		anObject.adaptToCollectionAndApply(self, >)
	}

	>= { :self :anObject |
		anObject.adaptToCollectionAndApply(self, >=)
	}

	*+ { :self :mul :add |
		self * mul + add
	}

	[bitShiftLeft, <<] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitShiftLeft:/2)
	}

	[bitShiftRight, >>] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitShiftRight:/2)
	}

	[divide, /] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, divide:/2)
	}

	[mod, %] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, mod:/2)
	}

	[plus, +] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, plus:/2)
	}

	[power, ^] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, power:/2)
	}

	[quotient, //] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, quotient:/2)
	}

	[remainder, \\] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, remainder:/2)
	}

	[subtract, -] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, subtract:/2)
	}

	[times, *] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, times:/2)
	}

	absArg { :self |
		self.collect(absArg:/1)
	}

	arg { :self |
		self.collect(arg:/1)
	}

	arithmeticGeometricMean { :self :anObject |
		anObject.adaptToCollectionAndApply(self, arithmeticGeometricMean:/2)
	}

	beta { :self :anObject |
		anObject.adaptToCollectionAndApply(self, beta:/2)
	}

	binomial { :self :anObject |
		anObject.adaptToCollectionAndApply(self, binomial:/2)
	}

	bitAnd { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitAnd:/2)
	}

	bitOr { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitOr:/2)
	}

	bitShiftRightUnsigned { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitShiftRightUnsigned:/2)
	}

	bitXor { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitXor:/2)
	}

	Complex { :self :anObject |
		anObject.adaptToCollectionAndApply(self, Complex:/2)
	}

	divisible { :self :anObject |
		anObject.adaptToCollectionAndApply(self, divisible:/2)
	}

	Fraction { :self :anObject |
		anObject.adaptToCollectionAndApply(self, Fraction:/2)
	}

	gcd { :self :anObject |
		anObject.adaptToCollectionAndApply(self, gcd:/2)
	}

	integerDigits { :self :anObject |
		anObject.adaptToCollectionAndApply(self, integerDigits:/2)
	}

	isCloseToBy { :self :anObject :epsilon |
		anObject.adaptToCollectionAndApply(self) { :a :b |
			a.isCloseToBy(b, epsilon)
		}
	}

	lcm { :self :anObject |
		anObject.adaptToCollectionAndApply(self, lcm:/2)
	}

	mediant { :self |
		Fraction(
			self.collect(numerator:/1).sum,
			self.collect(denominator:/1).sum
		)
	}

	max { :self :anObject |
		anObject.adaptToCollectionAndApply(self, max:/2)
	}

	min { :self :anObject |
		anObject.adaptToCollectionAndApply(self, min:/2)
	}

	mod { :m :n :d |
		n.adaptToCollectionAndApply(m) { :i :j |
			i.mod(j, d)
		}
	}

	multiplyAdd { :i :j :k |
		withWithCollect(i, j, k, multiplyAdd:/3)
	}

	nthRoot { :self :anObject |
		anObject.adaptToCollectionAndApply(self, nthRoot:/2)
	}

	round { :self :anObject |
		anObject.adaptToCollectionAndApply(self, round:/2)
	}

	trinomial { :self :anObject |
		anObject.adaptToCollectionAndApply(self, trinomial:/2)
	}

	truncate { :self :anObject |
		anObject.adaptToCollectionAndApply(self, truncate:/2)
	}

}

+List {

	atVectorOrElementwise { :self :aBlock:/1 |
		self.isVector.if {
			aBlock(self)
		} {
			self.collect(aBlock:/1)
		}
	}

}
