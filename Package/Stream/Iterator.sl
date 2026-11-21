@Iterator {

	next { :self |
		self.typeResponsibility('Iterator>>next')
	}

}

+@Iterator {

	Iterator { :self |
		self
	}

	any { :self :numberOfElements |
		self.next(numberOfElements)
	}

	do { :self :aFunction/1 |
		let each = self.next;
		{
			each.isNil
		}.whileFalse {
			aFunction(each);
			each := self.next
		}
	}

	isIterator { :self |
		true
	}

	next { :self :anInteger |
		let answer = [];
		anInteger.timesRepeat {
			answer.addLast!(self.next)
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
		withReturn { :return/1 |
			maxNumberOfElements.timesRepeat {
				let item = self.next;
				item.ifNil {
					answer.return
				};
				answer.addLast!(item)
			};
			answer
		}
	}

	nextSatisfy { :self :aFunction/1 |
		withReturn { :return/1 |
			self.do { :each |
				aFunction(each).ifTrue {
					each.return
				}
			};
			'Iterator>>nextSatisfy: no satisfactory element'.error
		}
	}

	nextUntil { :self :aFunction/1 |
		self.nextWhile { :each |
			each.aFunction.not
		}
	}

	nextWhile { :self :aFunction/1 |
		let answer = [];
		let next = nil;
		{
			next := self.next;
			answer.addLast!(next)
		}.doWhileTrue {
			next.aFunction
		};
		answer
	}

	readIntoStartingAtCount { :self :aCollection :startIndex :n |
		withReturn { :return/1 |
			0.toDo(n - 1) { :i |
				let obj = self.next.ifNil {
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
			answer.addLast!(next);
			next := self.next
		};
		answer
	}

	upToEnd { :self |
		let answer = [];
		self.do { :each |
			answer.addLast!(each)
		};
		answer
	}

}

+@Object {

	isIterator { :self |
		false
	}

}
