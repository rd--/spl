/* Requires: Set */

IdentitySet! : [Object, Copy, Store, Equal, Iterable, Collection, Extensible, Unordered, Set] {

	do { :self :aBlock |
		<primitive:
		_self.forEach(function(item) {
			_aBlock(item);
		});
		>
		nil
	}

	include! { :self :anObject |
		anObject.isImmediate.ifFalse {
			self.error('IdentitySet>>include: non-immediate entry', [anObject])
		};
		self.uncheckedInclude(anObject)
	}

	includes { :self :anObject |
		<primitive: return _self.has(_anObject);>
	}

	[List, identitySetToList] { :self |
		<primitive: return Array.from(_self);>
	}

	pseudoSlotNameList { :self |
		['size']
	}

	removeAll! { :self |
		<primitive: _self.clear();>
		nil
	}

	removeIfAbsent! { :self :anObject :aBlock/0 |
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
		IdentitySet/0
	}

	storeString { :self |
		'IdentitySet(%)'.format([self.List.storeString])
	}

	uncheckedInclude { :self :anObject |
		<primitive: _self.add(_anObject);>
		anObject
	}

	uncheckedIncludeAll { :self :aCollection |
		<primitive:
		for (const item of _aCollection) {
			_self.add(item);
		};
		>
		aCollection
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

	IdentitySet { :self |
		let answer = IdentitySet();
		answer.includeAll!(self);
		answer
	}

}

+@Dictionary {

	IdentitySet { :self |
		self.values.IdentitySet
	}

}

+List {

	IdentitySet { :self |
		self.allSatisfy(isImmediate/1).ifFalse {
			'List>>IdentitySet: non-immediate entry'.error
		};
		self.uncheckedIdentitySet
	}

	uncheckedIdentitySet { :self |
		<primitive: return new Set(_self);>
	}

}
