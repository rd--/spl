Record! : [Object, Json, Iterable, Indexable, Collection, Dictionary] {

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

	includesIndex { :self :key |
		<primitive: return Object.hasOwn(_self, _key);>
	}

	indices { :self |
		<primitive: return Object.keys(_self);>
	}

	removeKeyIfAbsent { :self :key :aProcedure |
		<primitive:
		if(Object.hasOwn(_self, _key)) {
			delete _self[_key];
			return _key;
		} else {
			return _aProcedure();
		}
		>
	}

	size { :self |
		<primitive: return Object.keys(_self).length;>
	}

	species { :self |
		Record:/0
	}

	Record { :self |
		self
	}

	storeString { :self |
		[
			'(',
			self.associations.collect { :each |
				each.key ++ ': ' ++ each.value.storeString
			}.joinSeparatedBy(', '),
			')'
		].join
	}

	values { :self |
		<primitive: return Object.values(_self);>
	}

	withIndexDo { :self :aProcedure:/2 |
		<primitive:
		Object.entries(_self).forEach(function(entry) {
			_aProcedure_2(entry[1], entry[0]);
		});
		return null;
		>
	}

}

+Array {

	recordFromTwoElementArrays { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	Record { :self |
		self.collect(key:/1).allSatisfy(isString:/1).if {
			self.collect(Array:/1).recordFromTwoElementArrays
		} {
			self.error('Record: not all keys are strings')
		}
	}

}

+Void {

	Record {
		<primitive: return Object.create(null);>
	}

}
