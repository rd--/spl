SortedList : [Object, Copyable, Equatable, Comparable, Iterable, Indexable, Collection, Extensible, Removable, Sequenceable] { | contents sortBlock |

	++ { :self :aCollection |
		let answer = self.copy;
		answer.addAll(aCollection);
		answer
	}

	add { :self :item |
		self.contents.isEmpty.if {
			self.contents.add(item)
		} {
			let nextIndex = self.indexForInserting(item);
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
		};
		aCollection
	}

	asList { :self |
		self.contents.copy
	}

	atIfAbsent { :self :index :ifAbsent:/0 |
		self.contents.atIfAbsent(index, ifAbsent:/0)
	}

	collect { :self :aBlock:/1 |
		self.contents.collect(aBlock:/1).asSortedList(self.sortBlock)
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1);
		self
	}

	indexForInserting { :self :newObject |
		let low = 1;
		let high = self.contents.size;
		let sortBlock:/2 = self.sortBlock;
		let index = nil;
		{
			index := high + low // 2;
			sortBlock(low, high)
		}.whileTrue {
			self.sortBlock.value(self.contents[index], newObject).if {
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
			let c = self.contents;
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

	removeIfAbsent { :self :oldObject :anExceptionBlock:/0 |
		let i = self.indexOf(oldObject);
		(i = 0).if {
			anExceptionBlock()
		} {
			self.contents.removeAt(i)
		}
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		SortedList:/0
	}

	storeString { :self |
		(self.sortBlock = precedesOrEqualTo:/2).if {
			'SortedList(%)'.format([self.contents])
		} {
			'SortedList(%, %)'.format(
				[
					self.contents,
					self.sortBlock.name
				]
			)
		}
	}

}

+Void {

	SortedList {
		newSortedList().initializeSlots([], precedesOrEqualTo:/2)
	}

}

+@Collection {

	asSortedList { :self |
		SortedList(self.asList)
	}

	asSortedList { :self :sortBlock:/2 |
		SortedList(self.asList, sortBlock:/2)
	}

}

+List {

	SortedList { :self |
		SortedList(self, precedesOrEqualTo:/2)
	}

	SortedList { :self :sortBlock:/2 |
		newSortedList().initializeSlots(
			self.copy.sortBy(sortBlock:/2),
			sortBlock:/2
		)
	}

}
