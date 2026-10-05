@PrimitiveArray {

	atIfAbsent { :self :index :ifAbsent/0 |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			return _self[_index - 1];
		}
		return _ifAbsent_0();
		>
	}

	collect { :self :aBlock/1 |
		<primitive:
		if(_aBlock_1 instanceof Function) {
			return _self.map(function(element, _unusedIndex, _unusedArray) {
				return _aBlock_1(element);
			});
		}
		>
		self.error('@PrimitiveArray>>collect: not a block')
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

	findFirstElement { :self :aBlock/1 |
		<primitive:
		const item = _self.find(function(element) {
			return _aBlock_1(element);
		});
		return (item === undefined) ? null : item;
		>
	}

	findFirst { :self :aBlock/1 |
		<primitive:
		const index = _self.findIndex(function(element) {
			return _aBlock_1(element);
		});
		return index + 1;
		>
	}

	insertAt! { :self :anObject :index |
		<primitive:
		_self.splice(_index - 1, 0, _anObject);
		>
		anObject
	}

	includesIndex { :self :index |
		<primitive:
		return Number.isInteger(_index) && 0 < _index && _index <= _self.length;
		>
	}

	[List, primitiveArrayToList] { :self |
		List(self.size).fillFrom(self)
	}

	put! { :self :index :anObject |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			_self[_index - 1] = _anObject;
			return _anObject;
		}
		>
		self.errorInvalidIndex('put!', index)
	}

	reverse! { :self |
		<primitive: return _self.reverse();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	sortBy! { :self :sortBlock/2 |
		self.uncheckedSortComparing!(
			sortBlockToTypeCheckedCompareBlock(sortBlock/2)
		)
	}

	sortBy { :self :sortBlock/2 |
		self.uncheckedSortComparing(
			sortBlockToTypeCheckedCompareBlock(sortBlock/2)
		)
	}

	sortByOn! { :self :sortBlock/2 :keyBlock/1 |
		<primitive:
		return _self.sort(function(p, q) {
			return _sortBlock_2(_keyBlock_1(p), _keyBlock_1(q)) ? -1 : 1
		});
		>
	}

	sortComparing! { :self :compareBlock/2 |
		self.uncheckedSortComparing!(
			typeCheckedCompareBlock(compareBlock/2)
		)
	}

	sortComparing { :self :compareBlock/2 |
		self.uncheckedSortComparing(
			typeCheckedCompareBlock(compareBlock/2)
		)
	}

	storeString { :self |
		'%(%)'.format(
			[
				self.typeOf,
				self.List.storeString
			]
		)
	}

	uncheckedAt { :self :index |
		<primitive: return _self[_index - 1];>
	}

	uncheckedPut! { :self :index :value |
		<primitive: _self[_index - 1] = _value;>
		value
	}

	uncheckedRemoveAt { :self :index |
		<primitive: return _self.splice(_index - 1, 1)[0];>
	}

	uncheckedSortComparing { :self :compareBlock/2 |
		<primitive: return _self.toSorted(_compareBlock_2);>
	}

	uncheckedSortComparing! { :self :compareBlock/2 |
		<primitive: return _self.sort(_compareBlock_2);>
	}

}
