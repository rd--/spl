/* Requires: List */

@Dictionary {

	add! { :self :anAssociation |
		self.includesKey(anAssociation.key).if {
			self.error('@Dictionary>>add: key exists', [anAssociation.key])
		} {
			self[anAssociation.key] := anAssociation.value;
			anAssociation
		}
	}

	addAll! { :self :aCollection |
		aCollection.associationsDo { :anAssociation |
			self.add!(anAssociation)
		};
		aCollection
	}

	assertIsValidKey { :self :key |
		self.includesKey(key).if {
			key
		} {
			self.error('@Dictionary>>assertIsValidKey: no such key', [key])
		}
	}

	associationAt { :self :key |
		self.associationAtIfAbsent(key) {
			self.error('@Dictionary>>associationAt: no such key')
		}
	}

	associationAtIfAbsent { :self :key :aBlock/0 |
		self.atIfPresentIfAbsent(key) { :value |
			key -> value
		} {
			aBlock()
		}
	}

	[associations, List] { :self |
		let answer = [];
		self.associationsDo { :each |
			answer.add!(each)
		};
		answer
	}

	associationsAllSatisfy { :self :aBlock/1 |
		withReturn { :return/1 |
			self.associationsDo { :each |
				aBlock(each).ifFalse {
					false.return
				}
			};
			true
		}
	}

	associationsDo { :self :aBlock/1 |
		self.keysAndValuesDo { :key :value |
			aBlock(key -> value)
		}
	}

	associationsRemove! { :self :aBlock/1 |
		let removals = [];
		self.associationsDo { :each |
			aBlock(each).ifTrue {
				removals.add!(each.key)
			}
		};
		removals.do { :key |
			self.removeKey!(key)
		};
		removals
	}

	associationsSelect { :self :aBlock/1 |
		let answer = self.new;
		self.associationsDo { :each |
			each.aBlock.ifTrue {
				answer.add!(each)
			}
		};
		answer
	}

	associationsSwapped { :self |
		let answer = [];
		self.associationsDo { :anAssociation |
			answer.add!(anAssociation.value -> anAssociation.key)
		};
		answer
	}

	at { :self :key |
		self.atIfAbsent(key) {
			self.error('@Dictionary>>at: unknown key', [key])
		}
	}

	atAll { :self :keys |
		keys.collect { :each |
			self.at(each)
		}
	}

	atAllPath { :self :operand |
		let [keys] = operand;
		self.atAll(keys)
	}

	atIfAbsent { :self :key :ifAbsent/0 |
		self.typeResponsibility('@Dictionary>>atIfAbsent')
	}

	collect { :self :aBlock/1 |
		let answer = self.new;
		self.keysAndValuesDo { :key :value |
			answer.add!(key -> aBlock(value))
		};
		answer
	}

	collect! { :self :aBlock/1 |
		self.keysDo { :key |
			self[key] := aBlock(self[key])
		};
		self
	}

	[concatenation, ++] { :self :aDictionary |
		let answer = self.copy;
		answer.includeAll!(aDictionary);
		answer
	}

	declareFrom { :self :key :aDictionary |
		self.includesKey(key).if {
			nil
		} {
			aDictionary.includesKey(key).if {
				let association = aDictionary.associationAt(key);
				self.add!(association);
				aDictionary.removeKey!(key);
				association
			} {
				self.add!(key -> nil);
				nil
			}
		}
	}

	do { :self :aBlock/1 |
		self.valuesDo(aBlock/1)
	}

	errorValueNotFound { :self |
		self.error('Value not found')
	}

	fillFromWith! { :self :aCollection :aBlock/1 |
		aCollection.isDictionary.if {
			aCollection.associationsDo { :association |
				self[association.key] := aBlock(association.value)
			}
		} {
			aCollection.do { :element |
				self.add!(aBlock(element))
			}
		}
	}

	hasEqualElements { :self :aDictionary :aBlock/2 |
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
		self.hasEqualElements(aDictionary, isEqual/2)
	}

	include! { :self :anAssociation |
		self[anAssociation.key] := anAssociation.value;
		anAssociation
	}

	includeAll! { :self :aCollection |
		aCollection.associationsDo { :anAssociation |
			self.include!(anAssociation)
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
		withReturn { :return/1 |
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

	isEqualBy { :self :aDictionary :aBlock/2 |
		self.typeName = aDictionary.typeName & {
			self.hasEqualElements(aDictionary, aBlock/2)
		}
	}

	keyAtValue { :self :value |
		self.keyAtValueIfAbsent(value) {
			self.errorValueNotFound
		}
	}

	keyAtValueIfAbsent { :self :value :exceptionBlock/0 |
		withReturn { :return/1 |
			self.associationsDo { :association |
				(value = association.value).ifTrue {
					association.key.return
				}
			};
			exceptionBlock()
		}
	}

	keySelect { :self :aBlock/1 |
		let answer = self.new;
		self.associationsDo { :each |
			each.key.aBlock.ifTrue {
				answer.add!(each.copy)
			}
		};
		answer
	}

	keySort { :self |
		self.associations.sortOn!(key/1)
	}

	keyType { :self |
		self.keys.elementType
	}

	keysAndEachValue { :self |
		let answer = [];
		self.keysAndEachValueDo { :key :value |
			answer.add!([key, value])
		};
		answer
	}

	keysAndEachValueDo { :self :aBlock/2 |
		self.keysAndValuesDo { :key :value |
			value.isCollection.if {
				value.do { :each |
					aBlock(key, each)
				}
			} {
				self.error('keysAndEachValueDo: value not a collection')
			}
		}
	}

	keysAndValues { :self |
		let answer = [];
		self.keysAndValuesDo { :key :value |
			answer.add!([key, value])
		};
		answer
	}

	keysAndValuesCollect { :self :aBlock/2 |
		let answer = self.new;
		self.keysAndValuesDo { :key :value |
			answer.add!(key -> aBlock(key, value))
		};
		answer
	}

	keysAndValuesDo { :self :aBlock/2 |
		self.typeResponsibility('@Dictionary>>keysAndValuesDo')
	}

	keysAndValuesRemove! { :self :keyAndValueBlock/2 |
		self.associationsRemove! { :each |
			keyAndValueBlock(each.key, each.value)
		}
	}

	keysDo { :self :aBlock/1 |
		self.keysAndValuesDo { :key :value |
			aBlock(key)
		}
	}

	lookup { :self :key :defaultAnswer |
		key.isList.if {
			key.collect { :each |
				self.lookup(each, defaultAnswer)
			}
		} {
			self.atIfAbsent(key) {
				defaultAnswer
			}
		}
	}

	put! { :self :key :value |
		self.typeResponsibility('@Dictionary>>put!')
	}

	remove! { :self :anAssociation |
		self.removeAssociation!(anAssociation)
	}

	removeAll! { :self |
		self.associationsRemove! { :unusedItem |
			true
		};
		nil
	}

	removeAllSuchThat! { :self :aBlock/1 |
		self.associationsRemove! { :each |
			aBlock(each.value)
		}
	}

	removeAssociation! { :self :oldObject |
		self.removeAssociationIfAbsent!(oldObject) {
			self.error('removeAssociation!: not present')
		}
	}

	removeAssociationIfAbsent! { :self :oldObject :anExceptionBlock/0 |
		self.includesAssociation(oldObject).if {
			self.removeKey!(oldObject.key)
		} {
			anExceptionBlock()
		}
	}

	[removeAt, removeKey] { :self :key |
		let answer = self.copy;
		answer.removeAt!(key);
		answer
	}

	[removeAt!, removeKey!] { :self :key |
		self.removeKeyIfAbsent!(key) {
			self.error('@Dictionary>>removeKey!')
		}
	}

	[removeAtAll!, removeAllKeys!] { :self :keys |
		self.associationsRemove! { :each |
			keys.includes(each.key)
		}
	}

	removeIfAbsent! { :self :oldObject :anExceptionBlock/0 |
		self.shouldNotImplement('removeIfAbsent!')
	}

	removeKeyIfAbsent! { :self :key :ifAbsent/0 |
		let index = self.keys.indexOfBy(key, self.comparator);
		(index = 0).if {
			ifAbsent()
		} {
			self.keys.removeAt!(index);
			self.values.removeAt!(index)
		}
	}

	select { :self :aBlock/1 |
		let answer = self.new;
		self.associationsDo { :each |
			each.value.aBlock.ifTrue {
				answer.add!(each.copy)
			}
		};
		answer
	}

	[selectIndices, selectKeys] { :self :keys |
		self.associationsSelect { :each |
			keys.includesBy(each.key, self.comparator)
		}
	}

	size { :self |
		self.typeResponsibility('@Dictionary>>size')
	}

	storeStringExpression { :self |
		'%.as%'.format(
			[
				self.associations.storeString,
				self.typeName
			]
		)
	}

	storeStringLiteral { :self :empty :open :close :formatKey/1 :join :formatValue/1 |
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

	unaryBlock { :self |
		{ :key |
			self.at(key)
		}
	}

	valueSort { :self |
		self.associations.sortOn!(value/1)
	}

	valueType { :self |
		self.values.elementType
	}

	valuesDo { :self :aBlock/1 |
		self.keysAndValuesDo { :key :value |
			aBlock(value)
		}
	}

	withIndexCollect { :self :aBlock/2 |
		self.keysAndValuesCollect { :key :value |
			aBlock(value, key)
		}
	}

}

+List {

	keyIntersection { :self |
		let keys = self.collect(keys/1).intersection;
		self.collect { :each |
			let item = each.new;
			keys.do { :key |
				item.add!(key -> each.at(key))
			};
			item
		}
	}

	keyUnion { :self :blockOrDictionary |
		let keys = Set();
		let aBlock/1 = blockOrDictionary.unaryBlock;
		self.do { :each |
			keys.includeAll!(each.keys)
		};
		self.collect { :each |
			let copy = each.copy;
			keys.do { :key |
				copy.includesKey(key).ifFalse {
					copy.add!(key -> aBlock(key))
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

	merge { :self :aBlock/1 |
		let keys = self.collect(keys/1).union;
		let values = keys.collect { :key |
			let list = [];
			self.do { :each |
				each.includesKey(key).ifTrue {
					list.add!(each.at(key))
				}
			};
			list
		};
		let answer = self.anyOne.new;
		keys.withDo(values) { :key :value |
			answer.add!(key -> aBlock(value))
		};
		answer
	}

	merge { :self |
		self.merge(identity/1)
	}

}

+@Collection {

	dictionaryJoin { :self |
		self.ifEmpty {
			self.error('dictionaryJoin: empty collection')
		} {
			let answer = self.first.copy;
			self.allButFirstDo { :each |
				answer.includeAll!(each)
			};
			answer
		}
	}

}
