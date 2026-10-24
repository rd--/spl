/* Requires: RegularExpression String */

SmallFloat! : [Object, Copy, Store, Json, Equal, Compare, Number, Integer, Binary] {

	[Integer, normalInteger] { :self |
		SmallInteger(self)
	}

	[SmallFloat, Float] { :self |
		self
	}

	[SmallInteger, smallFloatToSmallInteger] { :self |
		self.isSmallInteger.if {
			self
		} {
			self.error('SmallFloat>>SmallInteger: not integer')
		}
	}

	[absoluteValue, abs] { :self |
		<primitive: return Math.abs(_self)>
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock/2 |
		self.isNaN.if {
			NaN
		} {
			anInteger.isLargeInteger.if {
				aBlock(SmallFloat(anInteger), self)
			} {
				self.error('SmallFloat>>adaptToIntegerAndApply', anInteger)
			}
		}
	}

	amusicalPermutation { :n |
		n.isEven.if {
			3 * n / 2
		} {
			((3 * n + 2) / 4).floor
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

	assertIsSmallInteger { :self |
		self.assertIsSmallInteger('')
	}

	atRandom { :self |
		system.nextRandomFloat(0, self)
	}

	bitAnd { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self & _anObject;
		}
		>
		self.isBinary.if {
			anObject.adaptToNumberAndApply(self, bitAnd/2)
		} {
			self.error('SmallFloat>>bitAnd', [anObject])
		}
	}

	bitNot { :self |
		<primitive:
		if(sl.isBitwise(_self)) {
			return ~_self;
		}
		>
		self.error('SmallFloat>>bitNot: not binary')
	}

	bitOr { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self | _anObject;
		}
		>
		self.isBinary.if {
			anObject.adaptToNumberAndApply(self, bitOr/2)
		} {
			self.error('SmallFloat>>bitOr', [anObject])
		}
	}

	[bitShiftLeft, <<] { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self << _anObject;
		}
		>
		self.isBinary.if {
			anObject.adaptToNumberAndApply(self, bitShiftLeft/2)
		} {
			self.error('SmallFloat>>bitShiftLeft')
		}
	}

	[bitShiftRight, >>] { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self >> _anObject;
		}
		>
		self.isBinary.if {
			anObject.adaptToNumberAndApply(self, bitShiftRight/2)
		} {
			self.error('SmallFloat>>bitShiftRight')
		}
	}

	[bitShiftRightUnsigned, >>>] { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self >>> _anObject;
		}
		>
		self.isBinary.if {
			anObject.adaptToNumberAndApply(self, bitShiftRightUnsigned/2)
		} {
			self.error('SmallFloat>>bitShiftRightUnsigned')
		}
	}

	bitTest { :self :anInteger |
		self.bitAnd(1 << (anInteger - 1)) != 0
	}

	bitXor { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self ^ _anObject;
		}
		>
		self.isBinary.if {
			anObject.adaptToNumberAndApply(self, bitXor/2)
		}{
			self.error('SmallFloat>>bitXor')
		}
	}

	byteHexString { :self |
		self.isByte.if {
			self
			.uncheckedPrintString(16)
			.padLeft([2], '0')
		} {
			self.error(
				'SmallFloat>>byteHexString: not a byte'
			)
		}
	}

	cantorStaircase { :x :n |
		let f = { :x :n |
			(n = 0).if {
				x
			} {
				let y = 3 * x;
				(y < 1).if {
					f(y, n - 1) / 2
				} {
					(y < 2).if {
						0.5
					} {
						0.5 + (f(y - 2, n - 1) / 2)
					}
				}
			}
		};
		f(x, n)
	}

	cantorStaircase { :x |
		x.cantorStaircase(12)
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

	clearZeroSignBit { :n |
		n.isZero.if {
			0
		} {
			n
		}
	}

	countLeadingOnes { :self :base :wordSize |
		self.bitNot.countLeadingZeroes(base, wordSize)
	}

	countLeadingZeroes { :self :base :wordSize |
		(base = 2 & { wordSize = 32 }).if {
			self.uncheckedCountLeadingZeroes
		} {
			LargeInteger(self).countLeadingZeroes(base, wordSize)
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
		<primitive: return Math.cbrt(_self);>
	}

	denominator { :self |
		self.isInteger.if {
			1
		} {
			self.error('denominator')
		}
	}

	[divide, /] { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self / _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, divide/2)
	}

	encodeFloat32 { :self :littleEndian |
		<primitive: return sc.encodeFloat32(_self, _littleEndian);>
	}

	encodeFloat64 { :self :littleEndian |
		<primitive: return sc.encodeFloat64(_self, _littleEndian);>
	}

	encodeInt16 { :self :littleEndian |
		<primitive: return sc.encodeInt16(_self, _littleEndian);>
	}

	encodeInt32 { :self :littleEndian |
		<primitive: return sc.encodeInt32(_self, _littleEndian);>
	}

	encodeInt8 { :self |
		<primitive: return sc.encodeInt8(_self);>
	}

	[encodeJson, smallFloatToJson] { :self |
		self.uncheckedEncodeJson
	}

	exp { :self |
		<primitive: return Math.exp(_self)>
	}

	floor { :self |
		<primitive: return Math.floor(_self)>
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
		<primitive: return _self % 1;>
	}

	hypotenuse { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.hypot(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, hypotenuse/2)
	}

	i32BitRotateLeft { :self :anInteger |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anInteger)) {
			return (_self << _anInteger) | (_self >>> (32 - _anInteger));
		}
		>
		self.error('SmallFloat>>i32BitRotateLeft', [anInteger])
	}

	i32BitRotateRight { :self :anInteger |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anInteger)) {
			return (_self >> _anInteger) | (_self << (32 - _anInteger));
		}
		>
		self.error('SmallFloat>>i32BitRotateRight', [anInteger])
	}

	i32Plus { :a :b |
		(a + b).wrapExclusive(-2147483648, 2147483647 + 1)
	}

	i32Times { :m :n |
		/* <primitive: return ((_m & 0xffff) * _n) + ((((_m >>> 16) * _n) & 0xffff) << 16);> */
		<primitive: return Math.imul(_m, _n);>
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
		<primitive: return sl.isBitwise(_self);>
	}

	isCloseBy { :self :aNumber :epsilon |
		aNumber.isNumber.not.if {
			false
		} {
			(self = 0).if {
				aNumber.abs < epsilon
			} {
				(aNumber = 0).if {
					self.abs < epsilon
				} {
					let other = aNumber.SmallFloat;
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

	[isEqual, =] { :self :anObject |
		anObject.isNumber.if {
			anObject.isSmallFloat.if {
				isIdentical(self, anObject)
			} {
				anObject.adaptToNumberAndApply(self, isEqual/2)
			}
		} {
			false
		}
	}

	isEven { :self |
		<primitive: return _self % 2 === 0;>
		/* self % 2 = 0 */
	}

	isExact { :self |
		self.isSmallInteger
	}

	isFinite { :self |
		<primitive: return Number.isFinite(_self);>
	}

	isIeeeInteger { :self |
		<primitive: return Number.isInteger(_self);>
	}

	isImmediate { :unused |
		true
	}

	isInteger { :self |
		<primitive: return Number.isSafeInteger(_self);>
	}

	isInteger { :self :epsilon |
		(self - self.round).abs < epsilon
	}

	[isLess, <] { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self < _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, isLess/2)
	}

	[isLessOrEqual, <=] { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self <= _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, isLessOrEqual/2)
	}

	isLiteral { :self |
		true
	}

	isNaN { :self |
		<primitive: return Number.isNaN(_self);>
	}

	isNegativeZero { :self |
		<primitive: return Object.is(_self, -0);>
	}

	isOdd { :self |
		<primitive: return Math.abs(_self % 2) === 1;>
		/* (self % 2).abs = 1 */
	}

	isRational { :self |
		self.isInteger
	}

	isSmallInteger { :self |
		<primitive: return Number.isSafeInteger(_self);>
		/* self.abs <= 9_007_199_254_740_991 */
	}

	isSquare { :n |
		n.isSmallInteger.if {
			LargeInteger(n).isSquare
		} {
			false
		}
	}

	[loadExponent, ldexp] { :self :operand |
		/* https://blog.codefrau.net/2014/08/deconstructing-floats-frexp-and-ldexp.html */
		<primitive:
		let mantissa = _self;
		let exponent = _operand;
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
		<primitive: return Math.log(_self) / Math.log(_base)>
	}

	log10 { :self |
		<primitive: return Math.log10(_self)>
	}

	log2 { :self |
		<primitive: return Math.log2(_self)>
	}

	mantissaExponent { :x :b |
		let i = x.integerPart;
		let k = i.integerLength(b);
		[
			x / (b ^ k),
			k
		]
	}

	[maximum, max] { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.max(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, max/2)
	}

	[minimum, min] { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.min(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, min/2)
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

	minkowskiQuestionMarkInverse { :x |
		let y = (x / 1).floor;
		let bits = x % 1;
		let lo = [0 1];
		let hi = [1 1];
		let iterationCount = 0;
		{
			iterationCount < 152 & {
				(y + (lo[1] / lo[2])) < (y + (hi[1] / hi[2]))
			}
		}.whileTrue {
			let bit = (2 * bits / 1).floor;
			bits := 2 * bits % 1;
			(bit > 0).if {
				lo := lo + hi
			} {
				hi := hi + lo
			};
			iterationCount := iterationCount + 1
		};
		y + (lo[1] / lo[2])
	}

	[mod, %] { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return ((_self % _anObject) + _anObject) % _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, mod/2)
	}

	muLawDecode { :y |
		let mu = 255;
		let a = ((1 + mu) ^ y.abs) - 1;
		y.sign * (a / mu)
	}

	muLawEncode { :x |
		let mu = 255;
		let a = (1 + (mu * x.abs)).log;
		x.sign * (a / (1 + mu).log)
	}

	newtonRaphsonMethod { :epsilon :tolerance :iterationCount :x0 :f/1 :fPrime/1 |
		withReturn { :return/1 |
			iterationCount.timesRepeat {
				let y = f(x0);
				let yPrime = fPrime(x0);
				let x1 = (yPrime.abs > epsilon).if {
					x0 - (y / yPrime)
				} {
					'newtonRaphsonMethod: y < ε'.error
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
		(aPositiveInteger.isInteger.not | {
			aPositiveInteger.isNegative
		}).ifTrue {
			'nthRoot: only defined for positive integers'.error
		};
		self.isNegative.if {
			aPositiveInteger.isOdd.if {
				(self.negate ^ (1 / aPositiveInteger)).negate
			} {
				'nthRoot: negative numbers do not have even roots.'.error
			}
		} {
			self ^ (1 / aPositiveInteger)
		}
	}

	numberExpand { :self :base |
		let i = self.abs.truncate;
		let f = self.abs.fractionalPart;
		let d = i.integerDigits(base);
		let k = d.size;
		let m = k.toBy(1, -1).collect { :each |
			base ^ (each - 1)
		};
		let l = (d * m);
		(f = 0).ifFalse {
			l[k] := l[k] + f
		};
		l * self.sign
	}

	numerator { :self |
		self.assertIsSmallInteger
	}

	one { :self |
		1
	}

	[plus, +] { :self :operand |
		<primitive:
		if(sl.isSmallFloat(_operand)) {
			const answer = _self + _operand;
			/*sl.checkSmallFloatOverflow(_self, _operand, answer);*/
			return answer;
		}
		>
		operand.adaptToNumberAndApply(self, plus/2)
	}

	[power, ^] { :self :anObject |
		anObject.isSmallFloat.if {
			anObject.isInteger.if {
				self.raisedToInteger(anObject)
			} {
				self.isNegative.if {
					Complex(self, 0) ^ anObject
				} {
					self.raisedToSmallFloat(anObject)
				}
			}
		} {
			anObject.adaptToNumberAndApply(self, power/2)
		}
	}

	printStringToAtMostPlaces { :self :anInteger |
		self.isInteger.if {
			self.printString
		} {
			self.printStringToFixed(anInteger)
		}
	}

	printStringToFixed { :self :anInteger |
		<primitive:
		if(sl.isSmallFloatInteger(_anInteger)) {
			return _self.toFixed(_anInteger);
		}
		>
		'SmallFloat>>printStringToFixed: not integer precision'.error
	}

	printStringToPrecision { :self :anInteger |
		<primitive:
		if(sl.isSmallFloatInteger(_anInteger)) {
			return _self.toPrecision(_anInteger);
		}
		>
		'SmallFloat>>printStringToPrecision: not integer precision'.error
	}

	promoteBinary { :self |
		self.isBinary.if {
			self
		} {
			LargeInteger(self)
		}
	}

	raisedToPositiveSmallInteger { :self :operand |
		self.uncheckedPower(operand)
	}

	raisedToSmallFloat { :self :operand |
		<primitive:
		if(sl.isSmallFloat(_operand)) {
			let answer = Math.pow(_self, _operand);
			/*sl.checkSmallFloatOverflow(_self, _operand, answer);*/
			return answer;
		}
		>
		'SmallFloat>>raisedToSmallFloat: not SmallFloat'.error
	}

	ramanujansSum { :q :n |
		1.to(q).sum { :a |
			(a.gcd(q) = 1).if {
				(2I.pi * (a / q) * n).exp
			} {
				0
			}
		}.real.round
	}

	realDigits { :self :base :size |
		(base != 10).if {
			self.error('SmallFloat>>realDigits: not implemented unless base=10')
		} {
			let x = self.abs;
			(x = 0).if {
				[List(size, 0), 1]
			} {
				let exponent = (x.log10 + 1).round;
				[
					(x * (10 ^ (size - exponent))).round.integerDigits(10, size),
					exponent
				]
			}
		}
	}

	realExponent { :x :b |
		x.abs.log(b)
	}

	reduce { :self |
		self.isClose(self.round).if {
			self.round
		} {
			self
		}
	}

	remainder { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self % _anObject;
		}
		>
		self.error('remainder')
	}

	replaceNaN { :x :y |
		x.isNaN.if {
			y
		} {
			x
		}
	}

	round { :self |
		<primitive: return Math.round(_self)>
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
		<primitive: return Math.sign(_self);>
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

	[squareRoot, sqrt] { :self |
		self.isNegative.if {
			Complex(self, 0).sqrt
		} {
			self.uncheckedSquareRoot
		}
	}

	storeString { :self |
		self.printString(10)
	}

	[subtract, -] { :self :operand |
		<primitive:
		if(sl.isSmallFloat(_operand)) {
			const answer = _self - _operand;
			/*sl.checkSmallFloatOverflow(_self, _operand, answer);*/
			return answer;
		}
		>
		operand.adaptToNumberAndApply(self, subtract/2)
	}

	surd { :x :n |
		(x < 0).if {
			0 - surd(0 - x, n)
		} {
			x ^ (1 / n)
		}
	}

	[times, *] { :self :operand |
		<primitive:
		if(sl.isSmallFloat(_operand)) {
			const answer = _self * _operand;
			/*sl.checkSmallFloatOverflow(_self, _operand, answer);*/
			return answer;
		}
		>
		operand.adaptToNumberAndApply(self, times/2)
	}

	truncate { :self |
		<primitive: return Math.trunc(_self)>
	}

	uncheckedBitAnd { :self :anObject |
		<primitive: return _self & _anObject;>
	}

	uncheckedBitNot { :self |
		<primitive: return ~_self;>
	}

	uncheckedBitShiftLeft { :self :anObject |
		<primitive: return _self << _anObject;>
	}

	uncheckedBitShiftRight { :self :anObject |
		<primitive: return _self >> _anObject;>
	}

	uncheckedBitShiftRightUnsigned { :self :anObject |
		<primitive: return _self >>> _anObject;>
	}

	uncheckedBitXor { :self :anObject |
		<primitive: return _self ^ _anObject;>
	}

	uncheckedCountLeadingZeroes { :self |
		<primitive:
		if(sl.isBitwise(_self)) {
			return Math.clz32(_self);
		}
		>
		self.error('SmallFloat>>uncheckedCountLeadingZeroes')
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

	uncheckedPower { :self :operand |
		<primitive:
		const answer = Math.pow(_self, _operand);
		/*sl.checkSmallFloatOverflow(_self, _operand, answer);*/
		return answer;
		>
	}

	uncheckedPrintString { :self :radix |
		<primitive:
		if(Object.is(_self, -0)) {
			return "-0"
		};
		if(Number.isFinite(_self)) {
			return _self.toString(_radix).toUpperCase();
		};
		return _self.toString();
		>
	}

	uncheckedSquareRoot { :self |
		<primitive: return Math.sqrt(_self)>
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
		0
	}

}

+@Collect {

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
		<primitive: return Number(_self);>
	}

	uncheckedParseInteger { :self :radix |
		<primitive: return Number.parseInt(_self, _radix);>
	}

	uncheckedParseNumber { :self |
		<primitive: return Number.parseFloat(_self);>
	}

}

+List {

	fromSignExponentMantissa { :self |
		(-1 ^ self[1]) * (2 ^ self[2]) * self[3]
	}

}

+Void {

	eulersNumber {
		1.exp
	}

}
