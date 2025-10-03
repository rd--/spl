Float64Array! : [Object, Equatable, Comparable, Iterable, Indexable, Collection, Sequenceable, PrimitiveSequence] {

	atPut { :self :index :aFloat |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index) && sl.isSmallFloat(_aFloat)) {
			_self[_index - 1] = _aFloat;
			return _aFloat;
		}
		>
		self.errorInvalidIndex('atPut', index)
	}

	copy { :self |
		<primitive: return new Float64Array(_self);>
	}

	encode { :self :littleEndian |
		<primitive: return sc.encodeFloat64Array(_self, _littleEndian);>
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

	asFloat64Array { :self |
		Float64Array(self)
	}

	basicFloat64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

	Float64Array { :self |
		self.isSmallFloatVector.if {
			self.basicFloat64Array
		} {
			self.error('List>>asFloat64Array: invalid')
		}
	}

}

+Range {

	asFloat64Array { :self |
		self.asList.basicFloat64Array
	}

}
