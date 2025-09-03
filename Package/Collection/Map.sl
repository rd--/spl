/* Require: List, Record, Void */

@PrimitiveMap {

	asMap { :self |
		self
	}

	asRecord { :self |
		self.keys.allSatisfy(isString:/1).if {
			self.uncheckedAsRecord
		} {
			self.error('@PrimitiveMap>>asRecord: not all keys are strings')
		}
	}

	atIfAbsent { :self :key :ifAbsent:/0 |
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

	asJson { :self |
		self.asJson(nil, '')
	}

	asJson { :self :replacer :space |
		self.asRecord.asJson(replacer, space)
	}

	atPut { :self :key :value |
		key.isImmediate.ifFalse {
			self.error('Map>>atPut: non-immediate key: ' ++ key)
		};
		self.uncheckedAtPut(key, value)
	}

	comparator { :self |
		==
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

	reverse { :self |
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
		self.isEmpty.if {
			'[:]'
		} {
			'[%]'.format(
				[
					self.associations.collect { :each |
						'%: %'.format(
							[
								each.key.storeString,
								each.value.storeString
							]
						)
					}.commaSeparated
				]
			)
		}
	}

	listSubstitutionSystem { :self :aList :anInteger |
		let rules = self.associations;
		let answer = [aList];
		anInteger.timesRepeat {
			answer.add(
				sequenceReplace(answer.last, rules)
			)
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

	uncheckedAsRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	uncheckedAtPut { :self :key :value |
		<primitive:
		_self.set(_key, _value);
		return _value;
		>
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
		self.isAssociationList.if {
			self.collect(asList:/1).mapFromTwoElementLists
		} {
			let [_, n] = self.shape;
			(n = 2).if {
				self.mapFromTwoElementLists
			} {
				self.error('List>>asMap: not association list or two column matrix')
			}
		}
	}

	substitutionSystem { :self :initialCondition :anInteger |
		self.asMap.substitutionSystem(initialCondition, anInteger)
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
