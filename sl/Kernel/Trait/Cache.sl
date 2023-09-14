@Cache {

	cache { :self |
		self.typeResponsibility('@Cache>>cache')
	}

	cached { :self :key :constructor:/0 |
		self.cache.atIfAbsentPut(key, constructor:/0)
	}

	withCached { :self :key :asyncConstructor:/0 :aBlock:/1 |
		self.cache[key].ifNil {
			asyncConstructor().then { :answer |
				self.cache[key] := answer;
				aBlock(answer)
			}
		} { :answer |
			aBlock(answer)
		}
	}

}
