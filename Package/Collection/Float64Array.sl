Float64Array! : [Object, New, Copy, Store, Equal, Compare, Do, At, Indices, Put, Collect, Collection, Sequence, PrimitiveArray] {

	encode { :self :littleEndian |
		<primitive: return sc.encodeFloat64Array(_self, _littleEndian);>
	}

	put! { :self :index :aFloat |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index) && sl.isSmallFloat(_aFloat)) {
			_self[_index - 1] = _aFloat;
			return _aFloat;
		}
		>
		self.errorInvalidIndex('put!', index)
	}

	shallowCopy { :self |
		<primitive: return new Float64Array(_self);>
	}

	species { :self |
		zeroFloat64Array/1
	}

	storageType { :self |
		'Float64'
	}

}

+SmallFloat {

	[Float64Array, constantFloat64Array] { :n :x |
		<primitive: return new Float64Array(_n).fill(_x);>
	}

	zeroFloat64Array { :n |
		Float64Array(n, 0.0)
	}

}

+List {

	[Float64Array, listToFloat64Array] { :self |
		self.isSmallFloatVector.ifFalse {
			self.error('Float64Array: invalid input')
		};
		self.uncheckedFloat64Array
	}

	uncheckedFloat64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}

+Range {

	[Float64Array, rangeToFloat64Array] { :self |
		uncheckedFloat64Array(List(self))
	}

}
