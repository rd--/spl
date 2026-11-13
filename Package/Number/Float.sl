/* Requires: RegularExpression String */

Float! : [Object, Copy, Store, Json, Equal, Compare, Number, Integer, Binary] {

	[Float, F] { :self |
		self
	}

	[SmallInteger, normalInteger] { :self |
		self.isSmallInteger.if {
			self
		} {
			self.error('Float>>SmallInteger: not integer')
		}
	}

	[absoluteValue, abs] { :self |
		<primitive:
		return Math.abs(_self)
		>
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock/2 |
		self.isNaN.if {
			NaN
		} {
			aBlock(Float(anInteger), self) /* SmallInteger */
		}
	}

	assertIsFinite { :self :message |
		self.assert(message) {
			self.isFinite
		}
	}

	assertIsSmallInteger { :self :message |
		self.assert(message) {
			self.isSmallInteger
		}
	}

	atRandom { :self |
		system.nextRandomFloat(0, self)
	}

	bitAnd { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return _self & aFloat;
		}
		>
		self.isBinary.if {
			operand.adaptToNumberAndApply(self, bitAnd/2)
		} {
			self.error('Float>>bitAnd', [operand])
		}
	}

	bitNot { :self |
		<primitive:
		if(sl.isBitwise(_self)) {
			return ~_self;
		}
		>
		self.error('Float>>bitNot: not binary')
	}

	bitOr { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return _self | aFloat;
		}
		>
		self.isBinary.if {
			operand.adaptToNumberAndApply(self, bitOr/2)
		} {
			self.error('Float>>bitOr', [operand])
		}
	}

	[bitShiftLeft, <<] { :self :operand |
		operand.isIntegerValuedNumber.if {
			checkedBitShiftLeft(self, operand)
		} {
			operand.adaptToNumberAndApply(self, bitShiftLeft/2)
		}
	}

	[bitShiftRight, >>] { :self :operand |
		operand.isIntegerValuedNumber.if {
			checkedBitShiftRight(self, operand)
		} {
			operand.adaptToNumberAndApply(self, bitShiftRight/2)
		}
	}

	[bitShiftRightUnsigned, >>>] { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return _self >>> aFloat;
		}
		>
		self.isBinary.if {
			operand.adaptToNumberAndApply(self, bitShiftRightUnsigned/2)
		} {
			self.error('Float>>bitShiftRightUnsigned')
		}
	}

	bitTest { :self :anInteger |
		self.bitAnd(1 << (anInteger - 1)) != 0
	}

	bitXor { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return _self ^ aFloat;
		}
		>
		self.isBinary.if {
			operand.adaptToNumberAndApply(self, bitXor/2)
		}{
			self.error('Float>>bitXor')
		}
	}

	byteHexString { :self |
		self.isByte.if {
			self
			.integerString(16L)
			.padLeft([2], '0')
		} {
			self.error(
				'Float>>byteHexString: not a byte'
			)
		}
	}

	checkedBitShiftLeft { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return _self << aFloat;
		}
		>
		self.error('bitShiftLeft', [operand])
	}

	checkedBitShiftRight { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return _self >> aFloat;
		}
		>
		self.error('bitShiftRight')
	}

	chop { :self :epsilon |
		(self.abs < epsilon).if {
			0
		} {
			self
		}
	}

	chop { :self |
		self.chop(1E-10)
	}

	concisePrintString { :self |
		self.uncheckedFloatString(10)
	}

	countLeadingOnes { :self :base :wordSize |
		self.bitNot.countLeadingZeroes(base, wordSize)
	}

	countLeadingZeroes { :self :base :wordSize |
		(base = 2 & { wordSize = 32 }).if {
			self.uncheckedCountLeadingZeroes
		} {
			Integer(self).countLeadingZeroes(base, wordSize)
		}
	}

	countTrailingOnes { :self :base :wordSize |
		self.bitNot.countTrailingZeroes(base, wordSize)
	}

	countTrailingZeroes { :self :base :wordSize |
		(base = 2 & { wordSize = 32 }).if {
			self.uncheckedCountTrailingZeroes
		} {
			self.error('countTrailingZeroes')
		}
	}

	cubeRoot { :self |
		<primitive:
		return Math.cbrt(_self);
		>
	}

	decimalStringToPrecision { :self :anInteger |
		<primitive:
		const aFloat = sl.toFloat(_anInteger);
		if(sl.isSmallInteger(aFloat)) {
			return _self.toPrecision(aFloat);
		}
		>
		self.error('decimalStringToPrecision: not integer precision', [anInteger])
	}

	decimalStringToScale { :self :anInteger |
		<primitive:
		const aFloat = sl.toFloat(_anInteger);
		if(sl.isSmallInteger(aFloat)) {
			return _self.toFixed(aFloat);
		}
		>
		self.error('decimalStringToScale: not integer precision', [anInteger])
	}

	decimalStringToScaleWithoutPrimitive { :self :places |
		(places <= 0).if {
			self.round.printString
		} {
			let rounder = 10 ^ places;
			let round = self.round(rounder.reciprocal);
			let prefix = round.isNegative.if { '-' } { '' };
			let roundFractionPart = (round.abs.fractionalPart * rounder).round; /* truncate? */
			[
				prefix,
				round.abs.integerPart.truncate.printString,
				'.',
				roundFractionPart.printString.padLeft([places], '0')
			].stringCatenate
		}
	}

	denominator { :self |
		self.isIntegerValuedNumber.if {
			1L
		} {
			self.error('denominator: not integer valued number')
		}
	}

	[divide, divideToFloat, /] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return _self / _operand;
		}
		>
		operand.adaptToNumberAndApply(self, divide/2)
	}

	divideToFraction { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			if(_operand === 0 || _operand === 1) {
				return _self / _operand;
			}
			if(Number.isSafeInteger(_self) && Number.isSafeInteger(_operand)) {
				return _Fraction_2(BigInt(_self), BigInt(_operand));
			}
			return _self / _operand;
		}
		>
		operand.adaptToNumberAndApply(self, divideToFraction/2)
	}

	[encodeJson, floatToJson] { :self |
		self.uncheckedEncodeJson
	}

	exp { :self |
		<primitive:
		return Math.exp(_self)
		>
	}

	floatString { :self :radix |
		radix.isIntegerValuedNumber.if {
			let answer = self.uncheckedFloatString(radix);
			self.isSmallInteger.ifTrue {
				answer := answer ++ '.0'
			};
			answer
		} {
			radix.adaptToNumberAndApply(self, floatString/2)
		}
	}

	floatString { :self :radix :k |
		let i = self.integerPart;
		(k <= 0).if {
			i.integerString(radix)
		} {
			let f = self - i;
			'%.%'.format(
				[
					i.integerString(radix),
					f.floatString(radix).drop(2).take(k)
				]
			)
		}
	}

	floor { :self |
		<primitive:
		return Math.floor(_self)
		>
	}

	[fractionExponent, frexp] { :self |
		/* https://blog.codefrau.net/2014/08/deconstructing-floats-frexp-and-ldexp.html */
		<primitive:
		const value = _self;
		if (value === 0) {
			return [value, 0];
		}
		const data = new DataView(new ArrayBuffer(8));
		data.setFloat64(0, value);
		let bits = (data.getUint32(0) >>> 20) & 0x7FF;
		if (bits === 0) {
			data.setFloat64(0, value * Math.pow(2, 64));
			bits = ((data.getUint32(0) >>> 20) & 0x7FF) - 64;
		}
		let exponent = bits - 1022;
		let mantissa = _ldexp_2(value, -exponent);
		return [mantissa, exponent];
		>
	}

	fractionalPart { :self |
		<primitive:
		return _self % 1;
		>
	}

	hypotenuse { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return Math.hypot(_self, _operand);
		}
		>
		operand.adaptToNumberAndApply(self, hypotenuse/2)
	}

	i32BitRotateLeft { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return (_self << aFloat) | (_self >>> (32 - aFloat));
		}
		>
		self.error('Float>>i32BitRotateLeft', [anInteger])
	}

	i32BitRotateRight { :self :operand |
		<primitive:
		const aFloat = sl.toFloat(_operand);
		if(sl.isBitwise(_self) && sl.isBitwise(aFloat)) {
			return (_self >> aFloat) | (_self << (32 - aFloat));
		}
		>
		self.error('Float>>i32BitRotateRight', [anInteger])
	}

	i32Plus { :a :b |
		(a + b).wrapExclusive(-2147483648, 2147483647 + 1)
	}

	i32Times { :m :n |
		/*
		<primitive:
		return ((_m & 0xffff) * _n) + ((((_m >>> 16) * _n) & 0xffff) << 16);
		>
		*/
		<primitive:
		return Math.imul(_m, _n);
		>
	}

	ieeeRemainder { :self :operand |
		<primitive:
		const dividend = _self;
		const divisor = _operand;
		if (Object.is(divisor, 0)
			|| !Number.isFinite(dividend)
			|| Number.isNaN(dividend)
			|| Number.isNaN(divisor)
		) {
			return NaN;
		}
		if (!Number.isFinite(divisor)
			|| Object.is(dividend, 0)
		) {
			return dividend;
		}
		const exactQuotient = dividend / divisor;
		let roundedQuotient = Math.round(exactQuotient);
		if (Math.abs(exactQuotient - roundedQuotient) === 0.5) {
			if (roundedQuotient % 2 !== 0) {
				roundedQuotient = roundedQuotient + (exactQuotient > roundedQuotient ? 1 : -1);
			}
		}
		const remainder = dividend - (divisor * roundedQuotient);
		return remainder;
		>
	}

	ifNaN { :self :whenNaN/0 :whenNotNaN/1 |
		self.isNaN.if {
			whenNaN()
		} {
			whenNotNaN(self)
		}
	}

	integerChop { :self :epsilon |
		let nearestInteger = self.round;
		((self - nearestInteger).abs < epsilon).if {
			nearestInteger
		} {
			self
		}
	}

	integerChop { :self |
		self.integerChop(1E-10)
	}

	[integerSquareRoot, isqrt] { :self |
		self.sqrt.floor
	}

	isBinary { :self |
		<primitive:
		return sl.isBitwise(_self);
		>
	}

	isCloseBy { :self :aNumber :epsilon |
		aNumber.isNumber.not.if {
			false
		} {
			(self = 0.0).if {
				aNumber.abs < epsilon
			} {
				(aNumber = 0.0).if {
					self.abs < epsilon
				} {
					let other = Float(aNumber);
					self = other | {
						let z = self.abs;
						(z < epsilon).if {
							other.abs < epsilon
						} {
							(self - other).abs / (z.max(other.abs)) < epsilon
						}
					}
				}
			}
		}
	}

	[isEqual, =] { :self :operand |
		operand.isNumber.if {
			operand.isFloat.if {
				isIdentical(self, operand)
			} {
				operand.adaptToNumberAndApply(self, isEqual/2)
			}
		} {
			false
		}
	}

	isEven { :self |
		<primitive:
		if(Number.isInteger(_self)) {
			if(!Number.isSafeInteger(_self)) {
				throw new Error('isEven: unsafe');
			};
			return (_self % 2) === 0;
		};
		return false;
		>
	}

	isExact { :self |
		self.isSmallInteger
	}

	[isFinite, isRealValuedNumber] { :self |
		<primitive:
		return Number.isFinite(_self);
		>
	}

	isIeeeInteger { :self |
		<primitive:
		return Number.isInteger(_self);
		>
	}

	isImmediate { :unused |
		true
	}

	isIntegerValuedNumber { :self |
		<primitive:
		return Number.isSafeInteger(_self);
		>
	}

	[isLess, <] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return _self < _operand;
		}
		>
		operand.adaptToNumberAndApply(self, isLess/2)
	}

	[isLessOrEqual, <=] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return _self <= _operand;
		}
		>
		operand.adaptToNumberAndApply(self, isLessOrEqual/2)
	}

	isLiteral { :self |
		true
	}

	isNaN { :self |
		<primitive:
		return Number.isNaN(_self);
		>
	}

	isNearInteger { :self :epsilon |
		(self - self.round).abs < epsilon
	}

	isNegativeZero { :self |
		<primitive:
		return Object.is(_self, -0);
		>
	}

	isOdd { :self |
		<primitive:
		if(Number.isInteger(_self)) {
			if(!Number.isSafeInteger(_self)) {
				throw new Error('isOdd: unsafe');
			};
			return Math.abs(_self % 2) === 1;
		};
		return false;
		>
	}

	isRational { :self |
		self.isIntegerValuedNumber
	}

	isSmallInteger { :self |
		/* self.abs <= 9_007_199_254_740_991 */
		<primitive:
		return Number.isSafeInteger(_self);
		>
	}

	isSquare { :n |
		n.isSmallInteger.if {
			Integer(n).isSquare
		} {
			false
		}
	}

	[loadExponent, ldexp] { :self :operand |
		/* https://blog.codefrau.net/2014/08/deconstructing-floats-frexp-and-ldexp.html */
		<primitive:
		let mantissa = _self;
		let exponent = sl.toFloat(_operand);
		let steps = Math.min(3, Math.ceil(Math.abs(exponent) / 1023));
		let result = mantissa;
		for (let i = 0; i < steps; i++) {
			result *= Math.pow(2, Math.floor((exponent + i) / steps));
		}
		return result;
		>
	}

	log { :self |
		<primitive:
		if(_self >= 0) {
			return Math.log(_self)
		}
		>
		Complex(self, 0).log
	}

	log { :self :base |
		<primitive:
		return Math.log(_self) / Math.log(sl.toFloat(_base))
		>
	}

	log10 { :self |
		<primitive:
		return Math.log10(_self)
		>
	}

	log2 { :self |
		<primitive:
		return Math.log2(_self)
		>
	}

	mantissaExponent { :x :b |
		let i = x.integerPart;
		let k = i.integerLength(b);
		[
			x / (b ^ k),
			k
		]
	}

	[maximum, max] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return Math.max(_self, _operand);
		}
		>
		operand.isCollection.if {
			operand.adaptToNumberAndApply(self, max/2)
		} {
			(self > operand).if {
				self
			} {
				operand
			}
		}
	}

	[minimum, min] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return Math.min(_self, _operand);
		}
		>
		operand.isCollection.if {
			operand.adaptToNumberAndApply(self, min/2)
		} {
			(self <= operand).if {
				self
			} {
				operand
			}
		}
	}

	minkowskiQuestionMark { :x |
		let y = (x / 1).floor;
		let p = x % 1;
		let q = 1 - p;
		let d = 0.5;
		{
			y + d > y
		}.whileTrue {
			(p < q).if {
				q := q - p
			} {
				p := p - q;
				y := y + d
			};
			d := d / 2
		};
		y
	}

	[mod, %] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return ((_self % _operand) + _operand) % _operand;
		}
		>
		operand.adaptToNumberAndApply(self, mod/2)
	}

	newtonRaphsonMethod { :epsilon :tolerance :iterationCount :x0 :f/1 :fPrime/1 |
		withReturn { :return/1 |
			iterationCount.timesRepeat {
				let y = f(x0);
				let yPrime = fPrime(x0);
				let x1 = (yPrime.abs > epsilon).if {
					x0 - (y / yPrime)
				} {
					ε.error('newtonRaphsonMethod: y < ε', [tolerance, iterationCount])
				};
				((x1 - x0).abs <= tolerance).ifTrue {
					x1.return
				};
				x0 := x1
			};
			'newtonRaphsonMethod: failed to converge'.error
		}
	}

	nthRoot { :self :aPositiveInteger |
		(
			aPositiveInteger.isIntegerValuedNumber.not | {
				aPositiveInteger.isNegative
			}
		).ifTrue {
			'nthRoot: only defined for positive integers'.error
		};
		self.isNegative.if {
			aPositiveInteger.isOdd.if {
				(self.negate ^ Float(1 / aPositiveInteger)).negate
			} {
				'nthRoot: negative numbers do not have even roots.'.error
			}
		} {
			self ^ Float(1 / aPositiveInteger)
		}
	}

	numerator { :self |
		Integer(self)
	}

	one { :self |
		1.0
	}

	[plus, +] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			const answer = _self + _operand;
			return sl.checkSmallIntegerOverflow(_self, _operand, answer, '+', _plus_2);
		}
		>
		operand.adaptToNumberAndApply(self, plus/2)
	}

	[power, ^] { :self :anObject |
		anObject.isFloat.if {
			anObject.isIntegerValuedNumber.if {
				self.raisedToInteger(
					Integer(anObject)
				)
			} {
				self.isNegative.if {
					Complex(self, 0) ^ anObject
				} {
					self.raisedToFloat(anObject)
				}
			}
		} {
			anObject.adaptToNumberAndApply(self, power/2)
		}
	}

	printString { :self |
		self.floatString(10)
	}

	printStringToAtMostPlaces { :self :anInteger |
		self.isIntegerValuedNumber.if {
			self.printString
		} {
			self.decimalStringToScale(anInteger)
		}
	}

	printStringWithCommas { :self |
		<primitive:
		return _self.toLocaleString('en-US');
		>
	}

	promoteBinary { :self |
		self.isBinary.if {
			self
		} {
			Integer(self)
		}
	}

	radixString { :self :radix |
		(radix = 10).if {
			self.printString
		} {
			let unsignedAnswer = '%b%'.format(
				[
					radix.integerString(10),
					SmallInteger(self).abs.integerString(radix)
				]
			);
			self.isNegative.if {
				'-' ++ unsignedAnswer
			} {
				unsignedAnswer
			}
		}
	}

	raisedToFloat { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			let answer = Math.pow(_self, _operand);
			return sl.checkSmallIntegerOverflow(_self, _operand, answer, '^', _power_2);
		}
		>
		'Float>>raisedToFloat: not Float'.error
	}

	raisedToPositiveSmallInteger { :self :operand |
		self.uncheckedPower(operand)
	}

	realDigits { :self :base :size |
		(base != 10).if {
			self.error('Float>>realDigits: not implemented unless base=10')
		} {
			let x = self.abs;
			(x = 0).if {
				[List(size, 0.0), 1.0]
			} {
				let exponent = (x.log10 + 1.0).round;
				[
					(x * (10.0 ^ (size - exponent))).round.integerDigits(10, size),
					exponent
				]
			}
		}
	}

	realExponent { :x :b |
		x.abs.log(b)
	}

	[remainder, \\] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			return _self % _operand;
		}
		>
		operand.adaptToNumberAndApply(self, remainder/2)
	}

	replaceNaN { :x :y |
		x.isNaN.if {
			y
		} {
			x
		}
	}

	round { :self |
		<primitive:
		return Math.round(_self)
		>
	}

	roundTiesEven { :n |
		(n.fractionalPart = 0.5).if {
			2 * (n / 2).round
		} {
			n.round
		}
	}

	shallowCopy { :self |
		self
	}

	sign { :self |
		<primitive:
		return Math.sign(_self);
		>
		/*
		(self < 0).if {
			-1
		} {
			(self > 0).if {
				1
			} {
				0
			}
		}
		*/
	}

	signExponentMantissa { :self |
		<primitive:
		const float = new Float64Array(1);
		const bytes = new Uint8Array(float.buffer);
		float[0] = _self;
		const sign = bytes[7] >> 7;
		const exponent = ((bytes[7] & 0x7f) << 4 | bytes[6] >> 4) - 0x3ff;
		bytes[7] = 0x3f;
		bytes[6] |= 0xf0;
		return [sign, exponent, float[0]];
		>
	}

	[signedPower, **] { :self :operand |
		<primitive:
		if (sl.isFloat(_operand)) {
			if(_self < 0) {
				return 0 - Math.pow(0.0 - _self, _operand);
			} {
				return Math.pow(_self, _operand);
			}
		}
		>
		operand.adaptToNumberAndApply(self, signedPower/2)
	}

	[squareRoot, sqrt] { :self |
		self.isNegative.if {
			Complex(self, 0).sqrt
		} {
			self.uncheckedSquareRoot
		}
	}

	storeString { :self |
		self.printString
	}

	[subtract, -] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			const answer = _self - _operand;
			return sl.checkSmallIntegerOverflow(_self, _operand, answer, '-', _subtract_2);
		}
		>
		operand.adaptToNumberAndApply(self, subtract/2)
	}

	surd { :x :n |
		(x < 0).if {
			0 - surd(0 - x, n)
		} {
			x ^ Float(1 / n)
		}
	}

	[times, *] { :self :operand |
		<primitive:
		if(sl.isFloat(_operand)) {
			const answer = _self * _operand;
			return sl.checkSmallIntegerOverflow(_self, _operand, answer, '*', _times_2);
		}
		>
		operand.adaptToNumberAndApply(self, times/2)
	}

	truncate { :self |
		<primitive:
		return Math.trunc(_self)
		>
	}

	uncheckedBitAnd { :self :anObject |
		<primitive:
		return _self & sl.toFloat(_anObject);
		>
	}

	uncheckedBitNot { :self |
		<primitive:
		return ~_self;
		>
	}

	uncheckedBitShiftLeft { :self :anObject |
		<primitive:
		return _self << sl.toFloat(_anObject);
		>
	}

	uncheckedBitShiftRight { :self :anObject |
		<primitive:
		return _self >> sl.toFloat(_anObject);
		>
	}

	uncheckedBitShiftRightUnsigned { :self :anObject |
		<primitive:
		return _self >>> sl.toFloat(_anObject);
		>
	}

	uncheckedBitXor { :self :anObject |
		<primitive:
		return _self ^ sl.toFloat(_anObject);
		>
	}

	uncheckedCountLeadingZeroes { :self |
		<primitive:
		if(sl.isBitwise(_self)) {
			return Math.clz32(_self);
		}
		>
		self.error('Float>>uncheckedCountLeadingZeroes')
	}

	uncheckedCountTrailingZeroes { :self |
		<primitive:
		let n = _self;
		n >>>= 0;
		if (n === 0) {
			return 32;
		}
		n &= -n;
		return 31 - Math.clz32(n);
		>
	}

	uncheckedDivide { :self :operand |
		<primitive:
		return _self / _operand;
		>
	}

	uncheckedFloatString { :self :radix |
		<primitive:
		if(Object.is(_self, -0)) {
			return "-0"
		};
		if(Number.isFinite(_self)) {
			return _self.toString(
				sl.toFloat(_radix)
			).toUpperCase();
		};
		return _self.toString();
		>
	}

	uncheckedPower { :self :operand |
		<primitive:
		const answer = Math.pow(_self, _operand);
		return sl.checkSmallIntegerOverflow(_self, _operand, answer, '^', _power_2);
		>
	}

	uncheckedSquareRoot { :self |
		<primitive:
		return Math.sqrt(_self)
		>
	}

	unsigned32BitWordList { :self |
		<primitive:
		const f64 = new Float64Array(1);
		const u32 = new Uint32Array(f64.buffer);
		f64[0] = _self;
		return [u32[0], u32[1]];
		>
	}

	zero { :self |
		0.0
	}

}

+@Collection {

	isNaN { :self |
		self.collect(isNaN/1)
	}

}

+String {

	isRadixIntegerString { :self :radix |
		self.isEmpty.if {
			false
		} {
			radix.caseOf([
				2 -> {
					self.matchesRegularExpression('^[0-1+-]+$')
				},
				4 -> {
					self.matchesRegularExpression('^[0-3+-]+$')
				},
				8 -> {
					self.matchesRegularExpression('^[0-7+-]+$')
				},
				10 -> {
					self.matchesRegularExpression('^[0-9+-]+$')
				},
				16 -> {
					self.matchesRegularExpression('^[0-9A-Fa-f+-]+$')
				}
			]) {
				let c = self.characters;
				(c[1] = '-' | { c[1] = '+' }).ifTrue {
					c.removeAt!(1)
				};
				c.collect(digitValue/1).allSatisfy { :each |
					each >= 0 & { each < radix }
				}
			}
		}
	}

	parseDecimalInteger { :self :elseClause/0 |
		self.isDecimalIntegerString.if {
			let answer = self.uncheckedParseDecimalInteger;
			answer.isNaN.if {
				elseClause()
			} {
				answer.isSmallInteger.if {
					answer
				} {
					elseClause()
				}
			}
		} {
			elseClause()
		}
	}

	parseDecimalInteger { :self |
		self.parseDecimalInteger {
			self.error('parseDecimalInteger: invalid input')
		}
	}

	parseDecimalNumeral { :self :elseClause/0 |
		self.isDecimalNumeralString.if {
			self.uncheckedParseNumber
		} {
			elseClause()
		}
	}

	parseDecimalNumeral { :self |
		self.parseDecimalNumeral {
			self.error('parseDecimalNumeral: invalid input')
		}
	}

	parseNumber { :self :elseClause/0 |
		self.isFloatString.if {
			self.uncheckedParseNumber
		} {
			elseClause()
		}
	}

	parseNumber { :self |
		self.parseNumber {
			self.error('parseNumber: invalid input')
		}
	}

	parseScientificNotation { :self :elseClause/0 |
		self.isScientificNotationString.if {
			self.uncheckedParseNumber
		} {
			elseClause()
		}
	}

	parseScientificNotation { :self |
		self.parseScientificNotation {
			self.error('parseScientificNotation: invalid input')
		}
	}

	parseSexagesimal { :self |
		let [a, b] = self.splitOn(';');
		let [p, q] = [a, b].collect { :each |
			each.splitOn(',').collect(parseDecimalInteger/1)
		};
		let [m, n] = [p, q].collect(size/1);
		(p * (60L ^ (m - 1).toBy(0, -1))).sum + (q / (60L ^ 1.to(n))).sum
	}

	parseSmallInteger { :self :radix :elseClause/0 |
		radix.isSmallInteger.if {
			(
				radix > 1 & {
					radix < 36 & {
						self.isRadixIntegerString(radix)
					}
				}
			).if {
				let answer = self.uncheckedParseInteger(radix);
				answer.isSmallInteger.if {
					answer
				} {
					elseClause()
				}
			} {
				elseClause()
			}
		} {
			elseClause()
		}
	}

	parseSmallInteger { :self :radix |
		self.parseSmallInteger(radix) {
			self.error('parseSmallInteger: invalid input')
		}
	}

	uncheckedParseDecimalInteger { :self |
		<primitive:
		return Number(_self);
		>
	}

	uncheckedParseInteger { :self :radix |
		<primitive:
		return Number.parseInt(_self, sl.toFloat(_radix));
		>
	}

	uncheckedParseNumber { :self |
		<primitive:
		return Number.parseFloat(_self);
		>
	}

}

+List {

	fromSignExponentMantissa { :self |
		let [s, e, m] = self;
		(-1 ^ s) * Float(2L ^ e) * m
	}

}

+Void {

	eulersNumber {
		1.exp
	}

}
