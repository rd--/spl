Set : [Object, Iterable, Collection, UnorderedCollection] {

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
		<primitive:
		_self.add(_anObject);
		return _anObject;
		>
	}

	Array { :self |
		<primitive: return Array.from(_self);>
	}

	do { :self :aProcedure |
		<primitive:
		_self.forEach(function(item) {
			_aProcedure(item);
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
		<primitive:
		_self.delete(_anObject);
		return _anObject;
		>
	}

	removeAll { :self |
		<primitive:
		_self.clear();
		return null;
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
