Storage! : [Object, Collection, Dictionary] {

	= { :self :anObject |
		self == anObject
	}

	at { :self :key |
		key.assertIsString;
		self.assertIsValidKey(key);
		self.uncheckedAt(key)
	}

	atPut { :self :key :value |
		key.assertIsString;
		value.assertIsString;
		self.uncheckedAtPut(key, value)
	}

	includesKey { :self :key |
		self.keys.includes(key)
	}

	keys { :self |
		<primitive:
		const answer = [];
		for(let index = 0; index < _self.length; index++) {
			answer.push(_self.key(index));
		};
		return answer;
		>
	}

	removeKey { :self :key |
		self.removeKeyIfAbsent(key) {
			self.error('removeKey: invalid key')
		}
	}

	removeKeyIfAbsent { :self :key :aBlock:/0 |
		self.includesKey(key).if {
			self.uncheckedRemoveKey(key)
		} {
			aBlock()
		}
	}

	removeAll { :self |
		<primitive:
		_self.clear();
		return _self;
		>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	storeString { :self |
		'a Storage'
	}

	uncheckedAt { :self :key |
		<primitive: return _self.getItem(_key);>
	}

	uncheckedAtPut { :self :key :value |
		<primitive:
		_self.setItem(_key, _value);
		return _value;
		>
	}

	uncheckedRemoveKey { :self :key |
		<primitive:
		const answer = _self.getItem(_key);
		_self.removeItem(_key);
		return answer;
		>
	}

}
