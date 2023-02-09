@ArrayedCollection {

	asArray { :self |
		Array(self.size).fillFromWith(self, identity:/1)
	}

	at { :self :anInteger |
		<primitive: if(sl.arrayCheckIndex(_self, _anInteger - 1)) { return _self[_anInteger - 1]; }>
		error('ArrayedCollection>>at: index not an integer or out of range: ' ++ anInteger)
	}

	atPut { :self :anInteger :anObject |
		<primitive: if(sl.arrayCheckIndex(_self, _anInteger - 1)) { _self[_anInteger - 1] = _anObject; return _anObject; }>
		error('ArrayedCollection>>atPut: index not an integer')
	}

	checkIndex { :self :anInteger |
		<primitive: return Number.isInteger(_anInteger) && 0 < _anInteger && _anInteger <= _self.length;>
	}

	collect { :self :aProcedure |
		<primitive: if(_aProcedure instanceof Function) { return _self.map(function(each) { return _aProcedure(each); }); }>
		error('ArrayedCollection>>collect: not a procedure')
	}

	detectIfFoundIfNone { :self :aProcedure :whenFound :whenNone |
		<primitive:
		var item = _self.find(function(element) { return _aProcedure(element); });
		return (item !== undefined) ? _whenFound(item) : _whenNone(item);
		>
	}

	do { :self :aProcedure |
		<primitive: _self.forEach(function(item) { return _aProcedure(item) }); return _self;>
	}

	doWhile { :self :activity:/1 :condition:/0 |
		| nextIndex = 1, endIndex = self.size; |
		{ condition() & { nextIndex <= endIndex } }.whileTrue {
			activity(self[nextIndex]);
			nextIndex := nextIndex + 1
		}
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.withIndexDo { :each :index |
			self[index] := aProcedure(each)
		};
		self
	}

	find { :self :aProcedure |
		<primitive:
		var item = _self.find(function(element) { return _aProcedure(element); });
		return (item === undefined) ? null : item;
		>
	}

	findIndex { :self :aProcedure |
		<primitive:
		var index = _self.findIndex(function(element) { return _aProcedure(element); });
		return (index === -1) ? null : index + 1;
		>
	}

	injectInto { :self :anObject :aProcedure:/2 |
		| result = anObject; |
		1.toDo(self.size) { :index |
			result := aProcedure(result, self[index])
		};
		result
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		1.toDo(self.size) { :index |
			(self[index] = anObject).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	reverseInPlace { :self |
		<primitive: return _self.reverse();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	sortInPlaceBy { :self :aBinaryProcedure |
		<primitive: return _self.sort(function(p, q) { return _aBinaryProcedure(p, q) ? -1 : 1 });>
	}

	sortInPlace { :self |
		self.sortInPlaceBy(lessThanEquals:/2)
	}

	sort { :self :aSortProcedureOrNil |
		self.sortInPlaceBy(aSortProcedureOrNil ? lessThan:/2)
	}

	sorted { :self :aSortProcedureOrNil |
		self.copy.sortInPlaceBy(aSortProcedureOrNil ? lessThan:/2)
	}

	sorted { :self |
		self.copy.sortInPlace
	}

	unsafeAt { :self :anInteger |
		<primitive: return _self[_anInteger - 1];>
	}

	unsafeAtPut { :self :anInteger :anObject |
		<primitive: _self[_anInteger - 1] = _anObject; return _anObject;>
	}

	unsafeCollect { :self :aProcedure |
		<primitive: return _self.map(function(each) { return _aProcedure(each); });>
	}

}
