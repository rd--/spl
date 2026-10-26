/* Requires: SmallFloat String */

LargeInteger! : [Object, Copy, Store, Equal, Compare, Binary, Number, Integer, ImplicitFloat] {

	[Integer, normalInteger] { :self |
		self.isSmallInteger.if {
			SmallFloat(self)
		} {
			self
		}
	}

	[LargeInteger, L] { :self |
		self
	}

	[SmallFloat, Float, largeIntegerToSmallFloat] { :self |
		<primitive: return Number(_self);>
	}

	[SmallInteger, largeIntegerToSmallInteger]  { :self |
		self.isSmallInteger.if {
			SmallFloat(self)
		} {
			self.error('LargeInteger>>SmallInteger: not small integer')
		}
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		aNumber.isInteger.if {
			aBlock(LargeInteger(aNumber), self)
		} {
			aBlock(aNumber, SmallFloat(self))
		}
	}

	atRandom { :self |
		system.nextRandomInteger(1, SmallFloat(self))
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

	bitNot { :self |
		<primitive: return ~_self;>
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

	[bitShiftLeft, <<] { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self << BigInt(_anObject);
		}
		>
		self.error('bitShiftLeft: operand not a LargeInteger or SmallInteger')
	}

	[bitShiftRight, >>] { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self >> BigInt(_anObject);
		}
		>
		self.error('bitShiftRight: operand not a LargeInteger or SmallInteger')
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

	countLeadingZeroes { :self :base :wordSize |
		self.integerDigits(base, wordSize).takeWhile(isZero/1).size
	}

	decimalPeriod { :unused |
		0
	}

	denominator { :self |
		1L
	}

	[divide, /] { :self :anObject |
		anObject.isInteger.if {
			let fraction = Fraction(
				self,
				LargeInteger(anObject)
			);
			fraction.isInteger.if {
				fraction.numerator
			} {
				fraction
			}
		} {
			anObject.adaptToIntegerAndApply(self, divide/2)
		}
	}

	floorLog { :self :radix |
		(self <= 0).if {
			self.error('LargeInteger>>floorLog: is only defined for x > 0', [radix])
		} {
			self.numberOfDigitsInBase(radix) - 1
		}
	}

	highBitOfInteger { :self |
		withReturn { :return/1 |
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
			SmallFloat(lastDigit).highBitOfByte + (8 * (realLength - 1))
		}
	}

	integerDigits { :self :radix |
		radix.isBetween(2, 36).if {
			self.abs.uncheckedPrintString(radix).characters.digitValue
		} {
			SmallInteger(self).integerDigits(radix)
		}.collect(LargeInteger/1)
	}

	integerLength { :self :radix |
		self.uncheckedPrintString(radix).size
	}

	[integerSquareRoot, isqrt] { :self |
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

	[isEqual, =] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self === BigInt(_anObject);
		};
		>
		false
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

	isInteger { :unusedSelf :unusedEpsilon |
		true
	}

	[isLess, <] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self < BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, isLess/2)
	}

	isLiteral { :unused |
		true
	}

	isNaN { :unused |
		false
	}

	isOdd { :self |
		(self % 2L) = 1L
	}

	isRational { :unused |
		true
	}

	isRepeatingDecimal { :unused |
		false
	}

	[isSimilar, ~] { :self :anObject |
		SmallFloat(self) ~ anObject
	}

	isSmallInteger { :self |
		self.abs <= (2L ^ 53 - 1)
	}

	isSquare { :n |
		let m = n.integerSquareRoot;
		(m * m) = n
	}

	isTerminatingDecimal { :unused |
		true
	}

	isVeryClose { :self :aNumber |
		self = aNumber
	}

	isZero { :self |
		self = 0L
	}

	[mod, %] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			const i = BigInt(_anObject);
			return ((_self % i) + i) % i;
		}
		>
		anObject.adaptToIntegerAndApply(self, mod/2)
	}

	numberOfDigitsInBase { :self :radix |
		self.integerDigits(radix).size
	}

	numerator { :self |
		self
	}

	one { :unused |
		1L
	}

	[plus, +] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self + BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, plus/2)
	}

	[power, ^] { :self :anObject |
		anObject.isInteger.if {
			self.raisedToInteger(anObject)
		} {
			anObject.adaptToIntegerAndApply(self, power/2)
		}
	}

	printString { :self |
		self.storeString
	}

	promoteBinary { :self |
		self
	}

	[quotient, //] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self / BigInt(_anObject);
		};
		>
		anObject.adaptToIntegerAndApply(self, quotient/2)
	}

	raisedToInteger { :self :operand |
		operand.isNegative.if {
			1L / self.raisedToPositiveInteger(-operand)
		} {
			self.raisedToPositiveInteger(operand)
		}
	}

	raisedToPositiveInteger { :self :operand |
		<primitive:
		if (sl.isLargeInteger(_operand) || sl.isSmallFloatInteger(_operand)) {
			return _self ** BigInt(_operand);
		}
		>
		self.error('raisedToPositiveInteger: not integer')
	}

	[remainder, \\] { :self :operand |
		<primitive:
		if (sl.isLargeInteger(_operand) || sl.isSmallFloatInteger(_operand)) {
			return _self % BigInt(_operand);
		}
		>
		self.error('remainder: not integer')
	}

	shallowCopy { :self |
		self
	}

	signedInteger { :self :bitCount |
		<primitive: return BigInt.asIntN(_bitCount, _self);>
	}

	storeString { :self |
		self.storeStringLiteral
	}

	storeStringLiteral { :self |
		self.uncheckedPrintString(10) ++ 'L'
	}

	[subtract, -] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self - BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, subtract/2)
	}

	[times, *] { :self :anObject |
		<primitive:
		if (sl.isLargeInteger(_anObject) || sl.isSmallFloatInteger(_anObject)) {
			return _self * BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, times/2)
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

	uncheckedPrintString { :self :radix |
		<primitive: return _self.toString(_radix).toUpperCase();>
	}

	uncheckedRaisedToInteger { :self :anInteger |
		<primitive: return _self ** BigInt(_anInteger);>
	}

	uncheckedRemainder { :self :anInteger |
		<primitive: return _self % BigInt(_anInteger);>
	}

	unsignedInteger { :self :bitCount |
		<primitive: return BigInt.asUintN(_bitCount, _self);>
	}

	zero { :unused |
		0L
	}

}

+SmallFloat {

	[LargeInteger, L, smallFloatToLargeInteger] { :self |
		self.isNaN.if {
			NaN
		} {
			self.isSmallInteger.if {
				self.uncheckedLargeInteger
			} {
				self.error('LargeInteger: not SmallInteger')
			}
		}
	}

	uncheckedLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

+String {

	parseLargeInteger { :self :elseClause/0 |
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

	uncheckedParseLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

+ByteArray {
	decodeLargeInteger { :self :littleEndian |
		let k = self.size;
		let f = { :n |
			littleEndian.if { n - 1L } { k - n } * 8
		};
		let answer = 0L;
		self.withIndexDo { :each :i |
			answer := answer + (each << f(i))
		};
		answer
	}
}

+List {

	[LargeInteger, L] { :self |
		self.collect(LargeInteger/1)
	}

}
