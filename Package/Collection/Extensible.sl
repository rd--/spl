@Extensible {

	add { :self :anObject |
		self.typeResponsibility('@Extensible>>add')
	}

	addAll { :self :aCollection |
		aCollection.do { :each |
			self.add(each)
		}
	}

	addAllIfNotPresent { :self :aCollection |
		aCollection.do { :each |
			self.addIfNotPresent(each)
		}
	}

	addIfNotPresent { :self :anObject |
		self.includes(anObject).ifFalse {
			self.add(anObject)
		};
		anObject
	}

	addIfNotPresentBy { :self :anObject :aBlock:/2 |
		self.includesBy(anObject, aBlock:/2).ifFalse {
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

	ifAbsentAdd { :self :anObject |
		self.includes(anObject).if {
			false
		} {
			self.add(anObject);
			true
		}
	}

	include { :self :anObject |
		/* self.typeResponsibility('@Extensible>>include') */
		self.add(anObject)
	}

	includeAll { :self :aCollection |
		aCollection.do { :each |
			self.include(each)
		}
	}

	intersperse { :self :anObject |
		let answer = self.species.new;
		self.doSeparatedBy { :each |
			answer.add(each)
		} {
			answer.add(anObject)
		};
		answer
	}

	union { :self :aCollection |
		let answer = self.copy;
		answer.includeAll(aCollection);
		answer
	}

}
