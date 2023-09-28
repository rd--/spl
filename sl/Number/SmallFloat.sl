(* Requires: RegExp String *)

SmallFloat! : [Object, Json, Magnitude, Number, Integer, Binary] {

	= { :self :aNumber |
		<primitive: return _self === _aNumber;>
	}

	< { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self < _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, lessThan:/2)
	}

	<= { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self <= _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, lessThanEquals:/2)
	}

	+ { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self + _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, plus:/2)
	}

	- { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self - _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, minus:/2)
	}

	* { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self * _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, times:/2)
	}

	/ { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self / _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, dividedBy:/2)
	}

	% { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return ((_self % _anObject) + _anObject) % _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, modulo:/2)
	}

	^ { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.pow(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, raisedTo:/2)
	}

	<< { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self << _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, lessThanLessThan:/2)
	}

	>> { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return sl.shiftRight(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, greaterThanGreaterThan:/2)
	}


	abs { :self |
		<primitive: return Math.abs(_self)>
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :each |
			aBlock(each, self)
		}
	}

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		aFraction.SmallFloat.aBlock(self)
	}

	arcCos { :self |
		<primitive: return Math.acos(_self)>
	}

	arcSin { :self |
		<primitive: return Math.asin(_self)>
	}

	arcTan { :self |
		<primitive: return Math.atan(_self)>
	}

	arcTan { :self :anObject |
		self.atan2(anObject)
	}

	asFloat { :self |
		self
	}

	assertIsSmallInteger { :self |
		self.assert {
			self.isSmallInteger
		}
	}

	asInteger { :self |
		self.truncated
	}

	atan2 { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.atan2(_self, _anObject); }>
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
			| hexString = self.printString(16); |
			(self < 16).if {
				'0' ++ hexString
			} {
				hexString
			}
		} {
			self.error('byteHexString: not a byte')
		}
	}

	closeToBy { :self :aNumber :epsilon |
		aNumber.isNumber.not.if {
			{ self = aNumber }.ifError { false }
		} {
			(self = 0).if {
				aNumber.abs < epsilon
			} {
				(aNumber = 0).if {
					self.abs < epsilon
				} {
					(self = aNumber.SmallFloat) | {
						| z = self.abs; |
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

	closeTo { :self :aNumber |
		self.closeToBy(aNumber, 0.0001)
	}

	cos { :self |
		<primitive: return Math.cos(_self);>
	}

	cosh { :self |
		<primitive: return Math.cosh(_self);>
	}

	cubeRoot { :self |
		<primitive: return Math.cbrt(_self);>
	}

	even { :self |
		<primitive: return _self % 2 === 0;>
	}

	exp { :self |
		<primitive: return Math.exp(_self)>
	}

	floor { :self |
		<primitive: return Math.floor(_self)>
	}

	fractionPart { :self |
		<primitive: return _self % 1;>
	}

	isBinary { :self |
		<primitive: return sl.isBitwise(_self);>
	}

	isFinite { :self |
		<primitive: return Number.isFinite(_self);>
	}

	isFraction { :self |
		self.isInteger
	}

	isInteger { :self |
		<primitive: return Number.isInteger(_self);>
	}

	isNaN { :self |
		<primitive: return Number.isNaN(_self);>
	}

	isSmallInteger { :self |
		<primitive: return Number.isSafeInteger(_self);>
	}

	isZero { :self |
		self = 0
	}

	LargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

	log { :self |
		<primitive: return Math.log(_self)>
	}

	log2 { :self |
		<primitive: return Math.log2(_self)>
	}

	log10 { :self |
		<primitive: return Math.log10(_self)>
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

	Number { :self |
		self
	}

	odd { :self |
		<primitive: return Math.abs(_self % 2) === 1;>
	}

	one { :self |
		1
	}

	printString { :self :radix |
		<primitive:
		if(Number.isFinite(_self)) {
			return _self.toString(_radix);
		}
		>
		self.positive.if {
			'inf'
		} {
			'(0 - inf)'
		}
	}

	raisedToInteger { :self :anInteger |
		self ^ anInteger
	}

	randomFloat { :self |
		self * system.randomFloat
	}

	randomFloat { :self :aNumber |
		self + (aNumber - self).randomFloat
	}

	randomInteger { :self |
		1.randomFloat(self + 1).floor
	}

	randomInteger { :self :aNumber |
		self.randomFloat(aNumber + 1).floor
	}

	reduce { :self |
		self.closeTo(self.rounded).if {
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

	shallowCopy { :self |
		self
	}

	sign { :self |
		<primitive: return Math.sign(_self);>
	}

	sin { :self |
		<primitive: return Math.sin(_self)>
	}

	sinh { :self |
		<primitive: return Math.sinh(_self)>
	}

	SmallFloat { :self |
		self
	}

	sqrt { :self |
		<primitive: return Math.sqrt(_self)>
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

	veryCloseTo { :self :aNumber |
		self.closeToBy(aNumber, 0.000000000001)
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

	asInteger { :self |
		self.parseDecimalInteger
	}

	asNumber { :self |
		self.parseNumber
	}

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
		| answer = self.basicParseDecimalInteger; |
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
				radix < 36
			} & {
				self.matchesRegExp('^[0-9a-zA-Z-]+$')
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

+Void {

	eulersNumber {
		1.exp
	}

	epsilon {
		<primitive: return Number.EPSILON;>
	}

}

Constant.inf = Infinity
Constant.pi = 3.1415926535897932384626433
Constant.e = 2.71828182845904523536028747135266249775724709369995
Constant.epsilon = 0.000000000000001
