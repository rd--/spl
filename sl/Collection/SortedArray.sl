SortedArray : [Object, Iterable, Indexable, Collection, Extensible, Removable, Sequenceable] { | contents sortBlock |

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

	asArray { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents[index]
	}

	collect { :self :aBlock:/1 |
		self.contents.collect(aBlock:/1).asSortedArray(self.sortBlock)
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1);
		self
	}

	indexForInserting { :self :newObject |
		let low = 1;
		let high = self.contents.size;
		let compare:/2 = self.sortBlock;
		let index = nil;
		{
			index := high + low // 2;
			low <= high
		}.whileTrue {
			self.contents[index].compare(newObject).if {
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

	size { :self |
		self.contents.size
	}

	species { :self |
		SortedArray:/0
	}

}

+Void {

	SortedArray {
		newSortedArray().initializeSlots([], <=)
	}

}

+Array {

	asSortedArray { :self |
		newSortedArray().initializeSlots(self.sorted, <=)
	}

	asSortedArray { :self :sortBlock:/2 |
		newSortedArray().initializeSlots(self.sorted(sortBlock:/2), sortBlock:/2)
	}

}

+@Collection {

	asSortedArray { :self |
		self.asSortedArray(<=)
	}

	asSortedArray { :self :aSortBlock:/2 |
		let answer = SortedArray();
		answer.sortBlock := aSortBlock:/2;
		answer.addAll(self);
		answer
	}

}
