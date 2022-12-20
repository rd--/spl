StringDictionary : [Dictionary] {

	at { :self :aString |
		<primitive: return _self[_aString] || null;>
	}

	atPut { :self :aString :anObject |
		<primitive: if(typeof _aString === 'string') { return _self[_aString] = _anObject;}>
		('StringDictionary>>atPut key not a string: ' ++ aString.typeOf).error
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
		'StringDictionary(' ++ self.Array.printString ++ ')'
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

	StringDictionary { :self |
		<primitive: return Object.fromEntries(_self.map(function(each) { return _asArray_1(each); }));>
	}

}

+ Void {

	StringDictionary {
		<primitive: return Object.create(null);>
	}

}
