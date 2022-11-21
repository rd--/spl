Array : [Collection, SequenceableCollection, ArrayedCollection] {

	asArray { :self | self }
	printString { :self | '[' ++ self.collect(printString).joinSeparatedBy(', ') ++ ']' }

	at { :self :anInteger |
		<primitive: if(Number.isInteger(_anInteger)) { return _self[_anInteger - 1]; }>
		error('Array>>at: index not an integer')
	}

	put { :self :anInteger :anObject |
		<primitive: if(Number.isInteger(_anInteger)) { _self[_anInteger - 1] = _anObject; return _anObject; }>
		error('Array>>put: index not an integer')
	}

	collect { :self :aProcedure |
		<primitive: if(_aProcedure instanceof Function) { return _self.map(function(each) { return _aProcedure(each); }); }>
		error('Array>>collect: not a procedure')
	}

	copy { :self | <primitive: return Array.from(_self);> }

	size { :self | <primitive: return _self.length;> }

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

	detectIfFoundIfNone { :self :aProcedure :whenFound :whenNone |
		<primitive:
		var item = _self.find(function(element) { return _aProcedure(element); });
		return (item !== undefined) ? _whenFound(item) : _whenNone(item);
		>
	}

	reverseInPlace { :self | <primitive: return _self.reverse();> }

	do { :self :aProcedure |
		<primitive: _self.forEach(function(item) { return _aProcedure(item) }); return self;>
	}

	doWhile { :self :activity :condition |
		| nextIndex = 1, endIndex = self.size; |
		while { condition() & { nextIndex <= endIndex } } {
			activity(self[nextIndex]);
			nextIndex := nextIndex + 1
		}
	}

	sortInPlaceBy { :self :aBinaryProcedure |
		<primitive: return _self.sort(function(p, q) { return _aBinaryProcedure(p, q) ? -1 : 1 });>
	}

	sortInPlace { :self | self.sortInPlaceBy(lessThanEquals) }

	sorted { :self | self.copy.sortInPlace }

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		self.collect { :each | aProcedure(aNumber, each) }
	}

}

+ Number {

	toAsCollect { :self :stop :species :aProcedure |
		| answerSize = stop - self + 1, answer = species.ofSize(answerSize); |
		answerSize.do { :index | answer[index] := aProcedure(index + self - 1) };
		answer
	}

	replicate { :self :anObject | 1.toAsCollect(self, Array) { :unused | anObject } }

	Array { :size | <primitive: return Array(_size)> }

}

+ Object {

	asArray { :self | [self] }

	replicateApplying { :self :anInteger :aProcedure |
		| answer = Array(anInteger); |
		anInteger.do { :index | answer[index] := aProcedure(self) };
		answer
	}

	replicate { :self :anInteger | self.replicateApplying(anInteger, identity) }
	dup { :self :anInteger | self.replicateApplying(anInteger, value) }
	dup { :self | self.dup(2) }
	! { :self :anInteger | self.dup(anInteger) }

}

+ Void {
	Array { Array(0) }
}
