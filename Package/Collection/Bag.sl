Bag : [Object, Iterable, Collection, Extensible, Removable, Unordered] { | contents |

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
		anObject.isImmediate.ifFalse {
			'Bag>>addWithOccurrences: non-immediate entry'.error
		};
		self.basicAddWithOccurrences(anObject, anInteger)
	}

	asIdentityBag { :self |
		self
	}

	asList { :self |
		let answer = [];
		self.do { :each |
			answer.add(each)
		};
		answer
	}

	asMap { :self |
		self.contents
	}

	asIdentitySet { :self |
		self.contents.indices.asIdentitySet
	}

	atRandom { :self :shape :r |
		let e = self.contents.keys;
		let w = self.contents.values;
		r.randomWeightedChoice(e, w, shape)
	}

	basicAddWithOccurrences { :self :anObject :anInteger |
		self.includes(anObject).if {
			self.contents[anObject] := self.contents[anObject] + anInteger
		} {
			self.contents[anObject] := anInteger
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

	max { :self |
		self.contents.indices.injectInto(self.contents.indices.anyOne) { :max :each |
			max.max(each)
		}
	}

	min { :self |
		self.contents.indices.injectInto(self.contents.indices.anyOne) { :min :each |
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
		self.contents.storeString ++ '.asIdentityBag'
	}

	species { :self |
		IdentityBag:/0
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

+Void {

	IdentityBag {
		newBag().initializeSlots(Map())
	}

}

+@Collection {

	asIdentityBag { :self |
		let answer = IdentityBag();
		answer.addAll(self);
		answer
	}

	commonest { :self |
		let byCount = self.asIdentityBag.sortedCounts;
		let count = byCount.first.key;
		byCount.select { :each | each.key = count }.collect(value:/1)
	}

	counts { :self |
		self.asIdentityBag.sortedElements
	}

	histogramOf { :self :aBlock:/1 |
		let answer = IdentityBag();
		self.collectInto(aBlock:/1, answer);
		answer
	}

}
