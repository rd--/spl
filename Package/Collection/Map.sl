/* Require: List, Record, Void */

@PrimitiveMap {

	asMap { :self |
		self
	}

	asRecord { :self |
		self.keys.allSatisfy(isString:/1).if {
			self.basicAsRecord
		} {
			self.error('@PrimitiveMap>>asRecord: not all keys are strings')
		}
	}

	at { :self :key |
		<primitive:
		if(_self.has(_key)) {
			return _self.get(_key);
		}
		>
		self.error('@PrimitiveMap>>at: unknown key: ' ++ key)
	}

	basicAtPut { :self :key :value |
		<primitive:
		_self.set(_key, _value);
		return _value;
		>
	}

	includesKey { :self :key |
		<primitive: return _self.has(_key);>
	}

	removeKeyIfAbsent { :self :key :aBlock:/0 |
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

}

Map! : [Object, Iterable, Indexable, Collection, Extensible, Removable, Dictionary, PrimitiveMap] {

	asDictionary { :self |
		let answer = Dictionary();
		answer.addAll(self);
		answer
	}

	asJson { :self |
		self.asJson(nil, '')
	}

	asJson { :self :replacer :space |
		self.asRecord.asJson(replacer, space)
	}

	atPut { :self :key :value |
		key.isImmediate.ifFalse {
			self.error('Map>>atPut: non-immediate key')
		};
		self.basicAtPut(key, value)
	}

	basicAsRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	indices { :self |
		self.keys
	}

	keys { :self |
		<primitive: return Array.from(_self.keys());>
	}

	keysAndValuesDo { :self :aBlock:/2 |
		<primitive:
		_self.forEach(function(value, key, _) {
			_aBlock_2(key, value);
		});
		return null;
		>
	}

	removeAll { :self |
		<primitive: _self.clear();>
		self
	}

	reversed { :self |
		let answer = Map();
		self.keysAndValuesDo { :key :value |
			answer.add(value -> key)
		};
		answer
	}

	shallowCopy { :self |
		<primitive: return new Map(_self);>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		Map:/0
	}

	storeString { :self |
		self.associations.storeString ++ '.asMap'
	}

	listSubstitutionSystem { :self :aList :anInteger |
		let answer = [aList];
		anInteger.timesRepeat {
			let next = [];
			answer.last.do { :each |
				next.addAll(self[each])
			};
			answer.add(next)
		};
		answer
	}

	matrixSubstitutionSystem { :self :aMatrix :anInteger |
		let answer = [aMatrix];
		anInteger.timesRepeat {
			let next = answer.last.deepCollect { :each |
				self[each]
			}.arrayFlatten;
			answer.add(next)
		};
		answer
	}

	stringSubstitutionSystem { :self :aString :anInteger |
		let answer = [aString];
		anInteger.timesRepeat {
			let next = [];
			answer.last.do { :each |
				next.add(self[each])
			};
			answer.add(next.stringCatenate)
		};
		answer
	}

	substitutionSystem { :self :initialCondition :anInteger |
		initialCondition.isString.if {
			self.stringSubstitutionSystem(initialCondition, anInteger)
		} {
			initialCondition.isVector.if {
				self.listSubstitutionSystem(initialCondition, anInteger)
			} {
				initialCondition.isMatrix.if {
					self.matrixSubstitutionSystem(initialCondition, anInteger)
				} {
					self.error('substitutionSystem: not string or vector or matrix')
				}
			}
		}
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

}

+List {

	mapFromTwoElementLists { :self |
		<primitive: return new Map(_self);>
	}

	asMap { :self |
		self.collect { :each |
			let association = each.asList;
			association
			.assertIsOfSize(2)
		}.mapFromTwoElementLists
	}

}

+Void {

	Map {
		<primitive: return new Map();>
	}

}

+Record {

	asMap { :self |
		<primitive: return new Map(Object.entries(_self));>
	}

}
