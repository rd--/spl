SortedList : [Object, Iterable, Indexable, Collection, Extensible, Removable, Sequence] { | contents sortBlock |

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
		}
	}

	asList { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents[index]
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
		let index = nil;
		{
			index := high + low // 2;
			low <= high
		}.whileTrue {
			self.sortBlock.value(self.contents[index], newObject).if {
				low := index + 1
			} {
				high := index - 1
			}
		};
		low
	}

	median { :self |
		let n = self.size;
		n.odd.if {
			self[n // 2 + 1]
		} {
			let i = n // 2;
			(self[i] + self[i + 1]) / 2
		}
	}

	quantile { :self :p :a :b :c :d |
		p.isCollection.if {
			p.collect { :each |
				self.quantile(each, a, b, c, d)
			}
		} {
			let y = self;
			let n = y.size;
			let r = a + ((n + b) * p);
			let f = r.fractionPart;
			let i0 = r.floor.max(1);
			let i1 = r.ceiling.min(n);
			y[i0] + ((y[i1] - y[i0]) * (c + (d * f)))
		}
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		SortedList:/0
	}

}

+Void {

	SortedList {
		newSortedList().initializeSlots([], <=)
	}

}

+List {

	asSortedList { :self |
		newSortedList().initializeSlots(self.sorted, <=)
	}

	asSortedList { :self :sortBlock:/2 |
		newSortedList().initializeSlots(self.sorted(sortBlock:/2), sortBlock:/2)
	}

}

+@Collection {

	asSortedList { :self |
		self.asSortedList(<=)
	}

	asSortedList { :self :aSortBlock:/2 |
		let answer = SortedList();
		answer.sortBlock := aSortBlock:/2;
		answer.addAll(self);
		answer
	}

}
