ListView : [Object, New, Copy, Store, Equal, Compare, Do, At, Indices, Put, Collect, Collection, Sequence] {

	| collection startIndex endIndex referenceIndex |

	[List, listViewToList] { :self |
		self
		.collection
		.copyFromTo(self.startIndex, self.endIndex)
		.List
	}

	[ListView, listViewToListView] { :self :startIndex :endIndex :referenceIndex |
		ListView(
			self.collection,
			self.startIndex + startIndex - 1,
			self.startIndex + endIndex - 1,
			referenceIndex
		)
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		self.includesIndex(index).if {
			self.collection[index + self.startIndex - self.referenceIndex]
		} {
			ifAbsent()
		}
	}

	copyFromTo { :self :from :to |
		ListView(self, from, to, self.referenceIndex)
	}

	do { :self :aBlock/1 |
		let items = self.collection;
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

	indexOf { :self :anObject |
		self.indexOfIfAbsent(anObject) {
			self.referenceIndex - 1
		}
	}

	indexOfIfAbsent { :self :anObject :aBlock/0 |
		self.indices.detectIfNone { :i |
			self.at(i) = anObject
		} {
			aBlock()
		}
	}

	indices { :self |
		let i = self.referenceIndex;
		i.to(i + self.size - 1)
	}

	postCopy { :self |
		self.collection := self.collection.copy
	}

	put! { :self :index :value |
		self.includesIndex(index).if {
			self.collection[index + self.startIndex - self.referenceIndex] := value
		} {
			self.error('put!: invalid index', [index])
		}
	}

	size { :self |
		self.endIndex - self.startIndex + 1
	}

	species { :self |
		nilList/1
	}

}

+List {

	ListView { :self :startIndex :endIndex :referenceIndex |
		(
			startIndex >= 1 & {
				endIndex + 1 >= startIndex & {
					self.size >= endIndex
				}
			}
		).if {
			newListView().initializeSlots(self, startIndex, endIndex, referenceIndex)
		} {
			self.error('ListView: invalid indices')
		}
	}

}

+[List, ListView] {

	ListView { :self :startIndex :endIndex |
		ListView(self, startIndex, endIndex, 1)
	}

	ListView { :self |
		ListView(self, 1, self.size)
	}

	zeroIndexedListView { :self |
		ListView(self, 1, self.size, 0)
	}

}
