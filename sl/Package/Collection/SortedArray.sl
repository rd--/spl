SortedArray : [Object, Iterable, Indexable, Collection, Extensible, Removable] { | contents sortBlock |

	add { :self :item |
		self.contents.isEmpty.if {
			self.contents.add(item)
		} {
			| nextIndex = self.indexForInserting(item); |
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

	Array { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents[index]
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1);
		self
	}

	indexForInserting { :self :newObject |
		|(
			low = 1,
			high = self.contents.size,
			compare:/2 = self.sortBlock,
			index = nil
		)|
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
		self[self.size + 1 // 2]
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
		newSortedArray().initializeSlots([], lessThanEquals:/2)
	}

}

+Array {

	SortedArray { :self |
		newSortedArray().initializeSlots(self.sorted, lessThanEquals:/2)
	}

	SortedArray { :self :sortBlock:/2 |
		newSortedArray().initializeSlots(self.sorted(sortBlock:/2), sortBlock:/2)
	}

}

+@Collection {

	SortedArray { :self |
		self.SortedArray(lessThanEquals:/2)
	}

	SortedArray { :self :aSortBlock:/2 |
		| answer = SortedArray(); |
		answer.sortBlock := aSortBlock:/2;
		answer.addAll(self);
		answer
	}

}
