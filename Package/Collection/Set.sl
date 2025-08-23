@Set {

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
		self.includes(anObject).ifTrue {
			self.error('@Set>>add: includes item')
		};
		self.include(anObject)
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.include(aBlock(each))
		};
		answer
	}

	isSet { :unused |
		true
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).if {
			1
		} {
			0
		}
	}

	remove { :self :anObject |
		self.removeIfAbsent(anObject) {
			self.error('@Set>>remove: item does not exist')
		}
	}

	union { :self :aSet |
		let answer = self.copy;
		answer.includeAll(aSet);
		answer
	}

	without { :self :anObject |
		self.removeIfAbsent(anObject) { };
		self
	}

}

Set! : [Object, Iterable, Collection, Extensible, Removable, Unordered, Set] {

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
			self.error('IdentitySet>>include: non-immediate entry: ' ++ anObject)
		};
		self.basicInclude(anObject)
	}

	includes { :self :anObject |
		<primitive: return _self.has(_anObject);>
	}

	isIdentitySet { :self |
		true
	}

	pseudoSlotNameList { :self |
		['size']
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
		IdentitySet:/0
	}

	storeString { :self |
		self.asList.storeString ++ '.asIdentitySet'
	}

}

SetBy : [Object, Iterable, Collection, Extensible, Removable, Unordered, Set] { | contents predicate |

	asList { :self |
		self.contents.copy
	}

	basicInclude { :self :anObject |
		self.include(anObject)
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1);
		self
	}

	include { :self :anObject |
		self.contents.addIfNotPresentBy(anObject, self.predicate)
	}

	includes { :self :anObject |
		self.contents.includesBy(anObject, self.predicate)
	}

	removeAll { :self |
		self.contents.removeAll
	}

	removeIfAbsent { :self :anObject :aBlock:/0 |
		self.contents.detectIndexIfFoundIfNone { :item |
			self.predicate.value(item, anObject)
		} { :index |
			self.contents.removeAt(index)
		} {
			aBlock()
		}
	}

	shallowCopy { :self |
		self.contents.shallowCopy.asSet(self.predicate)
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		{
			Set(self.predicate)
		}
	}

	storeString { :self |
		'%.asSet(%)'.format(
			[
				self.contents.storeString,
				self.predicate.name
			]
		)
	}

}

+@Dictionary {

	asIdentitySet { :self |
		self.values.asIdentitySet
	}

	asSet { :self :aBlock:/2 |
		self.values.asSet(aBlock:/2)
	}

}

+List {

	basicAsIdentitySet { :self |
		<primitive: return new Set(_self);>
	}

	asIdentitySet { :self |
		self.allSatisfy(isImmediate:/1).ifFalse {
			'List>>asIdentitySet: non-immediate entry'.error
		};
		self.basicAsIdentitySet
	}

	unionBy { :self :aBlock:/2 |
		let set = Set(aBlock:/2);
		self.do { :each |
			set.includeAll(each)
		};
		set.asList
	}

	unionBy { :self :aCollection :aBlock:/2 |
		[self, aCollection].unionBy(aBlock:/2)
	}

	union { :self |
		self.unionBy(=)
	}

	union { :self :aCollection |
		[self, aCollection].unionBy(=)
	}

}

+@Collection {

	asIdentitySet { :self |
		let answer = IdentitySet();
		answer.includeAll(self);
		answer
	}

	asSet { :self :aBlock:/2 |
		let answer = Set(aBlock:/2);
		answer.includeAll(self);
		answer
	}

}

+@Object {

	isIdentitySet { :self |
		false
	}

}

+Void {

	IdentitySet {
		<primitive: return new Set();>
	}

}

+Block {

	Set { :aBlock:/2 |
		(aBlock:/2 == ==).if {
			IdentitySet()
		} {
			newSetBy().initializeSlots([], aBlock:/2)
		}
	}

}
