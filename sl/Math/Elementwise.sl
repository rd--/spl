{- Requires: Collection Sequence -}

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
		e ^ self
	}

	abs { :self |
		self.collect(abs:/1)
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

	bitAnd { :self |
		self.reduce(bitAnd:/2)
	}

	bitOr { :self |
		self.reduce(bitOr:/2)
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

	cosh { :self |
		self.collect(cosh:/1)
	}

	cubed { :self |
		self.collect(cubed:/1)
	}

	degreesToRadians { :self |
		self.collect(degreesToRadians:/1)
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

	fractionPart { :self |
		self.collect(fractionPart:/1)
	}

	eulerPhi { :self |
		self.collect(eulerPhi:/1)
	}

	fibonacci { :self |
		self.collect(fibonacci:/1)
	}

	harmonicNumber { :self |
		self.collect(harmonicNumber:/1)
	}

	haversine { :self |
		self.collect(haversine:/1)
	}

	i { :self |
		self.collect(i:/1)
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

	pi { :self |
		self.collect(pi:/1)
	}

	primeFactors { :self |
		self.collect(primeFactors:/1)
	}

	primeLimit { :self |
		self.collect(primeLimit:/1)
	}

	radiansToDegrees { :self |
		self.collect(radiansToDegrees:/1)
	}

	rounded { :self |
		self.collect(rounded:/1)
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

	^ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, ^)
	}

	% { :self :anObject |
		anObject.adaptToCollectionAndApply(self, %)
	}

	absArg { :self |
		self.collect(absArg:/1)
	}

	arg { :self |
		self.collect(arg:/1)
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

	divisible { :self :anObject |
		anObject.adaptToCollectionAndApply(self, divisible:/2)
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
