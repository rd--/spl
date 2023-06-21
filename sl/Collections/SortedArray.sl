SortedArray : [Object, Collection] { | contents sortBlock |

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
			self.contents.sortInPlace
		} {
			aCollection.do { :each |
				self.add(each)
			}
		}
	}

	Array { :self |
		self.contents
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1)
	}

	indexForInserting { :self :newObject |
		| low = 1, high = self.contents.size, index = nil; |
		{
			index := high + low // 2;
			low <= high
		}.whileTrue {
			self.sortBlock . (self.contents[index], newObject).if {
				low := index + 1
			} {
				high := index - 1
			}
		};
		low
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		SortedArray:/0
	}

}

+ Void {

	SortedArray {
		newSortedArray().initializeSlots([], lessThan:/2)
	}

}

+ Array {

	SortedArray { :self |
		newSortedArray().initializeSlots(self.sorted, lessThan:/2)
	}

}
