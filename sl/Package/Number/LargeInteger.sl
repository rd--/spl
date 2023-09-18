(* Requires: SmallFloat String *)

LargeInteger! : [Object, Binary, Magnitude, Number, Integer] {

	== { :self :anInteger |
		<primitive: return _self === _anInteger;>
	}

	= { :self :anInteger |
		<primitive: return _self === BigInt(_anInteger);>
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
		| fraction = Fraction(self, anInteger.LargeInteger).reduced; |
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
		var i = BigInt(_anInteger);
		return ((_self % i) + i) % i;
		>
	}

	^ { :self :anInteger |
		<primitive: return _self ** BigInt(_anInteger);>
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

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.LargeInteger, self)
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

	even { :self |
		(self % 2) = 0
	}

	isInteger { :self |
		true
	}

	LargeInteger { :self |
		self
	}

	odd { :self |
		(self % 2) = 1
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

	remainder { :self :anInteger |
		<primitive: return _self % BigInt(_anInteger);>
	}

	shallowCopy { :self |
		self
	}

	SmallFloat { :self |
		<primitive: return Number(_self);>
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

	LargeInteger { :self |
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
		|(
			fnvPrime = 16777619,
			hash = self.negative.if {
				3490449840
			} {
				2166136261
			}
		)|
		1.upTo(self.digitLength).do { :index |
			hash := 16rFFFFFFFF.bitAnd(hash.bitXor(self.digitAt(index)) * fnvPrime)
		};
		hash
	}

}
