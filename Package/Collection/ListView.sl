ListView : [Object, Equatable, Comparable, Iterable, Indexable, Collection, Sequenceable] { | contents startIndex endIndex referenceIndex |

	asList { :self |
		self.contents.copyFromTo(self.startIndex, self.endIndex).asList
	}

	atIfAbsent { :self :index :ifAbsent:/0 |
		self.includesIndex(index).if {
			self.contents[index + self.startIndex - self.referenceIndex]
		} {
			ifAbsent()
		}
	}

	atPut { :self :index :value |
		self.includesIndex(index).if {
			self.contents[index + self.startIndex - self.referenceIndex] := value
		} {
			self.error('atPut: invalid index: ' ++ index)
		}
	}

	copyFromTo { :self :from :to |
		ListView(self, from, to, self.referenceIndex)
	}

	do { :self :aBlock:/1 |
		let items = self.contents;
		self.startIndex.toDo(self.endIndex) { :index |
			aBlock(items[index])
		}
	}

	includesIndex { :self :index |
		let a = self.referenceIndex;
		index >= a & {
			index <= (a + self.size - 1)
		}
	}

	indices { :self |
		let i = self.referenceIndex;
		i.to(i + self.size - 1)
	}

	ListView { :self :startIndex :endIndex :referenceIndex |
		ListView(
			self.contents,
			self.startIndex + startIndex - 1,
			self.startIndex + endIndex - 1,
			referenceIndex
		)
	}

	printString { :self |
		self.asList.printString
	}

	size { :self |
		self.endIndex - self.startIndex + 1
	}

}

+List {

	ListView { :self :startIndex :endIndex :referenceIndex |
		(endIndex >= startIndex & { self.size >= endIndex }).if {
			newListView().initializeSlots(self, startIndex, endIndex, referenceIndex)
		} {
			self.error('ListView: invalid indices')
		}
	}

}
