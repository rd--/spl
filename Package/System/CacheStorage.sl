CacheStorage : [Object] {

	basicOpen { :self :key |
		<primitive: return _self.open(_key);>
	}

	at { :self :key |
		self.includesKey(key).if {
			self.basicOpen(key)
		} {
			self.error('at: key does not exist')
		}
	}

	create { :self :key |
		self.includesKey(key).if {
			self.error('create: key exists')
		} {
			self.basicOpen(key)
		}
	}

	includesKey { :self :key |
		<primitive: return _self.has(_key);>
	}

	removeKey { :self :key |
		<primitive: return _self.delete(_key);>
	}

}
