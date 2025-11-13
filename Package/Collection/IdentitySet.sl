/* Requires: Set */

IdentitySet! : [Object, Storeable, Equatable, Iterable, Collection, Extensible, Removable, Unordered, Set] {

	asList { :self |
		<primitive: return Array.from(_self);>
	}

	copy { :self |
		<primitive: return new Set(_self);>
	}

	deepCopy { :self |
		self.primitiveDeepCopy
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
		self.uncheckedInclude(anObject)
	}

	includes { :self :anObject |
		<primitive: return _self.has(_anObject);>
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

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		IdentitySet:/0
	}

	storeString { :self |
		'IdentitySet(%)'.format([self.asList.storeString])
	}

	uncheckedInclude { :self :anObject |
		<primitive:
		_self.add(_anObject);
		return _anObject;
		>
	}

	uncheckedIncludeAll { :self :aCollection |
		<primitive:
		for (const item of _aCollection) {
			_self.add(item);
		};
		return _aCollection;
		>
	}

	uncheckedRemove { :self :anObject |
		<primitive:
		_self.delete(_anObject);
		return _anObject;
		>
	}

}

+Void {

	IdentitySet {
		<primitive: return new Set();>
	}

}

+@Collection {

	asIdentitySet { :self |
		let answer = IdentitySet();
		answer.includeAll(self);
		answer
	}

}

+@Dictionary {

	asIdentitySet { :self |
		self.values.asIdentitySet
	}

}

+List {

	asIdentitySet { :self |
		IdentitySet(self)
	}

	IdentitySet { :self |
		self.allSatisfy(isImmediate:/1).ifFalse {
			'List>>IdentitySet: non-immediate entry'.error
		};
		self.uncheckedIdentitySet
	}

	uncheckedIdentitySet { :self |
		<primitive: return new Set(_self);>
	}

}
