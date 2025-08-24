/* Require: Collection */

@Dictionary {

	= { :self :aDictionary |
		self.equalBy(aDictionary, =)
	}

	~ { :self :aDictionary |
		self.equalBy(aDictionary, ~)
	}

	++ { :self :aDictionary |
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

	at { :self :key |
		self.atIfAbsent(key) {
			self.error('@Dictionary>>at: unknown key: ' ++ key)
		}
	}

	atIfAbsent { :self :key :ifAbsent:/0 |
		let index = self.keys.indexOfBy(key, self.comparator);
		(index = 0).if {
			ifAbsent()
		} {
			self.values[index]
		}
	}

	atAll { :self :keys |
		self.associationsSelect { :each |
			keys.includesBy(each.key, self.comparator)
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

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.keysAndValuesDo { :key :value |
			answer.add(key -> aBlock(value))
		};
		answer
	}

	comparator { :self |
		self.typeResponsibility('@Dictionary>>comparator')
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
		(self.size = aDictionary.size) & {
			self.keys.allSatisfy { :key |
				aBlock(self[key], aDictionary[key])
			}
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

	hasEqualElements { :self :aDictionary |
		(self.size = aDictionary.size).if {
			self.keys.allSatisfy { :key |
				aDictionary.atIfPresentIfAbsent(key) { :value |
					self[key] = value
				} {
					false
				}
			}
		} {
			false
		}
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

	includesAllIndices { :self :indices |
		indices.allSatisfy { :each |
			self.includesKey(each)
		}
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

	indices { :self |
		self.keys
	}

	isDictionary { :self |
		true
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

	keysAndValuesCollect { :self :aBlock:/2 |
		let answer = self.species.new;
		self.keysAndValuesDo { :key :value |
			answer.add(key -> aBlock(key, value))
		};
		answer
	}

	keysAndValuesDo { :self :aBlock:/2 |
		let keys = self.keys;
		let values = self.values;
		1.toDo(keys.size) { :index |
			aBlock(keys[index], values[index])
		};
		nil
	}

	keysAndValuesRemove { :self :keyValueBlock:/2 |
		self.associationsRemove { :each |
			keyValueBlock(each.key, each.value)
		}
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

	keysDo { :self :aBlock:/1 |
		self.associationsDo { :association |
			aBlock(association.key)
		}
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
		self.shouldNotImplement('@Dictionary>>removeIfAbsent')
	}

	replace { :self :aBlock:/1 |
		self.indices.do { :key |
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
		self.keys.size
	}

	storeString { :self |
		'%.as%'.format(
			[
				self.associations.storeString,
				self.typeOf
			]
		)
	}

	valuesDo { :self :aBlock:/1 |
		self.associationsDo { :association |
			aBlock(association.value)
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
		let keys = Set(=);
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
