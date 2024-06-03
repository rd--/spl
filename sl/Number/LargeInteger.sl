{- Requires: SmallFloat String -}

LargeInteger! : [Object, Binary, Magnitude, Number, Integer] {

	== { :self :anInteger |
		<primitive: return _self === _anInteger;>
	}

	= { :self :anInteger |
		<primitive: return _self === BigInt(_anInteger);>
	}

	~ { :self :anInteger |
		self = anInteger
	}

	< { :self :anInteger |
		<primitive: return _self < BigInt(_anInteger);>
	}

	<= { :self :anInteger |
		<primitive: return _self <= BigInt(_anInteger);>
	}

	+ { :self :anInteger |
		<primitive: return _self + BigInt(_anInteger);>
	}

	- { :self :anInteger |
		<primitive: return _self - BigInt(_anInteger);>
	}

	* { :self :anInteger |
		<primitive: return _self * BigInt(_anInteger);>
	}

	/ { :self :anInteger |
		let fraction = Fraction(self, anInteger.asLargeInteger);
		fraction.isInteger.if {
			fraction.numerator
		} {
			fraction
		}
	}

	// { :self :anInteger |
		<primitive: return _self / BigInt(_anInteger);>
	}

	% { :self :anInteger |
		<primitive:
		const i = BigInt(_anInteger);
		return ((_self % i) + i) % i;
		>
	}

	^ { :self :anInteger |
		<primitive: return _self ** BigInt(_anInteger);>
	}

	^ { :self :anObject |
		anObject.isInteger.if {
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
			return sl.shiftRight(_self, _anObject);
		} else if(sl.isSmallFloat(_anObject)) {
			return sl.shiftRight(_self, BigInt(_anObject));
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

	asLargeInteger { :self |
		self
	}

	asSmallFloat { :self |
		<primitive: return Number(_self);>
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
		(self % 2n) = 0n
	}

	isImmediate { :self |
		true
	}

	isInteger { :self |
		true
	}

	isLiteral { :self |
		true
	}

	isOdd { :self |
		(self % 2n) = 1n
	}

	isVeryCloseTo { :self :aNumber |
		self = aNumber
	}

	isZero { :self |
		self = 0n
	}

	one { :self |
		1n
	}

	printString { :self |
		<primitive: return _self.toString();>
	}

	storeString { :self |
		self.printString ++ 'n'
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
		<primitive: return sl.bigIntSqrt(_self);>
	}

	toNumber { :self :precision |
		<primitive: BigInt.asIntN(_precision, _self);>
	}

	unit { :self |
		1n
	}

	zero { :self |
		0n
	}

}

+SmallFloat {

	asLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

+String {

	parseLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

+LargeInteger {

	fnv1aHash { :self |
		let fnvPrime = 16777619;
		let hash = self.isNegative.if {
			3490449840
		} {
			2166136261
		};
		1.to(self.digitLength).do { :index |
			hash := 16rFFFFFFFF.bitAnd(hash.bitXor(self.digitAt(index)) * fnvPrime)
		};
		hash
	}

}

+ByteArray {

	asLargeInteger { :self |
		let answer = 0n;
		self.withIndexDo { :each :i |
			answer := answer + (each << (i - 1n * 8))
		};
		answer
	}

}
