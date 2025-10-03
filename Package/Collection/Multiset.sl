@Multiset {

	= { :self :aMultiset |
		(self.typeOf = aMultiset.typeOf) & {
			self.size = aMultiset.size & {
				valueWithReturn { :return:/1 |
					self.contents.associationsDo { :assoc |
						(aMultiset.occurrencesOf(assoc.key) = assoc.value).ifFalse {
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
		self.basicAddWithOccurrences(anObject, anInteger)
	}

	asMultiset { :self |
		self
	}

	asList { :self |
		let answer = [];
		self.do { :each |
			answer.add(each)
		};
		answer
	}

	associations { :self |
		self.contents.associations
	}

	asSet { :self |
		self.contents.indices.asSet
	}

	basicAddWithOccurrences { :self :anObject :anInteger |
		let dictionary = self.contents;
		dictionary.includesIndex(anObject).if {
			dictionary[anObject] := dictionary[anObject] + anInteger
		} {
			dictionary[anObject] := anInteger
		};
		anObject
	}

	cumulativeCounts { :self |
		let s = self.size / 100.0;
		let n = 0;
		self.sortedCounts.collect { :a |
			n := n + a.key;
			(n / s.round(0.1)) -> a.value
		}
	}

	do { :self :aBlock:/1 |
		self.contents.associationsDo { :assoc |
			assoc.value.timesRepeat {
				aBlock(assoc.key)
			}
		};
		self
	}

	includes { :self :anObject |
		self.contents.includesIndex(anObject)
	}

	intersection { :self :operand |
		let answer = self.species.new;
		self.associations.do { :each |
			let x = each.key;
			let i = each.value;
			let j = operand.occurrencesOf(x);
			let k = i.min(j);
			(k > 0).ifTrue {
				answer.addWithOccurrences(x, k)
			}
		};
		answer
	}

	keySort { :self |
		self.sortedElements
	}

	max { :self |
		self.contents.indices.reduce(max:/2)
	}

	min { :self |
		self.contents.indices.reduce(min:/2)
	}

	occurrencesOf { :self :anObject |
		self.contents.atIfAbsent(anObject) {
			0
		}
	}

	postCopy { :self |
		self.contents := self.contents.copy
	}

	randomChoice { :self :r :shape |
		let e = self.contents.keys;
		let w = self.contents.values;
		r.randomWeightedChoice(e, w, shape)
	}

	removeIfAbsent { :self :oldObject :whenAbsent:/0 |
		self.includes(oldObject).if {
			let count = self.contents[oldObject];
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
		let tally = 0;
		self.contents.do { :each |
			tally := tally + each
		};
		tally
	}

	sortedCounts { :self |
		let answer = [];
		self.contents.associationsDo { :anAssociation |
			answer.add(anAssociation.value -> anAssociation.key)
		};
		answer.sortBy(succeedsOrEqualTo:/2)
	}

	sortedElements { :self |
		self.contents.associations.sortByOn(precedesOrEqualTo:/2, key:/1)
	}

	storeString { :self |
		self.contents.storeString ++ '.' ++ self.typeOf
	}

	sum { :self |
		self.ifEmpty {
			self.error('sum: empty')
		} {
			let sum = 0;
			self.contents.withIndexDo { :count :value |
				sum := sum + (value * count)
			};
			sum
		}
	}

	valuesAndCounts { :self |
		self.contents
	}

	valueSort { :self |
		self.associations.sortByOn(precedesOrEqualTo:/2, value:/1)
	}

}

Multiset : [Object, Copyable, Equatable, Iterable, Collection, Extensible, Removable, Unordered, Multiset] { | contents |

	postCopy { :self |
		self.contents := self.contents.copy
	}

	species { :self |
		Multiset:/0
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

	Multiset { :self |
		newMultiset().initializeSlots(self)
	}

}

+@Collection {

	asMultiset { :self |
		let answer = Multiset();
		answer.addAll(self);
		answer
	}

	histogramOf { :self :aBlock:/1 |
		let answer = Multiset();
		self.collectInto(aBlock:/1, answer);
		answer
	}

}

+List {

	commonest { :self |
		let byCount = self.asMultiset.sortedCounts;
		let count = byCount.first.key;
		byCount.select { :each |
			each.key = count
		}.collect(value:/1)
	}

	counts { :self |
		self.asMultiset.sortedElements
	}

	multisetIntersection { :self |
		self.collect(asMultiset:/1).reduce(intersection:/2)
	}

}

+String {

	counts { :self |
		self.characters.counts
	}

}
