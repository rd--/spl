@Stream {

	any { :self :numberOfElements |
		self.next(numberOfElements)
	}

	atEnd { :self |
		self.typeResponsibility('Stream>>atEnd')
	}

	do { :self :aBlock:/1 |
		{
			self.atEnd
		}.whileFalse {
			aBlock(self.next)
		}
	}

	isBinary { :self |
		self.typeResponsibility('Stream>>isBinary')
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
		let count = self.readIntoStartingAtCount(aCollection, startIndex, n);
		(count = n).if {
			aCollection
		} {
			aCollection.copyFromTo(1, startIndex + count - 1)
		}
	}

	nextMatchFor { :self :anObject |
		anObject = self.next
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
				let obj = nil;
				obj := self.next.ifNil {
					i.return
				};
				aCollection[startIndex + i] := obj
			};
			n
		}
	}

	take { :self :maxNumberOfElements |
		let answer = [];
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
		let answer = [];
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

}
