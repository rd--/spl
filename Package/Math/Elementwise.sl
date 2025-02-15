/* Requires: Collection Sequence */

+@Collection {

	+ { :self |
		self.collect(conjugated:/1)
	}

	- { :self |
		self.collect(negated:/1)
	}

	* { :self |
		self.collect(sign:/1)
	}

	/ { :self |
		self.collect(reciprocal:/1)
	}

	! { :self |
		self.collect(factorialOrGamma:/1)
	}

	^ { :self |
		1.e ^ self
	}

	abs { :self |
		self.collect(abs:/1)
	}

	absSquared { :self |
		self.collect(absSquared:/1)
	}

	arcCosh { :self |
		self.collect(arcCosh:/1)
	}

	arcCos { :self |
		self.collect(arcCos:/1)
	}

	arcSin { :self |
		self.collect(arcSin:/1)
	}

	arcTan { :self |
		self.collect(arcTan:/1)
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

	bellNumber { :self |
		self.collect(bellNumber:/1)
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

	cantorStaircase { :self |
		self.collect(cantorStaircase:/1)
	}

	ceiling { :self |
		self.collect(ceiling:/1)
	}

	conjugated { :self |
		self.collect(conjugated:/1)
	}

	cos { :self |
		self.collect(cos:/1)
	}

	cosecant { :self |
		self.collect(cosecant:/1)
	}

	cosh { :self |
		self.collect(cosh:/1)
	}

	cotangent { :self |
		self.collect(cotangent:/1)
	}

	cubed { :self |
		self.collect(cubed:/1)
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
		self.collect(denominator:/1)
	}

	divisors { :self |
		self.collect(divisors:/1)
	}

	doubleFactorial { :self |
		self.collect(doubleFactorial:/1)
	}

	e { :self |
		self.collect(e:/1)
	}

	e { :self :aNumber |
		self * (10 ^ aNumber)
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

	exp { :self |
		self.collect(exp:/1)
	}

	factorial { :self |
		self.collect(factorial:/1)
	}

	factorialOrGamma { :self |
		self.collect(factorialOrGamma:/1)
	}

	floor { :self |
		self.collect(floor:/1)
	}

	factorInteger { :self |
		self.collect(factorInteger:/1)
	}

	fibonacciWord { :self |
		self.collect(fibonacciWord:/1)
	}

	fractionPart { :self |
		self.collect(fractionPart:/1)
	}

	fibonacci { :self |
		self.collect(fibonacci:/1)
	}

	gamma { :self |
		self.collect(gamma:/1)
	}

	harmonicNumber { :self |
		self.collect(harmonicNumber:/1)
	}

	halved { :self |
		self.collect(halved:/1)
	}

	haversine { :self |
		self.collect(haversine:/1)
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

	integerPart { :self |
		self.collect(integerPart:/1)
	}

	integerSquareRoot { :self |
		self.collect(integerSquareRoot:/1)
	}

	inverseErf { :self |
		self.collect(inverseErf:/1)
	}

	isGaussianPrime { :self |
		self.collect(isGaussianPrime:/1)
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

	logScale { :self |
		self.collect(logScale:/1)
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

	negated { :self |
		self.collect(negated:/1)
	}

	numerator { :self |
		self.collect(numerator:/1)
	}

	partitionsP { :self |
		self.collect(partitionsP:/1)
	}

	partitionsQ { :self |
		self.collect(partitionsQ:/1)
	}

	pi { :self |
		self.collect(pi:/1)
	}

	powerMod { :self :exponent :modulo |
		self.collect { :each |
			each.powerMod(exponent, modulo)
		}
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

	real { :self |
		self.collect(real:/1)
	}

	realImaginary { :self |
		self.collect(realImaginary:/1)
	}

	rounded { :self |
		self.collect(rounded:/1)
	}

	secant { :self |
		self.collect(secant:/1)
	}

	sign { :self |
		self.collect(sign:/1)
	}

	sin { :self |
		self.collect(sin:/1)
	}

	sinc { :self |
		self.collect(sinc:/1)
	}

	sincNormalized { :self |
		self.collect(sincNormalized:/1)
	}

	sinh { :self |
		self.collect(sinh:/1)
	}

	sqrt { :self |
		self.collect(sqrt:/1)
	}

	squared { :self |
		self.collect(squared:/1)
	}

	tan { :self |
		self.collect(tan:/1)
	}

	tanh { :self |
		self.collect(tanh:/1)
	}

	thueMorse { :self |
		self.collect(thueMorse:/1)
	}

	truncated { :self |
		self.collect(truncated:/1)
	}

	truncated { :self |
		self.collect(truncated:/1)
	}

	unitize { :self |
		self.collect(unitize:/1)
	}

	vanDerCorputNumber { :self :base |
		self.collect { :n |
			n.vanDerCorputNumber(base)
		}
	}

	wrapBetweenAnd { :self :lo :hi |
		self.collect { :each |
			each.wrapBetweenAnd(lo, hi)
		}
	}

	wrapIndex { :self :size |
		self.collect { :each |
			each.wrapIndex(size)
		}
	}

}

+@Sequence {

	+ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, +)
	}

	- { :self :anObject |
		anObject.adaptToCollectionAndApply(self, -)
	}

	* { :self :anObject |
		anObject.adaptToCollectionAndApply(self, *)
	}

	/ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, /)
	}

	// { :self :anObject |
		anObject.adaptToCollectionAndApply(self, //)
	}

	\\ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, \\)
	}

	< { :self :anObject |
		anObject.adaptToCollectionAndApply(self, <)
	}

	<< { :self :anObject |
		anObject.adaptToCollectionAndApply(self, <<)
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

	>> { :self :anObject |
		anObject.adaptToCollectionAndApply(self, >>)
	}

	^ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, ^)
	}

	% { :self :anObject |
		anObject.adaptToCollectionAndApply(self, %)
	}

	*+ { :self :mul :add |
		self * mul + add
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

	bitShiftLeft { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitShiftLeft:/2)
	}

	bitShiftRight { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitShiftRight:/2)
	}

	bitShiftRightUnsigned { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitShiftRightUnsigned:/2)
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

	lcm { :self :anObject |
		anObject.adaptToCollectionAndApply(self, lcm:/2)
	}

	mediant { :self |
		Fraction(
			self.collect(numerator:/1).sum,
			self.collect(denominator:/1).sum
		)
	}

	min { :self :anObject |
		anObject.adaptToCollectionAndApply(self, min:/2)
	}

	max { :self :anObject |
		anObject.adaptToCollectionAndApply(self, max:/2)
	}

	nthRoot { :self :anObject |
		anObject.adaptToCollectionAndApply(self, nthRoot:/2)
	}

	roundTo { :self :anObject |
		anObject.adaptToCollectionAndApply(self, roundTo:/2)
	}

	truncateTo { :self :anObject |
		anObject.adaptToCollectionAndApply(self, truncateTo:/2)
	}

}
