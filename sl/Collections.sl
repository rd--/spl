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
		self.indexError('at', index)
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
		self.indexError('atPut', index)
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
		1.upToDo(self.size) { :index |
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
		1.upToDo(self.size) { :index |
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
			self.error('Only sequenceable collections may be combined arithmetically')
		}
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

	errorNotKeyed { :self |
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
		self.subclassResponsibility('@Collection>>removeIfAbsent')
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

	** { :self :arg |
		arg.adaptToCollectionAndApply(self, timesTimes:/2)
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
		| keyArray = self.keys; |
		(keyArray = aDictionary.keys) & {
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
		self.keysAndValuesDo { :key :value |
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
			self.includesKey(delegateKey).if {
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
		self.includesKey(key).if {
			self.atPut(key, value)
		} {
			self.atIfAbsent(key) {
				self.includesKey(delegateKey).if {
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
		self.keysAndValuesDo { :key :value |
			answer.add(key -> aProcedure(value))
		};
		answer
	}

	declareFrom { :self :key :aDictionary |
		self.includesKey(key).if {
			nil
		} {
			aDictionary.includesKey(key).if {
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

	includesIndex { :self :index |
		self.includesKey(index)
	}

	includesKey { :self :key |
		self.keys.includes(key)
	}

	indices { :self |
		self.keys
	}

	isDictionary { :self |
		true
	}

	keysAndValuesDo { :self :aProcedure:/2 |
		self.associationsDo { :association |
			aProcedure(association.key, association.value)
		}
	}

	keysAndValuesRemove { :self :keyValueBlock:/2 |
		self.associationsRemove { :each |
			keyValueBlock(each.key, each.value)
		}
	}

	keysDo { :self :aBlock:/1 |
		self.associationsDo { :association |
			aBlock(association.key)
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
		<primitive: _self.clear();>
		self
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

	removeAt { :self :key |
		self.includesKey(key).if {
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

	removeIfAbsent { :self :oldObject :anExceptionBlock |
		self.shouldNotImplement('@Dictionary>>removeIfAbsent')
	}

	replace { :self :aBlock:/1 |
		self.keys.do { :key |
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

	atPut { :self :index :anObject |
		self.basicAtPut(index, anObject)
	}

	basicAt { :self :index |
		self.error('@Indexable>>basicAt: type responsibility')
	}

	basicAtPut { :self :index :anObject |
		self.error('@Indexable>>basicAtPut: type responsibility')
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

	= { :self :anObject |
		(self == anObject) | {
			(self.typeOf = anObject.typeOf) & {
				self.hasEqualElements(anObject)
			}
		}
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
		2.upToDo(self.size) { :index |
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
		1.upToDo(self.size - 1) { :index |
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
		1.upToDo(indexArray.size) { :index |
			answer[index] := self[indexArray[index]]
		};
		answer
	}

	atAllPut { :self :anObject |
		| size = self.size; |
		(size > 50).if {
			self.fromToPut(1, size, anObject)
		} {
			1.upToDo(size) { :index |
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
			1.upToDo(sequenceSize) { :index |
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
		1.upToDo(self.size) { :index |
			answer[index] := aProcedure(self[index])
		};
		answer
	}

	combinationsAtATimeDo { :self :kk :aBlock:/1 |
		| aCollection = Array(kk); |
		self.combinationsAtInAfterDo(1, aCollection, 0, aBlock:/1)
	}

	combinationsAtInAfterDo { :self :j :aCollection :n :aBlock:/1 |
		(n + 1).upToDo(self.size) { :index |
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
		1.upToDo(self.size) { :index |
			aProcedure(self[index])
		};
		self
	}

	doSeparatedBy { :self :elementBlock:/1 :separatorBlock:/0 |
		1.upToDo(self.size) { :index |
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
		1.upToDo(self.size) { :index |
			(anItem = self[index]).ifFalse {
				aBlock(self[index])
			}
		}
	}

	errorSubscriptBounds { :self :index |
		self.error('@SequenceableCollection>>errorSubscriptBounds: ' ++ index)
	}

	fillWith { :self :aBlock |
		1.toDo(self.size) { :index |
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

	fromToDo { :self :start :stop :aBlock:/1 |
		start.upToDo(stop) { :index |
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

	hasEqualElements { :self :otherCollection |
		(otherCollection.isSequenceable & {
			self.size = otherCollection.size
		}).if {
			valueWithReturn { :return:/1 |
				1.upToDo(self.size) { :index |
					(self[index] = otherCollection[index]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			false
		}
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

	indexError { :self :for :index |
		self.error([
			'indexError: index not an integer or out of range.',
			' index: ', index,
			' for: ', for,
			' index.typeOf: ', index.typeOf,
			' index.isInteger: ', index.isInteger,
			' self.size: ', self.size
		].join)
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
			start.upToDo(self.size) { :index |
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
				start.max(1).upToDo(self.size - subCollectionSize + 1) { :startIndex |
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
				(startIndex + 1).upToDo(endIndex) { :index |
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

	keysDo { :self :aBlock:/1 |
		1.upToDo(self.size, aBlock:/1)
	}

	keysAndValuesDo { :self :aBlock:/2 |
		1.upToDo(self.size) { :index |
			aBlock(index, self[index])
		}
	}

	last { :self |
		self[self.size]
	}

	last { :self :n |
		| size = self.size; |
		self.copyFromTo(size - n + 1, size)
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
		1.upToDo(self.size // 2) { :index |
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
		1.upToDo(self.size) { :index |
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
		1.upToDo(self.size) { :toIndex |
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
		1.upToDo(self.size) { :index |
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
		1.upToDo(self.size) { :index |
			twoArgBlock(self[index], otherCollection[index])
		}
	}

	withReplace { :self :otherCollection :aProcedure:/2 |
		self.isOfSameSizeCheck(otherCollection);
		1.toDo(self.size) { :index |
			self[index] := aProcedure(self[index], otherCollection[index])
		}
	}

	withIndexCollect { :self :elementAndIndexProcedure:/2 |
		| answer = self.species.ofSize(self.size); |
		1.upToDo(self.size) { :index |
			answer[index] := elementAndIndexProcedure(self[index], index)
		};
		answer
	}

	withIndexDo { :self :elementAndIndexProcedure:/2 |
		1.upToDo(self.size) { :index |
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
			self.errorSubscriptBounds(index)
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
		self.errorNotKeyed
	}

	atPut { :self :index :value |
		self.errorNotKeyed
	}

}

Array : [Object, Json, Iterable, Indexable, Collection, SequenceableCollection, ArrayedCollection, OrderedCollection] {

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		self.collect { :each |
			aProcedure(aNumber, each)
		}
	}

	addArrayFirst { :self :anArray |
		<primitive:
		_self.unshift(..._anArray);
		return _anArray;
		>
	}

	addArrayLast { :self :anArray |
		<primitive:
		_self.push(..._anArray);
		return _anArray;
		>
	}

	addFirst { :self :anObject |
		<primitive:
		_self.unshift(_anObject);
		return _anObject;
		>
	}

	addLast { :self :anObject |
		<primitive: return _self.push(_anObject);>
	}

	Array { :self |
		self
	}

	atAllPut { :self :anObject |
		<primitive:
		_self.fill(_anObject);
		return _anObject;
		>
	}

	intersperse { :self :anObject |
		| answer = []; |
		self.doSeparatedBy { :each |
			answer.add(each)
		} {
			answer.add(anObject)
		};
		answer
	}

	join { :self |
		self.joinSeparatedBy('')
	}

	joinCharacters { :self |
		self.collect(string:/1).joinSeparatedBy('')
	}

	joinSeparatedBy { :self :aString |
		self.collect(asString:/1).joinStringsSeparatedBy(aString)
	}

	joinStringsSeparatedBy { :self :aString |
		<primitive: return _self.join(_aString);>
	}

	printString { :self :toString:/1 |
		'[' ++ self.collect(toString:/1).joinSeparatedBy(', ') ++ ']'
	}

	printString { :self |
		self.printString(printString:/1)
	}

	removeAll { :self |
		<primitive: return _self.splice(0);>
	}

	removeAt { :self :index |
		<primitive: return _self.splice(_index - 1, 1)[0];>
	}

	removeFirst { :self |
		<primitive: return _self.shift();>
	}

	removeFirst { :self :count |
		<primitive: return _self.splice(0, _count);>
	}

	shallowCopy { :self |
		<primitive: return Array.from(_self);>
	}

	species { :self |
		Array:/1
	}

	storeString { :self |
		self.printString(storeString:/1)
	}

	unlines { :self |
		<primitive: return _self.join('\n');>
	}

	unwords { :self |
		self.joinSeparatedBy(' ')
	}

}

+SmallFloat {

	Array { :size |
		<primitive: return Array(_size);>
	}

	Array { :size :anObject |
		| answer = Array(size); |
		answer.atAllPut(anObject);
		answer
	}

	arithmeticSeries { :self :start :step |
		1.upTo(self).collect { :item |
			(step * (item - 1)) + start
		}
	}

	geometricSeries { :self :start :grow |
		| accum = start; |
		1.upTo(self).collect { :unusedItem |
			| entry = accum; |
			accum := grow * accum;
			entry
		}
	}

	toAsCollect { :self :stop :species :aProcedure:/1 |
		|(
			answerSize = stop - self + 1,
			answer = species.ofSize(answerSize)
		)|
		1.upToDo(answerSize) { :index |
			answer[index] := aProcedure(index + self - 1)
		};
		answer
	}

}

+Void {

	Array {
		<primitive: return [];>
	}

}

+@Object {

	replicateApplying { :self :anInteger :aProcedure:/1 |
		| answer = Array(anInteger); |
		1.upToDo(anInteger) { :index |
			answer[index] := aProcedure(self)
		};
		answer
	}

	replicate { :self :anInteger |
		self.replicateApplying(anInteger, identity:/1)
	}

}

+@SequenceableCollection {

	Array { :self |
		| answer = Array(self.size); |
		1.upToDo(self.size) { :index |
			answer[index] := self[index]
		};
		answer
	}

}

ArrayBuffer : [Object] {

	byteLength { :self |
		<primitive: return _self.byteLength;>
	}

	size { :self |
		<primitive: return _self.byteLength;>
	}

	ByteArray { :self |
		<primitive: return new Uint8Array(_self);>
	}

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}

Association : [Object] { | key value |

	= { :self :anAssociation |
		anAssociation.isAssociation & {
			self.key = anAssociation.key & {
				self.value = anAssociation.value
			}
		}
	}

	< { :self :anAssociation |
		self.key < anAssociation.key
	}

	<= { :self :anAssociation |
		self.key <= anAssociation.key
	}

	> { :self :anAssociation |
		self.key > anAssociation.key
	}

	>= { :self :anAssociation |
		self.key >= anAssociation.key
	}

	Array { :self |
		[self.key, self.value]
	}

	keyValue { :self :key :value |
		self.key := key;
		self.value := value;
		self
	}

	printString { :self |
		[self.key, ' -> ', self.value].join
	}

	storeString { :self |
		[
			'Association(',
			self.key.storeString,
			', ',
			self.value.storeString,
			')'
		].join
	}

}

+@Object {

	-> { :self :anObject |
		Association(self, anObject)
	}

	Association { :self :anObject |
		newAssociation().initializeSlots(self, anObject)
	}

}

ByteArray : [Object, Iterable, Indexable, Collection, SequenceableCollection, ArrayedCollection] {

	asciiString { :self |
		<primitive: return new TextDecoder('ascii').decode(_self);>
	}

	atPut { :self :anInteger :aByte |
		<primitive:
		if(Number.isInteger(_anInteger) && sl.isByte(_aByte)) {
			_self[_anInteger - 1] = _aByte;
			return _aByte;
		}>
		self.error('atPut: index not an integer or value not a byte')
	}

	base64Encoded { :self |
		<primitive:
		const binString = Array.from(_self, function(x) {
			return String.fromCodePoint(x)
		}).join('');
		return btoa(binString);
		>
	}

	crc16 { :self |
		|(
			table = [
				16r0000, 16rC0C1, 16rC181, 16r0140, 16rC301, 16r03C0, 16r0280, 16rC241,
				16rC601, 16r06C0, 16r0780, 16rC741, 16r0500, 16rC5C1, 16rC481, 16r0440,
				16rCC01, 16r0CC0, 16r0D80, 16rCD41, 16r0F00, 16rCFC1, 16rCE81, 16r0E40,
				16r0A00, 16rCAC1, 16rCB81, 16r0B40, 16rC901, 16r09C0, 16r0880, 16rC841,
				16rD801, 16r18C0, 16r1980, 16rD941, 16r1B00, 16rDBC1, 16rDA81, 16r1A40,
				16r1E00, 16rDEC1, 16rDF81, 16r1F40, 16rDD01, 16r1DC0, 16r1C80, 16rDC41,
				16r1400, 16rD4C1, 16rD581, 16r1540, 16rD701, 16r17C0, 16r1680, 16rD641,
				16rD201, 16r12C0, 16r1380, 16rD341, 16r1100, 16rD1C1, 16rD081, 16r1040,
				16rF001, 16r30C0, 16r3180, 16rF141, 16r3300, 16rF3C1, 16rF281, 16r3240,
				16r3600, 16rF6C1, 16rF781, 16r3740, 16rF501, 16r35C0, 16r3480, 16rF441,
				16r3C00, 16rFCC1, 16rFD81, 16r3D40, 16rFF01, 16r3FC0, 16r3E80, 16rFE41,
				16rFA01, 16r3AC0, 16r3B80, 16rFB41, 16r3900, 16rF9C1, 16rF881, 16r3840,
				16r2800, 16rE8C1, 16rE981, 16r2940, 16rEB01, 16r2BC0, 16r2A80, 16rEA41,
				16rEE01, 16r2EC0, 16r2F80, 16rEF41, 16r2D00, 16rEDC1, 16rEC81, 16r2C40,
				16rE401, 16r24C0, 16r2580, 16rE541, 16r2700, 16rE7C1, 16rE681, 16r2640,
				16r2200, 16rE2C1, 16rE381, 16r2340, 16rE101, 16r21C0, 16r2080, 16rE041,
				16rA001, 16r60C0, 16r6180, 16rA141, 16r6300, 16rA3C1, 16rA281, 16r6240,
				16r6600, 16rA6C1, 16rA781, 16r6740, 16rA501, 16r65C0, 16r6480, 16rA441,
				16r6C00, 16rACC1, 16rAD81, 16r6D40, 16rAF01, 16r6FC0, 16r6E80, 16rAE41,
				16rAA01, 16r6AC0, 16r6B80, 16rAB41, 16r6900, 16rA9C1, 16rA881, 16r6840,
				16r7800, 16rB8C1, 16rB981, 16r7940, 16rBB01, 16r7BC0, 16r7A80, 16rBA41,
				16rBE01, 16r7EC0, 16r7F80, 16rBF41, 16r7D00, 16rBDC1, 16rBC81, 16r7C40,
				16rB401, 16r74C0, 16r7580, 16rB541, 16r7700, 16rB7C1, 16rB681, 16r7640,
				16r7200, 16rB2C1, 16rB381, 16r7340, 16rB101, 16r71C0, 16r7080, 16rB041,
				16r5000, 16r90C1, 16r9181, 16r5140, 16r9301, 16r53C0, 16r5280, 16r9241,
				16r9601, 16r56C0, 16r5780, 16r9741, 16r5500, 16r95C1, 16r9481, 16r5440,
				16r9C01, 16r5CC0, 16r5D80, 16r9D41, 16r5F00, 16r9FC1, 16r9E81, 16r5E40,
				16r5A00, 16r9AC1, 16r9B81, 16r5B40, 16r9901, 16r59C0, 16r5880, 16r9841,
				16r8801, 16r48C0, 16r4980, 16r8941, 16r4B00, 16r8BC1, 16r8A81, 16r4A40,
				16r4E00, 16r8EC1, 16r8F81, 16r4F40, 16r8D01, 16r4DC0, 16r4C80, 16r8C41,
				16r4400, 16r84C1, 16r8581, 16r4540, 16r8701, 16r47C0, 16r4680, 16r8641,
				16r8201, 16r42C0, 16r4380, 16r8341, 16r4100, 16r81C1, 16r8081, 16r4040
			],
			crc = 0
		)|
		1.toDo(self.size) { :index |
			|(
				octet = self[index],
				tableIndex = crc.bitXor(octet).bitAnd(16rFF) + 1
			)|
			crc := crc.bitShiftRight(8).bitXor(table[tableIndex])
		};
		crc
	}

	hex { :self |
		|(
			map = '0123456789abcdef'.asciiByteArray,
			array = ByteArray(self.size * 2),
			index = 1
		)|
		self.do { :each |
			array[index] := map[each.bitShiftRight(4) + 1];
			array[index + 1] := map[each.bitAnd(15) + 1];
			index := index + 2
		};
		array.asciiString
	}

	shallowCopy { :self |
		<primitive: return new Uint8Array(_self);>
	}

	species { :self |
		ByteArray:/1
	}

	utf8String { :self |
		<primitive: return new TextDecoder('utf8').decode(_self).normalize('NFC');>
	}

}

+Array {

	ByteArray { :self |
		| answer = ByteArray(self.size); |
		answer.fillFromWith(self, identity:/1)
	}

}

+SmallFloat {

	ByteArray { :self |
		<primitive: return new Uint8Array(_self);>
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

Float64Array : [Object, Iterable, Indexable, Collection, SequenceableCollection, ArrayedCollection] {

	atPut { :self :index :aFloat |
		<primitive:
		if(sl.arrayCheckIndex(_self, _index) && sl.isSmallFloat(_aFloat)) {
			_self[_index - 1] = _aFloat;
			return _aFloat;
		}
		>
		self.indexError('atPut', index)
	}

	shallowCopy { :self |
		<primitive: return new Float64Array(_self);>
	}

	species { :self |
		Float64Array:/1
	}

}

+Array {

	Float64Array { :self |
		| answer = Float64Array(self.size); |
		answer.fillFromWith(self, identity:/1)
	}

}

+SmallFloat {

	Float64Array { :self |
		<primitive: return new Float64Array(_self);>
	}

}

Graph : [Object] { | degree edges vertexLabels edgeLabels |

	labeledVertices { :self |
		self.vertexLabels.ifNil {
			self.vertices.collect { :each |
				each -> ''
			}
		} {
			self.vertices.withCollect(self.vertexLabels) { :vertex :label |
				vertex -> label
			}
		}
	}

	vertices { :self |
		Interval(1, self.degree)
	}

}

+@Integral {

	Graph { :self :edges :vertexLabels :edgeLabels |
		newGraph().initializeSlots(
			self,
			edges,
			vertexLabels,
			edgeLabels
		)
	}

}

Bag : [Object, Iterable, Collection, UnorderedCollection] { | contents |

	= { :self :aBag |
		aBag.isBag & {
			self.size = aBag.size & {
				valueWithReturn { :return:/1 |
					self.contents.associationsDo { :assoc |
						(aBag.occurrencesOf(assoc.key) = assoc.value).ifFalse {
							false.return
						}
					};
					true
				}
			}
		}
	}

	add { :self :anObject |
		self.addWithOccurrences(anObject, 1)
	}

	addWithOccurrences { :self :anObject :anInteger |
		self.includes(anObject).if {
			self.contents[anObject] := anInteger + self.contents[anObject]
		} {
			self.contents[anObject] := anInteger
		};
		anObject
	}

	Bag { :self |
		self
	}

	cumulativeCounts { :self |
		| s = self.size / 100.0, n = 0; |
		self.sortedCounts.collect { :a |
			n := n + a.key;
			(n / s.roundTo(0.1)) -> a.value
		}
	}

	do { :self :aProcedure:/1 |
		self.contents.associationsDo { :assoc |
			assoc.value.timesRepeat {
				aProcedure(assoc.key)
			}
		};
		self
	}

	includes { :self :anObject |
		self.contents.includesKey(anObject)
	}

	max { :self |
		self.contents.keys.injectInto(self.contents.keys.anyOne) { :max :each |
			max.max(each)
		}
	}

	min { :self |
		self.contents.keys.injectInto(self.contents.keys.anyOne) { :min :each |
			min.min(each)
		}
	}

	occurrencesOf { :self :anObject |
		self.contents.atIfAbsent(anObject) {
			0
		}
	}

	postCopy { :self |
		self.contents := self.contents.copy
	}

	removeIfAbsent { :self :oldObject :whenAbsent:/0 |
		self.includes(oldObject).if {
			| count = self.contents[oldObject]; |
			(count = 1).if {
				self.contents.removeKey(oldObject)
			} {
				self.contents[oldObject] := count - 1
			}
		} {
			whenAbsent()
		};
		oldObject
	}

	removeAll { :self |
		self.contents.removeAll
	}

	Set { :self |
		self.contents.keys.Set
	}

	setContents { :self :aDictionary |
		self.contents := aDictionary
	}

	size { :self |
		| tally = 0; |
		self.contents.do { :each |
			tally := tally + each
		};
		tally
	}

	sortedCounts { :self |
		| answer = []; |
		self.contents.associationsDo { :anAssociation |
			answer.add(anAssociation.value -> anAssociation.key)
		};
		answer.sortBy(greaterThanEquals:/2)
	}

	sortedElements { :self |
		self.contents.associations.sort
	}

	storeString { :self |
		self.contents.storeString ++ '.Bag'
	}

	species { :self |
		Bag:/0
	}

	sum { :self |
		self.ifEmpty {
			self.error('sum: empty')
		} {
			| sum = 0; |
			self.contents.keysAndValuesDo { :value :count |
				sum := sum + (value * count)
			};
			sum
		}
	}

	valuesAndCounts { :self |
		self.contents
	}

}

+Void {

	Bag {
		newBag().initializeSlots(Map())
	}

}

+@Collection {

	Bag { :self |
		| answer = Bag(); |
		answer.addAll(self);
		answer
	}

}

Map : [Object, Iterable, Collection, Indexable, Dictionary] {

	add { :self :anAssociation |
		<primitive:
		_self.set(_anAssociation.key, _anAssociation.value);
		return _anAssociation;
		>
	}

	at { :self :key |
		<primitive:
		if(_self.has(_key)) {
			return _self.get(_key);
		}
		>
		self.error('at: unknown key: ' ++ key)
	}

	atPut { :self :key :aValue |
		<primitive:
		_self.set(_key, _aValue);
		return _aValue;
		>
	}

	includesKey { :self :key |
		<primitive: return _self.has(_key);>
	}

	json { :self |
		self.json(nil, '')
	}

	json { :self :replacer :space |
		self.keys.allSatisfy(isString:/1).if {
			self.Record.json(replacer, space)
		} {
			self.error('json: not all keys are strings')
		}
	}

	keys { :self |
		<primitive: return Array.from(_self.keys());>
	}

	keysAndValuesDo { :self :aProcedure |
		<primitive:
		_self.forEach(function(value, key, _) {
			_aProcedure(key, value);
		});
		return null;
		>
	}

	Map { :self |
		self
	}

	removeKeyIfAbsent { :self :key :aProcedure |
		<primitive:
		var existed = _self.delete(_key);
		if(existed) {
			return _key;
		} else {
			return _aProcedure();
		}
		>
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
		self.associations.storeString ++ '.Map'
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

}

+Array {

	mapFromTwoElementArrays { :self |
		<primitive: return new Map(_self);>
	}

	Map { :self |
		self.collect(Array:/1).mapFromTwoElementArrays
	}

}

+Void {

	Map {
		<primitive: return new Map();>
	}

}

Set : [Object, Iterable, Collection, UnorderedCollection] {

	= { :self :anObject |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includes(each)
				}
			}
		}
	}

	add { :self :anObject |
		<primitive:
		_self.add(_anObject);
		return _anObject;
		>
	}

	Array { :self |
		<primitive: return Array.from(_self);>
	}

	do { :self :aProcedure |
		<primitive:
		_self.forEach(function(item) {
			_aProcedure(item);
		});
		>
		self
	}

	ifAbsentAdd { :self :anObject |
		self.includes(anObject).if {
			false
		} {
			self.add(anObject);
			true
		}
	}

	includes { :self :anObject |
		<primitive: return _self.has(_anObject);>
	}

	isSet { :self |
		true
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).if {
			1
		} {
			0
		}
	}

	pseudoSlotNameArray { :self |
		['size', 'Array']
	}

	remove { :self :anObject |
		<primitive:
		_self.delete(_anObject);
		return _anObject;
		>
	}

	removeAll { :self |
		<primitive:
		_self.clear();
		return null;
		>
	}

	shallowCopy { :self |
		<primitive: return new Set(_self);>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		Set:/0
	}

}

+Array {

	Set { :self |
		<primitive: return new Set(_self);>
	}

}

+@Collection {

	Set { :self |
		| answer = Set(); |
		answer.addAll(self);
		answer
	}

}

+@Dictionary {

	Set { :self |
		self.values.Set
	}

}

+@Object {

	isSet { :self |
		false
	}

}

+Void {

	Set {
		<primitive: return new Set();>
	}

}

Interval : [Object, Iterable, Collection, SequenceableCollection] { | start stop step |

	= { :self :anInterval |
		anInterval.isInterval & {
			self.start = anInterval.start & {
				self.stop = anInterval.stop & {
					self.step = anInterval.step
				}
			}
		}
	}

	+ { :self :arg |
		arg.isSmallFloat.if {
			Interval(self.start + arg, self.stop + arg, self.step)
		} {
			arg.adaptToCollectionAndApply(self, plus:/2)
		}
	}

	- { :self :arg |
		arg.isSmallFloat.if {
			Interval(self.start - arg, self.stop - arg, self.step)
		} {
			arg.adaptToCollectionAndApply(self, minus:/2)
		}
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aProcedure(aCollection, self.Array)
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		self.collect { :each |
			aProcedure(aNumber, each)
		}
	}

	Array { :self |
		self.collect(identity:/1)
	}

	at { :self :index |
		self.includesIndex(index).if {
			self.step * (index - 1) + self.start
		} {
			self.indexError('at', index)
		}
	}

	basicAt { :self :index |
		self.step * (index - 1) + self.start
	}

	collect { :self :aProcedure:/1 |
		| result = Array(self.size), index = 1; |
		self.do { :nextValue |
			result[index] := aProcedure(nextValue);
			index := index + 1
		};
		result
	}

	copyFromTo { :self :startIndex :stopIndex |
		(startIndex = 1 & { stopIndex = self.size }).if {
			self
		} {
			self[startIndex].toBy(self[stopIndex], self.step)
		}
	}

	do { :self :aProcedure:/1 |
		| nextValue = self.start, endValue = self.stop; |
		(self.step > 0).if {
			{ nextValue <= endValue }.whileTrue {
				aProcedure(nextValue);
				nextValue := nextValue + self.step
			}
		} {
			{ nextValue >= endValue }.whileTrue {
				aProcedure(nextValue);
				nextValue := nextValue + self.step
			}
		};
		self
	}

	increment { :self |
		self.step
	}

	isEmpty { :self |
		self.size = 0
	}

	last { :self |
		self.ifEmpty {
			'last: empty interval'
		} {
			self.stop - (self.stop - self.start % self.step)
		}
	}

	permutationsDo { :self :aBlock:/1 |
		self.Array.permutationsDo(aBlock:/1)
	}

	printString { :self |
		(self.step = 1).if {
			'(' ++ self.start ++ ' .. ' ++ self.stop ++ ')'
		} {
			self.storeString
		}
	}

	removeFirst { :self |
		self.isEmpty.if {
			self.error('removeFirst: empty interval')
		} {
			| removed = self.start; |
			self.start := self.start + self.step;
			removed
		}
	}

	removeLast { :self |
		self.isEmpty.if {
			self.error('removeLast: empty interval')
		} {
			| removed = self.stop; |
			self.stop := self.stop - self.step;
			removed
		}
	}

	reversed { :self |
		self.isEmpty.if {
			Interval(self.stop, self.start, self.step.negated)
		} {
			Interval(self.last, self.start, self.step.negated)
		}
	}

	reverseDo { :self :aProcedure:/1 |
		|(
			each = self.last,
			predicate = (self.step < 0).if {
				{ self.start >= each }
			} {
				{ self.start <= each }
			}
		)|
		predicate.whileTrue {
			aProcedure(each);
			each := each - self.step
		}
	}

	size { :self |
		| derived = (self.stop - self.start).quotient(self.step) + 1; |
		(self.step < 0).if {
			(self.start < self.stop).if {
				0
			} {
				derived
			}
		} {
			(self.stop < self.start).if {
				0
			} {
				derived
			}
		}
	}

	sorted { :self |
		(self.step < 0).if {
			self.reversed
		} {
			self
		}
	}

	species { :self |
		Array:/1
	}

	storeString { :self |
		[
			'Interval(',
			self.start,
			', ',
			self.stop,
			', ',
			self.step,
			')'
		].join
	}

	sum { :self |
		self.size * ((self.size - 1) * self.step + (self.start * 2)) / 2
	}

}

+@Number {

	downTo { :self :stop |
		Interval(self, stop, -1)
	}

	Interval { :start :stop :step |
		newInterval().initializeSlots(start, stop, step)
	}

	thenTo { :self :second :last |
		Interval(self, last, second - self)
	}

	to { :self :stop |
		self.upTo(stop)
	}

	toBy { :self :stop :step |
		Interval(self, stop, step)
	}

	upOrDownTo { :self :stop |
		Interval(
			self,
			stop,
			(self <= stop).if {
				1
			} {
				-1
			}
		)
	}

	upTo { :self :stop |
		Interval(self, stop, 1)
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

PriorityQueue : [Object] {

	clear { :self |
		<primitive: return _self.clear();>
	}

	clearAndShrink { :self |
		self.clear;
		self.shrink
	}

	isEmpty { :self |
		self.size = 0
	}

	peek { :self |
		<primitive: return _self.peek() || null;>
	}

	peekPriority { :self |
		<primitive: return _self.peekValue() || null;>
	}

	pop { :self |
		<primitive: return _self.pop();>
	}

	pseudoSlotNameArray { :self |
		['size']
	}

	push { :self :item :priority |
		<primitive: return _self.push(_item, _priority);>
	}

	pushAll { :self :associationsArray |
		associationsArray.do { :each |
			self.push(each.key, each.value)
		}
	}

	shrink { :self |
		<primitive: return _self.shrink();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

}

+Void {

	PriorityQueue {
		<primitive: return new sl.PriorityQueue();>
	}

}

SortedArray : [Object, Iterable, Indexable, Collection] { | contents sortBlock |

	add { :self :item |
		self.contents.isEmpty.if {
			self.contents.add(item)
		} {
			| nextIndex = self.indexForInserting(item); |
			self.contents.insertAt(item, nextIndex)
		}
	}

	addAll { :self :aCollection |
		(aCollection.size > (self.contents.size // 3)).if {
			self.contents.addAll(aCollection);
			self.contents.sortBy(self.sortBlock)
		} {
			aCollection.do { :each |
				self.add(each)
			}
		}
	}

	Array { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents[index]
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1);
		self
	}

	indexForInserting { :self :newObject |
		|(
			low = 1,
			high = self.contents.size,
			compare:/2 = self.sortBlock,
			index = nil
		)|
		{
			index := high + low // 2;
			low <= high
		}.whileTrue {
			self.contents[index].compare(newObject).if {
				low := index + 1
			} {
				high := index - 1
			}
		};
		low
	}

	median { :self |
		self[self.size + 1 // 2]
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		SortedArray:/0
	}

}

+Void {

	SortedArray {
		newSortedArray().initializeSlots([], lessThanEquals:/2)
	}

}

+Array {

	SortedArray { :self |
		newSortedArray().initializeSlots(self.sorted, lessThanEquals:/2)
	}

	SortedArray { :self :sortBlock:/2 |
		newSortedArray().initializeSlots(self.sorted(sortBlock:/2), sortBlock:/2)
	}

}

+@Collection {

	SortedArray { :self |
		self.SortedArray(lessThanEquals:/2)
	}

	SortedArray { :self :aSortBlock:/2 |
		| answer = SortedArray(); |
		answer.sortBlock := aSortBlock:/2;
		answer.addAll(self);
		answer
	}

}

Record : [Object, Json, Iterable, Indexable, Collection, Dictionary] {

	at { :self :aString |
		<primitive:
		if(Object.hasOwn(_self, _aString)) {
			return _self[_aString];
		}
		>
		self.error('at: unknown key: ' ++ aString)
	}

	atPut { :self :aString :anObject |
		<primitive:
		if(typeof _aString === 'string') {
			_self[_aString] = _anObject;
			return _anObject;
		}
		>
		self.error('atPut key not a string: ' ++ aString.typeOf)
	}

	Map { :self |
		<primitive: return new Map(Object.entries(_self));>
	}

	includesKey { :self :key |
		<primitive: return Object.hasOwn(_self, _key);>
	}

	keys { :self |
		<primitive: return Object.keys(_self);>
	}

	keysAndValuesDo { :self :aProcedure:/2 |
		<primitive:
		Object.entries(_self).forEach(function(entry) {
			_aProcedure_2(entry[0], entry[1]);
		});
		return null;
		>
	}

	removeKeyIfAbsent { :self :key :aProcedure |
		<primitive:
		if(Object.hasOwn(_self, _key)) {
			delete _self[_key];
			return _key;
		} else {
			return _aProcedure();
		}
		>
	}

	size { :self |
		<primitive: return Object.keys(_self).length;>
	}

	species { :self |
		Record:/0
	}

	Record { :self |
		self
	}

	storeString { :self |
		[
			'(',
			self.associations.collect { :each |
				each.key ++ ': ' ++ each.value.storeString
			}.joinSeparatedBy(', '),
			')'
		].join
	}

	values { :self |
		<primitive: return Object.values(_self);>
	}

}

+Array {

	recordFromTwoElementArrays { :self |
		<primitive: return Object.fromEntries(_self);>
	}

	Record { :self |
		self.collect(key:/1).allSatisfy(isString:/1).if {
			self.collect(Array:/1).recordFromTwoElementArrays
		} {
			self.error('Record: not all keys are strings')
		}
	}

}

+Map {

	Record { :self |
		self.keys.allSatisfy(isString:/1).if {
			self.unsafeRecord
		} {
			self.error('Record: not all keys are strings')
		}
	}

	unsafeRecord { :self |
		<primitive: return Object.fromEntries(_self);>
	}

}

+Void {

	Record {
		<primitive: return Object.create(null);>
	}

}
