Float64Array! : [Object, New, Copy, Store, Equal, Compare, Do, At, Indices, Put, Collection, Sequence] {

	encode { :self :littleEndian |
		<primitive:
		return sc.encodeFloat64Array(_self, _littleEndian);
		>
	}

	put! { :self :index :anObject |
		self.putFloat!(index, anObject)
	}

	shallowCopy { :self |
		<primitive:
		return new Float64Array(_self);
		>
	}

	species { :unused |
		zeroFloat64Array/1
	}

	storageType { :unused |
		'Float64'
	}

}

+@Integer {

	[Float64Array, constantFloat64Array] { :n :x |
		<primitive:
		return new Float64Array(Number(_n)).fill(Number(_x));
		>
	}

	zeroFloat64Array { :n |
		Float64Array(n, 0.0)
	}

}

+List {

	[Float64Array, listToFloat64Array] { :self |
		self.atVectorOrElementwise { :aList |
			let floatList = SmallFloat(aList);
			floatList.isSmallFloatVector.ifFalse {
				self.error('Float64Array: invalid input')
			};
			floatList.uncheckedFloat64Array
		}
	}

	uncheckedFloat64Array { :self |
		<primitive:
		return new Float64Array(_self);
		>
	}

}

+Range {

	[Float64Array, rangeToFloat64Array] { :self |
		uncheckedFloat64Array(
			List(self)
		)
	}

}
