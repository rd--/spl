@Add {

	add! { :self :anObject |
		self.typeResponsibility('@Add>>add!')
	}

	addAll! { :self :aCollection |
		aCollection.do { :each |
			self.add!(each)
		};
		aCollection
	}

	addAllIfNotPresent! { :self :aCollection |
		aCollection.do { :each |
			self.addIfNotPresent!(each)
		}
	}

	addIfNotPresent! { :self :anObject |
		self.includes(anObject).ifFalse {
			self.add!(anObject)
		};
		anObject
	}

	addIfNotPresentBy! { :self :anObject :aBlock/2 |
		self.includesBy(anObject, aBlock/2).ifFalse {
			self.add!(anObject)
		};
		anObject
	}

	addWithOccurrences! { :self :newObject :anInteger |
		anInteger.timesRepeat {
			self.add!(newObject)
		};
		newObject
	}

	[concatenation, ++] { :self :aCollection |
		let answer = self.copy;
		answer.addAll!(aCollection.assertIsCollection);
		answer
	}

	copyWith { :self :newElement |
		let answer = self.copy;
		answer.add!(newElement);
		answer
	}

	extendToSize! { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add!(nil)
		};
		self
	}

	fillFromWith! { :self :aCollection :aBlock/1 |
		aCollection.do { :each |
			self.add!(aBlock(each))
		}
	}

	ifAbsentAdd! { :self :anObject |
		self.includes(anObject).if {
			false
		} {
			self.add!(anObject);
			true
		}
	}

	include! { :self :anObject |
		/* self.typeResponsibility('@Add>>include!') */
		self.add!(anObject)
	}

	includeAll! { :self :aCollection |
		aCollection.do { :each |
			self.include!(each)
		};
		aCollection
	}

	intersperse { :self :anObject |
		let answer = self.new;
		self.doSeparatedBy { :each |
			answer.add!(each)
		} {
			answer.add!(anObject)
		};
		answer
	}

	select { :self :aBlock/1 |
		let answer = self.new;
		self.do { :each |
			aBlock(each).ifTrue {
				answer.include!(each)
			}
		};
		answer
	}

	selectThenCollect { :self :selectBlock/1 :collectBlock/1 |
		let answer = self.new;
		self.selectThenDo(selectBlock/1) { :each |
			answer.add!(collectBlock(each))
		};
		answer
	}

	union { :self :aCollection |
		let answer = self.copy;
		answer.includeAll!(aCollection);
		answer
	}

}
