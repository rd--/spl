@Multiset {

	[equal, =] { :self :aMultiset |
		(self.typeOf = aMultiset.typeOf) & {
			self.size = aMultiset.size & {
				self.valuesAndCounts.associationsAllSatisfy { :each |
					aMultiset.occurrencesOf(each.key) = each.value
				}
			}
		}
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
		let answer = self.species.new;
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

	keySort { :self |
		self.sortedElements
	}

	[List, multitsetToList] { :self |
		let answer = [];
		self.do { :each |
			answer.add!(each)
		};
		answer
	}

	max { :self |
		self.valuesAndCounts.indices.reduce(max/2)
	}

	min { :self |
		self.valuesAndCounts.indices.reduce(min/2)
	}

	Multiset { :self |
		self
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

	removeAll! { :self |
		self.valuesAndCounts.removeAll!
	}

	[Set, multisetToSet] { :self |
		self.valuesAndCounts.indices.Set
	}

	/*
	setDictionary! { :self :aDictionary |
		self.valuesAndCounts := aDictionary
	}
	*/

	size { :self |
		let tally = 0;
		self.valuesAndCounts.do { :each |
			tally := tally + each
		};
		tally
	}

	sortedCounts { :self :aBlock/2|
		self.valuesAndCounts.associationsSwapped.sortBy!(aBlock/2)
	}

	sortedCounts { :self |
		self.sortedCounts(succeedsOrEqualTo/2)
	}

	sortedElements { :self |
		self.valuesAndCounts.associations.sortByOn!(precedesOrEqualTo/2, key/1)
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
		self.associations.sortByOn!(precedesOrEqualTo/2, value/1)
	}

}

Multiset : [Object, Copy, Store, Equal, Iterable, Collection, Extensible, Unordered, Multiset] { | valuesAndCounts |

	postCopy { :self |
		self.valuesAndCounts := self.valuesAndCounts.copy
	}

	species { :self |
		Multiset/0
	}

}

+Void {

	Multiset {
		Multiset(
			Dictionary()
		)
	}

}

+Dictionary {

	[Multiset, dictionaryToMultiset] { :self |
		newMultiset().initializeSlots(self)
	}

}

+List {

	Multiset { :self |
		self.isAssociationList.if {
			Multiset(Dictionary(self))
		} {
			self.collectionToMultiset
		}
	}

	sortedCounts { :self |
		self.Multiset.sortedCounts
	}

	sortedElements { :self |
		self.Multiset.sortedElements
	}

}

+@Collection {

	[Multiset, collectionToMultiset] { :self |
		let answer = Multiset();
		answer.addAll!(self);
		answer
	}

	histogramOf { :self :aBlock/1 |
		let answer = Multiset();
		self.collectInto(aBlock/1, answer);
		answer
	}

}

+List {

	commonest { :self |
		let byCount = self.Multiset.sortedCounts;
		let count = byCount.first.key;
		byCount.select { :each |
			each.key = count
		}.collect(value/1)
	}

	counts { :self |
		self.Multiset.sortedElements
	}

	multisetIntersection { :self |
		self.collect(Multiset/1).reduce(intersection/2)
	}

}

+String {

	counts { :self |
		self.characters.counts
	}

}
