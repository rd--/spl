/* Requires: RegExp String */

SmallFloat! : [Object, Json, Magnitude, Number, Integer, Binary] {

	= { :self :anObject |
		anObject.isNumber.if {
			anObject.isSmallFloat.if {
				self == anObject
			} {
				anObject.adaptToNumberAndApply(self, =)
			}
		} {
			false
		}
	}

	< { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self < _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, <)
	}

	<= { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self <= _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, <=)
	}

	+ { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self + _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, +)
	}

	- { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self - _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, -)
	}

	* { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self * _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, *)
	}

	/ { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self / _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, /)
	}

	% { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return ((_self % _anObject) + _anObject) % _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, %)
	}

	^ { :self :anObject |
		anObject.isInteger.if {
			self.raisedToInteger(anObject)
		} {
			anObject.isSmallFloat.if {
				self.raisedToSmallFloat(anObject)
			} {
				anObject.adaptToNumberAndApply(self, ^)
			}
		}
	}

	<< { :self :anObject |
		<primitive:
		if(sl.isBitwise(_anObject)) {
			return _self << _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, <<)
	}

	>> { :self :anObject |
		<primitive:
		if(sl.isBitwise(_anObject)) {
			return _self >> _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, >>)
	}


	>>> { :self :anObject |
		<primitive:
		if(sl.isBitwise(_anObject)) {
			return _self >>> _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, >>>)
	}

	abs { :self |
		<primitive: return Math.abs(_self)>
	}

	arcCos { :self |
		<primitive: return Math.acos(_self)>
	}

	arcCosh { :self |
		<primitive: return Math.acosh(_self)>
	}

	arcSin { :self |
		<primitive: return Math.asin(_self)>
	}

	arcSinh { :self |
		<primitive: return Math.asinh(_self)>
	}

	arcTan { :self |
		<primitive: return Math.atan(_self)>
	}

	arcTan { :self :anObject |
		anObject.atan2(self)
	}

	asFloat { :self |
		self
	}

	asInteger { :self |
		self.truncated
	}

	asSmallFloat { :self |
		self
	}

	assertIsSmallInteger { :self |
		self.assert {
			self.isSmallInteger
		}
	}

	atRandom { :self :shape :rng |
		rng.randomReal([0, self], shape)
	}

	basicPrintString { :self :radix |
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

	basicSqrt { :self |
		<primitive: return Math.sqrt(_self)>
	}

	atan2 { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.atan2(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, atan2:/2)
	}

	bitAnd { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self & _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, bitAnd:/2)
	}

	bitNot { :self |
		<primitive:
		if(sl.isBitwise(_self)) {
			return ~_self;
		}
		>
		anObject.adaptToNumberAndApply(self, bitNot:/1)
	}

	bitOr { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self | _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, bitOr:/2)
	}

	bitTest { :self :anInteger |
		self.bitAnd(1 << (anInteger - 1)) ~= 0
	}

	bitXor { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self ^ _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, bitXor:/2)
	}

	byteHexString { :self |
		self.isByte.if {
			self.basicPrintString(16).padLeft([2], '0')
		} {
			self.error('SmallFloat>>byteHexString: not a byte')
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

	cos { :self |
		<primitive: return Math.cos(_self);>
	}

	cosecant { :self |
		1 / self.sin
	}

	cosh { :self |
		<primitive: return Math.cosh(_self);>
	}

	cotangent { :self |
		1 / self.tan
	}

	cubeRoot { :self |
		<primitive: return Math.cbrt(_self);>
	}

	encodeFloat32 { :self :littleEndian |
		<primitive: return sc.encodeFloat32(_self, _littleEndian);>
	}

	encodeFloat64 { :self :littleEndian |
		<primitive: return sc.encodeFloat64(_self, _littleEndian);>
	}

	encodeInt8 { :self |
		<primitive: return sc.encodeInt8(_self);>
	}

	encodeInt16 { :self :littleEndian |
		<primitive: return sc.encodeInt16(_self, _littleEndian);>
	}

	encodeInt32 { :self :littleEndian |
		<primitive: return sc.encodeInt32(_self, _littleEndian);>
	}

	exp { :self |
		<primitive: return Math.exp(_self)>
	}

	fibonacci { :n |
		let phi = 1.goldenRatio;
		((phi ^ n) - (n.pi.cos * (phi ^ n.-))) / 5.sqrt
	}

	floor { :self |
		<primitive: return Math.floor(_self)>
	}

	fractionPart { :self |
		<primitive: return _self % 1;>
	}

	hypotenuse { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.hypot(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, hypotenuse:/2)
	}

	isBinary { :self |
		<primitive: return sl.isBitwise(_self);>
	}

	isCloseToBy { :self :aNumber :epsilon |
		aNumber.isNumber.not.if {
			false
		} {
			(self = 0).if {
				aNumber.abs < epsilon
			} {
				(aNumber = 0).if {
					self.abs < epsilon
				} {
					self = aNumber.asSmallFloat | {
						let z = self.abs;
						(z < epsilon).if {
							aNumber.abs < epsilon
						} {
							(self - aNumber).abs / (z.max(aNumber.abs)) < epsilon
						}
					}
				}
			}
		}
	}

	isCloseTo { :self :aNumber |
		self.isCloseToBy(aNumber, 0.0001)
	}

	isEven { :self |
		<primitive: return _self % 2 === 0;>
	}

	isExact { :self |
		self.isSmallInteger
	}

	isFinite { :self |
		<primitive: return Number.isFinite(_self);>
	}

	isImmediate { :self |
		true
	}

	isInteger { :self |
		<primitive: return Number.isInteger(_self);>
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
	}

	isRational { :self |
		self.isInteger
	}

	isSmallInteger { :self |
		<primitive: return Number.isSafeInteger(_self);>
	}

	isVeryCloseTo { :self :aNumber |
		self.isCloseToBy(aNumber, 0.000000000001)
	}

	log { :self |
		<primitive: return Math.log(_self)>
	}

	log { :self :base |
		<primitive: return Math.log(_self) / Math.log(_base)>
	}

	log2 { :self |
		<primitive: return Math.log2(_self)>
	}

	log10 { :self |
		<primitive: return Math.log10(_self)>
	}

	lucasNumber { :self |
		let phi = 1.goldenRatio;
		(phi ^ self) + (self.pi.cos * (phi ^ self.negated))
	}

	min { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.min(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, min:/2)
	}

	max { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.max(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, max:/2)
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

	newtonRaphsonMethod { :epsilon :tolerance :iterationCount :x0 :f:/1 :fPrime:/1 |
		valueWithReturn { :return:/1 |
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
				(self.negated ^ (1 / aPositiveInteger)).negated
			} {
				'nthRoot: negative numbers do not have even roots.'.error
			}
		} {
			self ^ (1 / aPositiveInteger)
		}
	}

	/*Number { :self |
		self
	}*/

	one { :self |
		1
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

	raisedToSmallFloat { :self :aSmallFloat |
		<primitive:
		if(sl.isSmallFloat(_aSmallFloat)) {
			return Math.pow(_self, _aSmallFloat);
		}
		>
		'SmallFloat>>raisedToSmallFloat: not SmallFloat'.error
	}

	realDigits { :self :base :size |
		(base ~= 10).if {
			self.error('SmallFloat>>realDigits: not implemented unless base=10')
		} {
			let exponent = (self.log10 + 1).rounded;
			[
				(self * (10 ^ (size - exponent))).rounded.integerDigits(10, size),
				exponent
			]
		}
	}

	reduce { :self |
		self.isCloseTo(self.rounded).if {
			self.rounded
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

	rounded { :self |
		<primitive: return Math.round(_self)>
	}

	secant { :self |
		1 / self.cos
	}

	shallowCopy { :self |
		self
	}

	sign { :self |
		<primitive: return Math.sign(_self);>
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

	sin { :self |
		<primitive: return Math.sin(_self)>
	}

	sinc { :self |
		self.isZero.if {
			1
		} {
			self.sin / self
		}
	}

	sincNormalized { :self |
		self.pi.sinc
	}

	sinh { :self |
		<primitive: return Math.sinh(_self)>
	}

	sqrt { :self |
		self.isNegative.if {
			Complex(self, 0).sqrt
		} {
			self.basicSqrt
		}
	}

	storeString { :self |
		self.printString(10)
	}

	tan { :self |
		<primitive: return Math.tan(_self)>
	}

	tanh { :self |
		<primitive: return Math.tanh(_self)>
	}

	truncated { :self |
		<primitive: return Math.trunc(_self)>
	}

	unsigned32BitWordList { :self |
		<primitive:
		const f64 = new Float64Array(1);
		const u32 = new Uint32Array(f64.buffer);
		f64[0] = _self;
		return [u32[0], u32[1]];
		>
	}

	weierstrassFunction { :x :a :m |
		1:m.collect { :k |
			((k ^ a).pi * x).sin / (k ^ a).pi
		}.sum
	}

	zero { :self |
		0
	}

}

+@Object {

	isSmallInteger { :self |
		false
	}

}

+@Collection {

	isFinite { :self |
		self.allSatisfy(isFinite:/1)
	}

}

+String {

	basicParseDecimalInteger { :self |
		<primitive: return Number(_self);>
	}

	basicParseInteger { :self :radix |
		<primitive: return Number.parseInt(_self, _radix);>
	}

	basicParseNumber { :self |
		<primitive: return Number.parseFloat(_self);>
	}

	parseDecimalInteger { :self |
		let answer = self.basicParseDecimalInteger;
		answer.isNaN.if {
			self.error('parseDecimalInteger: not a number')
		} {
			answer.isSmallInteger.if {
				answer
			} {
				self.error('parseDecimalInteger: not an integer')
			}
		}
	}

	parseNumber { :self |
		self.assert {
			self.matchesRegExp('^[0-9eE.+-]+$')
		};
		self.basicParseNumber
	}

	parseSmallInteger { :self :radix |
		radix.assertIsSmallInteger;
		self.assert {
			radix > 1 & {
				radix < 36 & {
					self.matchesRegExp('^[0-9a-zA-Z-]+$')
				}
			}
		};
		self.basicParseInteger(radix).assertIsSmallInteger
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
