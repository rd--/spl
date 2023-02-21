StringDictionary : [Object, Dictionary] {

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

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	json { :self :replacer :space |
		<primitive: return JSON.stringify(_self, _replacer, _space);>
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

	IdentityDictionary { :self |
		<primitive: return new Map(Object.entries(_self));>
	}

	StringDictionary { :self |
		self
	}

}

+ Array {

	StringDictionary { :self |
		(* I am an array of associations. *)
		self.IdentityDictionary.StringDictionary
	}

}

+ IdentityDictionary {

	unsafeStringDictionary { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	StringDictionary { :self |
		self.keys.allSatisfy(isString:/1).if {
			self.unsafeStringDictionary
		} {
			'IdentityDictionary>>StringDictionary: not all keys are strings'.error
		}
	}

}

+ Void {

	StringDictionary {
		<primitive: return Object.create(null);>
	}

}
