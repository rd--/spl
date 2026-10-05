/* Require: List, PrimitiveMap, Record, Void */

Map! : [Object, Copy, Store, Equal, Iterable, Indexable, Collection, Extensible, Dictionary, PrimitiveMap] {

	encodeJson { :self |
		self.encodeJson(nil, '')
	}

	encodeJson { :self :replacer :space |
		self.Record.encodeJson(replacer, space)
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

	keysAndValuesDo { :self :aBlock/2 |
		<primitive:
		_self.forEach(function(value, key, _) {
			_aBlock_2(key, value);
		});
		>
		nil
	}

	put! { :self :key :value |
		key.isImmediate.ifFalse {
			self.error('Map>>put!: non-immediate key', [key])
		};
		self.uncheckedPut!(key, value)
	}

	removeAll! { :self |
		<primitive: _self.clear();>
		nil
	}

	reverse { :self |
		let answer = Map();
		self.keysAndValuesDo { :key :value |
			answer.add!(value -> key)
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
		Map/0
	}

	storeString { :self |
		'Map(%)'.format([self.keysAndValues.storeString])
	}

	storeStringLiteral { :self |
		self.storeStringLiteral('[:]', '[', ']', storeString/1, ': ', storeString/1)
	}

	listSubstitutionSystem { :self :aList :anInteger |
		let rules = self.associations;
		let answer = [aList];
		anInteger.timesRepeat {
			answer.add!(
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
			answer.add!(next)
		};
		answer
	}

	stringSubstitutionSystem { :self :aString :anInteger |
		let answer = [aString];
		anInteger.timesRepeat {
			let next = [];
			answer.last.do { :each |
				next.add!(self[each])
			};
			answer.add!(next.stringCatenate)
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

	uncheckedMapToRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	uncheckedPut! { :self :key :value |
		<primitive: _self.set(_key, _value);>
		value
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

}

+List {

	associationListToMap { :self |
		self.isAssociationList.if {
			self.collect(keyAndValue/1).uncheckedMatrixToMap
		} {
			self.error('List>>associationListToMap')
		}
	}

	matrixToMap { :self |
		let [_, m] = self.dimensions;
		(m = 2).if {
			self.uncheckedMatrixToMap
		} {
			self.error('List>>matrixToMap')
		}
	}

	[Map, listToMap] { :self |
		self.isEmpty.if {
			Map()
		} {
			self.anyOne.isAssociation.if {
				self.associationListToMap
			} {
				self.isMatrix.if {
					self.matrixToMap
				} {
					self.error('Map: invalid list')
				}
			}
		}
	}

	substitutionSystem { :self :initialCondition :anInteger |
		self.Map.substitutionSystem(initialCondition, anInteger)
	}

	uncheckedMatrixToMap { :self |
		<primitive: return new Map(_self);>
	}

}

+Void {

	Map {
		<primitive: return new Map();>
	}

}

+Record {

	[Map, recordToMap] { :self |
		<primitive: return new Map(Object.entries(_self));>
	}

}
