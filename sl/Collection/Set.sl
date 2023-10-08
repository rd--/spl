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

	Array { :self |
		<primitive: return Array.from(_self);>
	}

	basicRemove { :self :anObject |
		<primitive:
		_self.delete(_anObject);
		return _anObject;
		>
	}

	collect { :self :aBlock:/1 |
		| answer = Set(); |
		self.do { :each |
			answer.include(aBlock(each))
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

	ifAbsentAdd { :self :anObject |
		self.includes(anObject).if {
			false
		} {
			self.add(anObject);
			true
		}
	}

	include { :self :anObject |
		<primitive:
		_self.add(_anObject);
		return _anObject;
		>
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

	pseudoSlotNameArray { :self |
		['size', 'Array']
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

}

+Array {

	Set { :self |
		<primitive: return new Set(_self);>
	}

}

+@Collection {

	Set { :self |
		| answer = Set(); |
		answer.addAll(self);
		answer
	}

}

+@Dictionary {

	Set { :self |
		self.values.Set
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
