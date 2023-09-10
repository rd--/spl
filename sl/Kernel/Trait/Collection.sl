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
				index +:= 1;
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
			index +:= 1;
			array[index] := each
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
				index +:= 1
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
