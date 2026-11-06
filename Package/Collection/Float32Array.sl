Float32Array! : [Object, New, Copy, Store, Equal, Compare, Do, At, Indices, Put, Collection, Sequence] {

	buffer { :self |
		<primitive:
		return _self.buffer;
		>
	}

	encode { :self :littleEndian |
		<primitive:
		return sc.encodeFloat32Array(_self, _littleEndian);
		>
	}

	put! { :self :index :anObject |
		<primitive:
		const zeroIndex = sl.arrayCheckIndex(_self, _index);
		const aFloat = sl.toFloat(_anObject);
		if(zeroIndex > -1) {
			_self[zeroIndex] = aFloat;
			return _anObject;
		}
		>
		self.errorInvalidIndex('put!', index)
	}

	shallowCopy { :self |
		<primitive:
		return new Float32Array(_self);
		>
	}

	species { :unused |
		zeroFloat32Array/1
	}

	storageType { :unused |
		'Float32'
	}

}

+@Integer {

	[Float32Array, constantFloat64Array] { :n :x |
		<primitive:
		return new Float32Array(
			sl.toFloat(_n)
		).fill(
			sl.toFloat(_x)
		);
		>
	}

	zeroFloat32Array { :n |
		Float32Array(n, 0.0)
	}

}

+ArrayBuffer {

	arrayBufferToFloat32Array { :self :byteOffset :size |
		<primitive:
		return new Float32Array(
			_self,
			sl.toFloat(_byteOffset),
			sl.toFloat(_size)
		);
		>
	}

}

+List {

	[Float32Array, listToFloat32Array] { :self |
		self.atVectorOrElementwise { :aList |
			let floatList = SmallFloat(aList);
			floatList.isSmallFloatVector.if {
				floatList.uncheckedFloat32Array
			} {
				self.error('List>>Float32Array')
			}
		}
	}

	uncheckedFloat32Array { :self |
		<primitive:
		return new Float32Array(_self);
		>
	}

}

+Range {

	[Float32Array, rangeToFloat32Array] { :self |
		Float32Array(self.List)
	}

}
