Record! : [Object, Json, Iterable, Indexable, Collection, Removable, Extensible, Dictionary] {

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

	includesKeys { :self :aCollection |
		aCollection.allSatisfy { :each |
			self.includesKey(each)
		}
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
		self.isEmpty.if {
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
		}
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
			matrix.uncheckedAsRecord
		} {
			self.error('List>>asRecord: not of correct shape or invalid keys')
		}
	}

	Record { :self |
		self.allSatisfy { :each |
			each.isList & {
				each.size = 2 & {
					each[1].isString
				}
			}
		}.if {
			self.uncheckedAsRecord
		} {
			self.error('List>>Record: not two column matrix or keys not uniformly String values')
		}
	}

	uncheckedAsRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

}

+Void {

	Record {
		<primitive: return Object.create(null);>
	}

}
