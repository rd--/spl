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

	collect { :self :aFunction/1 |
		<primitive:
		if(_aFunction_1 instanceof Function) {
			return _self.map(
				function(element, _unusedIndex, _unusedArray) {
					return _aFunction_1(element);
				}
			);
		}
		>
		self.error('collect: not a function')
	}

	detectIfFoundIfNone { :self :aFunction/1 :whenFound/1 :whenNone/0 |
		<primitive:
		const item = _self.find(
			function(element) {
				return _aFunction_1(element);
			}
		);
		return (item !== undefined) ? _whenFound_1(item) : _whenNone_0();
		>
	}

	do { :self :aFunction/1 |
		<primitive:
		_self.forEach(
			function(item, _unusedIndex, _unusedArray) {
				return _aFunction_1(item)
			}
		);
		>
		nil
	}

	findFirst { :self :aFunction/1 |
		<primitive:
		const index = _self.findIndex(
			function(element) {
				return _aFunction_1(element);
			}
		);
		return sl.toInteger(index + 1);
		>
	}

	findFirstElement { :self :aFunction/1 |
		<primitive:
		const item = _self.find(
			function(element) {
				return _aFunction_1(element);
			}
		);
		return (item === undefined) ? null : item;
		>
	}

	insertAt! { :self :anObject :index |
		(
			index.isIntegerValuedNumber & {
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
		<primitive:
		return _self.reverse();
		>
	}

	select { :self :aFunction/1 |
		<primitive:
		if(_aFunction_1 instanceof Function) {
			return _self.filter(
				function(element, _unusedIndex, _unusedArray) {
					return _aFunction_1(element);
				}
			);
		}
		>
		self.error('select: not a function')
	}

	size { :self |
		<primitive:
		return sl.toInteger(_self.length);
		>
	}

	[sort, sortBy] { :self :sortFunction/2 |
		self.uncheckedSortComparing(
			sortFunctionToTypeCheckedCompareFunction(sortFunction/2)
		)
	}

	[sort!, sortBy!] { :self :sortFunction/2 |
		self.uncheckedSortComparing!(
			sortFunctionToTypeCheckedCompareFunction(sortFunction/2)
		)
	}

	[sort!, sortByOn!] { :self :sortFunction/2 :keyFunction/1 |
		<primitive:
		return _self.sort(
			function(p, q) {
				return _sortFunction_2(_keyFunction_1(p), _keyFunction_1(q)) ? -1 : 1
			}
		);
		>
	}

	sortComparing { :self :compareFunction/2 |
		self.uncheckedSortComparing(
			typeCheckedCompareFunction(compareFunction/2)
		)
	}

	sortComparing! { :self :compareFunction/2 |
		self.uncheckedSortComparing!(
			typeCheckedCompareFunction(compareFunction/2)
		)
	}

	uncheckedAt { :self :index |
		<primitive:
		return _self[sl.toFloat(_index) - 1];
		>
	}

	uncheckedInsertAt! { :self :anObject :index |
		<primitive:
		_self.splice(sl.toFloat(_index) - 1, 0, _anObject);
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

	uncheckedSortComparing { :self :compareFunction/2 |
		<primitive:
		return _self.toSorted(_compareFunction_2);
		>
	}

	uncheckedSortComparing! { :self :compareFunction/2 |
		<primitive:
		return _self.sort(_compareFunction_2);
		>
	}

}

+[ByteArray, Float32Array, Float64Array] {

	[List, arrayToList] { :self |
		List(self.size, nil).fillFrom!(self)
	}

	storeString { :self |
		self.storeStringUsing(storeString/1)
	}

	storeStringUsing { :self :aFunction/1 |
		'%(%)'.format(
			[
				self.typeName,
				List(self).storeStringUsing(storeString/1)
			]
		)
	}

}
