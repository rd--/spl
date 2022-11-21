IdentityDictionary : [Collection, Dictionary] {

	add { :self :anAssociation |
		<primitive: _self.set(_anAssociation.key, _anAssociation.value); return _anAssociation;>
	}

	at { :self :aKey |
		<primitive: return _self.get(_aKey) || null;>
	}

	includesKey { :self :aKey |
		<primitive: return _self.has(_aKey);>
	}

	isIdentityDictionary { :self |
		true
	}

	keys { :self |
		<primitive: return Array.from(_self.keys());>
	}

	keysValuesDo { :self :aProcedure |
		<primitive: _self.forEach(function(value, key, _) { _aProcedure(key, value) }); return null;>
	}

	printString { :self |
		self.asArray.printString ++ '.asIdentityDictionary'
	}

	put { :self :aKey :aValue |
		<primitive: _self.set(_aKey, _aValue);>
	}

	removeKeyIfAbsent { :self :aKey :aProcedure |
		<primitive: var existed = _self.delete(_aKey); if(existed) { return _aKey; } else { return _aProcedure(); }>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

}

+ Array {

	asIdentityDictionary { :self |
		<primitive: return new Map(_self.map(function(each) { return _asArray(each) }));>
	}

}

+ Object {

	isIdentityDictionary { :self |
		false
	}

}

+Void {

	IdentityDictionary {
		<primitive: return new Map();>
	}

}
