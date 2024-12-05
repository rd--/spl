/* Requires: Map */

WeakMap! : [Object, Indexable, PrimitiveMap] {

	includesIndex { :self :key |
		<primitive: return _self.has(_key);>
	}

	size { :self |
		self.error('size: cannot be observed')
	}

}

+Void {

	WeakMap {
		<primitive: return new WeakMap();>
	}

}
