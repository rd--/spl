{- Requires: RegExp String -}

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
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self << _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, <<)
	}

	>> { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return sl.shiftRight(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, >>)
	}


	abs { :self |
		<primitive: return Math.abs(_self)>
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :each |
			aBlock(each, self)
		}
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

	asLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

	asSmallFloat { :self |
		self
	}

	assertIsSmallInteger { :self |
		self.assert {
			self.isSmallInteger
		}
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
			let hexString = self.printString(16);
			(self < 16).if {
				'0' ++ hexString
			} {
				hexString
			}
		} {
			self.error('byteHexString: not a byte')
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

	hypot { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.hypot(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, hypot:/2)
	}

	isBinary { :self |
		<primitive: return sl.isBitwise(_self);>
	}

	isCloseToBy { :self :aNumber :epsilon |
		aNumber.isNumber.not.if {
			{ self = aNumber }.ifError { false }
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

	isFinite { :self |
		<primitive: return Number.isFinite(_self);>
	}

	isFraction { :self |
		self.isInteger
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
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.min(_self, _anObject); }>
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

	nthRoot { :self :aPositiveInteger |
		(aPositiveInteger = 2).if {
			self.sqrt
		} {
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
	}


	Number { :self |
		self
	}

	one { :self |
		1
	}

	printString { :self :radix |
		<primitive:
		if(Object.is(_self, -0)) {
			return "-0"
		};
		if(Number.isFinite(_self)) {
			return _self.toString(_radix);
		}
		>
		self.isPositive.if {
			'inf'
		} {
			'(0 - inf)'
		}
	}

	raisedToSmallFloat { :self :aSmallFloat |
		<primitive:
		if(sl.isSmallFloat(_aSmallFloat)) {
			return Math.pow(_self, _aSmallFloat);
		}
		>
		'SmallFloat>>raisedToSmallFloat: not SmallFloat'.error
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
		<primitive: return sl.signExponentMantissa(_self);>
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

	weierstrassFunction { :x :a :m |
		1:m.collect { :k |
			(pi * (k ^ a) * x).sin / (pi * (k ^ a))
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

	parseInteger { :self :radix |
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

	parseNumber { :self |
		self.assert {
			self.matchesRegExp('^[0-9e.+-]+$')
		};
		self.basicParseNumber
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

Constant.inf = Infinity
Constant.pi = 3.1415926535897932384626433
Constant.e = 2.71828182845904523536028747135266249775724709369995
Constant.epsilon = 0.000000000000001
