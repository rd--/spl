/* Require: Collection */

@Dictionary {

	= { :self :aDictionary |
		let keyList = self.indices;
		keyList = aDictionary.indices & {
			keyList.allSatisfy { :key |
				self[key] = aDictionary[key]
			}
		}
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

	atAll { :self :keys |
		self.associationsSelect { :each |
			keys.includes(each.key)
		}
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
		self.keys.includes(key)
	}

	isDictionary { :self |
		true
	}

	keysAndValuesCollect { :self :aBlock:/2 |
		let answer = self.species.new;
		self.keysAndValuesDo { :key :value |
			answer.add(key -> aBlock(key, value))
		};
		answer
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

	storeString { :self |
		self.associations.storeString ++ '.as' ++ self.typeOf
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

}

Dictionary : [Object, Iterable, Indexable, Collection, Extensible, Removable, Dictionary] { | keys values |

	atIfPresentIfAbsent { :self :key :ifPresent:/1 :ifAbsent:/0 |
		let index = self.keys.indexOf(key);
		(index = 0).if {
			ifAbsent()
		} {
			ifPresent(self.values[index])
		}
	}

	at { :self :key |
		self.atIfPresentIfAbsent(key, identity:/1) {
			self.error('at: unknown key: ' ++ key)
		}
	}

	atPut { :self :key :value |
		let index = self.keys.indexOf(key);
		(index = 0).if {
			self.keys.add(key);
			self.values.add(value)
		} {
			self.values[index] := value
		};
		value
	}

	includesKey { :self :key |
		self.keys.includes(key)
	}

	indices { :self |
		self.keys
	}

	keysAndValuesDo { :self :aBlock:/2 |
		let keys = self.keys;
		let values = self.values;
		1.toDo(keys.size) { :index |
			aBlock(keys[index], values[index])
		};
		nil
	}

	removeKeyIfAbsent { :self :key :ifAbsent:/0 |
		let index = self.keys.indexOf(key);
		(index = 0).if {
			ifAbsent()
		} {
			self.keys.removeAt(index);
			self.values.removeAt(index)
		}
	}

	size { :self |
		self.keys.size
	}

}

+Void {

	Dictionary {
		newDictionary().initializeSlots([], [])
	}

}

+List {

	asDictionary { :self |
		self.allSatisfy(isAssociation:/1).if {
			newDictionary().initializeSlots(
				self.collect(key:/1),
				self.collect(value:/1)
			)
		} {
			self.error('List>>asDictionary: not list of associations')
		}
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
