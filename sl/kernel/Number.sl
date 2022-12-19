Number : [Magnitude, Numeric] {

	= { :self :aNumber |
		<primitive: return _self === _aNumber;>
	}

	< { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self < _anObject; }>
		anObject.adaptToNumberAndApply(self, lessThan:/2)
	}

	<= { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self <= _anObject; }>
		anObject.adaptToNumberAndApply(self, lessThanEquals:/2)
	}

	+ { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self + _anObject; }>
		anObject.adaptToNumberAndApply(self, plus:/2)
	}

	- { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self - _anObject; }>
		anObject.adaptToNumberAndApply(self, minus:/2)
	}

	* { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self * _anObject; }>
		anObject.adaptToNumberAndApply(self, times:/2)
	}

	/ { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self / _anObject; }>
		anObject.adaptToNumberAndApply(self, dividedBy:/2)
	}

	% { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return ((_self % _anObject) + _anObject) % _anObject; }>
		anObject.adaptToNumberAndApply(self, modulo:/2)
	}

	remainder { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self % _anObject; }>
		error('Number>>remainder');
	}

	** { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return Math.pow(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, timesTimes:/2)
	}

	bitAnd { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self & _anObject; }>
		anObject.adaptToNumberAndApply(self, bitAnd:/2)
	}

	bitOr { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self | _anObject; }>
		anObject.adaptToNumberAndApply(self, bitOr:/2)
	}

	bitXor { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self ^ _anObject; }>
		anObject.adaptToNumberAndApply(self, bitXor:/2)
	}

	<< { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return _self << _anObject; }>
		anObject.adaptToNumberAndApply(self, lessThanLessThan:/2)
	}

	>> { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return sl.shiftRight(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, greaterThanGreaterThan:/2)
	}

	min { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return Math.min(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, min:/2)
	}

	max { :self :anObject |
		<primitive: if(sl.isNumber(_anObject)) { return Math.max(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, max:/2)
	}

	abs { :self | <primitive: return Math.abs(_self)> }
	acos { :self | <primitive: return Math.acos(_self)> }
	asin { :self | <primitive: return Math.asin(_self)> }
	atan { :self | <primitive: return Math.atan(_self)> }
	bitNot { :self | <primitive: return ~_self;> }
	cos { :self | <primitive: return Math.cos(_self)> }
	cosh { :self | <primitive: return Math.cosh(_self)> }
	even { :self | <primitive: return _self % 2 === 0;> }
	exp { :self | <primitive: return Math.exp(_self)> }
	floor { :self | <primitive: return Math.floor(_self)> }
	fractionPart { :self | <primitive: return _self % 1;> }
	isInteger { :self | <primitive: return Number.isInteger(_self);> }
	isNaN { :self | <primitive: return Number.isNaN(_self);> }
	log { :self | <primitive: return Math.log(_self)> }
	log2 { :self | <primitive: return Math.log2(_self)> }
	log10 { :self | <primitive: return Math.log10(_self)> }
	odd { :self | <primitive: return Math.abs(_self % 2) === 1;> }
	printString { :self | <primitive: return _self.toString();> }
	rounded { :self | <primitive: return Math.round(_self)> }
	sign { :self | <primitive: return Math.sign(_self);> }
	sin { :self | <primitive: return Math.sin(_self)> }
	sinh { :self | <primitive: return Math.sinh(_self)> }
	sqrt { :self | <primitive: return Math.sqrt(_self)> }
	tan { :self | <primitive: return Math.tan(_self)> }
	tanh { :self | <primitive: return Math.tanh(_self)> }
	truncated { :self | <primitive: return Math.trunc(_self)> }

	asInteger { :self | self.truncated }

	randomFloat { :self | self * randomFloat() }
	randomFloat { :self :aNumber | self + randomFloat(aNumber - self) }

	randomInteger { :self | randomFloat(1, self).rounded }
	randomInteger { :self :aNumber | randomFloat(self, aNumber).rounded }

	atRandom { :self | self.randomInteger }

	adaptToCollectionAndApply { :self :aCollection :aProcedure |
		aCollection.collect { :each |
			aProcedure.value(each, self)
		}
	}

	Number { :self | self }

}

+ Object {
	isByte { :self | false }
	isInteger { :self | false }
	squared { :self | self * self }
	cubed { :self | self * self * self }
}

+ Void {
	randomFloat { <primitive: return Math.random();> }
	Number { 'Number()'.error }
}
