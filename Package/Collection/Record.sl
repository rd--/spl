Record! : [Object, Copyable, Equatable, Json, Iterable, Indexable, Collection, Removable, Extensible, Dictionary] {

	asRecord { :self |
		self
	}

	atIfAbsent { :self :aString :ifAbsent:/0 |
		<primitive:
		if(Object.hasOwn(_self, _aString)) {
			return _self[_aString];
		}
		return _ifAbsent_0();
		>
	}

	atPut { :self :aString :anObject |
		<primitive:
		if(typeof _aString === 'string') {
			_self[_aString] = _anObject;
			return _anObject;
		}
		>
		self.error('atPut key not a string: ' ++ aString.typeOf)
	}

	comparator { :self |
		==
	}

	includesKey { :self :key |
		<primitive: return Object.hasOwn(_self, _key);>
	}

	indices { :self |
		self.keys
	}

	isJson { :self |
		self.allSatisfy(isJson:/1)
	}

	isLiteral { :self |
		self.allSatisfy(isLiteral:/1)
	}

	keyType { :unused |
		'String'
	}

	keys { :self |
		<primitive: return Object.keys(_self);>
	}

	keysAndValuesDo { :self :aBlock:/2 |
		<primitive:
		Object.entries(_self).forEach(function(entry) {
			_aBlock_2(entry[0], entry[1]);
		});
		return null;
		>
	}

	propertyRead { :self :aString |
		<primitive: return _self[_aString];>
	}

	propertyWrite { :self :aString :anObject |
		<primitive: return _self[_aString] = _anObject;>
	}

	removeKeyIfAbsent { :self :key :aBlock |
		<primitive:
		if(Object.hasOwn(_self, _key)) {
			const removed = _self[_key];
			delete _self[_key];
			return removed;
		} else {
			return _aBlock();
		}
		>
	}

	size { :self |
		<primitive: return Object.keys(_self).length;>
	}

	species { :self |
		Record:/0
	}

	storeString { :self |
		self.storeStringLiteral('(:)', '(', ')', identity:/1, ': ', storeString:/1)
		/*self.isEmpty.if {
			'(:)'
		} {
			'(%)'.format(
				[
					self.associations.collect { :each |
						'%: %'.format(
							[
								each.key,
								each.value.storeString
							]
						)
					}.commaSeparated
				]
			)
		}*/
	}

	uncheckedAt { :self :key |
		<primitive: return _self[_key];>
	}

	uncheckedAtPut { :self :key :value |
		<primitive:
		_self[_key] = _value;
		return _value;
		>
	}

	values { :self |
		<primitive: return Object.values(_self);>
	}

}

+List {

	asRecord { :self |
		Record(self)
	}

	listToRecord { :self |
		self.allSatisfy { :each |
			each.isList & {
				each.size = 2 & {
					each.at(1).isString
				}
			}
		}.if {
			self.uncheckedListToRecord
		} {
			self.error('List>>listToRecord')
		}
	}

	Record { :self |
		self.isAssociationList.if {
			self.collect(asList:/1).listToRecord
		} {
			self.listToRecord
		}
	}

	uncheckedListToRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

}

+Void {

	Record {
		<primitive: return Object.create(null);>
	}

}
