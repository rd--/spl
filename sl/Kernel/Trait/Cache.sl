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
