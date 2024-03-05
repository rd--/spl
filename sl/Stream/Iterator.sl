@Iterator {

	any { :self :numberOfElements |
		self.next(numberOfElements)
	}

	asIterator { :self |
		self
	}

	do { :self :aBlock:/1 |
		let each = self.next;
		{
			each.isNil
		}.whileFalse {
			aBlock(each);
			each := self.next
		}
	}

	isIterator { :self |
		true
	}

	next { :self |
		self.typeResponsibility('Iterator>>next')
	}

	next { :self :anInteger |
		let answer = [];
		anInteger.timesRepeat {
			answer.addLast(self.next)
		};
		answer
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

	nextOrUpToEnd { :self :maxNumberOfElements |
		let answer = [];
		valueWithReturn { :return:/1 |
			maxNumberOfElements.timesRepeat {
				let item = self.next;
				item.ifNil {
					answer.return
				};
				answer.addLast(item)
			};
			answer
		}
	}

	nextSatisfy { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				aBlock(each).ifTrue {
					each.return
				}
			};
			'Iterator>>nextSatisfy: no satisfactory element'.error
		}
	}

	nextUntil { :self :aBlock:/1 |
		self.nextWhile { :each |
			each.aBlock.not
		}
	}

	nextWhile { :self :aBlock:/1 |
		let answer = [];
		let next = nil;
		{
			next := self.next;
			answer.addLast(next)
		}.doWhileTrue {
			next.aBlock
		};
		answer
	}

	readIntoStartingAtCount { :self :aCollection :startIndex :n |
		valueWithReturn { :return:/1 |
			0.toDo(n - 1) { :i |
				let obj = nil;
				obj := self.next.ifNil {
					i.return
				};
				aCollection[startIndex + i] := obj
			};
			n
		}
	}

	upTo { :self :anObject |
		let answer = [];
		let next = self.next;
		{
			next = nil | {
				next = anObject
			}
		}.whileFalse {
			answer.addLast(next);
			next := self.next
		};
		answer
	}

	upToEnd { :self |
		let answer = [];
		self.do { :each |
			answer.addLast(each)
		};
		answer
	}

}

+@Object {

	isIterator { :self |
		false
	}

}
