LargeInteger : [Magnitude, Numeric] {

	asLargeInteger { :self | self }
	isInteger { :self | true }
	printString { :self | <primitive: return _self.toString();> }

	= { :self :anInteger | <primitive: return _self === _asLargeInteger(_anInteger);> }
	< { :self :anInteger | <primitive: return _self < _asLargeInteger(_anInteger);> }
	<= { :self :anInteger | <primitive: return _self <= _asLargeInteger(_anInteger);> }
	+ { :self :anInteger | <primitive: return _self + _asLargeInteger(_anInteger);> }
	- { :self :anInteger | <primitive: return _self - _asLargeInteger(_anInteger);> }
	* { :self :anInteger | <primitive: return _self * _asLargeInteger(_anInteger);> }
	/ { :self :anInteger | <primitive: return _self / _asLargeInteger(_anInteger);> }

	remainder { :self :anInteger |
		<primitive: return _self % _asLargeInteger(_anInteger);>
	}

	toNumber { :self :precision |
		<primitive: BigInt.asIntN(_precision, _self);>
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		aProcedure.value(aNumber.asLargeInteger, self)
	}

}

+ Number {

	asLargeInteger { :self | <primitive: return BigInt(_self);> }
	LargeInteger { :self | LargeInteger(self) }

}

+ String {

	asLargeInteger { :self | <primitive: return BigInt(_self);> }

}
