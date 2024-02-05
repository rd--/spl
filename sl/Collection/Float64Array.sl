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

	shallowCopy { :self |
		<primitive: return new Float64Array(_self);>
	}

	species { :self |
		Float64Array:/1
	}

}

+[List, Interval] {

	asFloat64Array { :self |
		Float64Array(self.size).fillFrom(self)
	}

}

+SmallFloat {

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}
