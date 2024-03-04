@Ordered {

	add { :self :anObject |
		self.addLast(anObject)
	}

	addAfter { :self :newObject :oldObject |
		let index = self.indexOf(oldObject);
		self.insertAt(newObject, index + 1)
	}

	addAfterIndex { :self :newObject :index |
		index.betweenAnd(0, self.size).if {
			self.insertAt(newObject, index + 1);
			newObject
		} {
			self.errorInvalidIndex('addAfterIndex', index)
		}
	}

	addAllFirst { :self :aCollection |
		self.addListFirst(aCollection.asList)
	}

	addAllLast { :self :aCollection |
		self.addListLast(aCollection.asList)
	}

	addBefore { :self :newObject :oldObject |
		let index = self.indexOf(oldObject);
		self.insertAt(newObject, index)
	}

	addBeforeIndex { :self :newObject :index |
		index.betweenAnd(1, self.size + 1).if {
			self.insertAt(newObject, index);
			newObject
		} {
			self.errorInvalidIndex('addBeforeIndex', index)
		}
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add(nil)
		};
		self
	}

	removeIfAbsent { :self :oldObject :anExceptionBlock:/0 |
		let index = self.indexOf(oldObject);
		(index = 0).if {
			anExceptionBlock()
		} {
			self.removeAt(index)
		}
	}

}
