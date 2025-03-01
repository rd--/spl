Record! : [Object, Json, Iterable, Indexable, Collection, Removable, Extensible, Dictionary] {

	asDictionary { :self |
		let answer = Dictionary();
		answer.addAll(self);
		answer
	}

	asRecord { :self |
		self
	}

	at { :self :aString |
		<primitive:
		if(Object.hasOwn(_self, _aString)) {
			return _self[_aString];
		}
		>
		self.error('at: unknown key: ' ++ aString)
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

	basicAt { :self :key |
		<primitive: return _self[_key];>
	}

	basicAtPut { :self :key :value |
		<primitive:
		_self[_key] = _value;
		return _value;
		>
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
		'(%)'.format([
			self.associations.collect { :each |
				'%: %'.format([
					each.key,
					each.value.storeString
				])
			}.commaSeparated
		])
	}

	values { :self |
		<primitive: return Object.values(_self);>
	}

}

+List {

	asRecord { :self |
		let matrix = self.collect(asList:/1);
		(
			(
				self.isAssociationList | {
					matrix.isMatrix & {
						matrix.shape.second = 2
					}
				}
			) & {
				matrix.allSatisfy { :each |
					each.first.isString
				}
			}
		).if {
			matrix.basicAsRecord
		} {
			self.error('List>>asRecord: not of correct shape or invalid keys')
		}
	}

	basicAsRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	Record { :self |
		self.allSatisfy { :each |
			each.isList & {
				each.size = 2 & {
					each[1].isString
				}
			}
		}.if {
			self.basicAsRecord
		} {
			self.error('List>>Record: not two column matrix or keys not uniformly String values')
		}
	}

}

+Void {

	Record {
		<primitive: return Object.create(null);>
	}

}
