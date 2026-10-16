Float32Array! : [Object, New, Copy, Store, Equal, Compare, Do, At, Indices, Put, Collect, Collection, Sequence, PrimitiveArray] {

	buffer { :self |
		<primitive: return _self.buffer;>
	}

	encode { :self :littleEndian |
		<primitive: return sc.encodeFloat32Array(_self, _littleEndian);>
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
		<primitive: return new Float32Array(_self);>
	}

	species { :self |
		zeroFloat32Array/1
	}

	storageType { :self |
		'Float32'
	}

}

+SmallFloat {

	[Float32Array, constantFloat64Array] { :n :x |
		<primitive: return new Float32Array(_n).fill(_x);>
	}

	zeroFloat32Array { :n |
		Float32Array(n, 0.0)
	}

}

+ArrayBuffer {

	arrayBufferToFloat32Array { :self :byteOffset :size |
		<primitive: return new Float32Array(_self, _byteOffset, _size);>
	}

}

+List {

	[Float32Array, listToFloat32Array] { :self |
		self.isSmallFloatVector.if {
			self.uncheckedFloat32Array
		} {
			self.error('List>>Float32Array')
		}
	}

	uncheckedFloat32Array { :self |
		<primitive: return new Float32Array(_self);>
	}

}

+Range {

	[Float32Array, rangeToFloat32Array] { :self |
		Float32Array(self.List)
	}

}
