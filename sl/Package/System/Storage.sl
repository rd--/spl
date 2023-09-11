Storage : [Object, Collection, Dictionary] {

	at { :self :key |
		self.indexCheck(key);
		self.basicAt(key)
	}

	atPut { :self :key :value |
		self.stringCheck(key);
		self.stringCheck(value);
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

	indexCheck { :self :index |
		self.stringCheck(index);
		self.includesIndex(index).if {
			index
		} {
			self.error('indexCheck: no such index: ' ++ index)
		}
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
		self.indexCheck(key);
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

	stringCheck { :self :anObject |
		anObject.isString.if {
			anObject
		} {
			self.error('stringCheck: not a string: ' ++ anObject.typeOf)
		}
	}

}
