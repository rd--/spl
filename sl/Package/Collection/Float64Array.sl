Float64Array : [Object, Iterable, Indexable, Collection, SequenceableCollection, ArrayedCollection] {

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

+Array {

	Float64Array { :self |
		| answer = Float64Array(self.size); |
		answer.fillFromWith(self, identity:/1)
	}

}

+SmallFloat {

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}
