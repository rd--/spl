Storage! : [Object, Collection, Dictionary] {

	[equal, =] { :self :anObject |
		identical(self, anObject)
	}

	at { :self :key |
		key.assertIsString;
		self.assertIsValidKey(key);
		self.uncheckedAt(key)
	}

	includesKey { :self :key |
		self.keys.includes(key)
	}

	[indices, keys] { :self |
		<primitive:
		const answer = [];
		for(let index = 0; index < _self.length; index++) {
			answer.push(_self.key(index));
		};
		return answer;
		>
	}

	put! { :self :key :value |
		key.assertIsString;
		value.assertIsString;
		self.uncheckedPut!(key, value)
	}

	removeKey! { :self :key |
		self.removeKeyIfAbsent!(key) {
			self.error('removeKey!: invalid key')
		}
	}

	removeKeyIfAbsent! { :self :key :aBlock/0 |
		self.includesKey(key).if {
			self.uncheckedRemoveKey(key)
		} {
			aBlock()
		}
	}

	removeAll! { :self |
		<primitive: _self.clear();>
		nil
	}

	size { :self |
		<primitive: return _self.length;>
	}

	uncheckedAt { :self :key |
		<primitive: return _self.getItem(_key);>
	}

	uncheckedPut! { :self :key :value |
		<primitive: _self.setItem(_key, _value);>
		value
	}

	uncheckedRemoveKey { :self :key |
		<primitive:
		const answer = _self.getItem(_key);
		_self.removeItem(_key);
		return answer;
		>
	}

}
