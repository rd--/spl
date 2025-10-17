Slice : [Object, Equatable, Comparable, Iterable, Indexable, Collection, Sequenceable] { | contents startIndex size |

	asList { :self |
		self.contents.copyFromTo(self.startIndex, self.endIndex).asList
	}

	atIfAbsent { :self :index :ifAbsent:/0 |
		self.includesIndex(index).if {
			self.contents[index + self.startIndex - 1]
		} {
			ifAbsent()
		}
	}

	atPut { :self :index :value |
		self.includesIndex(index).if {
			self.contents[index + self.startIndex - 1] := value
		} {
			self.error('atPut: invalid index: ' ++ index)
		}
	}

	copyFromTo { :self :startIndex :endIndex |
		let size = endIndex - startIndex + 1;
		Slice(self, startIndex, size)
	}

	do { :self :aBlock:/1 |
		let items = self.contents;
		self.startIndex.toDo(self.endIndex) { :index |
			aBlock(items[index])
		}
	}

	endIndex { :self |
		self.startIndex + self.size - 1
	}

	printString { :self |
		'%.sliceFromTo(%, %)'.format([
			self.contents.printString,
			self.startIndex,
			self.endIndex
		])
	}

	Slice { :self :startIndex :size |
		Slice(self.contents, self.startIndex + startIndex - 1, size)
	}

	storeString { :self |
		self.error('Slice>>storeString: do not store slices')
	}

}

+List {

	Slice { :self :startIndex :size |
		let endIndex = startIndex + size - 1;
		(self.size >= endIndex).if {
			newSlice().initializeSlots(self, startIndex, size)
		} {
			self.error('Slice: invalid indices')
		}
	}

}

+[List, Slice] {

	sliceFromTo { :self :startIndex :endIndex |
		let size = endIndex - startIndex + 1;
		Slice(self, startIndex, size)
	}

}
