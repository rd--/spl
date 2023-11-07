Float32Array! : [Object, Iterable, Indexable, Collection, Sequenceable, Arrayed] {

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
		<primitive: return new Float32Array(_self);>
	}

	species { :self |
		Float32Array:/1
	}

}

+[Array, Interval] {

	Float32Array { :self |
		Float32Array(self.size).fillFromWith(self, identity:/1)
	}

}

+SmallFloat {

	Float32Array { :self |
		<primitive: return new Float32Array(_self);>
	}

}
