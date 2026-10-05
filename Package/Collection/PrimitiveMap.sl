@PrimitiveMap {

	atIfAbsent { :self :key :ifAbsent/0 |
		<primitive:
		if(_self.has(_key)) {
			return _self.get(_key);
		};
		return _ifAbsent_0();
		>
	}

	includesKey { :self :key |
		<primitive: return _self.has(_key);>
	}

	Map { :self |
		self
	}

	Record { :self |
		self.keys.allSatisfy(isString/1).if {
			self.uncheckedMapToRecord
		} {
			self.error('@PrimitiveMap>>Record: not all keys are strings')
		}
	}

	removeKeyIfAbsent! { :self :key :aBlock/0 |
		<primitive:
		if(_self.has(_key)) {
			const removed = _self.get(_key);
			_self.delete(_key);
			return removed;
		} else {
			return _aBlock_0();
		}
		>
	}

	uncheckedAt { :self :key |
		<primitive: return _self.get(_key);>
	}

}
