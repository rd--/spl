CacheStorage : [Object] {

	basicDelete { :self :key |
		<primitive: return _self.delete(_key);>
	}

	basicHas { :self :key |
		<primitive: return _self.has(_key);>
	}

	basicOpen { :self :key |
		<primitive: return _self.open(_key);>
	}

	atIfAbsent { :self :key :ifAbsent:/0 |
		self.includesKey(key).then { :answer |
			answer.if {
				self.basicOpen(key)
			} {
				ifAbsent()
			}
		}
	}

	atIfPresent { :self :key :ifPresent:/1 |
		let validKey = self.validateKey(key);
		self.basicOpen(key).then { :cache |
			ifPresent(cache)
		}
	}

	includesKey { :self :key |
		let validKey = self.validateKey(key);
		self.basicHas(validKey)
	}

	removeKeyIfAbsent { :self :key :ifAbsent:/0 |
		self.includesKey(key).then { :answer |
			answer.if {
				self.basicDelete(key)
			} {
				ifAbsent()
			}
		}
	}

	validateKey { :self :key |
		key.isString.if {
			key
		} {
			self.error('CacheStorage>>validateKey: key not String')
		}
	}

}
