(* Stream: collection, atEnd contents next nextPut *)
@Stream {

	any { :self :numberOfElements |
		self.next(numberOfElements)
	}

	atEnd { :self |
		self.typeResponsibility('Stream>>atEnd')
	}

	contents { :self |
		self.typeResponsibility('Stream>>contents')
	}

	do { :self :aBlock:/1 |
		{
			self.atEnd
		}.whileFalse {
			aBlock(self.next)
		}
	}

	isBinary { :self |
		self.collection.isByteArray
	}

	isStream { :self |
		true
	}

	next { :self |
		self.typeResponsibility('Stream>>next')
	}

	nextInto { :self :aCollection |
		self.nextIntoStartingAt(aCollection.size, aCollection, 1)
	}

	nextIntoStartingAt { :self :n :aCollection :startIndex |
		| count = self.readIntoStartingAtCount(aCollection, startIndex, n); |
		(count = n).if {
			aCollection
		} {
			aCollection.copyFromTo(1, startIndex + count - 1)
		}
	}

	nextMatchFor { :self :anObject |
		anObject = self.next
	}

	nextPut { :self :anObject |
		self.typeResponsibility('Stream>>nextPut')
	}

	nextPutAll { :self :aCollection |
		aCollection.do { :each |
			self.nextPut(each)
		};
		aCollection
	}

	nextSatisfy { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				aBlock(each).ifTrue {
					each.return
				}
			};
			'Stream>>nextSatisfy: no satisfactory element'.error
		}
	}

	readIntoStartingAtCount { :self :aCollection :startIndex :n |
		valueWithReturn { :return:/1 |
			0.upToDo(n - 1) { :i |
				| obj |
				obj := self.next.ifNil {
					i.return
				};
				aCollection[startIndex + i] := obj
			};
			n
		}
	}

	take { :self :maxNumberOfElements |
		| answer = []; |
		valueWithReturn { :return:/1 |
			maxNumberOfElements.timesRepeat {
				self.atEnd.ifTrue {
					answer.return
				};
				answer.addLast(self.next)
			};
			answer
		}
	}

	upToEnd { :self |
		| answer = []; |
		{
			self.atEnd
		}.whileFalse {
			elements.addLast(self.next)
		};
		answer
	}

}

+@Object {

	isStream { :self |
		false
	}

	putOn { :self :aStream |
		aStream.nextPut(self)
	}

}

+@Sequenceable {

	putOn { :self :aStream |
		aStream.nextPutAll(self)
	}

}
