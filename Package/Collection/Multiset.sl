@Multiset {

	[IdentitySet, multisetToIdentitySet] { :self |
		IdentitySet(self.valuesAndCounts.keys)
	}

	[List, multitsetToList] { :self |
		let answer = [];
		self.do { :each |
			answer.add!(each)
		};
		answer
	}

	[Map, multisetToMap] { :self |
		self.isIdentityMultiset.if {
			self.valuesAndCounts
		} {
			self.error('multisetToMap')
		}
	}

	[Set, multisetToSet] { :self |
		Set(
			self.valuesAndCounts.keys,
			self.comparator
		)
	}

	add! { :self :anObject |
		self.addWithOccurrences!(anObject, 1)
	}

	addWithOccurrences! { :self :anObject :anInteger |
		self.uncheckedAddWithOccurrences(anObject, anInteger)
	}

	associations { :self |
		self.valuesAndCounts.associations
	}

	countsAndElements { :self |
		let answer = [];
		self.valuesAndCounts.associationsDo { :each |
			answer.add!([each.key, each.value])
		};
		answer
	}

	cumulativeCounts { :self |
		let s = self.size / 100.0;
		let n = 0;
		self.sortedCounts.collect { :a |
			n := n + a.key;
			(n / s.round(0.1)) -> a.value
		}
	}

	do { :self :aBlock/1 |
		self.valuesAndCounts.associationsDo { :each |
			each.value.timesRepeat {
				aBlock(each.key)
			}
		}
	}

	elementsAndCounts { :self |
		let answer = [];
		self.valuesAndCounts.associationsDo { :each |
			answer.add!([each.key, each.value])
		};
		answer
	}

	includes { :self :anObject |
		self.valuesAndCounts.includesIndex(anObject)
	}

	intersection { :self :operand |
		let answer = self.new;
		self.associations.do { :each |
			let x = each.key;
			let i = each.value;
			let j = operand.occurrencesOf(x);
			let k = i.min(j);
			(k > 0).ifTrue {
				answer.addWithOccurrences!(x, k)
			}
		};
		answer
	}

	[isEqual, =] { :self :operand |
		operand.isMultiset & {
			self.size = operand.size & {
				self.valuesAndCounts.associationsAllSatisfy { :each |
					operand.occurrencesOf(each.key) = each.value
				}
			}
		}
	}

	keySort { :self |
		self.sortedElements
	}

	[maximum, max] { :self |
		self.valuesAndCounts.indices.reduce(max/2)
	}

	[minimum, min] { :self |
		self.valuesAndCounts.indices.reduce(min/2)
	}

	occurrencesOf { :self :anObject |
		self.valuesAndCounts.atIfAbsent(anObject) {
			0
		}
	}

	postCopy { :self |
		self.valuesAndCounts := self.valuesAndCounts.copy
	}

	randomChoice { :self :r :shape |
		let e = self.valuesAndCounts.keys;
		let w = self.valuesAndCounts.values;
		r.randomWeightedChoice(e, w, shape)
	}

	removeAll! { :self |
		self.valuesAndCounts.removeAll!
	}

	removeIfAbsent! { :self :oldObject :whenAbsent/0 |
		self.includes(oldObject).if {
			let count = self.valuesAndCounts[oldObject];
			(count = 1).if {
				self.valuesAndCounts.removeKey!(oldObject)
			} {
				self.valuesAndCounts[oldObject] := count - 1
			}
		} {
			whenAbsent()
		};
		oldObject
	}

	size { :self |
		let tally = 0;
		self.valuesAndCounts.do { :each |
			tally := tally + each
		};
		tally
	}

	sortedCounts { :self :aBlock/2 |
		self
		.valuesAndCounts
		.associationsSwapped
		.sortBy!(aBlock/2)
	}

	sortedCounts { :self |
		self.sortedCounts(succeedsOrEqual/2)
	}

	sortedElements { :self |
		self
		.valuesAndCounts
		.associations
		.sortByOn!(precedesOrEqual/2, key/1)
	}

	sum { :self |
		self.ifEmpty {
			self.error('sum: empty')
		} {
			let sum = 0;
			self.valuesAndCounts.withIndexDo { :count :value |
				sum := sum + (value * count)
			};
			sum
		}
	}

	uncheckedAddWithOccurrences { :self :anObject :anInteger |
		let dictionary = self.valuesAndCounts;
		dictionary.includesIndex(anObject).if {
			dictionary[anObject] := dictionary[anObject] + anInteger
		} {
			dictionary[anObject] := anInteger
		};
		anObject
	}

	valueSort { :self |
		self.associations.sortByOn!(precedesOrEqual/2, value/1)
	}

}

Multiset : [Object, New, Copy, Store, Equal, Do, Collection, Add, Remove, Unordered, Multiset] {

	| valuesAndCounts |

	comparator { :self |
		self.valuesAndCounts.comparator
	}

	isEqualityMultiset { :self |
		self.comparator == =
	}

	isIdentityMultiset { :self |
		self.comparator == ==
	}

	postCopy { :self |
		self.valuesAndCounts := self.valuesAndCounts.copy
	}

	species { :self |
		{
			self.comparator.comparatorToEmptyMultiset
		}
	}

}

+@Dictionary {

	[Multiset, dictionaryToMultiset] { :self |
		newMultiset().initializeSlots(self)
	}

	Multiset { :self :operand |
		self.error('Multiset/2: not defined at @Dictionary')
	}

}

+List {

	Multiset { :self |
		self.isAssociationList.if {
			self.assocationListToDicionary.dictionaryToMultiset
		} {
			self.allTrue(isImmediate/1).if {
				Multiset(self, ==)
			} {
				Multiset(self, =)
			}
		}
	}

	sortedCounts { :self :comparator/2 |
		Multiset(self, comparator/2).sortedCounts
	}

	sortedElements { :self :comparator/2 |
		Multiset(self, comparator/2).sortedElements
	}

}

+Block {

	comparatorToEmptyMultiset { :comparator/2 |
		Multiset(
			comparatorToEmptyDictionary(comparator/2)
		)
	}

}

+@Collection {

	[Multiset, collectionToMultiset] { :self :comparator/2 |
		self.isDictionary.ifTrue {
			self.error('collectionToMultiset: not defined at @Dictionary')
		};
		let answer = comparatorToEmptyMultiset(comparator/2);
		answer.addAll!(self);
		answer
	}

	histogramOf { :self :comparator/2 :aBlock/1 |
		let answer = comparatorToEmptyMultiset(comparator/2);
		self.collectInto!(aBlock/1, answer);
		answer
	}

}

+List {

	commonest { :self :comparator/2 |
		let byCount = Multiset(self, comparator/2).sortedCounts;
		let count = byCount.first.key;
		byCount.select { :each |
			each.key = count
		}.collect(value/1)
	}

	commonest { :self |
		self.commonest(=)
	}

	counts { :self :comparator/2 |
		Multiset(self, comparator/2).sortedElements
	}

	counts { :self |
		self.counts(=)
	}

	multisetIntersection { :self :comparator/2 |
		self.collect { :x |
			Multiset(x, comparator/2)
		}.reduce(intersection/2)
	}

}

+String {

	counts { :self |
		self.characters.counts
	}

}
