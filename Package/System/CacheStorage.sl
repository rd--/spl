CacheStorage! : [Object] {

	atIfAbsent { :self :key :ifAbsent:/0 |
		self.includesKey(key).then { :answer |
			answer.if {
				self.uncheckedOpen(key)
			} {
				ifAbsent()
			}
		}
	}

	atIfPresent { :self :key :ifPresent:/1 |
		let validKey = self.validateKey(key);
		self.uncheckedOpen(key).then { :cache |
			ifPresent(cache)
		}
	}

	includesKey { :self :key |
		let validKey = self.validateKey(key);
		self.uncheckedHas(validKey)
	}

	removeKeyIfAbsent { :self :key :ifAbsent:/0 |
		self.includesKey(key).then { :answer |
			answer.if {
				self.uncheckedDelete(key)
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

	uncheckedDelete { :self :key |
		<primitive: return _self.delete(_key);>
	}

	uncheckedHas { :self :key |
		<primitive: return _self.has(_key);>
	}

	uncheckedOpen { :self :key |
		<primitive: return _self.open(_key);>
	}

}
