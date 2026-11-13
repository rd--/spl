/* Requires: List Float String */

Integer! : [Object, Copy, Store, Json, Equal, Compare, Binary, Number, Integer, ImplicitFloat] {

	[Float, F, integerToFloat] { :self |
		<primitive:
		return Number(_self);
		>
	}

	[Integer, L] { :self |
		self
	}

	[SmallInteger, integerToSmallInteger]  { :self |
		self.isSmallInteger.if {
			Float(self)
		} {
			self.error('Integer>>SmallInteger: not small integer')
		}
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		/* Model: SmallInteger | Integer */
		/*aNumber.isIntegerValuedNumber.if {
			aBlock(Integer(aNumber), self)
		} {*/
			aBlock(aNumber, Float(self))
		/*}*/
	}

	atRandom { :self |
		system.nextRandomSmallInteger(1.0, Float(self))
	}

	bitAnd { :self :operand |
		<primitive:
		if(sl.isInteger(_operand)) {
			return _self & _operand;
		} else if(sl.isFloat(_operand)) {
			return _self & BigInt(_operand);
		}
		>
		self.error('bitAnd: operand not a Integer or Float', [operand])
	}

	bitNot { :self |
		<primitive:
		return ~_self;
		>
	}

	bitOr { :self :operand |
		<primitive:
		if(sl.isInteger(_operand)) {
			return _self | _operand;
		} else if(sl.isFloat(_operand)) {
			return _self | BigInt(_operand);
		}
		>
		self.error('bitOr: operand not a Integer or Float', [operand])
	}

	[bitShiftLeft, <<] { :self :operand |
		<primitive:
		/* Model: SmallInteger | Integer */
		if(sl.isInteger(_operand) || sl.isSmallInteger(_operand)) {
			return _self << BigInt(_operand);
		}
		>
		operand.adaptToIntegerAndApply(self, bitShiftLeft/2)
	}

	[bitShiftRight, >>] { :self :operand |
		<primitive:
		/* Model: SmallInteger | Integer */
		if(sl.isInteger(_operand) || sl.isSmallInteger(_operand)) {
			return _self >> BigInt(_operand);
		}
		>
		operand.adaptToIntegerAndApply(self, bitShiftRight/2)
	}

	bitXor { :self :operand |
		<primitive:
		if(sl.isInteger(_operand)) {
			return _self ^ _operand;
		} else if(sl.isFloat(_operand)) {
			return _self ^ BigInt(_operand);
		}
		>
		self.error('bitXor: operand not a Integer or Float', [operand])
	}

	ceilingDivide { :a :b |
		(b < 0L).ifTrue {
			a := -a;
			b := -b
		};
		let q = a // b;
		let r = a \\ b;
		(r > 0L).if {
			q + 1L
		} {
			q
		}
	}

	concisePrintString { :self |
		self.integerString(10)
	}

	countLeadingZeroes { :self :base :wordSize |
		self.integerDigits(base, wordSize).takeWhile(isZero/1).size
	}

	decimalPeriod { :unused |
		0L
	}

	denominator { :self |
		1L
	}

	[divide, /] { :self :anObject |
		/* Model: SmallInteger | Integer */
		anObject.isInteger.if {
			Fraction(
				self,
				anObject
			)
		} {
			anObject.adaptToIntegerAndApply(self, divide/2)
		}
	}

	[encodeJson, floatToJson] { :self |
		Float(self).uncheckedEncodeJson
	}

	floorDivide { :a :b |
		let q = a // b;
		let r = a \\ b;
		(
			r != 0L & {
				((r < 0L) != (b < 0L))
			}
		).if  {
			q - 1L
		} {
			q
		}
	}

	floorLog { :self :radix |
		(self <= 0).if {
			self.error('Integer>>floorLog: is only defined for x > 0', [radix])
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
			Float(lastDigit).highBitOfByte + (8 * (realLength - 1))
		}
	}

	integerDigits { :self :radix |
		radix.isBetween(2, 36).if {
			self.abs.integerString(radix).characters.digitValue
		} {
			SmallInteger(self).integerDigits(radix)
		}.collect(Integer/1)
	}

	integerLength { :self :radix |
		self.isZero.if {
			0L
		} {
			Integer(
				self.integerString(radix).size
			)
		}
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

	integerString { :self :radix |
		radix.isIntegerValuedNumber.if {
			self.uncheckedIntegerString(radix)
		} {
			radix.adaptToIntegerAndApply(self, integerString/2)
		}
	}

	[isEqual, =] { :self :anObject |
		<primitive:
		if (sl.isInteger(_anObject) || sl.isSmallInteger(_anObject)) {
			return _self === BigInt(_anObject);
		};
		>
		anObject.adaptToIntegerAndApply(self, isEqual/2)
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
		/* Model: SmallInteger | Integer */
		/* 1L !== 1 */
		true
	}

	[isInteger, isIntegerValuedNumber] { :unused |
		true
	}

	[isLess, <] { :self :anObject |
		<primitive:
		if (sl.isInteger(_anObject) || sl.isSmallInteger(_anObject)) {
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

	isNearInteger { :unusedSelf :unusedEpsilon |
		true
	}

	isOdd { :self |
		(self % 2L) = 1L
	}

	isRational { :unused |
		true
	}

	isRealValuedNumber { :unused |
		true
	}

	isRepeatingDecimal { :unused |
		false
	}

	[isSimilar, ~] { :self :anObject |
		Float(self) ~ anObject
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

	[mod, %] { :self :anObject |
		<primitive:
		/* Model: SmallInteger | Integer */
		if (sl.isInteger(_anObject) /* || sl.isSmallInteger(_anObject) */) {
			const i = BigInt(_anObject);
			return ((_self % i) + i) % i;
		}
		>
		anObject.adaptToIntegerAndApply(self, mod/2)
	}

	[negate, -] { :self |
		self * -1L
	}

	normalInteger { :self |
		self.isSmallInteger.if {
			Float(self)
		} {
			self
		}
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
		/* Model: SmallInteger | Integer */
		if (sl.isInteger(_anObject) /*|| sl.isSmallInteger(_anObject) */) {
			return _self + BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, plus/2)
	}

	[power, ^] { :self :anObject |
		anObject.isIntegerValuedNumber.if {
			self.raisedToInteger(
				Integer(anObject)
			)
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

	[quotient, //] { :self :operand |
		<primitive:
		/* Model: SmallInteger | Integer */
		if (sl.isInteger(_operand) /*|| sl.isSmallInteger(_operand) */) {
			return _self / BigInt(_operand);
		};
		>
		operand.adaptToIntegerAndApply(self, quotient/2)
	}

	raisedToInteger { :self :operand |
		operand.isNegative.if {
			1L / self.raisedToPositiveInteger(-operand)
		} {
			self.raisedToPositiveInteger(operand)
		}
	}

	raisedToPositiveInteger { :self :operand |
		self.uncheckedRaisedToPositiveInteger(
			Integer(operand)
		)
	}

	[remainder, \\] { :self :operand |
		<primitive:
		/* Model: SmallInteger | Integer */
		if (sl.isInteger(_operand) /*|| sl.isSmallInteger(_operand) */) {
			return _self % BigInt(_operand);
		}
		>
		operand.adaptToIntegerAndApply(self, remainder/2)
	}

	shallowCopy { :self |
		self
	}

	signedInteger { :self :bitCount |
		<primitive:
		return BigInt.asIntN(
			sl.toFloat(_bitCount),
			_self
		);
		>
	}

	storeString { :self |
		self.storeStringLiteral
	}

	storeStringLiteral { :self |
		self.integerString(10) ++ 'L'
	}

	[subtract, -] { :self :anObject |
		<primitive:
		/* Model: SmallInteger | Integer */
		if (sl.isInteger(_anObject) /* || sl.isSmallInteger(_anObject) */) {
			return _self - BigInt(_anObject);
		}
		>
		anObject.adaptToIntegerAndApply(self, subtract/2)
	}

	[times, *] { :self :anObject |
		<primitive:
		/* Model: SmallInteger | Integer */
		if (sl.isInteger(_anObject) /*|| sl.isSmallInteger(_anObject)*/) {
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

	uncheckedInteger { :self |
		self
	}

	uncheckedIntegerString { :self :radix |
		<primitive:
		return _self.toString(
			sl.toFloat(_radix)
		).toUpperCase();
		>
	}

	uncheckedRaisedToInteger { :self :anInteger |
		<primitive:
		return _self ** BigInt(_anInteger);
		>
	}

	uncheckedRaisedToPositiveInteger { :self :operand |
		<primitive:
		if (sl.isInteger(_operand) || sl.isSmallInteger(_operand)) {
			return _self ** BigInt(_operand);
		}
		>
		self.error('uncheckedRaisedToPositiveInteger: not integer', [operand])
	}

	uncheckedRemainder { :self :anInteger |
		<primitive:
		return _self % BigInt(_anInteger);
		>
	}

	unsignedInteger { :self :bitCount |
		<primitive:
		return BigInt.asUintN(sl.toFloat(_bitCount), _self);
		>
	}

	zero { :unused |
		0L
	}

}

+Float {

	[Integer, L, floatToInteger] { :self |
		self.isNaN.if {
			NaN
		} {
			self.isSmallInteger.if {
				self.uncheckedInteger
			} {
				self.error('Integer: not SmallInteger')
			}
		}
	}

	uncheckedInteger { :self |
		<primitive:
		return BigInt(_self);
		>
	}

}

+String {

	parseInteger { :self :elseClause/0 |
		self.endsWith('L').ifTrue {
			self := self.allButLast
		};
		self.isDecimalIntegerString.if {
			self.uncheckedParseInteger
		} {
			elseClause()
		}
	}

	parseInteger { :self |
		self.parseInteger {
			self.error('parseInteger: invalid input')
		}
	}

	uncheckedParseInteger { :self |
		<primitive:
		return BigInt(_self);
		>
	}

}

+List {

	[Integer, L] { :self |
		self.collect(Integer/1)
	}

}
