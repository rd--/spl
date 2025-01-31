Set! : [Object, Iterable, Collection, Extensible, Removable, Unordered] {

	= { :self :anObject |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includes(each)
				}
			}
		}
	}

	add { :self :anObject |
		self.includes(anObject).if {
			self.error('set includes item')
		} {
			self.include(anObject)
		}
	}

	asList { :self |
		<primitive: return Array.from(_self);>
	}

	basicInclude { :self :anObject |
		<primitive:
		_self.add(_anObject);
		return _anObject;
		>
	}

	basicIncludeAll { :self :aCollection |
		<primitive:
		for (const item of _aCollection) {
			_self.add(item);
		};
		return _aCollection;
		>
	}

	basicRemove { :self :anObject |
		<primitive:
		_self.delete(_anObject);
		return _anObject;
		>
	}

	collect { :self :aBlock:/1 |
		let answer = Set();
		self.do { :each |
			answer.basicInclude(aBlock(each))
		};
		answer
	}

	do { :self :aBlock |
		<primitive:
		_self.forEach(function(item) {
			_aBlock(item);
		});
		>
		self
	}

	include { :self :anObject |
		anObject.isImmediate.ifFalse {
			'Set>>include: non-immediate entry'.error
		};
		self.basicInclude(anObject)
	}

	includes { :self :anObject |
		<primitive: return _self.has(_anObject);>
	}

	isSet { :self |
		true
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).if {
			1
		} {
			0
		}
	}

	pseudoSlotNameList { :self |
		['size']
	}

	remove { :self :anObject |
		self.removeIfAbsent(anObject) {
			self.error('remove: item does not exist')
		}
	}

	removeAll { :self |
		<primitive:
		_self.clear();
		return null;
		>
	}

	removeIfAbsent { :self :anObject :aBlock:/0 |
		<primitive:
		if(_self.has(_anObject)) {
			_self.delete(_anObject);
			return _anObject;
		} else {
			return _aBlock_0();
		}
		>
	}

	shallowCopy { :self |
		<primitive: return new Set(_self);>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		Set:/0
	}

	storeString { :self |
		self.isEmpty.if {
			'Set()'
		} {
			self.asList.storeString ++ '.asSet'
		}
	}

}

+@Dictionary {

	asSet { :self |
		self.values.asSet
	}

}

+List {

	basicAsSet { :self |
		<primitive: return new Set(_self);>
	}

	asSet { :self |
		self.allSatisfy(isImmediate:/1).ifFalse {
			'List>>asSet: non-immediate entry'.error
		};
		self.basicAsSet
	}

}

+@Collection {

	asSet { :self |
		let answer = Set();
		answer.includeAll(self);
		answer
	}

}

+@Object {

	isSet { :self |
		false
	}

}

+Void {

	Set {
		<primitive: return new Set();>
	}

}
