@Cache {

	cached { :self :aString :aBlock:/0 |
		self.cache.atIfAbsentPut(aString, aBlock:/0)
	}

}
