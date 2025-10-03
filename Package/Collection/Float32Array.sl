Float32Array! : [Object, Copyable, Equatable, Comparable, Iterable, Indexable, Collection, Sequenceable, PrimitiveSequence] {

	atPut { :self :index :aFloat |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index) && sl.isSmallFloat(_aFloat)) {
			_self[_index - 1] = _aFloat;
			return _aFloat;
		}
		>
		self.errorInvalidIndex('atPut', index)
	}

	buffer { :self |
		<primitive: return _self.buffer;>
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

	storageType { :self |
		'Float32'
	}

}

+SmallFloat {

	Float32Array { :self |
		<primitive: return new Float32Array(_self);>
	}

}

+ArrayBuffer {

	Float32Array { :self :byteOffset :size |
		<primitive: return new Float32Array(_self, _byteOffset, _size);>
	}

}

+List {

	basicAsFloat32Array { :self |
		<primitive: return new Float32Array(_self);>
	}

	asFloat32Array { :self |
		self.isSmallFloatVector.if {
			self.basicAsFloat32Array
		} {
			self.error('List>>asFloat32Array: invalid')
		}
	}

}

+Range {

	asFloat32Array { :self |
		self.asList.basicAsFloat32Array
	}

}
