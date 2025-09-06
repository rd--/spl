/* Requires: PrimitiveMap */

WeakMap! : [Object, Indexable, PrimitiveMap] {

	atPut { :self :key :value |
		<primitive:
		_self.set(_key, _value);
		return _value;
		>
	}

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
