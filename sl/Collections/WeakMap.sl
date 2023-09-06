WeakMap : [Object, Indexable, PrimitiveMap] {

	size { :self |
		self.error('size: cannot be observed')
	}

}

+Void {

	WeakMap {
		<primitive: return new WeakMap();>
	}

}
