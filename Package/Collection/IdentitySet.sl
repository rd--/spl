/* Requires: Set */

IdentitySet! : [Object, Iterable, Collection, Extensible, Removable, Unordered, Set] {

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
		'IdentitySet(%)'.format([self.asList.storeString])
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
