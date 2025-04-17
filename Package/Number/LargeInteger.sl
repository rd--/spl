/* Requires: SmallFloat String */

LargeInteger! : [Object, Binary, Magnitude, Number, Integer] {

	== { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	= { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self === BigInt(_anObject);
		} else {
			return false;
		}
		>
	}

	~ { :self :anObject |
		self = anObject
	}

	< { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self < BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, <)
	}

	<= { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self <= BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, <=)
	}

	+ { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self + BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, +)
	}

	- { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self - BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, -)
	}

	* { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self * BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, *)
	}

	/ { :self :anObject |
		anObject.isInteger.if {
			let fraction = Fraction(self, anObject.asLargeInteger);
			fraction.isInteger.if {
				fraction.numerator
			} {
				fraction
			}
		} {
			anObject.adaptToIntegerAndApply(self, /)
		}
	}

	// { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self / BigInt(_anObject);
		};
		>
		anObject.adaptToIntegerAndApply(self, //)
	}

	% { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			const i = BigInt(_anObject);
			return ((_self % i) + i) % i;
		}
		>
		anObject.adaptToIntegerAndApply(self, %)
	}

	^ { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self ** BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, ^)
	}

	^ { :self :anObject |
		anObject.isScalarInteger.if {
			self.raisedToInteger(anObject)
		} {
			anObject.adaptToNumberAndApply(self, ^)
		}
	}

	<< { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self << _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self << BigInt(_anObject);
		}
		>
		self.error('shiftLeft: operand not a LargeInteger or SmallFloat')
	}

	>> { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self >> _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self >> BigInt(_anObject);
		}
		>
		self.error('shiftRight: operand not a LargeInteger or SmallFloat')
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(aNumber.asLargeInteger, self)
	}

	asFloat { :self |
		self.asSmallFloat
	}

	asInteger { :self |
		self.isSmallInteger.if {
			self.asSmallFloat
		} {
			self
		}
	}

	asLargeInteger { :self |
		self
	}

	asSmallFloat { :self |
		<primitive: return Number(_self);>
	}

	atRandom { :self |
		system.nextRandomInteger(1, self.asSmallFloat)
	}

	basicPrintString { :self :radix |
		<primitive: return _self.toString(_radix).toUpperCase();>
	}

	bitAnd { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self & _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self & BigInt(_anObject);
		}
		>
		self.error('bitAnd: operand not a LargeInteger or SmallFloat')
	}

	bitOr { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self | _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self | BigInt(_anObject);
		}
		>
		self.error('bitOr: operand not a LargeInteger or SmallFloat')
	}

	bitXor { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self ^ _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self ^ BigInt(_anObject);
		}
		>
		self.error('bitXor: operand not a LargeInteger or SmallFloat')
	}

	floorLog { :self :radix |
		(self <= 0).if {
			self.error('LargeInteger>>floorLog: is only defined for x > 0')
		} {
			self.numberOfDigitsInBase(radix) - 1
		}
	}

	highBitOfMagnitude { :self |
		valueWithReturn { :return:/1 |
			let realLength = self.digitLength;
			let lastDigit = self.digitAt(realLength);
			{
				lastDigit = 0
			}.whileTrue {
				realLength := realLength - 1;
				(realLength = 0).ifTrue {
					0.return
				}
			};
			lastDigit.asSmallFloat.highBitOfByte + (8 * (realLength - 1))
		}
	}

	isEven { :self |
		(self % 2L) = 0L
	}

	isExact { :unused |
		true
	}

	isInteger { :unused |
		true
	}

	isLiteral { :unused |
		true
	}

	isOdd { :self |
		(self % 2L) = 1L
	}

	isRational { :unused |
		true
	}

	isSmallInteger { :self |
		self.abs <= (2L ^ 53 - 1)
	}

	isVeryCloseTo { :self :aNumber |
		self = aNumber
	}

	isZero { :self |
		self = 0L
	}

	nthRoot { :self :aNumber |
		self.asSmallFloat.nthRoot(aNumber.asSmallFloat)
	}

	log { :self |
		self.asFloat.log
	}

	log2 { :self |
		self.asFloat.log2
	}

	log10 { :self |
		self.asFloat.log10
	}

	one { :unused |
		1L
	}

	printString { :self |
		self.storeString
	}

	quotient { :self :anInteger |
		self // anInteger
	}

	raisedToInteger { :self :anInteger |
		<primitive: return _self ** BigInt(_anInteger);>
	}

	remainder { :self :anInteger |
		<primitive: return _self % BigInt(_anInteger);>
	}

	shallowCopy { :self |
		self
	}

	sqrt { :self |
		<primitive:
		/* https://github.com/Aisse-258/bigint-isqrt */
		if (_self < 2n) {
			return _self;
		}
		if (_self < 16n) {
			return BigInt(Math.sqrt(Number(_self)) | 0);
		}
		let x0, x1;
		if (_self < 4503599627370496n) {
			x1 = BigInt(Math.sqrt(Number(_self)) | 0) - 3n;
		} else {
			const vlen = _self.toString().length;
			if (!(vlen & 1)) {
				x1 = 10n ** (BigInt(vlen / 2));
			} else {
				x1 = 4n * 10n ** (BigInt((vlen / 2) | 0));
			}
		}
		do {
			x0 = x1;
			x1 = ((_self / x0) + x0) >> 1n;
		} while ((x0 !== x1 && x0 !== (x1 - 1n)));
		return x0;
		>
	}

	storeString { :self |
		self.basicPrintString(10) ++ 'L'
	}

	toNumber { :self :precision |
		<primitive: BigInt.asIntN(_precision, _self);>
	}

	unit { :unused |
		1L
	}

	zero { :unused |
		0L
	}

}

+SmallFloat {

	asLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

+String {

	basicParseLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

	parseLargeInteger { :self |
		self.endsWith('L').if {
			self.allButLast.basicParseLargeInteger
		} {
			self.basicParseLargeInteger
		}
	}

}

+ByteArray {

	asLargeInteger { :self |
		let answer = 0L;
		self.withIndexDo { :each :i |
			answer := answer + (each << (i - 1L * 8))
		};
		answer
	}

}
