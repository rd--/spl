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
		self.includesIndex(anAssociation.key).if {
			self.error('@Dictionary>>add: index exists: ' ++ anAssociation.key)
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
		let answer = List(self.size);
		let index = 1;
		self.valuesDo { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
	}

	assertIsValidKey { :self :key |
		self.includesIndex(key).if {
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
		let answer = List(self.size);
		let index = 1;
		self.associationsDo { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
	}

	associationsDo { :self :aBlock:/1 |
		self.withIndexDo { :value :key |
			aBlock(key -> value)
		}
	}

	associationsRemove { :self :aBlock:/1 |
		self.removeAllSuchThat(aBlock:/1)
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

	basicAt { :self :key |
		<primitive: return _self[_key];>
	}

	basicAtPut { :self :key :value |
		<primitive:
		_self[_key] = _value;
		return _value;
		>
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.withIndexDo { :value :key |
			answer.add(key -> aBlock(value))
		};
		answer
	}

	declareFrom { :self :key :aDictionary |
		self.includesIndex(key).if {
			nil
		} {
			aDictionary.includesIndex(key).if {
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

	includesIndex { :self :index |
		self.indices.includes(index)
	}

	indexOfIfAbsent { :self :value :exceptionBlock:/0 |
		valueWithReturn { :return:/1 |
			self.associationsDo { :association |
				(value = association.value).ifTrue {
					association.key.return
				}
			};
			exceptionBlock()
		}
	}

	indexOf { :self :value |
		self.indexOfIfAbsent(value) {
			self.errorValueNotFound
		}
	}

	indicesDo { :self :aBlock:/1 |
		self.associationsDo { :association |
			aBlock(association.key)
		}
	}

	isDictionary { :self |
		true
	}

	keysAndValuesRemove { :self :keyValueBlock:/2 |
		self.associationsRemove { :each |
			keyValueBlock(each.key, each.value)
		}
	}

	keyAtValue { :self :value |
		self.indexOf(value)
	}

	keyAtValueIfAbsent { :self :value :exceptionBlock:/0 |
		self.indexOfIfAbsent(value, exceptionBlock:/0)
	}

	remove { :self :anAssociation |
		self.removeAssociation(anAssociation)
	}

	removeAll { :self |
		self.removeAllSuchThat { :unusedItem |
			true
		}
	}

	removeAllKeys { :self :keys |
		self.removeAllSuchThat { :each |
			keys.includes(each.key)
		}
	}

	removeAllSuchThat { :self :aBlock:/1 |
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
		self.includesIndex(key).if {
			let removed = self[key];
			self.removeKey(key);
			removed
		} {
			self.error('@Dictionary>>removeAt')
		}
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
		self.associations.storeString ++ '.' ++ self.typeOf
	}

	valuesDo { :self :aBlock:/1 |
		self.associationsDo { :association |
			aBlock(association.value)
		}
	}

	withIndexCollect { :self :aBlock:/2 |
		let answer = self.species.new;
		self.withIndexDo { :value :key |
			answer.add(key -> aBlock(value, key))
		};
		answer
	}

	withIndexDo { :self :aBlock:/2 |
		self.associationsDo { :association |
			aBlock(association.value, association.key)
		}
	}

}

+@Object {

	isDictionary { :self |
		false
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

/* Keys */
+@Dictionary {

	includesKey { :self :key |
		self.includesIndex(key)
	}

	keys { :self |
		self.indices
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.withIndexDo { :value :key |
			aBlock(key, value)
		}
	}

	keysDo { :self :aBlock:/1 |
		self.indicesDo(aBlock:/1)
	}

}
