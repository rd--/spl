Float64Array : [Collection, SequenceableCollection, ArrayedCollection] {

	atPut { :self :anInteger :aNumber |
		<primitive: if(sl.arrayCheckIndex(_self, _anInteger - 1) && sl.isNumber(_aNumber)) {
			_self[_anInteger - 1] = _aNumber; return _aNumber;
		}>
		error('Float64Array>>atPut: invalid index or value not a number')
	}

	printString { :self |
		'Float64Array(' ++ self.asArray.printString ++ ')'
	}

	species { :self |
		Float64Array:/1
	}

}

+ Array {

	Float64Array { :self |
		| answer = Float64Array(self.size); |
		answer.fillFromWith(self, identity:/1)
	}

}

+ Number {

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}

+ Void {

	Float64Array {
		<primitive: return new Float64Array(0);>
	}

}
