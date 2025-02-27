Float64Array! : [Object, Iterable, Indexable, Collection, Sequence, PrimitiveSequence] {

	atPut { :self :index :aFloat |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index) && sl.isSmallFloat(_aFloat)) {
			_self[_index - 1] = _aFloat;
			return _aFloat;
		}
		>
		self.errorInvalidIndex('atPut', index)
	}

	encode { :self :littleEndian |
		<primitive: return sc.encodeFloat64Array(_self, _littleEndian);>
	}

	shallowCopy { :self |
		<primitive: return new Float64Array(_self);>
	}

	species { :self |
		Float64Array:/1
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

+List {

	basicAsFloat64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

	asFloat64Array { :self |
		self.isSmallFloatVector.if {
			self.basicAsFloat64Array
		} {
			self.error('List>>asFloat64Array: invalid')
		}
	}

}

+Range {

	asFloat64Array { :self |
		self.asList.basicAsFloat64Array
	}

}
