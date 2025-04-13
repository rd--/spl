@PrimitiveSequence {

	asList { :self |
		List(self.size).fillFrom(self)
	}

	atIfAbsent { :self :index :ifAbsent:/0 |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			return _self[_index - 1];
		}
		return _ifAbsent_0();
		>
	}

	atPut { :self :index :anObject |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			_self[_index - 1] = _anObject;
			return _anObject;
		}
		>
		self.errorInvalidIndex('atPut', index)
	}

	collect { :self :aBlock:/1 |
		<primitive:
		if(_aBlock_1 instanceof Function) {
			return _self.map(function(each) {
				return _aBlock_1(each);
			});
		}
		>
		self.error('@PrimitiveSequence>>collect: not a block')
	}

	detectIfFoundIfNone { :self :aBlock:/1 :whenFound:/1 :whenNone:/0 |
		<primitive:
		const item = _self.find(function(element) {
			return _aBlock_1(element);
		});
		return (item !== undefined) ? _whenFound_1(item) : _whenNone_0();
		>
	}

	do { :self :aBlock:/1 |
		<primitive:
		_self.forEach(function(item) {
			return _aBlock_1(item)
		});
		>
		self
	}

	findFirstElement { :self :aBlock:/1 |
		<primitive:
		const item = _self.find(function(element) {
			return _aBlock_1(element);
		});
		return (item === undefined) ? null : item;
		>
	}

	findFirst { :self :aBlock:/1 |
		<primitive:
		const index = _self.findIndex(function(element) {
			return _aBlock_1(element);
		});
		return index + 1;
		>
	}

	insertAt { :self :anObject :index |
		<primitive:
		_self.splice(_index - 1, 0, _anObject);
		return _anObject;
		>
	}

	includesIndex { :self :index |
		<primitive:
		return Number.isInteger(_index) && 0 < _index && _index <= _self.length;
		>
	}

	reverse { :self |
		<primitive: return _self.reverse();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	sortBy { :self :aBlock:/2 |
		<primitive:
		return _self.sort(function(p, q) {
			return _aBlock_2(p, q) ? -1 : 1
		});
		>
	}

	sortedBy { :self :aBlock:/2 |
		<primitive:
		return _self.toSorted(function(p, q) {
			return _aBlock_2(p, q) ? -1 : 1
		});
		>
	}

	sortOnBy { :self :keyBlock:/1 :compareBlock:/2 |
		<primitive:
		return _self.sort(function(p, q) {
			return _compareBlock_2(_keyBlock_1(p), _keyBlock_1(q)) ? -1 : 1
		});
		>
	}

	storeString { :self |
		'%(%)'.format([
			self.typeOf,
			self.asList.storeString
		])
	}

	uncheckedAt { :self :index |
		<primitive: return _self[_index - 1];>
	}

	uncheckedAtPut { :self :index :value |
		<primitive:
		_self[_index - 1] = _value;
		return _value;
		>
	}

	uncheckedRemoveAt { :self :index |
		<primitive: return _self.splice(_index - 1, 1)[0];>
	}

}
