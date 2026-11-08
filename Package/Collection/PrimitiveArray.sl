/* Requires: ByteArray Float32Array Float64Array List */

+[ByteArray, Float32Array, Float64Array, List] {

	atIfAbsent { :self :index :ifAbsent/0 |
		<primitive:
		const zeroIndex = sl.arrayCheckIndex(_self, _index);
		if(zeroIndex != -1) {
			return _self[zeroIndex];
		}
		>
		ifAbsent()
	}

	collect { :self :aBlock/1 |
		<primitive:
		if(_aBlock_1 instanceof Function) {
			return _self.map(function(element, _unusedIndex, _unusedArray) {
				return _aBlock_1(element);
			});
		}
		>
		self.error('@collect: not a block')
	}

	detectIfFoundIfNone { :self :aBlock/1 :whenFound/1 :whenNone/0 |
		<primitive:
		const item = _self.find(function(element) {
			return _aBlock_1(element);
		});
		return (item !== undefined) ? _whenFound_1(item) : _whenNone_0();
		>
	}

	do { :self :aBlock/1 |
		<primitive:
		_self.forEach(function(item) {
			return _aBlock_1(item)
		});
		>
		nil
	}

	findFirst { :self :aBlock/1 |
		<primitive:
		const index = _self.findIndex(function(element) {
			return _aBlock_1(element);
		});
		return index + 1;
		>
	}

	findFirstElement { :self :aBlock/1 |
		<primitive:
		const item = _self.find(function(element) {
			return _aBlock_1(element);
		});
		return (item === undefined) ? null : item;
		>
	}

	insertAt! { :self :anObject :index |
		(
			index.isInteger & {
				index.isBetween(1, self.size + 1)
			}
		).if {
			uncheckedInsertAt!(self, anObject, index)
		} {
			self.error('insertAt!', [anObject, index])
		}
	}

	putFloat! { :self :index :anObject |
		<primitive:
		const zeroIndex = sl.arrayCheckIndex(_self, _index);
		const aFloat = sl.toFloat(_anObject);
		if(zeroIndex != -1) {
			_self[zeroIndex] = aFloat;
			return _anObject;
		}
		>
		self.errorInvalidIndex('putFloat!', index)
	}

	reverse! { :self |
		<primitive: return _self.reverse();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	[sort, sortBy] { :self :sortBlock/2 |
		self.uncheckedSortComparing(
			sortBlockToTypeCheckedCompareBlock(sortBlock/2)
		)
	}

	[sort!, sortBy!] { :self :sortBlock/2 |
		self.uncheckedSortComparing!(
			sortBlockToTypeCheckedCompareBlock(sortBlock/2)
		)
	}

	[sort!, sortByOn!] { :self :sortBlock/2 :keyBlock/1 |
		<primitive:
		return _self.sort(function(p, q) {
			return _sortBlock_2(_keyBlock_1(p), _keyBlock_1(q)) ? -1 : 1
		});
		>
	}

	sortComparing { :self :compareBlock/2 |
		self.uncheckedSortComparing(
			typeCheckedCompareBlock(compareBlock/2)
		)
	}

	sortComparing! { :self :compareBlock/2 |
		self.uncheckedSortComparing!(
			typeCheckedCompareBlock(compareBlock/2)
		)
	}

	uncheckedAt { :self :index |
		<primitive:
		return _self[sl.toFloat(_index) - 1];
		>
	}

	uncheckedInsertAt! { :self :anObject :index |
		<primitive:
		_self.splice(sl.toFloat(_index - 1), 0, _anObject);
		>
		anObject
	}

	uncheckedPut! { :self :index :value |
		<primitive:
		_self[sl.toFloat(_index) - 1] = _value;
		>
		value
	}

	uncheckedRemoveAt { :self :index |
		<primitive:
		return _self.splice(sl.toFloat(_index) - 1, 1)[0];
		>
	}

	uncheckedSortComparing { :self :compareBlock/2 |
		<primitive: return _self.toSorted(_compareBlock_2);>
	}

	uncheckedSortComparing! { :self :compareBlock/2 |
		<primitive: return _self.sort(_compareBlock_2);>
	}

}

+[ByteArray, Float32Array, Float64Array] {

	[List, arrayToList] { :self |
		List(self.size, nil).fillFrom!(self)
	}

	storeString { :self |
		'%(%)'.format(
			[
				self.typeName,
				self.List.storeString
			]
		)
	}

}
