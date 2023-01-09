IdentityDictionary : [Object, Collection, Dictionary] {

	add { :self :anAssociation |
		<primitive:
		_self.set(_anAssociation.key, _anAssociation.value);
		return _anAssociation;
		>
	}

	at { :self :aKey |
		<primitive: return _self.get(_aKey) || null;>
	}

	atPut { :self :aKey :aValue |
		<primitive: _self.set(_aKey, _aValue);>
	}

	includesKey { :self :aKey |
		<primitive: return _self.has(_aKey);>
	}

	keys { :self |
		<primitive: return Array.from(_self.keys());>
	}

	keysValuesDo { :self :aProcedure |
		<primitive:
		_self.forEach(function(value, key, _) {
			_aProcedure(key, value)
		});
		return null;
		>
	}

	printString { :self |
		self.asArray.printString ++ '.asIdentityDictionary'
	}

	removeKeyIfAbsent { :self :aKey :aProcedure |
		<primitive:
		var existed = _self.delete(_aKey);
		if(existed) { return _aKey; } else { return _aProcedure(); }
		>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		IdentityDictionary:/0
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

}

+ Array {

	identityDictionaryFromTwoElementArrays { :self |
		(* I am an array of two element arrays. *)
		<primitive: return new Map(_self);>
	}

	IdentityDictionary { :self |
		(* I am an array of associations. *)
		self.collect(asArray:/1).identityDictionaryFromTwoElementArrays
	}

}

+ @Object {

	isIdentityDictionary { :self |
		false
	}

}

+Void {

	IdentityDictionary {
		<primitive: return new Map();>
	}

}
