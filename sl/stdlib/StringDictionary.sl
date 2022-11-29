StringDictionary : [Dictionary] {

	at { :self :aString |
		<primitive: return _self[_aString] || null;>
	}

	includesKey { :self :aKey |
		<primitive: return Object.hasOwn(_aKey);>
	}

	keys { :self |
		<primitive: return Object.keys(_self);>
	}

	keysValuesDo { :self :aProcedure |
		<primitive: Object.entries(_self).forEach(function(entry) { _aProcedure(entry[0], entry[1]); }); return null;>
	}

	printString { :self |
		self.asArray.printString ++ '.asStringDictionary'
	}

	put { :self :aString :anObject |
		<primitive: if(typeof _aString === 'string') { return _self[_aString] = _anObject;}>
		('StringDictionary>>put key not a string: ' ++ aString.typeOf).error
	}

	removeKeyIfAbsent { :self :aKey :aProcedure |
		<primitive: if(_self.has(_aKey)) { delete _self[_aKey]; return _aKey; } else { return _aProcedure(); }>
	}

	size { :self |
		<primitive: return Object.keys(_self).length;>
	}

	values { :self |
		<primitive: return Object.values(_self);>
	}

}

+ Array {

	asStringDictionary { :self |
		<primitive: return Object.fromEntries(_self.map(function(each) { return _asArray(each); }));>
	}

}

+ Void {

	StringDictionary { <primitive: return Object.create(null);> }

}
