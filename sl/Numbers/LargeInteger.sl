LargeInteger : [Integral, Magnitude, Numeric, Object] {

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
		<primitive: return _self / BigInt(_anInteger);>
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
		<primitive: return _self % BigInt(_anInteger);>
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
