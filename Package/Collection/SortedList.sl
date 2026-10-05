SortedList : [Object, Copy, Store, Equal, Compare, Iterable, Indexable, Collection, Extensible, Sequence] {

	| uncopiedList sortBlock |

	[concatenation, ++] { :self :aCollection |
		let answer = self.copy;
		answer.addAll!(aCollection);
		answer
	}

	add! { :self :item |
		self.uncopiedList.isEmpty.if {
			self.uncopiedList.add!(item)
		} {
			let nextIndex = self.indexForInserting(item);
			self.uncopiedList.insertAt!(item, nextIndex)
		}
	}

	addAll! { :self :aCollection |
		(aCollection.size > (self.uncopiedList.size // 3)).if {
			self.uncopiedList.addAll!(aCollection);
			self.uncopiedList.sortBy!(self.sortBlock)
		} {
			aCollection.do { :each |
				self.add!(each)
			}
		};
		aCollection
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		self.uncopiedList.atIfAbsent(index, ifAbsent/0)
	}

	collect { :self :aBlock/1 |
		self
		.uncopiedList
		.collect(aBlock/1)
		.SortedList(self.sortBlock)
	}

	do { :self :aBlock/1 |
		self.uncopiedList.do(aBlock/1)
	}

	indexForInserting { :self :newObject |
		let low = 1;
		let high = self.uncopiedList.size;
		let sortBlock/2 = self.sortBlock;
		let index = nil;
		{
			index := high + low // 2;
			sortBlock(low, high)
		}.whileTrue {
			self.sortBlock.value(self.uncopiedList[index], newObject).if {
				low := index + 1
			} {
				high := index - 1
			}
		};
		low
	}

	indexOf { :self :anObject |
		let i = self.indexForInserting(anObject);
		(
			i >= 2 & {
				self[i - 1] = anObject
			}
		).if {
			i - 1
		} {
			0
		}
	}

	List { :self |
		self.uncopiedList.copy
	}

	median { :self |
		let n = self.size;
		n.isOdd.if {
			self[n // 2 + 1]
		} {
			let i = n // 2;
			(self[i] + self[i + 1]) / 2
		}
	}

	occurrencesOf { :self :anObject |
		let i = self.indexOf(anObject);
		(i = 0).if {
			0
		} {
			let j = i;
			let c = self.uncopiedList;
			{
				j := j - 1;
				j > 0 & { c[j] = anObject }
			}.whileTrue;
			i - j
		}
	}

	quantile { :self :p :o |
		p.isCollection.if {
			p.collect { :each |
				self.quantile(each, o)
			}
		} {
			let y = self;
			let n = y.size;
			(p = 0).if {
				y[1]
			} {
				(p = 1).if {
					y[n]
				} {
					let [a, b] = o[1];
					let [c, d] = o[2];
					let r = a + ((n + b) * p);
					let f = r.fractionalPart;
					let i0 = r.floor.max(1);
					let i1 = r.ceiling.min(n);
					y[i0] + ((y[i1] - y[i0]) * (c + (d * f)))
				}
			}
		}
	}

	removeIfAbsent! { :self :oldObject :anExceptionBlock/0 |
		let i = self.indexOf(oldObject);
		(i = 0).if {
			anExceptionBlock()
		} {
			self.uncopiedList.removeAt!(i)
		}
	}

	size { :self |
		self.uncopiedList.size
	}

	species { :self |
		SortedList/0
	}

	storeString { :self |
		(self.sortBlock = precedesOrEqualTo/2).if {
			'SortedList(%)'.format([self.uncopiedList])
		} {
			'SortedList(%, %)'.format(
				[
					self.uncopiedList,
					self.sortBlock.name
				]
			)
		}
	}

}

+Void {

	SortedList {
		newSortedList().initializeSlots([], precedesOrEqualTo/2)
	}

}

+List {

	SortedList { :self |
		SortedList(self, precedesOrEqualTo/2)
	}

	SortedList { :self :sortBlock/2 |
		newSortedList().initializeSlots(
			self.copy.sortBy!(sortBlock/2),
			sortBlock/2
		)
	}

}

+@Collection {

	SortedList { :self :sortBlock/2 |
		SortedList(self.items, sortBlock/2)
	}

	SortedList { :self |
		SortedList(self.items)
	}

}
