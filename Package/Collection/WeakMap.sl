/* Requires: PrimitiveMap */

WeakMap! : [Object, Indexable, PrimitiveMap] {

	includesIndex { :self :key |
		<primitive: return _self.has(_key);>
	}

	put! { :self :key :value |
		<primitive: _self.set(_key, _value);>
		value
	}

	size { :self |
		self.error('WeakMap>>size: cannot be observed')
	}

}

+Void {

	WeakMap {
		<primitive: return new WeakMap();>
	}

}
