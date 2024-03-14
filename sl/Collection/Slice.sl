Slice : [Object, Iterable, Indexable, Collection, Sequence] { | contents firstIndex lastIndex |

	asList { :self |
		self.contents.copyFromTo(self.firstIndex, self.lastIndex).asList
	}

	at { :self :index |
		self.contents[index]
	}

	atPut { :self :index :value |
		self.contents[index] := value
	}

	do { :self :aBlock:/1 |
		let items = self.contents;
		self.firstIndex.toDo(self.lastIndex) { :index |
			aBlock(items[index])
		}
	}

	printString { :self |
		self.contents.printString ++ '.slice(' ++ self.firstIndex ++ ', ' ++ self.lastIndex ++ ')'
	}

	size { :self |
		self.lastIndex - self.firstIndex + 1
	}

	storeString { :self |
		self.error('Slice>>storeString: do not store slices')
	}

}

+@Sequence {

	slice { :self :firstIndex :lastIndex |
		newSlice().initializeSlots(self, firstIndex, lastIndex)
	}

}
