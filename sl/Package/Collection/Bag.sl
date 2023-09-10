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
			self.contents[anObject] +:= anInteger
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
			n +:= a.key;
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
		self.contents.indices.Set
	}

	setContents { :self :aDictionary |
		self.contents := aDictionary
	}

	size { :self |
		| tally = 0; |
		self.contents.do { :each |
			tally +:= each
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
			self.contents.withIndexDo { :count :value |
				sum +:= value * count
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
