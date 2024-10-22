Float32Array! : [Object, Iterable, Indexable, Collection, Sequence, PrimitiveSequence] {

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
		<primitive: return sc.encodeFloat32Array(_self, _littleEndian);>
	}

	shallowCopy { :self |
		<primitive: return new Float32Array(_self);>
	}

	species { :self |
		Float32Array:/1
	}

}

+[List, Range] {

	asFloat32Array { :self |
		Float32Array(self.size).fillFrom(self)
	}

}

+SmallFloat {

	Float32Array { :self |
		<primitive: return new Float32Array(_self);>
	}

}
