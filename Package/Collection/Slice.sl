Slice : [Object, Iterable, Indexable, Collection, Sequenceable] { | contents startIndex size |

	asList { :self |
		self.contents.copyFromTo(self.startIndex, self.endIndex).asList
	}

	at { :self :index |
		self.includesIndex(index).if {
			self.contents[index + self.startIndex - 1]
		} {
			self.error('at: invalid index: ' ++ index)
		}
	}

	atPut { :self :index :value |
		self.includesIndex(index).if {
			self.contents[index + self.startIndex - 1] := value
		} {
			self.error('atPut: invalid index: ' ++ index)
		}
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

	storeString { :self |
		self.error('Slice>>storeString: do not store slices')
	}

}

+[List, Slice] {

	Slice { :self :startIndex :size |
		newSlice().initializeSlots(self, startIndex, size)
	}

	sliceFromTo { :self :startIndex :endIndex |
		Slice(self, startIndex, endIndex - startIndex + 1)
	}

}
