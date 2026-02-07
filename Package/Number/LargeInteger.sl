/* Requires: SmallFloat String */

LargeInteger! : [Object, Storeable, Equatable, Comparable, Binary, Magnitude, Number, Integer] {

	[less, <] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self < BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, <)
	}

	[bitShiftLeft, <<] { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self << _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self << BigInt(_anObject);
		}
		>
		self.error('bitShiftLeft: operand not a LargeInteger or SmallFloat')
	}

	[bitShiftRight, >>] { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self >> _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self >> BigInt(_anObject);
		}
		>
		self.error('bitShiftRight: operand not a LargeInteger or SmallFloat')
	}

	[divide, /] { :self :anObject |
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

	[equal, =] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self === BigInt(_anObject);
		} else {
			return false;
		}
		>
	}

	[mod, %] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			const i = BigInt(_anObject);
			return ((_self % i) + i) % i;
		}
		>
		anObject.adaptToIntegerAndApply(self, %)
	}

	[plus, +] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self + BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, +)
	}

	/*
	^ { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self ** BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, ^)
	}
	*/

	[power, ^] { :self :anObject |
		anObject.isScalarInteger.if {
			self.raisedToInteger(anObject)
		} {
			anObject.adaptToIntegerAndApply(self, ^)
		}
	}

	[quotient, //] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self / BigInt(_anObject);
		};
		>
		anObject.adaptToIntegerAndApply(self, quotient:/2)
	}

	[similar, ~] { :self :anObject |
		self.asSmallFloat ~ anObject
	}

	[subtract, -] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self - BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, -)
	}

	[times, *] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self * BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, *)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.isInteger.if {
			aBlock(aNumber.asLargeInteger, self)
		} {
			aBlock(aNumber, self.asSmallFloat)
		}
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

	asSmallInteger { :self |
		self.isSmallInteger.if {
			self.asSmallFloat
		} {
			self.error('LargeInteger>>asSmallInteger: not small integer')
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

	copy { :self |
		self
	}

	floorLog { :self :radix |
		(self <= 0).if {
			self.error('LargeInteger>>floorLog: is only defined for x > 0')
		} {
			self.numberOfDigitsInBase(radix) - 1
		}
	}

	/*
	gcd { :self :anInteger |
		anInteger.isLargeInteger.if {
			self.uncheckedGcd(anInteger)
		} {
			anInteger.adaptToNumberAndApply(self, gcd:/2)
		}
	}
	*/

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

	isCloseToBy { :self :aNumber :epsilon |
		self.asFloat.isCloseToBy(aNumber.asFloat, epsilon)
	}

	isEven { :self |
		(self % 2L) = 0L
	}

	isExact { :unused |
		true
	}

	isFinite { :unused |
		true
	}

	isImmediate { :unused |
		false /* 1L !== 1 */
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

	normal { :self |
		self.asInteger
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

	printStringToFixed { :self :anInteger |
		self.asSmallInteger.printStringToFixed(anInteger)
	}

	raisedToInteger { :self :anInteger |
		<primitive:
		if (sl.isLargeInteger(_anInteger) || sl.isSmallFloatInteger(_anInteger)) {
			return _self ** BigInt(_anInteger);
		}
		>
		self.error('raisedToInteger: not integer')
	}

	[remainder, \\] { :self :anInteger |
		<primitive:
		if (sl.isLargeInteger(_anInteger) || sl.isSmallFloatInteger(_anInteger)) {
			return _self % BigInt(_anInteger);
		}
		>
		self.error('remainder: not integer')
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

	storeStringLiteral { :self |
		self.basicPrintString(10) ++ 'L'
	}

	storeString { :self |
		self.storeStringLiteral
	}

	toNumber { :self :precision |
		<primitive: BigInt.asIntN(_precision, _self);>
	}

	uncheckedGcd { :self :anInteger |
		<primitive:
		let a = _self;
		let b = _anInteger;
		while (b !== 0n) {
			const r = a % b;
			a = b;
			b = r;
		}
		return a;
		>
	}

	uncheckedRaisedToInteger { :self :anInteger |
		<primitive: return _self ** BigInt(_anInteger);>
	}

	uncheckedRemainder { :self :anInteger |
		<primitive: return _self % BigInt(_anInteger);>
	}

	zero { :unused |
		0L
	}

}

+SmallFloat {

	LargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

	asLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

+String {

	uncheckedParseLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

	parseLargeInteger { :self :elseClause:/0 |
		self.endsWith('L').ifTrue {
			self := self.allButLast
		};
		self.isDecimalIntegerString.if {
			self.uncheckedParseLargeInteger
		} {
			elseClause()
		}
	}

	parseLargeInteger { :self |
		self.parseLargeInteger {
			self.error('parseLargeInteger: invalid input')
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
