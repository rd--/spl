@Arrayed {

	Array { :self |
		Array(self.size).fillFromWith(self, identity:/1)
	}

	at { :self :index |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			return _self[_index - 1];
		}
		>
		self.errorInvalidIndex('at', index)
	}

	atIfPresentIfAbsent { :self :index :ifPresent:/1 :ifAbsent:/0 |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			return _ifPresent_1(_self[_index - 1]);
		} {
			return _ifAbsent_0();
		}
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

	basicAt { :self :index |
		<primitive: return _self[_index - 1];>
	}

	basicAtPut { :self :index :value |
		<primitive:
		_self[_index - 1] = _value;
		return _value;
		>
	}

	collect { :self :aBlock:/1 |
		<primitive:
		if(_aBlock_1 instanceof Function) {
			return _self.map(function(each) {
				return _aBlock_1(each);
			});
		}
		>
		self.error('@Arrayed>>collect: not a block')
	}

	detectIfFoundIfNone { :self :aBlock:/1 :whenFound:/1 :whenNone:/0 |
		<primitive:
		var item = _self.find(function(element) {
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

	fillFromWith { :self :aCollection :aBlock:/1 |
		aCollection.withIndexDo { :each :index |
			self[index] := aBlock(each)
		};
		self
	}

	findFirstElement { :self :aBlock:/1 |
		<primitive:
		var item = _self.find(function(element) {
			return _aBlock_1(element);
		});
		return (item === undefined) ? null : item;
		>
	}

	findFirst { :self :aBlock:/1 |
		<primitive:
		var index = _self.findIndex(function(element) {
			return _aBlock_1(element);
		});
		return index + 1;
		>
	}

	findLast { :self :aBlock:/1 |
		| index = self.size + 1; |
		valueWithReturn { :return:/1 |
			{ (index := index - 1) >= 1 }.whileTrue {
				aBlock(self[index]).ifTrue {
					index.return
				}
			};
			0
		}
	}

	injectInto { :self :anObject :aBlock:/2 |
		| result = anObject; |
		self.indicesDo { :index |
			result := aBlock(result, self[index])
		};
		result
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

	occurrencesOf { :self :anObject |
		| tally = 0; |
		self.indicesDo { :index |
			(self[index] = anObject).ifTrue {
				tally +:= 1
			}
		};
		tally
	}

	reverse { :self |
		<primitive: return _self.reverse();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	sort { :self |
		self.sortBy(lessThanEquals:/2)
	}

	sort { :self :aBlock:/2 |
		aBlock:/2.ifNil {
			self.sort
		} {
			self.sortBy(aBlock:/2)
		}
	}

	sortBy { :self :aBlock:/2 |
		<primitive:
		return _self.sort(function(p, q) {
			return _aBlock_2(p, q) ? -1 : 1
		});
		>
	}

	sortOn { :self :keyBlock:/1 |
		self.sortOnBy(keyBlock:/1, lessThanEquals:/2)
	}

	sortOnBy { :self :keyBlock:/1 :compareBlock:/2 |
		<primitive:
		return _self.sort(function(p, q) {
			return _compareBlock_2(_keyBlock_1(p), _keyBlock_1(q)) ? -1 : 1
		});
		>
	}

	sorted { :self :aSortBlock:/2 |
		self.copy.sortBy(aSortBlock:/2)
	}

	sorted { :self |
		self.copy.sort
	}

	storeString { :self |
		self.Array.storeString ++ '.' ++ self.Type.name
	}

}
