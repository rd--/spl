Float64Array! : [Object, Copy, Store, Equal, Compare, Iterable, Indexable, Collection, Sequence, PrimitiveArray] {

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
		Float64Array/1
	}

	storageType { :self |
		'Float64'
	}

}

+SmallFloat {

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}

+[List, Range] {

	asFloat64Array { :self |
		Float64Array(self)
	}

	Float64Array { :self |
		self.isSmallFloatVector.if {
			self.asList.uncheckedFloat64Array
		} {
			self.error('asFloat64Array: invalid')
		}
	}

}

+List {

	uncheckedFloat64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}
