@Cache {

	cache { :self |
		self.typeResponsibility('@Cache>>cache')
	}

	cached { :self :key :constructor:/0 |
		self.cache.atIfAbsentPut(key, constructor:/0)
	}

	whenCached { :self :key :asyncConstructor:/0 |
		self.cache.includesIndex(key).if {
			self.cache[key]
		} {
			asyncConstructor().then { :answer |
				self.cache[key] := answer;
				answer
			}
		}
	}

}

Cache! : [Object] {

	basicDelete { :self :key |
		<primitive: return _self.delete(_key);>
	}

	basicMatch { :self :key |
		<primitive: return _self.match(_key);>
	}

	basicPut { :self :key :value |
		<primitive: return _self.put(_key, _value);>
	}

	at { :self :key |
		self.shouldNotImplement('at: see atIfPresentIfAbsent')
	}

	atIfAbsent { :self :key :ifAbsent:/0 |
		self.atIfPresentIfAbsent(key, identity:/1, ifAbsent:/0)
	}

	atIfPresentIfAbsent { :self :key :ifPresent:/1 :ifAbsent:/0 |
		let validKey = self.validateKey(key);
		self.basicMatch(validKey).then { :answer |
			answer.isResponse.if {
				ifPresent(answer)
			} {
				ifAbsent()
			}
		}
	}

	atIfPresent { :self :key :ifPresent:/1 |
		self.atIfPresentIfAbsent(key, ifPresent:/1) {
			self.error('atIfPresent: key not present')
		}
	}

	atPut { :self :key :value |
		let validKey = self.validateKey(key);
		let validValue = self.validateValue(value);
		self.basicPut(validKey, validValue)
	}

	includesKey { :self :key |
		self.shouldNotImplement('includesKey: see atPut and removeKeyIfAbsent')
	}

	removeKeyIfAbsent { :self :key :aBlock:/0 |
		let validKey = self.validateKey(key);
		self.basicDelete(validKey).then { :answer |
			answer.ifFalse {
				aBlock()
			}
		}
	}

	validateKey { :self :key |
		(key.isUrl | { key.isRequest }).if {
			key
		} {
			self.error('Cache>>validateKey: key not Url or Request')
		}
	}

	validateValue { :self :value |
		value.isResponse.if {
			value
		} {
			self.error('Cache>>validateValue: value not Response')
		}
	}

}
