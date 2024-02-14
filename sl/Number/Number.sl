@Number {

	- { :self |
		self.zero - self
	}

	/ { :self |
		self.one / self
	}

	^ { :self |
		e ^ self
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
		self.closeTo(aNumber)
	}

	!~ { :self :aNumber |
		self.closeTo(aNumber).not
	}

	<~ { :self :aNumber |
		self < aNumber | {
			self.closeTo(aNumber)
		}
	}

	>~ { :self :aNumber |
		self > aNumber | {
			self.closeTo(aNumber)
		}
	}

	abs { :self |
		(self < 0).if {
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

	asInteger { :self |
		self.truncated
	}

	asNumber { :self |
		self
	}

	asStringWithCommas { :self |
		<primitive: return _self.toLocaleString('en-US');>
	}

	basicPlus { :self :aNumber |
		aNumber.isNumber.if {
			self + aNumber
		} {
			('Number>>basicPlus: operand not number' ++ aNumber).error
		}
	}

	basicTimes { :self :aNumber |
		aNumber.isNumber.if {
			self * aNumber
		} {
			('Number>>basicTimes: operand not number: ' ++ aNumber).error
		}
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

	copySignTo { :self :aNumber |
		(self.signBit = 0).if {
			aNumber.abs
		} {
			aNumber.abs.negated
		}
	}

	cubed { :self |
		self * self * self
	}

	degreeCos { :self |
		(90 - (180 + self % 360 - 180).abs).degreesToRadians.sin
	}

	degreeSin { :self |
		(90 - self).degreeCos
	}

	degreesToRadians { :self |
		self * 0.01745329251994329547 {- pi / 180 -}
	}

	divisible { :self :aNumber |
		aNumber.isNumber.if {
			(self % aNumber).veryCloseTo(0)
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

	downToDo { :self :end :aBlock:/1 |
		let index = self;
		{
			index >= end
		}.whileTrue {
			aBlock(index);
			index := index - 1
		}
	}

	e { :self |
		self * 2.71828182845904523536028747135266249775724709369995
	}

	epsilon { :self |
		self * 0.000000000000001
	}

	eulerGamma { :self |
		self * 0.577215664901532860606512090082402431042
	}

	factorialPower { :self :anInteger |
		(self - (0 .. anInteger - 1)).product
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

	halved { :self |
		self / 2
	}

	integerPart { :self |
		self.truncated
	}

	isNumber { :self |
		true
	}

	isPrimePower { :self |
		let primeFactors = self.primeFactorization;
		primeFactors.size = 1 & {
			primeFactors.first.key.isPrime
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

	mu { :self |
		self / 1000000
	}

	negated { :self |
		self.zero - self
	}

	negative { :self |
		self < 0
	}

	pi { :self |
		self * 3.1415926535897932384626433
	}

	positive { :self |
		self >= 0
	}

	powerMod { :self :exponent :modulo |
		(exponent > 0).if {
			(self ^ exponent) % modulo
		} {
			'Number>>powerMod: not implemented for negative exponents'
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

	radiansToDegrees { :self |
		self * 57.29577951308232286465 {- 180 / pi -}
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
			}
		}
	}

	reciprocal { :self |
		1 / self
	}

	reflectionMatrix { :self |
		let n = 2 * self;
		[
			[n.cos, n.sin],
			[n.sin, n.cos.negated]
		]
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

	rotationMatrix { :self |
		[
			[self.cos, self.sin.negated],
			[self.sin, self.cos]
		]
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
		self.negative.if {
			1
		} {
			0
		}
	}

	squared { :self |
		self * self
	}

	stope { :x :p :y |
		(x + (p * (1:y - 1))).reduce(*)
	}

	strictlyPositive { :self |
		self > 0
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

	unitVector { :n :k |
		let answer = List(n, 0);
		answer[k] := 1;
		answer
	}

	upOrDownToDo { :self :end :aBlock:/1 |
		let step = (end < self).if { -1 } { 1 };
		self.toByDo(end, step, aBlock:/1)
	}

	upToDo { :self :end :aBlock:/1 |
		(end < self).ifTrue {
			self.error('upToDo: not ascending')
		};
		self.toDo(end, aBlock:/1)
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
