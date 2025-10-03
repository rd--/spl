/* Require: List, PrimitiveMap, Record, Void */

Map! : [Object, Copyable, Equatable, Iterable, Indexable, Collection, Extensible, Removable, Dictionary, PrimitiveMap] {

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
		self.storeStringLiteral('[:]', '[', ']', storeString:/1, ': ', storeString:/1)
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

	associationsToMap { :self |
		self.isAssociationList.if {
			self.collect(asList:/1).uncheckedListToMap
		} {
			self.error('List>>associationsToMap')
		}
	}

	listToMap { :self |
		let [_, m] = self.dimensions;
		(m = 2).if {
			self.uncheckedListToMap
		} {
			self.error('List>>listToMap')
		}
	}

	asMap { :self |
		self.isEmpty.if {
			Map()
		} {
			self.anyOne.isAssociation.if {
				self.associationsToMap
			} {
				self.listToMap
			}
		}
	}

	Map { :self |
		self.listToMap
	}

	substitutionSystem { :self :initialCondition :anInteger |
		self.asMap.substitutionSystem(initialCondition, anInteger)
	}

	uncheckedListToMap { :self |
		<primitive: return new Map(_self);>
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
