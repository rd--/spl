Storage! : [Object, Collection, Dictionary] {

	at { :self :key |
		key.assertIsString;
		self.assertIsValidKey(key);
		self.basicAt(key)
	}

	atPut { :self :key :value |
		key.assertIsString;
		value.assertIsString;
		self.basicAtPut(key, value)
	}

	basicAt { :self :key |
		<primitive: return _self.getItem(_key);>
	}

	basicAtPut { :self :key :value |
		<primitive:
		_self.setItem(_key, _value);
		return _value;
		>
	}

	basicRemoveAt { :self :key |
		<primitive:
		const answer = _self.getItem(_key);
		_self.removeItem(_key);
		return answer;
		>
	}

	includesIndex { :self :key |
		self.indices.includes(key)
	}

	indices { :self |
		<primitive:
		const answer = [];
		for(let index = 0; index < _self.length; index++) {
			answer.push(_self.key(index));
		};
		return answer;
		>
	}

	removeAt { :self :key |
		key.assertIsString;
		self.assertIsValidKey(key);
		self.basicRemoveAt(key)
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
		'<a Storage>'
	}

}
