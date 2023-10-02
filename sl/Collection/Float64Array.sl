Float64Array! : [Object, Iterable, Indexable, Collection, Sequenceable, Arrayed] {

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

+[Array, Interval] {

	Float64Array { :self |
		Float64Array(self.size).fillFromWith(self, identity:/1)
	}

}

+SmallFloat {

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}
