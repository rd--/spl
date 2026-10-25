/* Requires: Map, WeakMap */

+[Map, WeakMap] {

	Record { :self |
		self.keys.allSatisfy(isString/1).if {
			self.uncheckedMapToRecord
		} {
			self.error('@Record: not all keys are strings')
		}
	}

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
