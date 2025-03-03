@Bag {

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
		self.basicAddWithOccurrences(anObject, anInteger)
	}

	asBag { :self |
		self
	}

	asList { :self |
		let answer = [];
		self.do { :each |
			answer.add(each)
		};
		answer
	}

	asSet { :self :aBlock:/2 |
		self.contents.indices.asSet(aBlock:/2)
	}

	atRandom { :self :shape :r |
		let e = self.contents.keys;
		let w = self.contents.values;
		r.randomWeightedChoice(e, w, shape)
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
			(n / s.roundTo(0.1)) -> a.value
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

	isBag { :unused |
		true
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
		answer.sortBy(>=)
	}

	sortedElements { :self |
		self.contents.associations.sort
	}

	storeString { :self |
		self.contents.storeString ++ '.as' ++ self.typeOf
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

}

+@Object {

	isBag { :unused |
		false
	}

}

Bag : [Object, Iterable, Collection, Extensible, Removable, Unordered, Bag] { | contents |

	asSet { :self |
		self.contents.indices.asSet(=)
	}

	species { :self |
		Bag:/0
	}

}

IdentityBag : [Object, Iterable, Collection, Extensible, Removable, Unordered, Bag] { | contents |

	addWithOccurrences { :self :anObject :anInteger |
		anObject.isImmediate.ifFalse {
			'IdentityBag>>addWithOccurrences: non-immediate entry'.error
		};
		self.basicAddWithOccurrences(anObject, anInteger)
	}

	asIdentityBag { :self |
		self
	}

	asMap { :self |
		self.contents
	}

	asIdentitySet { :self |
		self.contents.indices.asIdentitySet
	}

	species { :self |
		IdentityBag:/0
	}

}

+Void {

	Bag {
		newBag().initializeSlots(Dictionary(=))
	}

	IdentityBag {
		newIdentityBag().initializeSlots(Map())
	}

}

+@Collection {

	asBag { :self |
		let answer = Bag();
		answer.addAll(self);
		answer
	}

	asIdentityBag { :self |
		let answer = IdentityBag();
		answer.addAll(self);
		answer
	}

	commonest { :self |
		let byCount = self.asBag.sortedCounts;
		let count = byCount.first.key;
		byCount.select { :each | each.key = count }.collect(value:/1)
	}

	counts { :self |
		self.asBag.sortedElements
	}

	histogramOf { :self :aBlock:/1 |
		let answer = Bag();
		self.collectInto(aBlock:/1, answer);
		answer
	}

}
