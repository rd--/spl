@ArrayedCollection {

	Array { :self |
		Array(self.size).fillFromWith(self, identity:/1)
	}

	at { :self :index |
		<primitive:
			if(sl.arrayCheckIndex(_self, _index - 1)) {
				return _self[_index - 1];
			}
		>
		self.indexError(index)
	}

	atIfPresent { :self :index :ifPresent:/1 |
		self.atIfPresentIfAbsent(index, ifPresent:/1) {
			nil
		}
	}

	atIfPresentIfAbsent { :self :index :ifPresent:/1 :ifAbsent:/0 |
		<primitive:
			if(sl.arrayCheckIndex(_self, _index - 1)) {
				return _ifPresent_1(_self[_index - 1]);
			} {
				return _ifAbsent_0();
			}
		>
	}

	atPut { :self :index :anObject |
		<primitive:
			if(sl.arrayCheckIndex(_self, _index - 1)) {
				_self[_index - 1] = _anObject;
				return _anObject;
			}
		>
		self.indexError(index)
	}

	collect { :self :aProcedure |
		<primitive:
			if(_aProcedure instanceof Function) {
				return _self.map(function(each) {
					return _aProcedure(each);
				});
			}
		>
		'@ArrayedCollection>>collect: not a procedure'.error
	}

	copy { :self |
		| answer = self.species.new; |
		(1 .. self.size).do { :index |
			answer[index] := self[index]
		};
		answer
	}

	detectIfFoundIfNone { :self :aProcedure:/1 :whenFound:/1 :whenNone:/0 |
		<primitive:
			var item = _self.find(function(element) { return _aProcedure_1(element); });
			return (item !== undefined) ? _whenFound_1(item) : _whenNone_0();
		>
	}

	do { :self :aProcedure:/1 |
		<primitive:
			_self.forEach(function(item) {
				return _aProcedure_1(item)
			});
			return _self;
		>
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.withIndexDo { :each :index |
			self[index] := aProcedure(each)
		};
		self
	}

	find { :self :aProcedure |
		<primitive:
		var item = _self.find(function(element) { return _aProcedure(element); });
		return (item === undefined) ? null : item;
		>
	}

	findIndex { :self :aProcedure |
		<primitive:
			var index = _self.findIndex(function(element) { return _aProcedure(element); });
			return (index === -1) ? null : index + 1;
		>
	}

	injectInto { :self :anObject :aProcedure:/2 |
		| result = anObject; |
		1.toDo(self.size) { :index |
			result := aProcedure(result, self[index])
		};
		result
	}

	isSorted { :self |
		self.isSortedBetweenAnd(1, self.size)
	}

	isSortedBetweenAnd { :self :startIndex :endIndex |
		(endIndex < startIndex).if {
			true
		} {
			| previousElement = self[startIndex]; |
			withReturn {
				(startIndex + 1 .. endIndex).do { :index |
					| element = self[index]; |
					(previousElement <= element).ifFalse {
						false.return
					};
					previousElement := element
				};
				true
			}
		}
	}

	isValidIndex { :self :index |
		<primitive:
			return Number.isInteger(_index) && 0 < _index && _index <= _self.length;
		>
	}

	printString { :self |
		self.Array.printString ++ '.' ++ self.Type.name
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		1.toDo(self.size) { :index |
			(self[index] = anObject).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	remove { :self :anObject |
		self.shouldNotImplement
	}

	removeAll { :self |
		self.shouldNotImplement
	}

	reverseInPlace { :self |
		<primitive: return _self.reverse();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

	sortInPlaceBy { :self :aProcedure:/2 |
		<primitive: return _self.sort(function(p, q) { return _aProcedure_2(p, q) ? -1 : 1 });>
	}

	sortInPlace { :self |
		self.sortInPlaceBy(lessThanEquals:/2)
	}

	sort { :self :aSortProcedureOrNil |
		self.sortInPlaceBy(aSortProcedureOrNil ? lessThan:/2)
	}

	sorted { :self :aSortProcedureOrNil |
		self.copy.sortInPlaceBy(aSortProcedureOrNil ? lessThan:/2)
	}

	sorted { :self |
		self.copy.sortInPlace
	}

	unsafeAt { :self :anInteger |
		<primitive: return _self[_anInteger - 1];>
	}

	unsafeAtPut { :self :anInteger :anObject |
		<primitive: _self[_anInteger - 1] = _anObject; return _anObject;>
	}

	unsafeCollect { :self :aProcedure |
		<primitive: return _self.map(function(each) { return _aProcedure(each); });>
	}

}

@Collection {

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

	allSatisfy { :self :aProcedure:/1 |
		withReturn {
			self.do { :each |
				each.aProcedure.ifFalse {
					false.return
				}
			};
			true
		}
	}

	any { :self :numberOfElements |
		self.anyAs(numberOfElements, self.species)
	}

	anyAs { :self :numberOfElements :aProcedure:/1 |
		| index = 0, result = numberOfElements.aProcedure; |
		withReturn {
			result.fillFromWith(self) { :each |
				index := index + 1;
				(index > numberOfElements).if {
					result.return
				} {
					each
				}
			};
			(index = numberOfElements).ifFalse {
				'@Collection>>any: Not enough elements in this collection'.error
			};
			result
		}
	}

	anyOne { :self |
		withReturn {
			self.do { :each |
				each.return
			};
			self.errorEmptyCollection
		}
	}

	anySatisfy { :self :aProcedure:/1 |
		withReturn {
			self.do { :each |
				each.aProcedure.ifTrue {
					true.return
				}
			};
			false
		}
	}

	asArray { :self |
		self.Array
	}

	asCollection { :self |
		self
	}

	associationsDo { :self :aBlock:/1 |
		self.do(aBlock:/1)
	}

	atRandom { :self |
		| randomIndex = self.size.atRandom, index = 1; |
		withReturn {
			self.do { :each |
				(index = randomIndex).ifTrue {
					each.return
				};
				index := index + 1
			}
		}
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

	copy { :self |
		| answer = self.species.new; |
		answer.addAll(self);
		answer
	}

	copyWithout{ :self :oldElement |
		self.reject { :each |
			each = oldElement
		}
	}

	count { :self :aProcedure:/1 |
		| answer = 0; |
		self.do { :each |
			aProcedure(each).ifTrue {
				answer := answer + 1
			}
		};
		answer
	}

	detectIfFound { :self :aProcedure:/1 :foundProcedure:/1 |
		self.detectIfFoundIfNone(aProcedure:/1, foundProcedure:/1, { nil })
	}

	detectIfFoundIfNone { :self :aProcedure:/1 :foundProcedure:/1 :exceptionProcedure:/0 |
		withReturn {
			self.do { :each |
				aProcedure(each).ifTrue {
					foundProcedure(each).return
				}
			};
			exceptionProcedure()
		}
	}

	detectIfNone { :self :aProcedure:/1 :whenAbsent:/0 |
		self.detectIfFoundIfNone(aProcedure:/1, identity:/1, whenAbsent:/0)
	}

	detect { :self :aProcedure:/1 |
		self.detectIfNone(aProcedure:/1) {
			error('@Collection>>detect: not found')
		}
	}

	detectMax { :self :aProcedure:/1 |
		| maxElement maxValue |
		self.do { :each |
			maxValue.isNil.if {
				maxElement := each;
				maxValue := aProcedure(each)
			} {
				| nextValue = aProcedure(each); |
				(nextValue > maxValue).ifTrue {
					maxElement := each;
					maxValue := nextValue
				}
			}
		};
		maxElement
	}

	difference { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	do { :self :aProcedure |
		<primitive: return _self.forEach(_aProcedure);>
	}

	emptyCheck { :self |
		self.isEmpty.ifTrue {
			self.errorEmptyCollection
		}
	}

	errorEmptyCollection { :self |
		(self.typeOf ++ '>>errorEmptyCollection: ' ++ self).error
	}

	errorNotFound { :self :anObject |
		(self.typeOf ++ '>>errorNotFound: ' ++ self).error
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.do { :each |
			self.add(aProcedure(each))
		}
	}

	groupBy { :self :keyBlock:/1 |
		| result = IdentityDictionary(); |
		self.do { :each |
			| key = keyBlock(each); |
			result.atIfAbsentPut(key, { OrderedCollection() }).add(each)
		};
		result
	}

	indices { :self |
		nil
	}

	includesAllOf { :self :aCollection |
		withReturn {
			aCollection.do { :elem |
				self.includes(elem).ifFalse {
					false.return
				}
			};
			true
		}
	}

	injectInto { :self :initialValue :aProcedure:/2 |
		| nextValue = initialValue; |
		self.do { :each |
			nextValue := aProcedure(nextValue, each)
		};
		nextValue
	}

	intersection { :self :aCollection |
		self.select { :each |
			aCollection.includes(each)
		}
	}

	isCollection { :self |
		true
	}

	isIndexable { :self |
		false
	}

	isEmpty { :self |
		self.size = 0
	}

	max { :self |
		self.injectInto(self.anyOne) { :answer :each |
			answer.max(each)
		}
	}

	mean { :self |
		self.sum / self.size
	}

	min { :self |
		self.injectInto(self.anyOne) { :answer :each |
			answer.min(each)
		}
	}

	minMax { :self |
		| min = self.anyOne, max = min; |
		self.do { :each |
			min := min.min(each);
			max := max.max(each)
		};
		[min, max]
	}

	notEmpty { :self |
		self.isEmpty.not
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		self.do { :each |
			(anObject = each).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	ofSize { :self :aNumber |
		(self.size = aNumber).ifFalse {
			'ofSize'.error
		};
		self
	}

	product { :self |
		self.reduce(times:/2)
	}

	pseudoSlotNameArray { :self |
		['size']
	}

	reduce { :self :aProcedure:/2 |
		| first = true, nextValue = nil; |
		self.do { :each |
			first.if {
				nextValue := each;
				first := false
			} {
				nextValue := aProcedure(nextValue, each)
			}
		};
		first.ifTrue {
			error('Collection>>reduce: empty collection')
		};
		nextValue
	}

	reject { :self :aProcedure:/1 |
		self.select { :element |
			aProcedure(element) = false
		}
	}

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

	select { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.do { :each |
			aProcedure(each).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	size { :self |
		| tally = 0; |
		self.do { :each |
			tally := tally + 1
		};
		tally
	}

	sorted { :self :compare |
		self.Array.sort(compare)
	}

	sum { :self |
		self.reduce(plus:/2)
	}

	take { :self :maxNumberOfElements |
		self.any(maxNumberOfElements.min(self.size))
	}

}

+@Object {

	isCollection { :self |
		false
	}

}

+Procedure {

	map { :self :aCollection |
		aCollection.collect(self)
	}

	ofSize { :self:/1 :aNumber |
		self(aNumber).ofSize(aNumber)
	}

}

@Dictionary {

	= { :self :aDictionary |
		| keyArray = self.keys; |
		(keyArray = aDictionary.keys) &
		{
			keyArray.allSatisfy { :key |
				self[key] = aDictionary[key]
			}
		}
	}

	++ { :self :aCollection |
		| answer = self.copy; |
		answer.addAll(aCollection);
		answer
	}

	add { :self :anAssociation |
		self[anAssociation.key] := anAssociation.value;
		anAssociation
	}

	addAll { :self :aCollection |
		aCollection.associationsDo { :asAssociation |
			self.add(asAssociation)
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
			| parent = self[delegateKey]; |
			parent.notNil.if {
				parent.atDelegateToIfAbsent(key, delegateKey, aProcedure:/0)
			} {
				aProcedure()
			}
		}
	}

	atDelegateTo { :self :key :delegateKey |
		self.atDelegateToIfAbsent(key, delegateKey) {
			('@Dictionary>>atDelegate: unknown key: ' ++ key).error
		}
	}

	atIfAbsent { :self :key :aProcedure:/0 |
		self[key] ? { aProcedure() }
	}

	atIfAbsentPut { :self :key :aProcedure:/0 |
		self.atIfAbsent(key) {
			self[key] := aProcedure()
		};
		self[key]
	}

	atIfPresent { :self :key :ifPresent:/1 |
		self.includesKey(key).ifTrue {
			ifPresent(self[key])
		}
	}

	atIfPresentIfAbsent { :self :key :ifPresent:/1 :ifAbsent:/0 |
		self.includesKey(key).if {
			ifPresent(self[key])
		} {
			ifAbsent()
		}
	}

	atPutDelegateToIfAbsent { :self :key :value :delegateKey :aProcedure:/0 |
		self.includesKey(key).if {
			self.atPut(key, value)
		} {
			self.atIfAbsent(key) {
				| parent = self[delegateKey]; |
				parent.notNil.if {
					parent.atPutDelegateToIfAbsent(key, value, delegateKey, aProcedure:/0)
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

	collect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.keysAndValuesDo { :key :value |
			answer.add(key -> aProcedure(value))
		};
		answer
	}

	do { :self :aProcedure |
		self.valuesDo(aProcedure)
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

	includesKey { :self :key |
		self.keys.includes(key)
	}

	indices { :self |
		self.keys
	}

	isDictionary { :self |
		true
	}

	isIndexable { :self |
		true
	}

	keyAtValue { :self :value |
		self.keyAtValueIfAbsent(value) {
			'Dictionary>>keyAtValue: errorValueNotFound'.error
		}
	}

	keyAtValueIfAbsent { :self :value :exceptionProcedure:/0 |
		withReturn {
			self.associationsDo { :association |
				(value = association.value).ifTrue {
					association.key.return
				}
			};
			exceptionProcedure()
		}
	}

	keysAndValuesDo { :self :aProcedure:/2 |
		self.associationsDo { :association |
			aProcedure(association.key, association.value)
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

	printString { :self |
		self.storeString
	}

	removeKey { :self :key |
		removeKeyIfAbsent(self, key) {
			error('Dictionary:removeKey')
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
		self.associations.printString ++ '.' ++ self.typeOf
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

@SequenceableCollection {

	= { :self :anObject |
		(anObject.isSequenceable & {
			self.typeOf == anObject.typeOf & {
				self.size == anObject.size
			}
		}).if {
			withReturn {
				self.size.do { :index |
					(self[index] = anObject[index]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			false
		}
	}

	++ { :self :otherCollection |
		self.copyReplaceFromToWith(
			self.size + 1,
			self.size,
			otherCollection.asCollection
		)
	}

	allButFirst { :self |
		self.allButFirst(1)
	}

	allButFirst { :self :n |
		self.copyFromTo(n + 1, self.size)
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


	atWrap { :self :index |
		self.at(index - 1 % self.size + 1)
	}

	atRandom { :self |
		self[randomInteger(1, self.size)]
	}

	beginsWith { :self :sequence |
		| sequenceSize = sequence.size; |
		withReturn {
			(self.size < sequenceSize).ifTrue {
				false.return
			};
			1.upTo(sequenceSize).do { :index |
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
		1.toDo(self.size) { :index |
			answer[index] := aProcedure(self[index])
		};
		answer
	}

	concatenation { :self |
		|
			answerSize = self.injectInto(0) { :sum :each |
				sum + each.size
			},
			answer = self.species.ofSize(answerSize),
			index = 1;
		|
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
		|
			end = start - 1 + aCollection.size,
			newSize = self.size + end - stop,
			answer = self.species.ofSize(newSize);
		|
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

	do { :self :aProcedure:/1 |
		1.toDo(self.size) { :index |
			aProcedure(self[index])
		}
	}

	doWhile { :self :activity:/1 :condition:/0 |
		| nextIndex = 1, endIndex = self.size; |
		{ condition() & { nextIndex <= endIndex } }.whileTrue {
			activity(self[nextIndex]);
			nextIndex := nextIndex + 1
		}
	}

	errorSubscriptBounds { :self :index |
		(self.typeOf ++ '>>errorSubscriptBounds: ' ++ index).error
	}

	first { :self |
		self[1]
	}

	first { :self :n |
		self.copyFromTo(1, n)
	}

	fisherYatesShuffle { :self |
		(self.size .. 2).do { :item |
			self.swapWith(item, randomInteger(1, item))
		};
		self
	}

	grownBy { :self :length |
		self.species.ofSize(self.size + length).replaceFromToWithStartingAt(1, self.size, self, 1)
	}

	includes { :self :anObject |
		self.indexOf(anObject) ~= 0
	}

	indexError { :self :index |
		(self.typeOf ++ '>>at: index not an integer or out of range: ' ++ index).error
	}

	indexOf { :self :anElement |
		self.indexOfStartingAt(anElement, 1)
	}

	indexOfStartingAt { :self :anElement :start |
		withReturn {
			start.toDo(self.size) { :index |
				(self[index] = anElement).ifTrue {
					index.return
				}
			};
			0
		}
	}

	indicesOfSubCollection { :self :subCollection |
		self.indicesOfSubCollectionStartingAt(subCollection, 1)
	}

	indicesOfSubCollectionStartingAt { :self :subCollection :initialIndex |
		| answer = OrderedCollection(), index = initialIndex - 1; |
		{
			index := self.indexOfSubCollectionStartingAt(subCollection, index + 1);
			index = 0
		}.whileFalse {
			answer.add(index)
		};
		answer.Array
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
			withReturn {
				start.max(1).upTo(self.size - subCollectionSize + 1).do { :startIndex |
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

	indices { :self |
		(1 .. self.size)
	}

	isIndexable { :self |
		true
	}

	isSequenceable { :self |
		true
	}

	isValidIndex { :self :index |
		index.isInteger & {
			index > 0 & {
				index <= self.size
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

	middle { :self |
		self[self.size // 2 + 1]
	}

	pairsCollect { :self :aBlock:/2 |
		(1 .. self.size // 2).collect { :index |
			aBlock(self[2 * index - 1], self[2 * index])
		}
	}

	pairsDo { :self :aProcedure:/2 |
		(1 .. self.size // 2).do { :index |
			aProcedure(self[2 * index - 1], self[2 * index])
		}
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
				(anInteger .. self.size).do { :i |
					self.swapWith(anInteger, i);
					self.permutationsStartingAtDo(anInteger + 1, aBlock:/1);
					self.swapWith(anInteger, i)
				}
			}
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
		toDo(1, self.size) { :toIndex |
			answer[toIndex] := self[fromIndex - 1];
			fromIndex := fromIndex - 1
		};
		answer
	}

	reverseDo { :self :aProcedure:/1 |
		self.size.toBy(1, -1).do { :index | 
			aProcedure(self[index])
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
		| answer = OrderedCollection(); |
		1.toDo(self.size) { :index |
			aProcedure(self[index]).ifTrue {
				answer.add(self[index])
			}
		};
		self.species.newFrom(answer)
	}

	shuffled { :self |
		self.copy.fisherYatesShuffle
	}

	splitBy { :self :aCollection |
		| answer = OrderedCollection(); |
		self.splitByDo(aCollection) { :each |
			answer.add(each)
		};
		answer.Array
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

	withCollect { :self :aCollection :aProcedure:/2 |
		(isSequenceable(aCollection) & {
			self.size == aCollection.size
		}).if {
			1.toAsCollect(self.size, self.species) { :index |
				aProcedure(self[index], aCollection[index])
			}
		} {
			error('SequenceableCollection>>withCollect: operand not-sequenceable or of unequal size')
		}
	}

	withIndexCollect { :self :elementAndIndexProcedure:/2 |
		| answer = self.species.ofSize(self.size); |
		1.toDo(self.size) { :index |
			answer[index] := elementAndIndexProcedure(self[index], index)
		};
		answer
	}

	withIndexDo { :self :elementAndIndexProcedure:/2 |
		1.toDo(self. size) { :index |
			elementAndIndexProcedure(self[index], index)
		}
	}

}

+@Object {

	isSequenceable { :self |
		false
	}

}

Array : [Object, Collection, SequenceableCollection, ArrayedCollection] {

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		self.collect { :each |
			aProcedure(aNumber, each)
		}
	}

	Array { :self |
		self
	}

	atAllPut { :self :anObject |
		<primitive: _self.fill(_anObject); return _self;>
	}

	copy { :self |
		<primitive: return Array.from(_self);>
	}

	join { :self |
		self.joinSeparatedBy('')
	}

	joinSeparatedBy { :self :aString |
		<primitive: return _self.join(_aString);>
	}

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	printString { :self :toString:/1 |
		'[' ++ self.collect(toString:/1).joinSeparatedBy(', ') ++ ']'
	}

	printString { :self |
		self.printString(printString:/1)
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

	replicate { :self :anObject |
		1.toAsCollect(self, Array:/1) { :unused |
			anObject
		}
	}

	toAsCollect { :self :stop :species :aProcedure:/1 |
		|
			answerSize = stop - self + 1,
			answer = species.ofSize(answerSize);
		|
		answerSize.do { :index |
			answer[index] := aProcedure(index + self - 1)
		};
		answer
	}

}

+@Object {

	asArray { :self |
		[self]
	}

	replicateApplying { :self :anInteger :aProcedure:/1 |
		| answer = Array(anInteger); |
		anInteger.do { :index |
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
		(1 .. self.size).do { :i |
			answer[i] := self[i]
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
		self.value = anAssociation.value
	}

	< { :self :anAssociation |
		self.key < anAssociation.key
	}

	<= { :self :anAssociation |
		self.key <= anAssociation.key
	}

	Array { :self |
		[self.key, self.value]
	}

	copy { :self |
		Association(self.key, self.value)
	}

	printString { :self |
		self.key.printString ++ ' -> ' ++ self.value.printString
	}

	storeString { :self |
		'Association(' ++ self.key.printString ++ ', ' ++ self.value.printString ++ ')'
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

ByteArray : [Object, Collection, SequenceableCollection, ArrayedCollection] {

	ascii { :self |
		<primitive: return new TextDecoder('ascii').decode(_self);>
	}

	atPut { :self :anInteger :aByte |
		<primitive: if(Number.isInteger(_anInteger) && sl.isByte(_aByte)) {
			_self[_anInteger - 1] = _aByte;
			return _aByte;
		}>
		error('ByteArray>>atPut: index not an integer or value not a byte')
	}

	species { :self |
		ByteArray:/1
	}

	utf8 { :self |
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

Float64Array : [Object, Collection, SequenceableCollection, ArrayedCollection] {

	atPut { :self :index :aFloat |
		<primitive: if(sl.arrayCheckIndex(_self, _index - 1) && sl.isSmallFloat(_aFloat)) {
			_self[_index - 1] = _aFloat;
			return _aFloat;
		}>
		self.indexError(index)
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
		self.vertexLabels.isNil.if {
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

IdentityBag : [Object, Collection] { | contents |

	= { :self :aBag |
		aBag.isIdentityBag & {
			self.size = aBag.size & {
				withReturn {
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
		}
	}

	IdentityBag { :self |
		self
	}

	IdentitySet { :self |
		self.contents.keys.IdentitySet
	}

	includes { :self :anObject |
		self.contents.includesKey(anObject)
	}

	occurrencesOf { :self :anObject |
		self.contents.atIfAbsent(anObject) {
			0
		}
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
		| answer = OrderedCollection(); |
		self.contents.associationsDo { :anAssociation |
			answer.add(anAssociation.value -> anAssociation.key)
		};
		answer.sharedArray.sorted
	}

	sortedElements { :self |
		| answer = OrderedCollection(); |
		self.contents.associationsDo { :anAssociation |
			answer.add(anAssociation)
		};
		answer.sharedArray.sorted
	}

}

+Void {

	IdentityBag {
		newIdentityBag().initializeSlots(IdentityDictionary())
	}

}

+@Collection {

	IdentityBag { :self |
		| answer = IdentityBag(); |
		answer.addAll(self);
		answer
	}

}

IdentityDictionary : [Object, Collection, Dictionary] {

	add { :self :anAssociation |
		<primitive:
			_self.set(_anAssociation.key, _anAssociation.value);
			return _anAssociation;
		>
	}

	at { :self :aKey |
		<primitive: return _self.get(_aKey) || null;>
	}

	atPut { :self :aKey :aValue |
		<primitive: _self.set(_aKey, _aValue);>
	}

	IdentityDictionary { :self |
		self
	}

	includesKey { :self :aKey |
		<primitive: return _self.has(_aKey);>
	}

	json { :self |
		self.json(nil, '')
	}

	json { :self :replacer :space |
		self.keys.allSatisfy(isString:/1).if {
			self.StringDictionary.json(replacer, space)
		} {
			'IdentityDictionary>>json: not all keys are strings'.error
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

	removeKeyIfAbsent { :self :aKey :aProcedure |
		<primitive:
			var existed = _self.delete(_aKey);
			if(existed) {
				return _aKey;
			} else {
				return _aProcedure();
			}
		>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		IdentityDictionary:/0
	}

	storeString { :self |
		self.associations.storeString ++ '.IdentityDictionary'
	}

	values { :self |
		<primitive: return Array.from(_self.values());>
	}

}

+Array {

	identityDictionaryFromTwoElementArrays { :self |
		<primitive: return new Map(_self);>
	}

	IdentityDictionary { :self |
		self.collect(Array:/1).identityDictionaryFromTwoElementArrays
	}

}

+@Object {

	isIdentityDictionary { :self |
		false
	}

}

+Void {

	IdentityDictionary {
		<primitive: return new Map();>
	}

}

IdentitySet : [Object, Collection] {

	= { :self :anObject |
		anObject.isIdentitySet & {
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

	copy { :self |
		<primitive: return new Set(_self);>
	}

	do { :self :aProcedure |
		<primitive:
			_self.forEach(function(item) {
				_aProcedure(item);
			});
			return null;
		>
	}

	includes { :self :anObject |
		<primitive: return _self.has(_anObject);>
	}

	isIdentitySet { :self |
		true
	}

	pseudoSlotNameArray { :self |
		['size', 'Array']
	}

	remove { :self :anObject |
		<primitive: _self.delete(_anObject); return _anObject;>
	}

	removeAll { :self |
		<primitive: _self.clear(); return null;>
	}

	size { :self |
		<primitive: return _self.size;>
	}

	species { :self |
		IdentitySet:/0
	}

	union { :self :aCollection |
		| answer = self.copy; |
		answer.addAll(aCollection);
		answer
	}

}

+Array {

	IdentitySet { :self |
		<primitive: return new Set(_self);>
	}

}

+@Collection {

	IdentitySet { :self |
		| answer = IdentitySet(); |
		answer.addAll(self);
		answer
	}

}

+@Dictionary {

	IdentitySet { :self |
		self.values.IdentitySet
	}

}

+@Object {

	isIdentitySet { :self |
		false
	}

}

+Void {

	IdentitySet {
		<primitive: return new Set();>
	}

}

Interval : [Object, Collection, SequenceableCollection] { | start stop step |

	= { :self :anInterval |
		anInterval.isInterval & {
			self.start = anInterval.start & {
				self.stop = anInterval.stop & {
					self.step = anInterval.step
				}
			}
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
		self.isValidIndex(index).if {
			self.step * (index - 1) + self.start
		} {
			self.indexError(index)
		}
	}

	collect { :self :aProcedure:/1 |
		| result = Array(self.size), index = 1; |
		self.do { :nextValue |
			result[index] := aProcedure(nextValue);
			index := index + 1
		};
		result
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
		}
	}

	first { :self |
		self.start
	}

	isEmpty { :self |
		self.size = 0
	}

	last { :self |
		self.stop - (self.stop - self.start % self.step)
	}

	printString { :self |
		(self.step = 1).if {
			'(' ++ self.start ++ ' .. ' ++ self.stop ++ ')'
		} {
			self.storeString
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
		|
			each = self.last,
			predicate = (self.step < 0).if {
				{ self.start >= each }
			} {
				{ self.start <= each }
			};
		|
		predicate.whileTrue {
			aProcedure(each);
			each := each - self.step
		}
	}

	second { :self |
		self.start + self.step
	}

	size { :self |
		| derive = (self.stop - self.start).quotient(self.step) + 1; |
		(self.step < 0).if {
			(self.start < self.stop).if {
				0
			} {
				derive
			}
		} {
			(self.stop < self.start).if {
				0
			} {
				derive
			}
		}
	}

	species { :self |
		Array:/1
	}

	storeString { :self |
		'Interval(' ++ self.start ++ ', ' ++ self.stop ++ ', ' ++ self.step ++ ')'
	}

	sum { :self |
		self.size * ((self.size - 1) * self.step + (self.start * 2)) / 2
	}

}

+SmallFloat {

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
		Interval(self, stop, (self <= stop).if { 1 } { -1 })
	}

	toBy { :self :stop :step |
		Interval(self, stop, step)
	}

	upTo { :self :stop |
		Interval(self, stop, 1)
	}

}

OrderedCollection : [Object, Collection, SequenceableCollection] { | primitiveArray | (* i.e. Js array *)

	= { :self :anObject |
		anObject.isOrderedCollection & {
			self.primitiveArray = anObject.primitiveArray
		}
	}

	add { :self :anObject |
		self.addLast(anObject)
	}

	addAllFirst { :self :aCollection |
		self.addArrayFirst(aCollection.Array)
	}

	addAllLast { :self :aCollection |
		self.addArrayLast(aCollection.Array)
	}

	addArrayFirst { :self :anArray |
		<primitive: return _self.primitiveArray.unshift(..._anArray);>
	}

	addArrayLast { :self :anArray |
		<primitive: return _self.primitiveArray.push(..._anArray);>
	}

	addFirst { :self :anObject |
		<primitive: return _self.primitiveArray.unshift(_anObject);>
	}

	addLast { :self :anObject |
		<primitive: return _self.primitiveArray.push(_anObject);>
	}

	Array { :self |
		self.primitiveArray.copy
	}

	at { :self :index |
		self.primitiveArray[index]
	}

	atPut { :self :index :anObject |
		self.primitiveArray[index] := anObject
	}

	collect { :self :aProcedure |
		OrderedCollection(self.primitiveArray.collect(aProcedure))
	}

	copy { :self |
		OrderedCollection(self.primitiveArray.copy)
	}

	IdentitySet { :self |
		self.primitiveArray.IdentitySet
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add(nil)
		};
		self
	}

	OrderedCollection { :self |
		self
	}

	size { :self |
		self.primitiveArray.size
	}

	removeAll { :self |
		self.primitiveArray := Array(self.primitiveArray.size)
	}

	removeAt { :self :index |
		<primitive: return _self.primitiveArray.splice(_index - 1, 1)[0];>
	}

	removeFirst { :self |
		<primitive: return _self.primitiveArray.shift();>
	}

	removeFirst { :self :count |
		<primitive: return _self.primitiveArray.splice(0, _count);>
	}

	removeLast { :self |
		<primitive: return _self.primitiveArray.pop();>
	}

	removeLast { :self :count |
		<primitive: return _self.primitiveArray.splice(_self.primitiveArray.length - _count, _count);>
	}

	sharedArray { :self |
		self.primitiveArray
	}

	species { :self |
		OrderedCollection:/1
	}

}

+Void {

	OrderedCollection {
		[].OrderedCollection
	}

}

+Array {

	OrderedCollection { :self |
		newOrderedCollection().initializeSlots(self)
	}

}

+SmallFloat {

	fibonacciSequence { :self |
		| a = 0, b = 1, i = 0, temp = nil, answer = OrderedCollection(); |
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

	OrderedCollection { :self |
		OrderedCollection()
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
		<primitive: return _self.peekValue()  || null;>
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

StringDictionary : [Object, Collection, Dictionary] {

	at { :self :aString |
		<primitive: return _self[_aString] || null;>
	}

	atPut { :self :aString :anObject |
		<primitive: if(typeof _aString === 'string') { return _self[_aString] = _anObject;}>
		('StringDictionary>>atPut key not a string: ' ++ aString.typeOf).error
	}

	IdentityDictionary { :self |
		<primitive: return new Map(Object.entries(_self));>
	}

	includesKey { :self :aKey |
		<primitive: return Object.hasOwn(_self, _aKey);>
	}

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	json { :self :replacer :space |
		<primitive: return JSON.stringify(_self, _replacer, _space);>
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

	printString { :self |
		[
			'(',
			self.associations.collect { :each |
				each.key ++ ': ' ++ each.value.printString
			}.joinSeparatedBy(', '),
			')'
		].join
	}

	removeKeyIfAbsent { :self :aKey :aProcedure |
		<primitive: if(_self.has(_aKey)) { delete _self[_aKey]; return _aKey; } else { return _aProcedure(); }>
	}

	size { :self |
		<primitive: return Object.keys(_self).length;>
	}

	species { :self |
		StringDictionary:/0
	}

	StringDictionary { :self |
		self
	}

	values { :self |
		<primitive: return Object.values(_self);>
	}

}

+Array {

	StringDictionary { :self |
		self.collect(key:/1).allSatisfy(isString:/1).if {
			self.collect(Array:/1).stringDictionaryFromTwoElementArrays
		} {
			'Array>>StringDictionary: not all keys are strings'.error
		}
	}

	stringDictionaryFromTwoElementArrays { :self |
		<primitive: return Object.fromEntries(_self);>
	}

}

+IdentityDictionary {

	StringDictionary { :self |
		self.keys.allSatisfy(isString:/1).if {
			self.unsafeStringDictionary
		} {
			'IdentityDictionary>>StringDictionary: not all keys are strings'.error
		}
	}

	unsafeStringDictionary { :self |
		<primitive: return Object.fromEntries(_self);>
	}

}

+Void {

	StringDictionary {
		<primitive: return Object.create(null);>
	}

}
