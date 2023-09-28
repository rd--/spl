@Extensible {

	addAll { :self :aCollection |
		aCollection.do { :each |
			self.add(each)
		}
	}

	addIfNotPresent { :self :anObject |
		self.includes(anObject).ifFalse {
			self.add(anObject)
		};
		anObject
	}

	addWithOccurrences { :self :newObject :anInteger |
		anInteger.timesRepeat {
			self.add(newObject)
		};
		newObject
	}

	fillFromWith { :self :aCollection :aBlock:/1 |
		aCollection.do { :each |
			self.add(aBlock(each))
		}
	}

	include { :self :anObject |
		self.add(anObject)
	}

	includeAll { :self :aCollection |
		aCollection.do { :each |
			self.include(each)
		}
	}

}
