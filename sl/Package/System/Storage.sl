Storage : [Object, Collection, Dictionary] {

	length { :self | <primitive: return _self.length;> }
	key { :self :index | <primitive: return _self.key(_index);> }
	getItem { :self :key | <primitive: return _self.getItem(_key);> }
	setItem { :self :key :value | <primitive: return _self.setItem(_key, _value);> }
	removeAll { :self | <primitive: return _self.clear();> }
	removeItem { :self :key | <primitive: return _self.removeItem(_key);> }

	at { :self :key |
		self.getItem(key)
	}

	atPut { :self :key :value |
		self.setItem(key, value)
	}

	includesIndex { :self :key |
		self[key].notNil
	}

	indices { :self |
		(0 .. self.length - 1).collect { :index |
			self.key(index)
		}
	}

	size { :self |
		self.length
	}

}
