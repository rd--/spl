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

	addBefore { :self :newObject :oldObject |
		let index = self.indexOf(oldObject);
		self.insertAt(newObject, index)
	}

	addAllFirst { :self :aCollection |
		self.addArrayFirst(aCollection.asArray)
	}

	addAllLast { :self :aCollection |
		self.addArrayLast(aCollection.asArray)
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

	removeLast { :self |
		<primitive: return _self.pop();>
	}

	removeLast { :self :count |
		<primitive: return _self.splice(_self.length - _count, _count);>
	}

}
