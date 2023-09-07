@ArrayedCollection {

	Array { :self |
		Array(self.size).fillFromWith(self, identity:/1)
	}

	at { :self :index |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			return _self[_index - 1];
		}
		>
		self.errorInvalidIndex('at', index)
	}

	atIfPresentIfAbsent { :self :index :ifPresent:/1 :ifAbsent:/0 |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			return _ifPresent_1(_self[_index - 1]);
		} {
			return _ifAbsent_0();
		}
		>
	}

	atPut { :self :index :anObject |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index)) {
			_self[_index - 1] = _anObject;
			return _anObject;
		}
		>
		self.errorInvalidIndex('atPut', index)
	}

	basicAt { :self :index |
		<primitive: return _self[_index - 1];>
	}

	basicAtPut { :self :index :value |
		<primitive:
		_self[_index - 1] = _value;
		return _value;
		>
	}

	collect { :self :aProcedure:/1 |
		<primitive:
		if(_aProcedure_1 instanceof Function) {
			return _self.map(function(each) {
				return _aProcedure_1(each);
			});
		}
		>
		self.error('@ArrayedCollection>>collect: not a procedure')
	}

	detectIfFoundIfNone { :self :aProcedure:/1 :whenFound:/1 :whenNone:/0 |
		<primitive:
		var item = _self.find(function(element) {
			return _aProcedure_1(element);
		});
		return (item !== undefined) ? _whenFound_1(item) : _whenNone_0();
		>
	}

	do { :self :aProcedure:/1 |
		<primitive:
		_self.forEach(function(item) {
			return _aProcedure_1(item)
		});
		>
		self
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.withIndexDo { :each :index |
			self[index] := aProcedure(each)
		};
		self
	}

	findFirstElement { :self :aProcedure:/1 |
		<primitive:
		var item = _self.find(function(element) {
			return _aProcedure_1(element);
		});
		return (item === undefined) ? null : item;
		>
	}

	findFirst { :self :aProcedure:/1 |
		<primitive:
		var index = _self.findIndex(function(element) {
			return _aProcedure_1(element);
		});
		return index + 1;
		>
	}

	findLast { :self :aBlock:/1 |
		| index = self.size + 1; |
		valueWithReturn { :return:/1 |
			{ (index := index - 1) >= 1 }.whileTrue {
				aBlock(self[index]).ifTrue {
					index.return
				}
			};
			0
		}
	}

	injectInto { :self :anObject :aProcedure:/2 |
		| result = anObject; |
		self.indicesDo { :index |
			result := aProcedure(result, self[index])
		};
		result
	}

	insertAt { :self :anObject :index |
		<primitive:
		_self.splice(_index - 1, 0, _anObject);
		return _anObject;
		>
	}

	includesIndex { :self :index |
		<primitive:
		return Number.isInteger(_index) && 0 < _index && _index <= _self.length;
		>
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		self.indicesDo { :index |
			(self[index] = anObject).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	reverse { :self |
		<primitive: return _self.reverse();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	sort { :self |
		self.sortBy(lessThanEquals:/2)
	}

	sort { :self :aBlock:/2 |
		aBlock:/2.ifNil {
			self.sort
		} {
			self.sortBy(aBlock:/2)
		}
	}

	sortBy { :self :aProcedure:/2 |
		<primitive:
		return _self.sort(function(p, q) {
			return _aProcedure_2(p, q) ? -1 : 1
		});
		>
	}

	sorted { :self :aSortProcedure:/2 |
		self.copy.sortBy(aSortProcedure:/2)
	}

	sorted { :self |
		self.copy.sort
	}

	storeString { :self |
		self.Array.storeString ++ '.' ++ self.Type.name
	}

}

@Collection {

	adaptToCollectionAndApply { :self :rcvr :aProcedure:/2 |
		(rcvr.isSequenceable & {
			self.isSequenceable
		}).if {
			rcvr.withCollect(self) { :rcvrItem :selfItem |
				aProcedure(rcvrItem, selfItem)
			}
		} {
			self.error('@Collection: only sequenceable collections may be combined arithmetically')
		}
	}

	allEqualBy { :self :aBlock:/2 |
		self.isEmpty.if {
			true
		} {
			| item = self.anyOne; |
			self.allSatisfy { :each |
				aBlock(each, item)
			}
		}
	}

	allEqual { :self |
		self.allEqualBy(equals:/2)
	}

	any { :self :numberOfElements |
		self.anyAs(numberOfElements, self.species)
	}

	anyAs { :self :numberOfElements :aProcedure:/1 |
		| index = 0, result = numberOfElements.aProcedure; |
		valueWithReturn { :return:/1 |
			result.fillFromWith(self) { :each |
				index := index + 1;
				(index > numberOfElements).if {
					result.return
				} {
					each
				}
			};
			(index = numberOfElements).ifFalse {
				self.error('@Collection>>any: Not enough elements in collection')
			};
			result
		}
	}

	Array { :self |
		| array = Array(self.size), index = 0; |
		self.do { :each |
			array[index := index + 1] := each
		};
		array
	}

	associationsDo { :self :aProcedure:/1 |
		self.do(aProcedure:/1)
	}

	atRandom { :self |
		| randomIndex = self.size.atRandom, index = 1; |
		valueWithReturn { :return:/1 |
			self.do { :each |
				(index = randomIndex).ifTrue {
					each.return
				};
				index := index + 1
			}
		}
	}

	average { :self |
		self.mean
	}

	capacity { :self |
		self.size
	}

	collect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.do { :each |
			answer.add(aProcedure(each))
		};
		answer
	}

	collectInto { :self :aProcedure :aCollection |
		aCollection.fillFromWith(self, aProcedure)
	}

	collectThenDo { :self :collectBlock:/1 :doBlock:/1 |
		self.collect(collectBlock:/1).do(doBlock:/1)
	}

	collectThenSelect { :self :collectBlock:/1 :selectBlock:/1 |
		| answer = self.species.new; |
		self.do { :each |
			| item = collectBlock(each); |
			selectBlock(item).ifTrue {
				answer.add(item)
			}
		};
		answer
	}

	contents { :self |
		self
	}

	copyWith { :self :newElement |
		| answer = self.copy; |
		answer.add(newElement);
		answer
	}

	copyWithout { :self :oldElement |
		self.reject { :each |
			each = oldElement
		}
	}

	copyWithoutAll { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	difference { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	doesNotInclude { :self :anObject |
		self.includes(anObject).not
	}

	emptyCheck { :self |
		self.isEmpty.ifTrue {
			self.errorEmptyCollection
		}
	}

	errorEmptyCollection { :self |
		self.error('errorEmptyCollection')
	}

	errorNotFound { :self :anObject |
		self.error('errorNotFound: ' ++ anObject)
	}

	errorNotIndexed { :self |
		self.error('is not indexed/keyed')
	}

	groupBy { :self :keyBlock:/1 |
		| result = Map(); |
		self.do { :each |
			| key = keyBlock(each); |
			result.atIfAbsentPut(key) {
				[]
			}.add(each)
		};
		result
	}

	histogramOf { :self |
		self.histogramOf { :each |
			each
		}
	}

	histogramOf { :self :aBlock:/1 |
		| answer = Bag(); |
		self.collectInto(aBlock:/1, answer);
		answer
	}

	indices { :self |
		nil
	}

	intersection { :self :aCollection |
		self.select { :each |
			aCollection.includes(each)
		}
	}

	isCollection { :self |
		true
	}

	ifEmpty { :self :aProcedure:/0 |
		self.isEmpty.if {
			aProcedure()
		} {
			self
		}
	}

	ifEmpty { :self :emptyBlock:/0 :notEmptyBlock |
		self.isEmpty.if {
			emptyBlock()
		} {
			notEmptyBlock.cull(self)
		}
	}

	ifEmptyIfNotEmptyDo { :self :emptyBlock:/0 :notEmptyBlock:/1 |
		self.isEmpty.if {
			emptyBlock()
		} {
			notEmptyBlock(self)
		}
	}

	ifNotEmptyDo { :self :aBlock:/1 |
		self.isEmpty.ifFalse {
			aBlock(self)
		}
	}

	isEmpty { :self |
		self.size = 0
	}

	isOfSameSizeCheck { :self :otherCollection |
		(otherCollection.size = self.size).ifFalse {
			self.error('@Collection>>isOfSameSizeCheck')
		}
	}

	isSequenceable { :self |
		false
	}

	mean { :self |
		self.sum / self.size
	}

	notEmpty { :self |
		self.isEmpty.not
	}

	ofSize { :self :aNumber |
		(self.size = aNumber).ifFalse {
			self.error('@Collection>>ofSize')
		};
		self
	}

	pseudoSlotNameArray { :self |
		['size']
	}

	reject { :self :aProcedure:/1 |
		self.select { :element |
			aProcedure(element).not
		}
	}


	select { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.do { :each |
			aProcedure(each).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	selectThenCollect { :self :selectBlock:/1 :collectBlock:/1 |
		| answer = self.species.new; |
		self.selectThenDo(selectBlock:/1) { :each |
			answer.add(collectBlock(each))
		};
		answer
	}

	sorted { :self |
		self.Array.sort
	}

	sorted { :self :sortBlock:/2 |
		self.Array.sortBy(sortBlock:/2)
	}

	take { :self :maxNumberOfElements |
		self.any(maxNumberOfElements.min(self.size))
	}

	toArray { :self |
		self.Array
	}

	union { :self :aCollection |
		| answer = self.Set; |
		answer.addAll(aCollection);
		answer
	}

	withoutDuplicates { :self |
		| seen = Set(); |
		self.select { :each |
			seen.ifAbsentAdd(each)
		}
	}

}

(* Extensible *)
+@Collection {

	addAll { :self :aCollection |
		aCollection.do { :each |
			self.add(each)
		}
	}

	addIfNotPresent { :self :anObject |
		self.includes(anObject).ifFalse {
			self.add(anObject)
		};
		anObject
	}

	addWithOccurrences { :self :newObject :anInteger |
		anInteger.timesRepeat {
			self.add(newObject)
		};
		newObject
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.do { :each |
			self.add(aProcedure(each))
		}
	}

}

(* Removeable *)
+@Collection {

	remove { :self :oldObject |
		self.removeIfAbsent(oldObject) {
			self.errorNotFound(oldObject)
		}
	}

	removeAll { :self |
		self.do { :each |
			self.remove(each)
		}
	}

	removeAll { :self :aCollection |
		(aCollection == self).if {
			self.removeAll
		} {
			aCollection.do { :each |
				self.remove(each)
			}
		};
		aCollection
	}

	removeAllFoundIn { :self :aCollection |
		aCollection.do { :each |
			self.removeIfAbsent(each) { }
		};
		aCollection
	}

	removeAllSuchThat { :self :aBlock:/1 |
		self.copy.do { :each |
			aBlock(each).ifTrue {
				self.remove(each)
			}
		}
	}

	removeIfAbsent { :self :oldObject :anExceptionBlock |
		self.typeResponsibility('@Collection>>removeIfAbsent')
	}

}

(* Numerical *)
+@Collection {


	+ { :self :arg |
		arg.adaptToCollectionAndApply(self, plus:/2)
	}

	- { :self :arg |
		arg.adaptToCollectionAndApply(self, minus:/2)
	}

	* { :self :arg |
		arg.adaptToCollectionAndApply(self, times:/2)
	}

	/ { :self :arg |
		arg.adaptToCollectionAndApply(self, dividedBy:/2)
	}

	< { :self :arg |
		arg.adaptToCollectionAndApply(self, lessThan:/2)
	}

	> { :self :arg |
		arg.adaptToCollectionAndApply(self, greaterThan:/2)
	}

	^ { :self :arg |
		arg.adaptToCollectionAndApply(self, raisedTo:/2)
	}

	% { :self :arg |
		arg.adaptToCollectionAndApply(self, modulo:/2)
	}

	abs { :self |
		self.collect(abs:/1)
	}

	arcCos { :self |
		self.collect(arcCos:/1)
	}

	arcSin { :self |
		self.collect(arcSin:/1)
	}

	arcTan { :self |
		self.collect(arcTan:/1)
	}

	ceiling { :self |
		self.collect(ceiling:/1)
	}

	cos { :self |
		self.collect(cos:/1)
	}

	cosh { :self |
		self.collect(cosh:/1)
	}

	cubed { :self |
		self.collect(cubed:/1)
	}

	exp { :self |
		self.collect(exp:/1)
	}

	floor { :self |
		self.collect(floor:/1)
	}

	fractionPart { :self |
		self.collect(fractionPart:/1)
	}

	log { :self |
		self.collect(log:/1)
	}

	log10 { :self |
		self.collect(log10:/1)
	}

	log2 { :self |
		self.collect(log2:/1)
	}

	negated { :self |
		self.collect(negated:/1)
	}

	rounded { :self |
		self.collect(rounded:/1)
	}

	sign { :self |
		self.collect(sign:/1)
	}

	sin { :self |
		self.collect(sinh:/1)
	}

	sinh { :self |
		self.collect(sinh:/1)
	}

	sqrt { :self |
		self.collect(sqrt:/1)
	}

	squared { :self |
		self.collect(squared:/1)
	}

	tan { :self |
		self.collect(tanh:/1)
	}

	tanh { :self |
		self.collect(tanh:/1)
	}

	truncated { :self |
		self.collect(truncated:/1)
	}

}

+@Object {

	isCollection { :self |
		false
	}

	toArray { :self |
		[self]
	}

}

+Procedure {

	map { :self:/1 :aCollection |
		aCollection.collect(self:/1)
	}

	ofSize { :self :aNumber |
		self.cull(aNumber).ofSize(aNumber)
	}

}

@Dictionary {

	= { :self :aDictionary |
		| keyArray = self.indices; |
		(keyArray = aDictionary.indices) & {
			keyArray.allSatisfy { :key |
				self[key] = aDictionary[key]
			}
		}
	}

	++ { :self :aDictionary |
		| answer = self.copy; |
		answer.addAll(aDictionary);
		answer
	}

	add { :self :anAssociation |
		self[anAssociation.key] := anAssociation.value;
		anAssociation
	}

	addAll { :self :aCollection |
		aCollection.associationsDo { :anAssociation |
			self.add(anAssociation)
		};
		aCollection
	}

	Array { :self |
		| answer = Array(self.size), index = 1; |
		self.valuesDo { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
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
		| answer = Array(self.size), index = 1; |
		self.associationsDo { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
	}

	associationsDo { :self :aProcedure:/1 |
		self.withIndexDo { :value :key |
			aProcedure(key -> value)
		}
	}

	associationsRemove { :self :aBlock:/1 |
		self.removeAllSuchThat(aBlock:/1)
	}

	associationsSelect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.associationsDo { :each |
			each.aProcedure.ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	atDelegateToIfAbsent { :self :key :delegateKey :aProcedure:/0 |
		self.atIfAbsent(key) {
			self.includesIndex(delegateKey).if {
				self[delegateKey].atDelegateToIfAbsent(
					key,
					delegateKey,
					aProcedure:/0
				)
			} {
				aProcedure()
			}
		}
	}

	atDelegateTo { :self :key :delegateKey |
		self.atDelegateToIfAbsent(key, delegateKey) {
			self.error('@Dictionary>>atDelegate: unknown key: ' ++ key)
		}
	}

	atPutDelegateToIfAbsent { :self :key :value :delegateKey :aProcedure:/0 |
		self.includesIndex(key).if {
			self.atPut(key, value)
		} {
			self.atIfAbsent(key) {
				self.includesIndex(delegateKey).if {
					self[delegateKey].atPutDelegateToIfAbsent(
						key,
						value,
						delegateKey,
						aProcedure:/0
					)
				} {
					aProcedure()
				}
			}
		}
	}

	atPutDelegateTo { :self :key :value :delegateKey |
		self.atPutDelegateToIfAbsent(key, value, delegateKey) {
			self.atPut(key, value)
		}
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

	collect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.withIndexDo { :value :key |
			answer.add(key -> aProcedure(value))
		};
		answer
	}

	declareFrom { :self :key :aDictionary |
		self.includesIndex(key).if {
			nil
		} {
			aDictionary.includesIndex(key).if {
				| association = aDictionary.associationAt(key); |
				self.add(association);
				aDictionary.removeKey(key);
				association
			} {
				self.add(key -> nil);
				nil
			}
		}
	}

	do { :self :aProcedure:/1 |
		self.valuesDo(aProcedure:/1)
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.isDictionary.if {
			aCollection.associationsDo { :association |
				self[association.key] := aProcedure(association.value)
			}
		} {
			aCollection.do { :element |
				self.add(aProcedure(element))
			}
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

	includesIndex { :self :key |
		self.indices.includes(key)
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

	messageSend { :self :selector :delegateKey :argumentsArray |
		| answer = self.atDelegateTo(selector, delegateKey); |
		answer.isProcedure.if {
			answer.apply([self] ++ argumentsArray)
		} {
			answer
		}
	}

	removeAll { :self |
		self.removeAllSuchThat { :unusedItem |
			true
		}
	}

	removeAllSuchThat { :self :aBlock:/1 |
		| removals = []; |
		self.associationsDo { :each |
			aBlock(each).ifTrue {
				removals.add(each.key)
			}
		};
		removals.do { :key |
			self.removeKey(key)
		}
	}

	removeAssociation { :self :oldObject |
		self.includesAssociation(oldObject).if {
			self.removeKey(oldObject.key)
		} {
			anExceptionBlock()
		}
	}

	removeAt { :self :key |
		self.includesIndex(key).if {
			| removed = self[key]; |
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

	select { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.associationsDo { :each |
			each.value.aProcedure.ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	storeString { :self |
		self.associations.storeString ++ '.' ++ self.typeOf
	}

	valuesDo { :self :aProcedure:/1 |
		self.associationsDo { :association |
			aProcedure(association.value)
		}
	}

	withIndexDo { :self :aProcedure:/2 |
		self.associationsDo { :association |
			aProcedure(association.value, association.key)
		}
	}

}

+@Object {

	isDictionary { :self |
		false
	}

}

@Indexable {

	at { :self :index |
		self.basicAt(index)
	}

	atAllPut { :self :anObject |
		self.indices.do { :index |
			self[index] := anObject
		};
		anObject
	}

	atAllPut { :self :indices :anObject |
		indices.do { :index |
			self[index] := anObject
		};
		anObject
	}

	atAllPutAll { :self :indices :values |
		indices.withDo(values) { :index :value |
			self[index] := value
		};
		values
	}

	atIfAbsent { :self :index :aBlock:/0 |
		self.includesIndex(index).if {
			self[index]
		} {
			aBlock()
		}
	}

	atIfAbsentPut { :self :index :aProcedure:/0 |
		self.atIfAbsent(index) {
			self[index] := aProcedure()
		}
	}

	atIfPresent { :self :index :aBlock:/1 |
		self.includesIndex(index).ifTrue {
			aBlock(self[index])
		}
	}

	atIfPresentIfAbsent { :self :index :ifPresent:/1 :ifAbsent:/0 |
		self.includesIndex(index).if {
			ifPresent(self[index])
		} {
			ifAbsent()
		}
	}

	atIncrementBy { :self :index :value |
		self[index] := self[index] + value
	}

	atModify { :self :index :aBlock:/1 |
		self[index] := aBlock(self[index])
	}

	atPath { :self :indices |
		| item = self; |
		indices.ifEmpty {
			self.error('atPath: empty indices')
		} {
			indices.do { :index |
				item := item[index]
			};
			item
		}
	}

	atPathPut { :self :indices :value |
		| item = self; |
		indices.ifEmpty {
			self.error('atPath: empty indices')
		} {
			1.toDo(indices.size - 1) { :indicesIndex |
				| index = indices[indicesIndex]; |
				item := item[index]
			};
			item[indices.last] := value
		}
	}

	atPut { :self :index :anObject |
		self.basicAtPut(index, anObject)
	}

	basicAt { :self :index |
		self.error('@Indexable>>basicAt: type responsibility')
	}

	basicAtPut { :self :index :anObject |
		self.error('@Indexable>>basicAtPut: type responsibility')
	}

	errorInvalidIndex { :self :for :index |
		self.error([
			'errorInvalidIndex: index not correct type or out of range.',
			' index: ', index,
			' for: ', for,
			' index.typeOf: ', index.typeOf,
			' self.size: ', self.size
		].join)
	}

	includesIndex { :self :anObject |
		self.indices.includes(anObject)
	}

	indexOf { :self :anObject |
		self.indexOfIfAbsent(anObject) {
			self.error('@Indexable>>indexOf: no such element')
		}
	}

	indexOfIfAbsent { :self :anObject :aBlock:/0 |
		valueWithReturn { :return:/1 |
			self.indices.do { :index |
				(self[index] = anObject).ifTrue {
					index.return
				}
			};
			aBlock()
		}
	}

	indices { :self |
		self.error('@Indexable>>indices: type responsibility')
	}

	indicesSorted { :self |
		| answer = self.indices; |
		answer.sort;
		answer
	}

	indicesDo { :self :aBlock:/1 |
		self.indices.do(aBlock:/1)
	}

	isIndexable { :self |
		true
	}

	withIndexDo { :self :elementAndIndexProcedure:/2 |
		self.indices.do { :index |
			elementAndIndexProcedure(self[index], index)
		}
	}

}

+@Object {

	isIndexable { :self |
		false
	}

}

@SequenceableCollection {

	equalsBy { :self :anObject :aBlock:/2 |
		(self == anObject) | {
			(self.typeOf = anObject.typeOf) & {
				self.hasEqualElementsBy(anObject, aBlock:/2)
			}
		}
	}

	= { :self :anObject |
		self.equalsBy(anObject, equals:/2)
	}

	~ { :self :anObject |
		self.equalsBy(anObject, tilde:/2)
	}

	++ { :self :aSequence |
		self.copyReplaceFromToWith(
			self.size + 1,
			self.size,
			aSequence
		)
	}

	allButFirst { :self |
		self.allButFirst(1)
	}

	allButFirst { :self :n |
		self.copyFromTo(n + 1, self.size)
	}

	allButFirstDo { :self :aBlock:/1 |
		2.toDo(self.size) { :index |
			aBlock(self[index])
		}
	}

	allButLast { :self |
		self.allButLast(1)
	}

	allButLast { :self :n |
		self.copyFromTo(1, self.size - n)
	}

	allButLastDo { :self :aBlock:/1 |
		1.toDo(self.size - 1) { :index |
			aBlock(self[index])
		}
	}

	asDigitsAtInDo { :self :anInteger :aCollection :aBlock:/1 |
		self.do { :each |
			aCollection[anInteger] := each;
			(anInteger = aCollection.size).if {
				aBlock(aCollection)
			} {
				self.asDigitsAtInDo(anInteger + 1, aCollection, aBlock:/1)
			}
		}
	}

	asDigitsToPowerDo { :self :anInteger :aBlock:/1 |
		| aCollection = Array(anInteger); |
		self.asDigitsAtInDo(1, aCollection, aBlock:/1)
	}

	atAll { :self :indexArray |
		| answer = self.species.ofSize(indexArray.size); |
		indexArray.indicesDo { :index |
			answer[index] := self[indexArray[index]]
		};
		answer
	}

	atAllPut { :self :anObject |
		| size = self.size; |
		(size > 50).if {
			self.fromToPut(1, size, anObject)
		} {
			self.indicesDo { :index |
				self[index] := anObject
			}
		};
		anObject
	}

	atLastPut { :self :indexFromEnd :anObject |
		self[self.size + 1 - indexFromEnd] := anObject
	}

	atPin { :self :index |
		(index < 1).if {
			self.first
		} {
			(index > self.size).if {
				self.last
			} {
				self[index]
			}
		}
	}

	atWrap { :self :index |
		self[index - 1 % self.size + 1]
	}

	atWrapPut { :self :index :anObject |
		self[index - 1 % self.size + 1] := anObject
	}

	atRandomBy { :self :random |
		self[random.randomInteger(1, self.size)]
	}

	atRandom { :self |
		self.atRandomBy(system)
	}

	beginsWith { :self :sequence |
		| sequenceSize = sequence.size; |
		valueWithReturn { :return:/1 |
			(self.size < sequenceSize).ifTrue {
				false.return
			};
			1.toDo(sequenceSize) { :index |
				(sequence[index] = self[index]).ifFalse {
					false.return
				}
			};
			true
		}
	}

	beginsWithAnyOf { :self :aCollection |
		aCollection.anySatisfy { :prefix |
			self.beginsWith(prefix)
		}
	}

	collect { :self :aProcedure:/1 |
		| answer = self.species.ofSize(self.size); |
		self.indicesDo { :index |
			answer[index] := aProcedure(self[index])
		};
		answer
	}

	combinationsAtATimeDo { :self :kk :aBlock:/1 |
		| aCollection = Array(kk); |
		self.combinationsAtInAfterDo(1, aCollection, 0, aBlock:/1)
	}

	combinationsAtInAfterDo { :self :j :aCollection :n :aBlock:/1 |
		(n + 1).toDo(self.size) { :index |
			aCollection[j] := self[index];
			(j = aCollection.size).if {
				aBlock(aCollection)
			} {
				self.combinationsAtInAfterDo(j + 1, aCollection, index, aBlock:/1)
			}
		}
	}

	concatenation { :self |
		|(
			answerSize = self.injectInto(0) { :sum :each |
				sum + each.size
			},
			answer = self.species.ofSize(answerSize),
			index = 1
		)|
		self.do { :each |
			each.do { :item |
				answer[index] := item;
				index := index + 1
			}
		};
		answer
	}

	copyFromTo { :self :start :stop |
		1.toAsCollect(stop - start + 1, self.species) { :index |
			self[index + start - 1]
		}
	}

	copyReplaceFromToWith { :self :start :stop :aCollection |
		|(
			end = start - 1 + aCollection.size,
			newSize = self.size + end - stop,
			answer = self.species.ofSize(newSize)
		)|
		(start > 1).ifTrue {
			answer.replaceFromToWithStartingAt(1, start - 1, self, 1)
		};
		(start <= end).ifTrue {
			answer.replaceFromToWithStartingAt(start, end, aCollection, 1)
		};
		(end < newSize).ifTrue {
			answer.replaceFromToWithStartingAt(end + 1, newSize, self, stop + 1)
		};
		answer
	}

	copyWithFirst { :self :newElement |
		| answer = self.copy; |
		answer.addFirst(newElement);
		answer
	}

	do { :self :aProcedure:/1 |
		self.indicesDo { :index |
			aProcedure(self[index])
		};
		self
	}

	doSeparatedBy { :self :elementBlock:/1 :separatorBlock:/0 |
		self.indicesDo { :index |
			(index = 1).ifFalse {
				separatorBlock()
			};
			elementBlock(self[index])
		}
	}

	doWhile { :self :activity:/1 :condition:/0 |
		| nextIndex = 1, endIndex = self.size; |
		{ condition() & { nextIndex <= endIndex } }.whileTrue {
			activity(self[nextIndex]);
			nextIndex := nextIndex + 1
		}
	}

	doWithout { :self :aBlock:/1 :anItem |
		self.indicesDo { :index |
			(anItem = self[index]).ifFalse {
				aBlock(self[index])
			}
		}
	}

	fillWith { :self :aBlock |
		self.indicesDo { :index |
			self[index] := aBlock.cull(index)
		};
		self
	}

	findBinary { :self :aBlock:/1 |
		self.findBinaryDoIfNone(aBlock:/1) { :found |
			found
		} {
			self.error('@SequenceableCollection>>findBinary: not found')
		}
	}

	findBinaryDoIfNone { :self :aBlock:/1 :actionBlock:/1 :exceptionBlock |
		self.findBinaryIndexDoIfNone(aBlock:/1) { :foundIndex |
			actionBlock(self[foundIndex])
		} { :previousIndex :nextIndex |
			exceptionBlock.cull(
				(previousIndex > 0).ifTrue { self[previousIndex] },
				(nextIndex <= self.size).ifTrue { self[nextIndex] }
			)
		}
	}

	findBinaryIfNone { :self :aBlock:/1 :exceptionBlock |
		self.findBinaryDoIfNone(aBlock:/1, { :found | found }, exceptionBlock)
	}

	findBinaryIndex { :self :aBlock:/1 |
		self.findBinaryIndexDoIfNone(aBlock:/1) { :found |
			found
		} {
			self.error('@SequenceableCollection>>findBinaryIndex: not found')
		}
	}

	findBinaryIndexDoIfNone { :self :aBlock:/1 :actionBlock:/1 :exceptionBlock |
		| low = 1, high = self.size; |
		valueWithReturn { :return:/1 |
			{ high < low }.whileFalse {
				| index = high + low // 2, test = aBlock(self[index]); |
				(test < 0).if {
					high := index - 1
				} {
					(0 < test).if {
						low := index + 1
					} {
						actionBlock(index).return
					}
				}
			};
			exceptionBlock.cull(high, low)
		}
	}

	findBinaryIndexIfNone { :self :aBlock:/1 :exceptionBlock |
		self.findBinaryIndexDoIfNone(aBlock:/1, { :found | found }, exceptionBlock)
	}

	first { :self |
		self[1]
	}

	first { :self :n |
		self.copyFromTo(1, n)
	}

	firstIndex { :self |
		1
	}

	fisherYatesShuffleBy { :self :random |
		self.size.downToDo(2) { :item |
			self.swapWith(item, random.randomInteger(1, item))
		};
		self
	}

	fisherYatesShuffle { :self |
		self.fisherYatesShuffleBy(system)
	}

	flattened { :self |
		| answer = []; |
		self.do { :item |
			item.isCollection.if {
				answer.addAll(item.flattened)
			} {
				answer.add(item)
			}
		};
		answer
	}

	forceToPaddingWith { :self :length :anObject |
		| answer = self.species.new(length); |
		answer.atAllPut(anObject);
		answer.replaceFromToWithStartingAt(1, self.size.min(length), self, 1);
		answer
	}

	foldLeft { :self :aProcedure:/2 |
		self.reduce(aProcedure:/2)
	}

	foldRight { :self :aProcedure:/2 |
		self.ifEmpty {
			self.errorEmptyCollection
		} {
			| answer = self.last; |
			(self.size - 1).toByDo(1, -1) { :index |
				answer := aProcedure(self[index], answer)
			};
			answer
		}
	}

	fromToDo { :self :start :stop :aBlock:/1 |
		start.toDo(stop) { :index |
			aBlock(self[index])
		}
	}

	fromToPut { :self :startIndex :endIndex :anObject |
		(startIndex > endIndex).if {
			self
		} {
			| written = 1, toWrite = endIndex - startIndex + 1, thisWrite = nil; |
			self[startIndex] := anObject;
			(written < toWrite).whileTrue {
				thisWrite := written.min(toWrite - written);
				self.replaceFromToWithStartingAt(
					startIndex + written,
					startIndex + written + thisWrite - 1,
					self,
					startIndex
				)
			};
			written := written + thisWrite
		};
		anObject
	}

	groupsDo { :self :aBlock |
		|numArgs = aBlock.numArgs; |
		numArgs.caseOfOtherwise([
			{ 0 } -> { self.error('groupsDo: At least one block argument expected') },
			{ 1 } -> { self.do(aBlock) },
			{ 2 } -> { self.pairsDo(aBlock) }
		]) {
			|(
				argumentArray = Array(numArgs),
				index = 1,
				endIndex = self.size - numArgs + 1
			)|
			{ index <= endIndex }.whileTrue {
				argumentArray.replaceFromToWithStartingAt(1, numArgs, self, index);
				aBlock.valueWithArguments(argumentArray);
				index := index + numArgs
			}
		}
	}

	grownBy { :self :length |
		| answer = self.species.ofSize(self.size + length); |
		answer.replaceFromToWithStartingAt(1, self.size, self, 1)
	}

	hasEqualElementsBy { :self :otherCollection :aBlock:/2 |
		(otherCollection.isSequenceable & {
			self.size = otherCollection.size
		}).if {
			valueWithReturn { :return:/1 |
				self.indicesDo { :index |
					aBlock(self[index], otherCollection[index]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			false
		}
	}

	hasEqualElements { :self :otherCollection |
		self.hasEqualElementsBy(otherCollection, equals:/2)
	}

	includes { :self :anObject |
		self.indexOf(anObject) ~= 0
	}

	includesIndex { :self :index |
		index.isInteger & {
			index > 0 & {
				index <= self.size
			}
		}
	}

	indexOf { :self :anElement |
		self.indexOfStartingAt(anElement, 1)
	}

	indexOfIfAbsent { :self :anElement :exceptionBlock:/0 |
		| index = self.indexOfStartingAt(anElement, 1); |
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	indexOfStartingAt { :self :anElement :start |
		valueWithReturn { :return:/1 |
			start.toDo(self.size) { :index |
				(self[index] = anElement).ifTrue {
					index.return
				}
			};
			0
		}
	}

	indexOfSubCollection { :self :aSubCollection |
		self.indexOfSubCollectionStartingAt(aSubCollection, 1)
	}

	indexOfSubCollectionStartingAt { :self :subCollection :start |
		| subCollectionSize = subCollection.size; |
		(subCollectionSize = 0).if {
			0
		} {
			| first = subCollection[1]; |
			valueWithReturn { :return:/1 |
				start.max(1).toDo(self.size - subCollectionSize + 1) { :startIndex |
					(self[startIndex] = first).ifTrue {
						| index = 2; |
						{
							(index <= subCollectionSize) & {
								self[startIndex + index - 1] = subCollection[index]
							}
						}.whileTrue {
							index := index + 1
						};
						(index <= subCollectionSize).ifFalse {
							startIndex.return
						}
					}
				};
				0
			}
		}
	}

	indexValueAssociations { :self |
		| answer = Array(self.size); |
		self.withIndexDo { :each :index |
			answer[index] := (index -> each)
		};
		answer
	}

	indices { :self |
		(1 .. self.size)
	}

	indicesSorted { :self |
		(1 .. self.size)
	}

	indicesDo { :self :aBlock:/1 |
		1.toDo(self.size, aBlock:/1)
	}

	indicesOfSubCollection { :self :subCollection |
		self.indicesOfSubCollectionStartingAt(subCollection, 1)
	}

	indicesOfSubCollectionStartingAt { :self :subCollection :initialIndex |
		| answer = [], index = initialIndex - 1; |
		{
			index := self.indexOfSubCollectionStartingAt(subCollection, index + 1);
			index = 0
		}.whileFalse {
			answer.add(index)
		};
		answer
	}

	isOctetSequence { :self |
		self.allSatisfy { :each |
			each.isInteger & {
				each >= 0
			} & {
				each < 256
			}
		}
	}

	isSequenceable { :self |
		true
	}

	isSorted { :self |
		self.isSortedBetweenAnd(1, self.size)
	}

	isSortedBetweenAnd { :self :startIndex :endIndex |
		self.isSortedByBetweenAnd(lessThanEquals:/2, startIndex, endIndex)
	}

	isSortedBy { :self :aProcedure:/2 |
		self.isSortedByBetweenAnd(aProcedure:/2, 1, self.size)
	}

	isSortedByBetweenAnd { :self :aProcedure:/2 :startIndex :endIndex |
		(endIndex <= startIndex).if {
			true
		} {
			| previousElement = self[startIndex]; |
			valueWithReturn { :return:/1 |
				(startIndex + 1).toDo(endIndex) { :index |
					| element = self[index]; |
					aProcedure(previousElement, element).ifFalse {
						false.return
					};
					previousElement := element
				};
				true
			}
		}
	}

	last { :self |
		self[self.size]
	}

	last { :self :n |
		| size = self.size; |
		self.copyFromTo(size - n + 1, size)
	}

	lastIndex { :self |
		self.size
	}

	lastIndexOf { :self :anElement |
		self.lastIndexOfStartingAt(anElement, self.size)
	}

	lastIndexOfIfAbsent { :self :anElement :exceptionBlock:/0 |
		| index = self.lastIndexOfStartingAt(anElement, self.size); |
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	lastIndexOfStartingAt { :self :anElement :lastIndex |
		valueWithReturn { :return:/1 |
			lastIndex.downToDo(1) { :index |
				(self[index] = anElement).ifTrue {
					index.return
				}
			};
			0
		}
	}

	lastIndexOfStartingAtIfAbsent { :self :anElement :lastIndex :exceptionBlock:/0 |
		| index = self.lastIndexOfStartingAt(anElement, lastIndex); |
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	middle { :self |
		self[self.size // 2 + 1]
	}

	pairsCollect { :self :aBlock:/2 |
		(1 .. self.size // 2).collect { :index |
			aBlock(self[2 * index - 1], self[2 * index])
		}
	}

	pairsDo { :self :aProcedure:/2 |
		1.toDo(self.size // 2) { :index |
			aProcedure(self[2 * index - 1], self[2 * index])
		}
	}

	permutations { :self |
		| answer = []; |
		self.permutationsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	permutationsDo { :self :aBlock:/1 |
		self.copy.permutationsStartingAtDo(1, aBlock:/1)
	}

	permutationsStartingAtDo { :self :anInteger :aBlock:/1 |
		(anInteger > self.size).if {
			self
		} {
			(anInteger = self.size).if {
				aBlock(self)
			} {
				anInteger.upToDo(self.size) { :index |
					self.swapWith(anInteger, index);
					self.permutationsStartingAtDo(anInteger + 1, aBlock:/1);
					self.swapWith(anInteger, index)
				}
			}
		}
	}

	replace { :self :aBlock:/1 |
		self.indicesDo { :index |
			self[index] := aBlock(self[index])
		}
	}

	replaceFromToWith { :self :start :stop :replacement |
		(replacement.size = (stop - start + 1)).if {
			self.replaceFromToWithStartingAt(start, stop, replacement, 1)
		} {
			self.error('replaceFromToWith: size of replacement doesnt match')
		}
	}

	replaceFromToWithStartingAt { :self :start :stop :replacement :replacementStart |
		| replacementOffset = replacementStart - start, index = start; |
		{ index <= stop }.whileTrue {
			self[index] := replacement[replacementOffset + index];
			index := index + 1
		};
		self
	}

	reversed { :self |
		| answer = self.species.ofSize(self.size), fromIndex = self.size + 1; |
		self.indicesDo { :toIndex |
			answer[toIndex] := self[fromIndex - 1];
			fromIndex := fromIndex - 1
		};
		answer
	}

	reverseDo { :self :aProcedure:/1 |
		self.size.downToDo(1) { :index |
			aProcedure(self[index])
		}
	}

	reverseWithDo { :self :aSequenceableCollection :aBlock:/2 |
		(self.size ~= aSequenceableCollection.size).if {
			self.error('reverseWithDo: unequal size')
		} {
			self.size.downToDo(1) { :index |
				aBlock(self[index], aSequenceableCollection[index])
			}
		}
	}

	rotate { :self :anInteger |
		self.rotateRight(anInteger)
	}

	rotateLeft { :self :anInteger |
		(1 + anInteger).toAsCollect(self.size + anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	rotateRight { :self :anInteger |
		(1 - anInteger).toAsCollect(self.size - anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	second { :self |
		self[2]
	}

	secondLast { :self |
		self[self.size - 1]
	}

	select { :self :aProcedure:/1 |
		| answer = []; |
		self.indicesDo { :index |
			aProcedure(self[index]).ifTrue {
				answer.add(self[index])
			}
		};
		self.species.newFrom(answer)
	}

	shuffleBy { :self :random |
		self.fisherYatesShuffleBy(random)
	}

	shuffle { :self |
		self.fisherYatesShuffle
	}

	shuffledBy { :self :random |
		self.copy.fisherYatesShuffleBy(random)
	}

	shuffled { :self |
		self.copy.fisherYatesShuffle
	}

	sortedWithIndices { :self |
		self.sortedWithIndices(lessThanEquals:/2)
	}

	sortedWithIndices { :self :sortBlock:/2 |
		self.ifEmpty {
			[]
		} {
			self.withIndexCollect { :each :index |
				each -> index
			}.sorted { :p :q |
				sortBlock(p.key, q.key)
			}
		}
	}

	splitBy { :self :aCollection |
		| answer = []; |
		self.splitByDo(aCollection) { :each |
			answer.add(each)
		};
		answer
	}

	splitByDo { :self :aCollection :aProcedure:/1 |
		| lastIndex = 1, nextIndex = nil; |
		{
			nextIndex := self.indexOfSubCollectionStartingAt(aCollection, lastIndex);
			nextIndex = 0
		}.whileFalse {
			aProcedure(self.copyFromTo(lastIndex, nextIndex - 1));
			lastIndex := nextIndex + aCollection.size
		};
		aProcedure(self.copyFromTo(lastIndex, self.size))
	}

	swapWith { :self :oneIndex :anotherIndex |
		| element = self[oneIndex]; |
		self[oneIndex] := self[anotherIndex];
		self[anotherIndex] := element
	}

	third { :self |
		self[3]
	}

	thirdLast { :self |
		self[self.size - 2]
	}

	transpose { :self |
		1.toAsCollect(self.first.size, self.first.species) { :index |
			self.collect { :row |
				row[index]
			}
		}
	}

	withCollect { :self :otherCollection :aProcedure:/2 |
		self.isOfSameSizeCheck(otherCollection);
		1.toAsCollect(self.size, self.species) { :index |
			aProcedure(self[index], otherCollection[index])
		}
	}

	withDo { :self :otherCollection :twoArgBlock:/2 |
		self.isOfSameSizeCheck(otherCollection);
		self.indicesDo { :index |
			twoArgBlock(self[index], otherCollection[index])
		}
	}

	withReplace { :self :otherCollection :aProcedure:/2 |
		self.isOfSameSizeCheck(otherCollection);
		self.indicesDo { :index |
			self[index] := aProcedure(self[index], otherCollection[index])
		}
	}

	withIndexCollect { :self :elementAndIndexProcedure:/2 |
		| answer = self.species.ofSize(self.size); |
		self.indicesDo { :index |
			answer[index] := elementAndIndexProcedure(self[index], index)
		};
		answer
	}

	withIndexDo { :self :elementAndIndexProcedure:/2 |
		self.indicesDo { :index |
			elementAndIndexProcedure(self[index], index)
		}
	}

}

+@SequenceableCollection {

	applyBinaryMathOperatorInPlace { :self :anObject :aBlock:/2 |
		anObject.isNumber.if {
			self.replace { :each |
				aBlock(each, anObject)
			}
		} {
			self.withReplace(anObject, aBlock:/2)
		}
	}

	+= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, plus:/2)
	}

	-= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, minus:/2)
	}

	*= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, times:/2)
	}

	/= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, dividedBy:/2)
	}

}

@OrderedCollection {

	add { :self :anObject |
		self.addLast(anObject)
	}

	addAfter { :self :newObject :oldObject |
		| index = self.indexOf(oldObject); |
		self.insertAt(newObject, index + 1)
	}

	addAfterIndex { :self :newObject :index |
		index.betweenAnd(0, self.size).if {
			self.insertAt(newObject, index + 1);
			newObject
		} {
			self.errorInvalidIndex('addAfterIndex', index)
		}
	}

	addBefore { :self :newObject :oldObject |
		| index = self.indexOf(oldObject); |
		self.insertAt(newObject, index)
	}

	addAllFirst { :self :aCollection |
		self.addArrayFirst(aCollection.Array)
	}

	addAllLast { :self :aCollection |
		self.addArrayLast(aCollection.Array)
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add(nil)
		};
		self
	}

	removeIfAbsent { :self :oldObject :anExceptionBlock:/0 |
		| index = self.indexOf(oldObject); |
		(index = 0).if {
			anExceptionBlock()
		} {
			self.removeAt(index)
		}
	}

	removeLast { :self |
		<primitive: return _self.pop();>
	}

	removeLast { :self :count |
		<primitive: return _self.splice(_self.length - _count, _count);>
	}

}

@UnorderedCollection {

	at { :self :index |
		self.errorNotIndexed
	}

	atPut { :self :index :value |
		self.errorNotIndexed
	}

}

+@Object {

	replicateApplying { :self :anInteger :aProcedure:/1 |
		| answer = Array(anInteger); |
		answer.indicesDo { :index |
			answer[index] := aProcedure(self)
		};
		answer
	}

	replicate { :self :anInteger |
		self.replicateApplying(anInteger, identity:/1)
	}

}

+String {

	base64Decoded { :self |
		<primitive:
		const binString = atob(_self);
		return Uint8Array.from(binString, function(m) {
			return m.codePointAt(0)
		});
		>
	}

	crc16 { :self |
		self.utf8ByteArray.crc16
	}

	parseHexString { :self |
		<primitive:
		const bytes = new Uint8Array(_self.length / 2);
		for (let i = 0; i < _self.length; i ++) {
			bytes[i] = parseInt(_self.substr(i * 2, 2), 16);
		}
		return bytes;
		>
	}

}

+SmallFloat {

	fibonacciSequence { :self |
		| a = 0, b = 1, i = 0, temp = nil, answer = []; |
		{ i < self }.whileTrue {
			answer.add(b);
			temp := b;
			b := a + b;
			a := temp;
			i := i + 1
		};
		answer
	}

	fibonacciArray { :self |
		self.fibonacciSequence.Array
	}

}
