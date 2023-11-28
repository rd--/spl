(* Require: Record *)

@PrimitiveMap {

	asMap { :self |
		self
	}

	asRecord { :self |
		self.indices.allSatisfy(isString:/1).if {
			self.unsafeRecord
		} {
			self.error('Record: not all keys are strings')
		}
	}

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

	removeKeyIfAbsent { :self :key :aBlock |
		<primitive:
		var existed = _self.delete(_key);
		if(existed) {
			return _key;
		} else {
			return _aBlock();
		}
		>
	}

}

Map! : [Object, Iterable, Collection, Extensible, Removable, Indexable, Dictionary, PrimitiveMap] {

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
			self.asRecord.json(replacer, space)
		} {
			self.error('json: not all keys are strings')
		}
	}

	indices { :self |
		<primitive: return Array.from(_self.keys());>
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
		self.associations.storeString ++ '.asMap'
	}

	unsafeRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

	withIndexDo { :self :aBlock |
		<primitive:
		_self.forEach(function(value, key, _) {
			_aBlock(value, key);
		});
		return null;
		>
	}

}

+Array {

	mapFromTwoElementArrays { :self |
		<primitive: return new Map(_self);>
	}

	asMap { :self |
		self.collect(asArray:/1).mapFromTwoElementArrays
	}

}

+Void {

	Map {
		<primitive: return new Map();>
	}

}

+Record {

	asMap { :self |
		<primitive: return new Map(Object.entries(_self));>
	}

}
