LargeInteger : [Magnitude, Numeric] {

	= { :self :anInteger |
		<primitive: return _self === _asLargeInteger_1(_anInteger);>
	}

	< { :self :anInteger |
		<primitive: return _self < _asLargeInteger_1(_anInteger);>
	}

	<= { :self :anInteger |
		<primitive: return _self <= _asLargeInteger_1(_anInteger);>
	}

	+ { :self :anInteger |
		<primitive: return _self + _asLargeInteger_1(_anInteger);>
	}

	- { :self :anInteger |
		<primitive: return _self - _asLargeInteger_1(_anInteger);>
	}

	* { :self :anInteger |
		<primitive: return _self * _asLargeInteger_1(_anInteger);>
	}

	/ { :self :anInteger |
		<primitive: return _self / _asLargeInteger_1(_anInteger);>
	}

	asLargeInteger { :self |
		self
	}

	isInteger { :self |
		true
	}

	printString { :self |
		<primitive: return _self.toString();>
	}

	remainder { :self :anInteger |
		<primitive: return _self % _asLargeInteger_1(_anInteger);>
	}

	toNumber { :self :precision |
		<primitive: BigInt.asIntN(_precision, _self);>
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.asLargeInteger, self)
	}

}

+ Number {

	asLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

+ String {

	asLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}
