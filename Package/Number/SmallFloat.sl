/* Requires: RegularExpression String */

SmallFloat! : [Object, Storeable, Equatable, Comparable, Json, Magnitude, Number, Integer, Binary] {

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
			anObject.adaptToNumberAndApply(self, ^)
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

	adaptToIntegerAndApply { :self :anInteger :aBlock:/2 |
		anInteger.isLargeInteger.if {
			aBlock(anInteger.asSmallFloat, self)
		} {
			self.error('adaptToIntegerAndApply: ?')
		}
	}

	addI32 { :a :b |
		(a + b).wrapExclusive(-2147483648, 2147483647 + 1)
	}

	asFloat { :self |
		self
	}

	asInteger { :self |
		self.asSmallInteger
	}

	asSmallFloat { :self |
		self
	}

	asSmallInteger { :self |
		self.isSmallInteger.if {
			self
		} {
			self.error('SmallFloat>>asSmallInteger: not integer')
		}
	}

	assertIsSmallInteger { :self |
		self.assert {
			self.isSmallInteger
		}
	}

	atRandom { :self |
		system.nextRandomFloat(0, self)
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

	bitRotateLeftI32 { :self :anInteger |
		<primitive: return (_self << _anInteger) | (_self >>> (32 - _anInteger));>
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
		anObject.adaptToNumberAndApply(self, bitXor:/2)
	}

	byteHexString { :self |
		self.isByte.if {
			self
			.basicPrintString(16)
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

	copy { :self |
		self
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

	floor { :self |
		<primitive: return Math.floor(_self)>
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
					let other = aNumber.asSmallFloat;
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

	isEven { :self |
		<primitive: return _self % 2 === 0;>
	}

	isExact { :self |
		self.isSmallInteger
	}

	isFinite { :self |
		<primitive: return Number.isFinite(_self);>
	}

	isImmediate { :unused |
		true
	}

	isInteger { :self |
		<primitive: return Number.isInteger(_self);>
	}

	isInteger { :self :epsilon |
		(self - self.round).abs < epsilon
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

	log2 { :self |
		<primitive: return Math.log2(_self)>
	}

	log10 { :self |
		<primitive: return Math.log10(_self)>
	}

	max { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.max(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, max:/2)
	}

	min { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.min(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, min:/2)
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

	multiplyI32 { :m :n |
		/* <primitive: return ((_m & 0xffff) * _n) + ((((_m >>> 16) * _n) & 0xffff) << 16);> */
		<primitive: return Math.imul(_m, _n);>
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
		(base != 10).if {
			self.error('SmallFloat>>realDigits: not implemented unless base=10')
		} {
			let exponent = (self.log10 + 1).round;
			[
				(self * (10 ^ (size - exponent))).round.integerDigits(10, size),
				exponent
			]
		}
	}

	reduce { :self |
		self.isCloseTo(self.round).if {
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

	sqrt { :self |
		self.isNegative.if {
			Complex(self, 0).sqrt
		} {
			self.uncheckedSqrt
		}
	}

	storeString { :self |
		self.printString(10)
	}

	truncate { :self |
		<primitive: return Math.trunc(_self)>
	}

	uncheckedSqrt { :self |
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

+@Collection {

	isFinite { :self |
		self.allSatisfy(isFinite:/1)
	}

	isNaN { :self |
		self.collect(isNaN:/1)
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
				let c = self.asList;
				(c[1] = '-' | { c[1] = '+' }).ifTrue {
					c.removeAt(1)
				};
				c.collect(digitValue:/1).allSatisfy { :each |
					each >= 0 & { each < radix }
				}
			}
		}
	}

	parseDecimalInteger { :self :elseClause:/0 |
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

	parseDecimalNumeral { :self :elseClause:/0 |
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

	parseNumber { :self :elseClause:/0 |
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

	parseScientificNotation { :self :elseClause:/0 |
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
		let [a, b] = self.splitBy(';');
		let [p, q] = [a, b].collect { :each |
			each.splitBy(',').collect(parseDecimalInteger:/1)
		};
		let [m, n] = [p, q].collect(size:/1);
		(p * (60 ^ (m - 1).toBy(0, -1))).sum + (q / (60 ^ 1.to(n))).sum
	}

	parseSmallInteger { :self :radix :elseClause:/0 |
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
