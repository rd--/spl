/* Require: Collection */

@Dictionary {

	[at, @] { :self :key |
		self.atIfAbsent(key) {
			self.error('@Dictionary>>at: unknown key: ' ++ key)
		}
	}

	[concatenation, ++] { :self :aDictionary |
		let answer = self.copy;
		answer.includeAll(aDictionary);
		answer
	}

	add { :self :anAssociation |
		self.includesKey(anAssociation.key).if {
			self.error('@Dictionary>>add: key exists: ' ++ anAssociation.key)
		} {
			self[anAssociation.key] := anAssociation.value;
			anAssociation
		}
	}

	addAll { :self :aCollection |
		aCollection.associationsDo { :anAssociation |
			self.add(anAssociation)
		};
		aCollection
	}

	asList { :self |
		let answer = [];
		self.valuesDo { :each |
			answer.add(each)
		};
		answer
	}

	assertIsValidKey { :self :key |
		self.includesKey(key).if {
			key
		} {
			self.error('@Dictionary>>assertIsValidKey: no such key: ' ++ key)
		}
	}

	associationAt { :self :key |
		self.associationAtIfAbsent(key) {
			self.error('@Dictionary>>associationAt: no such key')
		}
	}

	associationAtIfAbsent { :self :key :aBlock:/0 |
		self.atIfPresentIfAbsent(key) { :value |
			key -> value
		} {
			aBlock()
		}
	}

	associations { :self |
		let answer = [];
		self.associationsDo { :each |
			answer.add(each)
		};
		answer
	}

	associationsAllSatisfy { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			self.associationsDo { :each |
				aBlock(each).ifFalse {
					false.return
				}
			};
			true
		}
	}

	associationsDo { :self :aBlock:/1 |
		self.keysAndValuesDo { :key :value |
			aBlock(key -> value)
		}
	}

	associationsRemove { :self :aBlock:/1 |
		let removals = [];
		self.associationsDo { :each |
			aBlock(each).ifTrue {
				removals.add(each.key)
			}
		};
		removals.do { :key |
			self.removeKey(key)
		}
	}

	associationsSelect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.associationsDo { :each |
			each.aBlock.ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	atIfAbsent { :self :key :ifAbsent:/0 |
		self.typeResponsibility('@Dictionary>>atIfAbsent')
	}

	atAll { :self :keys |
		self.associationsSelect { :each |
			keys.includesBy(each.key, self.comparator)
		}
	}

	atPut { :self :key :value |
		self.typeResponsibility('@Dictionary>>atPut')
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.keysAndValuesDo { :key :value |
			answer.add(key -> aBlock(value))
		};
		answer
	}

	declareFrom { :self :key :aDictionary |
		self.includesKey(key).if {
			nil
		} {
			aDictionary.includesKey(key).if {
				let association = aDictionary.associationAt(key);
				self.add(association);
				aDictionary.removeKey(key);
				association
			} {
				self.add(key -> nil);
				nil
			}
		}
	}

	do { :self :aBlock:/1 |
		self.valuesDo(aBlock:/1)
	}

	equalBy { :self :aDictionary :aBlock:/2 |
		self.typeOf = aDictionary.typeOf & {
			self.hasEqualElements(aDictionary, aBlock:/2)
		}
	}

	errorValueNotFound { :self |
		self.error('Value not found')
	}

	fillFromWith { :self :aCollection :aBlock:/1 |
		aCollection.isDictionary.if {
			aCollection.associationsDo { :association |
				self[association.key] := aBlock(association.value)
			}
		} {
			aCollection.do { :element |
				self.add(aBlock(element))
			}
		}
	}

	hasEqualElements { :self :aDictionary :aBlock:/2 |
		(self.size = aDictionary.size).if {
			self.keys.allSatisfy { :key |
				aDictionary.atIfPresentIfAbsent(key) { :value |
					aBlock(self[key], value)
				} {
					false
				}
			}
		} {
			false
		}
	}

	hasEqualElements { :self :aDictionary |
		self.hasEqualElements(aDictionary, =)
	}

	include { :self :anAssociation |
		self[anAssociation.key] := anAssociation.value;
		anAssociation
	}

	includeAll { :self :aCollection |
		aCollection.associationsDo { :anAssociation |
			self.include(anAssociation)
		};
		aCollection
	}

	includesAssociation { :self :anAssociation |
		self.atIfPresentIfAbsent(anAssociation.key) { :value |
			anAssociation.value = value
		} {
			false
		}
	}

	includesIdentity { :self :anObject |
		valueWithReturn { :return:/1 |
			self.do { :each |
				(anObject == each).ifTrue {
					true.return
				}
			};
			false
		}
	}

	includesKey { :self :key |
		self.keys.includesBy(key, self.comparator)
	}

	includesKeys { :self :aCollection |
		aCollection.allSatisfy { :each |
			self.includesKey(each)
		}
	}

	indices { :self |
		self.keys
	}

	isDictionary { :unused |
		true
	}

	keyAtValueIfAbsent { :self :value :exceptionBlock:/0 |
		valueWithReturn { :return:/1 |
			self.associationsDo { :association |
				(value = association.value).ifTrue {
					association.key.return
				}
			};
			exceptionBlock()
		}
	}

	keyAtValue { :self :value |
		self.keyAtValueIfAbsent(value) {
			self.errorValueNotFound
		}
	}

	keysAndValues { :self |
		let answer = [];
		self.keysAndValuesDo { :key :value |
			answer.add([key, value])
		};
		answer
	}

	keysAndValuesCollect { :self :aBlock:/2 |
		let answer = self.species.new;
		self.keysAndValuesDo { :key :value |
			answer.add(key -> aBlock(key, value))
		};
		answer
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.typeResponsibility('@Dictionary>>keysAndValuesDo')
	}

	keysAndValuesRemove { :self :keyValueBlock:/2 |
		self.associationsRemove { :each |
			keyValueBlock(each.key, each.value)
		}
	}

	keysDo { :self :aBlock:/1 |
		self.keysAndValuesDo { :key :value |
			aBlock(key)
		}
	}

	keySelect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.associationsDo { :each |
			each.key.aBlock.ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	keySort { :self |
		self.associations.sortOn(key:/1)
	}

	keyType { :self |
		self.keys.elementType
	}

	lookup { :self :key :defaultAnswer |
		key.isList.if {
			key.collect { :each |
				self.lookup(each, defaultAnswer)
			}
		} {
			self.atIfAbsent(key) {
				defaultAnswer.value
			}
		}
	}

	remove { :self :anAssociation |
		self.removeAssociation(anAssociation)
	}

	removeAll { :self |
		self.associationsRemove { :unusedItem |
			true
		}
	}

	removeAllKeys { :self :keys |
		self.associationsRemove { :each |
			keys.includes(each.key)
		}
	}

	removeAllSuchThat { :self :aBlock:/1 |
		self.associationsRemove { :each |
			aBlock(each.value)
		}
	}

	removeAssociationIfAbsent { :self :oldObject :anExceptionBlock:/0 |
		self.includesAssociation(oldObject).if {
			self.removeKey(oldObject.key)
		} {
			anExceptionBlock()
		}
	}

	removeAssociation { :self :oldObject |
		self.removeAssociationIfAbsent(oldObject) {
			self.error('removeAssociation: not present')
		}
	}

	removeAt { :self :key |
		self.removeKey(key)
	}

	removeAtAll { :self :keys |
		self.removeAllKeys(keys)
	}

	removeKey { :self :key |
		self.removeKeyIfAbsent(key) {
			self.error('@Dictionary>>removeKey')
		}
	}

	removeKeyIfAbsent { :self :key :ifAbsent:/0 |
		let index = self.keys.indexOfBy(key, self.comparator);
		(index = 0).if {
			ifAbsent()
		} {
			self.keys.removeAt(index);
			self.values.removeAt(index)
		}
	}

	removeIfAbsent { :self :oldObject :anExceptionBlock:/0 |
		self.shouldNotImplement('removeIfAbsent')
	}

	replace { :self :aBlock:/1 |
		self.keysDo { :key |
			self[key] := aBlock(self[key])
		}
	}

	select { :self :aBlock:/1 |
		let answer = self.species.new;
		self.associationsDo { :each |
			each.value.aBlock.ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	size { :self |
		self.typeResponsibility('@Dictionary>>size')
	}

	storeStringLiteral { :self :empty :open :close :formatKey:/1 :join :formatValue:/1 |
		self.isEmpty.if {
			empty
		} {
			'%%%'.format(
				[
					open,
					self.associations.collect { :each |
						'%%%'.format(
							[
								each.key.formatKey,
								join,
								each.value.formatValue
							]
						)
					}.commaSeparated,
					close
				]
			)
		}
	}

	storeStringExpression { :self |
		'%.as%'.format(
			[
				self.associations.storeString,
				self.typeOf
			]
		)
	}

	valuesDo { :self :aBlock:/1 |
		self.keysAndValuesDo { :key :value |
			aBlock(value)
		}
	}

	withIndexCollect { :self :aBlock:/2 |
		self.keysAndValuesCollect { :key :value |
			aBlock(value, key)
		}
	}

	valueSort { :self |
		self.associations.sortOn(value:/1)
	}

	valueType { :self |
		self.values.elementType
	}

}

+List {

	keyIntersection { :self |
		let keys = self.collect(keys:/1).intersection;
		self.collect { :each |
			let item = each.species.new;
			keys.do { :key |
				item.add(key -> each.at(key))
			};
			item
		}
	}

	keyUnion { :self :blockOrDictionary |
		let keys = Set();
		let aBlock:/1 = blockOrDictionary.isBlock.if {
			blockOrDictionary
		} {
			{ :key |
				blockOrDictionary.at(key)
			}
		};
		self.do { :each |
			keys.includeAll(each.keys)
		};
		self.collect { :each |
			let copy = each.copy;
			keys.do { :key |
				copy.includesKey(key).ifFalse {
					copy.add(key -> aBlock(key))
				}
			};
			copy
		}
	}

	keyUnion { :self |
		self.keyUnion { :key |
			Missing('KeyAbsent', key)
		}
	}

	lookup { :self :key :defaultValue |
		self.collect { :each |
			each.lookup(key, defaultValue)
		}
	}

	merge { :self :aBlock:/1 |
		let keys = self.collect(keys:/1).union;
		let values = keys.collect { :key |
			let list = [];
			self.do { :each |
				each.includesKey(key).ifTrue {
					list.add(each.at(key))
				}
			};
			list
		};
		let answer = self.anyOne.species.new;
		keys.withDo(values) { :key :value |
			answer.add(key -> aBlock(value))
		};
		answer
	}

	merge { :self |
		self.merge(identity:/1)
	}

}

+@Collection {

	dictionaryJoin { :self |
		self.ifEmpty {
			self.error('@Collection>>dictionaryJoin')
		} {
			let answer = self.first.copy;
			self.allButFirstDo { :each |
				answer.includeAll(each)
			};
			answer
		}
	}

}

Dictionary : [Object, Storeable, Copyable, Equatable, Iterable, Indexable, Collection, Extensible, Removable, Dictionary] { | keys values comparator |

	atIfAbsent { :self :key :ifAbsent:/0 |
		let index = self.keys.indexOfBy(key, self.comparator);
		(index = 0).if {
			ifAbsent()
		} {
			self.values[index]
		}
	}

	atPut { :self :key :value |
		let index = self.keys.indexOfBy(key, self.comparator);
		(index = 0).if {
			self.keys.add(key);
			self.values.add(value)
		} {
			self.values[index] := value
		};
		value
	}

	keysAndValuesDo { :self :aBlock:/2 |
		let keys = self.keys;
		let values = self.values;
		let size = keys.size;
		1.toDo(size) { :index |
			aBlock(keys[index], values[index])
		};
		nil
	}

	postCopy { :self |
		self.keys := self.keys.copy;
		self.values := self.values.copy
	}

	size { :self |
		self.keys.size
	}

	storeString { :self |
		self.storeStringLiteral(
			'[| |]',
			'[|', '|]',
			storeString:/1, ' -> ', storeString:/1
		)
	}

}

+Void {

	Dictionary {
		newDictionary().initializeSlots([], [], =)
	}

}

+List {

	asDictionary { :self |
		Dictionary(self)
	}

	Dictionary { :self |
		self.isEmpty.if {
			Dictionary()
		} {
			self.isAssociationList.if {
				self.collect(keyValue:/1).listToDictionary
			} {
				self.listToDictionary
			}
		}
	}

	listToDictionary { :self |
		let [_, m] = self.dimensions;
		(m = 2).if {
			let [keys, values] = self.transpose;
			let answer = Dictionary();
			answer.keys := keys;
			answer.values := values;
			answer
		} {
			self.error('List>>listToDictionary')
		}
	}

}
