@PrimitiveMap {

	at { :self :key |
		<primitive:
		if(_self.has(_key)) {
			return _self.get(_key);
		}
		>
		self.error('at: unknown key: ' ++ key)
	}

	atPut { :self :key :value |
		<primitive:
		_self.set(_key, _value);
		return _value;
		>
	}

	includesIndex { :self :key |
		<primitive: return _self.has(_key);>
	}

	removeKeyIfAbsent { :self :key :aProcedure |
		<primitive:
		var existed = _self.delete(_key);
		if(existed) {
			return _key;
		} else {
			return _aProcedure();
		}
		>
	}

}

Map : [Object, Iterable, Collection, Indexable, Dictionary, PrimitiveMap] {

	add { :self :anAssociation |
		<primitive:
		_self.set(_anAssociation.key, _anAssociation.value);
		return _anAssociation;
		>
	}

	json { :self |
		self.json(nil, '')
	}

	json { :self :replacer :space |
		self.indices.allSatisfy(isString:/1).if {
			self.Record.json(replacer, space)
		} {
			self.error('json: not all keys are strings')
		}
	}

	indices { :self |
		<primitive: return Array.from(_self.keys());>
	}

	Map { :self |
		self
	}

	removeAll { :self |
		<primitive: _self.clear();>
		self
	}

	shallowCopy { :self |
		<primitive: return new Map(_self);>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		Map:/0
	}

	storeString { :self |
		self.associations.storeString ++ '.Map'
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

	withIndexDo { :self :aProcedure |
		<primitive:
		_self.forEach(function(value, key, _) {
			_aProcedure(value, key);
		});
		return null;
		>
	}

}

+Array {

	mapFromTwoElementArrays { :self |
		<primitive: return new Map(_self);>
	}

	Map { :self |
		self.collect(Array:/1).mapFromTwoElementArrays
	}

}

+Void {

	Map {
		<primitive: return new Map();>
	}

}
